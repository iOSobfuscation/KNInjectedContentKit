#!/bin/bash

# 循环检测输入的文件夹
checkInputDestDirRecursive() {
	echo -n "请输入目录: "
	read path
	if [[ -d $path ]]; then
		CheckInputDestDirRecursiveReturnValue=$path
	else
		echo -n "输入的目录无效，"
		checkInputDestDirRecursive
	fi
}

# 检测文件夹存在的方法，结果保存在全局变量`CheckInputDestDirRecursiveReturnValue`中
# 参数一：检测的文件夹路径
# 参数二：提示消息字符串
# 使用方式如下，去掉注释
# # 导入工具脚本
# . ./FileUtil.sh
# # 检测class_search_dir
# checkDirCore $class_search_dir "指定类的查找目录不存在"
# class_search_dir=${CheckInputDestDirRecursiveReturnValue}
checkDirCore() {
	to_process_dir=$1
	message=$2
	# 需处理源码目录检查
	if [[ -d $to_process_dir ]]; then
		echo "目录存在 $to_process_dir"
		CheckInputDestDirRecursiveReturnValue=$to_process_dir
		return 1
	else
		echo "${message} ${to_process_dir}"
		checkInputDestDirRecursive ${to_process_dir}
	fi
}

# 检测文件是否存在，不存在则创建
checkOrCreateFile() {
	file=$1
	if [[ -f $file ]]; then
		echo "检测到文件存在 $file"
	else
		echo "创建文件 $file"
		touch $file
	fi
}