#!/bin/bash
########################
# 脚本功能：生成重命名的类的配置脚本
# 输入参数 -i 输入的文件夹
# 输入参数 -o 保存的文件
########################


####### 参数定义
param_input_dir=""
param_output_file=""


####### 参数解析
echo "参数>>${@}"
while getopts :i:o: opt
do
	case "$opt" in
		i) param_input_dir=$OPTARG
			echo "Found the -i option, with parameter value $OPTARG"
			;;
		o) param_output_file=$OPTARG
			echo "Found the -o option, with parameter value $OPTARG"
			;;
		*) echo "Unknown option: $opt";;
	esac
done
echo "param_input_dir = ${param_input_dir}"
echo "param_output_file = ${param_output_file}"


####### 配置

# 属性黑名单配置文件
blacklist_cfg_file="$(pwd)/DefaultClassesBlackListConfig.cfg"


####### 数据定义

# 定义保存需要处理目标文件的数组
declare -a implement_source_file_array
declare -a implement_source_file_name_array
implement_source_file_count=0

# mark: p384
# 递归函数读取目录下的所有.m文件
function read_implement_file_recursively {
	echo "read_implement_file_recursively"
	if [[ -d $1 ]]; then
		for item in $(ls $1); do
			itemPath="$1/${item}"
			if [[ -d $itemPath ]]; then
				# 目录
				echo "处理目录 ${itemPath}"
				read_implement_file_recursively $itemPath
				echo "处理目录结束====="
			else 
				# 文件
				echo "处理文件 ${itemPath}"
				if [[ $(expr "$item" : '.*\.m') -gt 0 ]]; then
					echo ">>>>>>>>>>>>mmmmmmm"
					implement_source_file_array[$implement_source_file_count]=${itemPath}
					class_name=${item//".m"/""};
					implement_source_file_name_array[$implement_source_file_count]=${class_name}
					implement_source_file_count=$[ implement_source_file_count + 1 ];
				fi
				echo ""
			fi
		done
	else
		echo "err:不是一个目录"
	fi
}

post_implement_file_handle() {
	local wirte_to_file=$1
	# 写入文件中
	echo "# 需要处理的类配置文件" > ${wirte_to_file}
	for(( i=0;i<${#implement_source_file_name_array[@]};i++)) 
	do 
		class_file_name=${implement_source_file_name_array[i]}; 
		echo ${class_file_name} >> ${wirte_to_file}
	done;

	# 去重
	wirte_to_file_bak="${wirte_to_file}.bak"
	mv ${wirte_to_file} ${wirte_to_file_bak}
	sort ${wirte_to_file_bak} | uniq > ${wirte_to_file}

	# 过滤
	mv ${wirte_to_file} ${wirte_to_file_bak}
	echo "# Properties Configs Filtered" > ${wirte_to_file}
	IFS_OLD=$IFS
	IFS=$'\n'
	# 上一行的内容
	lastLine="";
	for line in $(cat ${wirte_to_file_bak} | sed 's/^[ \t]*//g')
	do
		grep_result=$(grep ${line} ${blacklist_cfg_file})
		category_judge_substring="\+"
		if [[ ${#line} -le 6 ]] || [[ $(expr "$line" : '^#.*') -gt 0 ]] || [[ -n ${grep_result} ]] || [[ ${line} =~ ${category_judge_substring} ]]; then
			# 长度小于等于6、注释内容的行、在黑名单中的内容、分类文件不处理
			echo "less then 6 char line or comment line"
		else
			if [[ -n ${lastLine} ]]; then
				# 上一行是非空白行
				# 比较上一行内容是否是当前行的一部分，不是添加上一行
				if [[ ${line} =~ ${lastLine} ]]; then
					echo "${line} 和 ${lastLine} 有交集"
				else
					echo ${lastLine} >> ${wirte_to_file}
				fi
			fi
			# 更新上一行
			lastLine=${line}
		fi	
	done
	IFS=${IFS_OLD}

	# 删除临时文件
	rm -f ${wirte_to_file_bak}
}

read_implement_file_recursively ${param_input_dir}
post_implement_file_handle ${param_output_file}


