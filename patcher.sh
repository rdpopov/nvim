#!/bin/bash
function git_apply(){
    git -C $1 apply $2
}

function git_reset(){
    git -C $1 reset --hard 
}

cd ~/.config/nvim
if [[ -e patches ]] && [[ -e plugged ]];then
    for i in $(ls plugged);do
        ls "./patches/"$i 1>/dev/null 2>/dev/null || mkdir  "./patches/"$i
    done
    for i in $(ls patches);do
        src="./patches/"$i 
        targ="./plugged/"$i
        git_reset $targ
        for _patch in $(ls $src);do 
            #echo $src"/"$patch
            patch=$src"/"$_patch
            target_patch=$targ"/"$_patch
            cp $patch $target_patch
            git_apply $targ $_patch
            rm $target_patch
        done 
    done
else 
    echo "No patches for current plugins"
fi
