#!/bin/env bash

files=(*.yaml)
# 以下文件是修改过，适配雾淞输入法
# weasel.custom.yaml
# wubi86_jidian.schema.yaml
# wubi86_jidian_pinyin.schema.yaml 
# default.custom.yaml
for i in "${files[@]}"; do
    if [ -e "../rime-ice/$i" ]; then
        echo "存在--$i"
        # pwsh -command "cp $i ../rime-ice/ && echo --$i copyed!"
        if [[ $i == "default.custom.yaml" ]]; then
            continue
        fi
        cp -pu "$i" ../rime-ice/
        # echo "cp $i"
    else
        if [[ $i == "default.custom.yaml" ]]; then
            cp -f ./default.custom.yaml.wusong.bak ../rime-ice/default.custom.yaml
        elif [[ $i == "squirrel.custom.yaml" || $i == "user.yaml" || $i == "installation.yaml" ]]; then
            echo "不存在--$i"
        else
            cp -pu "$i" ../rime-ice/
            echo "不存在++$i copyed!"
        fi
    fi
done

[ -d ./lua ] && cp -rf ./lua ../rime-ice
