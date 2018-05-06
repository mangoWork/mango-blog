#!/bin/bash

dai_base=/home/dlm/work/mango-blog
flag_path=${dai_base}/mango-blog-dai/version
version_path=/home/dlm/.dai/v_md5
gitbook_v_path=/home/dlm/.dai/g_md5
version=$(cat ${flag_path})

git fetch --all
git reset --hard origin/gitbook-dai

if [ ! -d $version_path ]; then
    mkdir -p ${version_path}
fi 



# $1 需要监测的文件
# $2 存放文件md5值，用于判断文件是否更改
# $3 可选文件更新后，需要执行的命令（用'service nginx restart' 用单引号包起来）
# $1 标识创建的文件，$2标识md5存放目录
function createMD5(){
     md5sum -b $1 > $2
     # 判断文件是否存在
}

function compare_change(){    
    if [ ! $2 ]; then
        creatMd5file $1 $2
        return 1
    fi
    
    md5sum -c $2 --status
    # 检测文件是否修改，$?返回1 表示修改, 0表示未修改
    if [ $? -gt 0 ] ; then        
        creatMd5file $1 $2
        return 1
    fi
    return 0
}

v_flag=compare_change ${flag_path} ${version_path}
g_flag=compare_change ${dai_base}/mango-blog-dai/book.json ${gitbook_v_path}

cd ${dai_base}/mango-blog-dai
 
if [ $g_flag -gt 0 ]; then        
    gitbook install
fi

if [ $v_flag -gt 0 ]; then    
    gitbook build  --output=${dai_base}/mango-blog-dai
fi


