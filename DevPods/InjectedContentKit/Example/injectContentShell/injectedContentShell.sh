#!/bin/bash

############## 配置

# 需处理文件目录
# mark: TODO
to_process_file_dir="$(pwd)/../injectedContentKit/Business000"
# 配置文件
cfg_file="$(pwd)/injectedContentConfig.cfg"

############## 工具类方法
function printHighlightMessage {
	#mark: echo 颜色选项 http://www.jb51.net/article/43968.htm
	echo -e "\033[31m $1 \033[0m"
}


# 检查是否安装gunsed
# mac安装gunSed  http://blog.csdn.net/sun_wangdong/article/details/71078083
which_sed=`which sed`
echo $which_sed
echo "testresult = $(expr "$which_sed" : '.*/gnu-sed/')"
if [[ $(expr "$which_sed" : '.*/gnu-sed/') -gt 0 ]]; then
	echo "检测到使用gun sed"
else
	if [ ! `which brew` ]
	then
		echo 'Homebrew not found. Trying to install...'
                    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
			|| exit 1
	fi
	echo 'Trying to install gun sed...'
	brew install gnu-sed --with-default-names || exit 1
	# 设置局部环境变量
	echo "set PATH...."
	source ./set-gun-sed-path.sh
	echo "set PATH done"

	echo "请手动执行命令,然后重新执行"
	command="PATH=\"/usr/local/Cellar/gnu-sed/4.4/bin:\$PATH\""
	printHighlightMessage $command
	echo ""
	exit 1
fi


# 循环检测输入的文件夹
function checkInputDestDir {
	echo -n "请输入需处理源码目录: "
	read path
	if [[ -d $path ]]; then
		to_process_file_dir=$path
	else
		echo -n "输入的目录无效，"
		checkInputDestDir
	fi
}

# 需处理源码目录检查
if [[ -d $to_process_file_dir ]]; then
	echo "需处理源码目录存在 $to_process_file_dir"
else
	echo "请确认需处理源码目录是否存在 $to_process_file_dir"
	checkInputDestDir
fi

# mark: p261
# 配置文件检查
if [[ -f $cfg_file ]]; then
	echo "检测到配置文件存在 $cfg_file"
else
	echo "请确认配置文件是否存在 $cfg_file"
	exit 1
fi

# 读取配置文件
echo "开始读取配置文件..."

declare -a config_content_array
cfg_line_count=0
# mark: p291
IFS_OLD=$IFS
IFS=$'\n'
# 删除文件行首的空白字符 http://www.jb51.net/article/57972.htm
for line in $(cat $cfg_file | sed 's/^[ \t]*//g')
do
	if [[ ${#line} -eq 0 ]]; then
		echo "blank line"
	else
		config_content_array[$cfg_line_count]=$line
	fi
	cfg_line_count=$[ $cfg_line_count + 1 ]
done
IFS=${IFS_OLD}


echo ""

# 读取需要处理目标文件
declare -a implement_source_file_array
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
					implement_source_file_count=$[ implement_source_file_count + 1 ];
				fi
				echo ""
			fi
		done
	else
		echo "err:不是一个目录"
	fi
}


echo ${to_process_file_dir}
read_implement_file_recursively ${to_process_file_dir}


# 处理目标文件，添加配置文件中注入的内容
function addInjectedContent {
	# implement_source_file_array
	# ${#config_content_array[@]}
	injected_content_index=0
	for(( i=0;i<${#implement_source_file_array[@]};i++)) 
	do 
		file=${implement_source_file_array[i]}; 
		echo ${file}
		injected_content=${config_content_array[$injected_content_index]};
		injected_content_index=$[ $injected_content_index + 1 ]

		echo ">>>>>>>${injected_content}"
		# mark: sed 命令中使用变量 http://blog.csdn.net/lepton126/article/details/36374933
		# 在匹配的行下面添加插入内容
		sed -i '/^- \(.*\){$/{
			a\ '"$injected_content"'
		}' ${file}

	done;
	message="内容添加完成"
	printHighlightMessage $message
}


# 处理目标文件，删除配置文件中注入的内容
function removeInjectedContent {
	for(( i=0;i<${#implement_source_file_array[@]};i++)) 
	do 
		file=${implement_source_file_array[i]}; 
		echo ${file}

		for(( j=0;j<${#config_content_array[@]};j++)) 
		do 
			pattern_str=${config_content_array[$j]};
			echo ">>>>>>>${pattern_str}"

			# mark: sed 命令中使用变量 http://blog.csdn.net/lepton126/article/details/36374933
			substring="["
			replacement="\["
			pattern_str=${pattern_str//$substring/$replacement}
			substring="]"
			replacement="\]"
			pattern_str=${pattern_str//$substring/$replacement}
			echo "pattern_str = $pattern_str"
			#pattern_str="[CardDataComposer new]"

			sed -i '/'"$pattern_str"'/ {
				d
			}' ${file}
		done
	done;
	message="内容删除完成"
	printHighlightMessage $message
}


function genMunu {
	clear
	echo
	echo -e "\t\t\t选项菜单\n"
	echo -e "\t1. 删除注入内容"
	echo -e "\t2. 添加注入内容"
	echo -e "\t0. Exit menu\n\n"
	echo -en "\t\tEnter option: "
	read -n 1 option
}


while [[ 1 ]]; do
	genMunu
	case $option in
	0 )
		echo ""
		echo "Bye"
		exit 0
	;;
	1 )
		# 删除配置文件中注入的内容
		removeInjectedContent
	;;
	2 )
		# 添加配置文件中注入的内容
		addInjectedContent
	;;
	h )
		genMunu
	;;
	* )
		echo "Wrong!!"
	;;
	esac

	echo
	echo -en "\n\n\tHit any key to continue"
	read -n 1 line

done

