#!/bin/bash
########################
# 脚本功能：删除类重命名脚本产生生成的类
########################

####### 配置
# 定义需要替换的类的查找目录，作为参数传递给GenRenameClasses.sh脚本使用，最终获取到的类名称保存到配置文件中，以给后续步骤使用
class_search_dir="$(pwd)/../injectedContentKit/Business000"
class_search_dir="/Users/aron/git-repo/YTTInjectedContentKit/DevPods/InjectedContentKit/Example/InjectedContentKit/Business"

# 类前缀
class_prefix="XYZ"
# 类后缀
class_suffix="ABC"


####### 配置检查处理
# 导入工具脚本
. ./FileUtil.sh

# 检测 class_search_dir
checkDirCore $class_search_dir "指定类的查找目录不存在"
class_search_dir=${CheckInputDestDirRecursiveReturnValue} 

# 也可以使用$(grep -rl "XYZ.*ABC" ${class_search_dir})
# 也可以使用$(find ${class_search_dir} -name "XYZ*ABC.[h|m]")
for class_file_path in `find ${class_search_dir} -name "XYZ*ABC.[h|m]"`; do
	echo "删除文件>>>${class_file_path}"
	rm -f ${class_file_path}
done

for class_file_path in `find ${class_search_dir} -name "XYZ*ABC.xib"`; do
	echo "删除文件>>>${class_file_path}"
	rm -f ${class_file_path}
done

