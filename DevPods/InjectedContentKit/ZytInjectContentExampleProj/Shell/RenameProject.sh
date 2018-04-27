#!/bin/bash

ProjectDir="$(pwd)/../"

# 原始项目名称
originalProjName="ZytInjectContentExampleProj"
# 需要修改的项目名称
replacedProjName="ZytInjectContentExample2222"
file="TestOriginalContent"

# project.pbxproj 文件位置
pbxprojFile="$(pwd)/../ZytInjectContentExampleProj.xcodeproj/project.pbxproj"
# Podfile文件位置
podFile="$(pwd)/../Podfile"


name="name = ${originalProjName}"
productName="productName = ${originalProjName}"
target="target '${originalProjName}'"

declare -a searchContents
searchContents[0]=${name}
searchContents[1]=${productName}
searchContents[2]=${target}

declare -a searchContentInFiles
searchContentInFiles[0]=${pbxprojFile}
searchContentInFiles[1]=${pbxprojFile}
searchContentInFiles[2]=${podFile}

for(( i=0;i<${#searchContents[@]};i++)) do 
	searchContent=${searchContents[$i]};
	file=${searchContentInFiles[$i]};
	echo "searchContent = ${searchContent}"
	sed -i '/'"${searchContent}"'/{
			s/'"${originalProjName}"'/'"${replacedProjName}"'/
		}' ${file}
done;
