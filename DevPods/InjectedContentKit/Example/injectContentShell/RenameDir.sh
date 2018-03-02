#!/bin/bash

############## 配置

# 需处理文件目录
# mark: TODO
to_process_file_dir="$(pwd)/../injectedContentKit/Business000"


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

echo "目标目录：${to_process_file_dir}"