#!/bin/bash
# 属性重命名脚本

####### 配置
# classes类目录
classes_dir="$(pwd)/../InjectedContentKitx"
# 黑名单类目录
declare -a custom_blacklist_search_dirs
custom_blacklist_search_dirs=("/Users/aron/PuTaoWorkSpace/project/sscatch/sscatch/Classes/SSCatchAPI" 
	"/Users/aron/PuTaoWorkSpace/project/sscatch/sscatch/Classes/Categories" 
	"/Users/aron/PuTaoWorkSpace/project/sscatch/sscatch/Classes/Components" 
	"/Users/aron/PuTaoWorkSpace/project/sscatch/sscatch/Classes/External" 
	"/Users/aron/PuTaoWorkSpace/project/sscatch/sscatch/Classes/HandyTools" 
	"/Users/aron/PuTaoWorkSpace/project/sscatch/sscatch/Classes/Macros" )
# 替换的属性配置文件
cfg_file="$(pwd)/PropertiesConfigs.cfg"
# 属性黑名单配置文件
custom_blacklist_cfg_file="$(pwd)/CustomPropertiesBlackListConfig.cfg"
custom_blacklist_cfg_tmp_file="$(pwd)/TmpCustomPropertiesBlackListConfig.cfg"
# 属性前缀,属性前缀需要特殊处理
class_prefix=""
# 属性后缀
class_suffix="abc"


####### 配置检查处理
# 检测文件是否存在，不存在则创建
checkOrCreateFile() {
	file=$1
	if [[ -f $file ]]; then
		echo "检测到配置文件存在 $file"
	else
		echo "创建配置文件 $file"
		touch $file
	fi
}

# 配置文件检查
checkOrCreateFile $cfg_file

# 循环检测输入的文件夹
function checkInputDestDir {
	echo -n "请输入需处理源码目录: "
	read path
	if [[ -d $path ]]; then
		classes_dir=$path
	else
		echo -n "输入的目录无效，"
		checkInputDestDir
	fi
}

# 需处理源码目录检查
if [[ -d $classes_dir ]]; then
	echo "需处理源码目录存在 $classes_dir"
else
	echo "请确认需处理源码目录是否存在 $classes_dir"
	checkInputDestDir
fi


####### 数据定义

# 定义属性保存数组
declare -a rename_properties_config_content_array
cfg_line_count=0


# 读取属性配置文件
function read_rename_properties_configs {
	IFS_OLD=$IFS
	IFS=$'\n'
	# 删除文件行首的空白字符 http://www.jb51.net/article/57972.htm
	for line in $(cat $cfg_file | sed 's/^[ \t]*//g')
	do
		is_comment=$(expr "$line" : '^#.*')
		echo "line=${line} is_common=${is_comment}"
		if [[ ${#line} -eq 0 ]] || [[ $(expr "$line" : '^#.*') -gt 0 ]]; then
			echo "blank line or comment line"
		else
			rename_properties_config_content_array[$cfg_line_count]=$line
			cfg_line_count=$[ $cfg_line_count + 1 ]
			# echo "line>>>>${line}"
		fi	
	done
	IFS=${IFS_OLD}
}

function print_array {
	# 获取数组
	local newarray
	newarray=($(echo "$@"))
	for (( i = 0; i < ${#newarray[@]}; i++ )); do
		item=${newarray[$i]}
		echo "array item >>> ${item}"
	done
}

# 重命名所有的属性
function rename_properties {

	# 读取属性配置文件
	read_rename_properties_configs
	# print_array ${rename_properties_config_content_array[*]}

	# 执行替换操作
	for (( i = 0; i < ${#rename_properties_config_content_array[@]}; i++ )); do
		original_prop_name=${rename_properties_config_content_array[i]};
		result_prop_name="${class_prefix}${original_prop_name}${class_suffix}"
		sed -i '{
			s/'"${original_prop_name}"'/'"${result_prop_name}"'/g
		}' `grep ${original_prop_name} -rl ${classes_dir}`
		echo "正在处理属性 ${original_prop_name}....."
	done
}

checkOrCreateFile ${custom_blacklist_cfg_tmp_file}

# 获取自定义的黑名单属性并保存到文件中
echo "# 由脚本RenameProperty.sh自动生成" > ${custom_blacklist_cfg_file}
for (( i = 0; i < ${#custom_blacklist_search_dirs[@]}; i++ )); do
	custom_blacklist_search_dir=${custom_blacklist_search_dirs[${i}]}
	./GetAndStoreProperties.sh \
		-i ${custom_blacklist_search_dir}\
		-o ${custom_blacklist_cfg_tmp_file}
	cat ${custom_blacklist_cfg_tmp_file} >> ${custom_blacklist_cfg_file}
done


# 获取和保存属性到熟悉配置文件
./GetAndStoreProperties.sh \
	-i ${classes_dir}\
	-o ${cfg_file}\
	-f \
	-c ${custom_blacklist_cfg_file}


# 执行属性重命名
rename_properties

echo "done."


