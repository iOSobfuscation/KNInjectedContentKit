#!/bin/bash
########################
# 脚本功能：从指定目录获取和保存属性到指定的文件
# 输入参数 -i 输入的文件夹
# 输入参数 -o 保存的文件
# 输入参数 -f 使用黑名单和自定义过滤条件的参数
# 输入参数 -c 自定义的黑名单文件
########################

####### 参数定义
param_input_dir=""
param_output_file=""
param_custom_filter_file=""
param_should_use_filter=0

####### 参数解析
while getopts :i:o:c:f opt
do
	case "$opt" in
		i) param_input_dir=$OPTARG
			echo "Found the -i option, with parameter value $OPTARG"
			;;
		o) param_output_file=$OPTARG
			echo "Found the -o option, with parameter value $OPTARG"
			;;
		c) param_custom_filter_file=$OPTARG
			echo "Found the -c option, with parameter value $OPTARG"
			;;
		f) echo "Found the -f option" 
			param_should_use_filter=1
			;;
		*) echo "Unknown option: $opt";;
	esac
done


####### 配置

# 属性黑名单配置文件
blacklist_cfg_file="$(pwd)/DefaultPropertiesBlackListConfig.cfg"

####### 数据定义

# 定义保存源文件的数组
declare -a implement_source_file_array
implement_source_file_count=0


# 定义保存属性的数组
declare -a tmp_props_array
props_count=0


# mark: p384
# 递归函数读取目录下的所有.m文件
function read_source_file_recursively {
	echo "read_implement_file_recursively"
	if [[ -d $1 ]]; then
		for item in $(ls $1); do
			itemPath="$1/${item}"
			if [[ -d $itemPath ]]; then
				# 目录
				echo "处理目录 ${itemPath}"
				read_source_file_recursively $itemPath
				echo "处理目录结束====="
			else 
				# 文件
				echo "处理文件 ${itemPath}"
				if [[ $(expr "$item" : '.*\.m') -gt 0 ]] || [[ $(expr "$item" : '.*\.h') -gt 0 ]]; then
					echo ">>>>>>>>>>>>mmmmmmm"
					implement_source_file_array[$implement_source_file_count]=${itemPath}
					implement_source_file_count=$[ implement_source_file_count + 1 ];
				fi
				echo ""
			fi
		done
	else
		echo "err:不是一个目录"
	fi
}


# 读取源码中的属性，保存到数组中
# 参数一: 源码文件路径
function get_properties_from_source_file {
	local class_file=$1;
	echo "class_file=${class_file}"

	properties=$(grep "@property.*" ${class_file})
	IFS_OLD=$IFS
	IFS=$'\n'
	for prop_line in $properties; do
		echo ">>>>>${prop_line}"

		asterisk_seperator_pattern="\*"
		if [[ ${prop_line} =~ ${asterisk_seperator_pattern} ]]; then
			# 从左向右截取最后一个string后的字符串
			prop_name=${prop_line##*${asterisk_seperator_pattern}}
			# 从左向右截取第一个string后的字符串
			seal_pattern=";*"
			seal_pattern_replacement=""
			prop_name=${prop_name//${seal_pattern}/${seal_pattern_replacement}}
			subsring_pattern="[ |;]"
			replacement=""
			prop_name=${prop_name//${subsring_pattern}/${replacement}}

			if [[ ${param_should_use_filter} -gt 0 ]]; then
				grep_result=$(grep ${prop_name} ${blacklist_cfg_file})
				echo "grep_result = >>${grep_result}<<"
				custom_grep_result=""
				if [[ -n ${param_custom_filter_file} ]]; then
					custom_grep_result=$(grep ${prop_name} ${param_custom_filter_file})
				fi
				if [[ -n ${grep_result} ]] || [[ -n ${custom_grep_result} ]]; then
					echo "--${prop_name}--存在配置文件中"
				else
					echo "--${prop_name}--XXX不存在配置文件中"

					tmp_props_array[$props_count]=$prop_name
					props_count=$[ props_count + 1 ]
					echo ">>>>>>>result_prop_name=${prop_name}"
				fi
			else
				tmp_props_array[$props_count]=$prop_name
				props_count=$[ props_count + 1 ]
			fi			
		fi
	done
	IFS=$IFS_OLD
}

# 获取目录下的所有源文件，读取其中的属性
function get_properties_from_source_dir {

	local l_classed_folder=$1

	echo "获取需要处理的源文件... ${l_classed_folder}"
	# 读取需要处理目标文件
	read_source_file_recursively ${l_classed_folder}

	echo "读取源文件中的属性..."
	for(( i=0;i<${#implement_source_file_array[@]};i++)) 
	do 
		class_file=${implement_source_file_array[i]}; 
		echo "处理源文件：${class_file}"
		get_properties_from_source_file ${class_file}
	done;
}

# 把获取到的属性过滤之后写入文件中
# 过滤步骤包含去重、去掉简单词汇、去掉长度少于多少的词汇
# 如果在执行的过程中遇到特殊情况，添加到黑名单配置（DefaultPropertiesBlackListConfig.cfg文件中添加配置）
function post_get_properties_handle {

	local prop_config_file=$1

	# 写入文件中
	echo "# Classes Configs" > ${prop_config_file}
	for key in $(echo ${!tmp_props_array[*]})
	do
	    # echo "$key : ${tmp_props_array[$key]}"
	    echo ${tmp_props_array[$key]} >> ${prop_config_file}
	done

	# 去重
	cfg_back_file="${prop_config_file}.bak"
	mv ${prop_config_file} ${cfg_back_file}
	sort ${cfg_back_file} | uniq > ${prop_config_file}
	
	# 过滤
	if [[ ${param_should_use_filter} -gt 0 ]]; then
		mv ${prop_config_file} ${cfg_back_file}
		echo "# Classes Configs Filtered" > ${prop_config_file}
		IFS_OLD=$IFS
		IFS=$'\n'
		# 上一行的内容
		lastLine="";
		for line in $(cat ${cfg_back_file} | sed 's/^[ \t]*//g')
		do
			if [[ ${#line} -le 6 ]] || [[ $(expr "$line" : '^#.*') -gt 0 ]]; then
				# 长度小于等于6或者注释内容的行不处理
				echo "less then 6 char line or comment line"
			else
				if [[ -n ${lastLine} ]]; then
					# 上一行是非空白行
					# 比较上一行内容是否是当前行的一部分，不是添加上一行
					if [[ ${line} =~ ${lastLine} ]]; then
						echo "${line} 和 ${lastLine} 有交集"
					else
						echo ${lastLine} >> ${prop_config_file}
					fi
				fi
				# 更新上一行
				lastLine=${line}
			fi	
		done
		IFS=${IFS_OLD}
	fi

	# 删除临时文件
	rm -f ${cfg_back_file}
}


get_properties_from_source_dir ${param_input_dir}
post_get_properties_handle ${param_output_file}


