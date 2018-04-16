#!/bin/bash

############## 工具类方法
function printHighlightMessage {
	#mark: echo 颜色选项 http://www.jb51.net/article/43968.htm
	echo -e "\033[31m $1 \033[0m"
}

# 检测是否安装gun sed，mac 内置的sed会有些问题，所以需要安装gun sed
gunSedInstallCheck() {
	# 检查是否安装gunsed
	# mac安装gunSed  http://blog.csdn.net/sun_wangdong/article/details/71078083
	which_sed=`which sed`
	echo $which_sed
	echo "testresult = $(expr "$which_sed" : '.*/gnu-sed/')"
	which_sed=`ls -al ${which_sed}`
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
		# echo "set PATH...."
		# source ./set-gun-sed-path.sh
		# echo "set PATH done"

		echo "请手动执行命令,然后重新执行"
		command="PATH=\"/usr/local/Cellar/gnu-sed/4.4/bin:\$PATH\""
		printHighlightMessage $command
		echo ""
		exit 1
	fi
}