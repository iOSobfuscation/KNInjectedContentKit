#!/bin/bash

injected_content="//#Test content";

# sed -i '/^- \(.*\){$/{
# 	a\ '"$injected_content"'
# }' InsertCodeToFunSourceFile.m


# sed -i -E '/^- \(.*\)[.\s\D]*?\{$/{
# 	a\ '"$injected_content"'
# }' InsertCodeToFunSourceFile.m

# sed -E '/^- \(.*\).*\{$/{
# 	a\ '"$injected_content"'
# }' InsertCodeToFunSourceFile.m


# sed '/\/\*/{
# 	:1;
#  	N;
#  	/\*\//!b1;
#  	s/\/\*.*\*\///
# }' InsertCodeToFunSourceFile.m

# sed '/^- \(.*\){$/{
# 	a\ '"$injected_content"'
# }' InsertCodeToFunSourceFile.m

sed -i '/^- \(.*\)/{
	:tag1;
 	N;
 	/{$/!b tag1;
 	a '"$injected_content"'
}' InsertCodeToFunSourceFile.m

sed -i '/^- \(.*\){$/{
	a\ '"$injected_content"'
}' InsertCodeToFunSourceFile.m

