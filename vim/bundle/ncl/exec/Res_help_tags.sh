#!/bin/bash
#==========================================================
# Author: fanghuan - fanghuan_nju@163.com
# Filename: Res_help_tags.sh
# Creat time: 2015-03-21 00:11:35
# {{{ comment flod start-----------------------
# Description: generate tags for Res_help_list.ncl
# Last modified: 2015-03-21 00:11:35
# ---------------------------------------------
# Description: bug can't deal with the same res for different workstation
# Last modified: 2015-03-21 13:24:24
# ---------------------------------------------
# Description: 
# Last modified: 2015-03-21 11:16:31
# }}} comment flod end
#==========================================================
if test -d "$HOME/.vim/bundle/ncl";then
    cd $HOME/.vim/bundle/ncl # enter into ~/.vim/bundle/ncl
else
    echo '$HOME/.vim/bundle/ncl dosen.t exsit'
    exit
fi

tags_path=$1
if [[ ! -z "$tags_path" ]];then
    tags_dir=`dirname "$tags_path"`
    tags_name=`basename "$tags_path"`
    if [[ ! -d "$tags_dir" ]];then
        echo "$tags_dir dosen't exsit,the tags file will be in $PWD/exec"
        tags_path="$PWD/exec"
    fi
else
    tags_path="$PWD/exec"
fi

if [[ -z "$tags_name" ]];then
    tags_name="ncl_res_help.tags"
    tags_path="$tags_path/$tags_name"
fi

printf '!_TAG_FILE_FORMAT\t2\t/extended format; --format=1 will not append ;\" to lines/\n' > $tags_path
printf '!_TAG_FILE_SORTED\t1\t/0=unsorted, 1=sorted, 2=foldcase/\n' >> $tags_path
printf '!_TAG_PROGRAM_AUTHOR\tDarren Hiebert\t/dhiebert@users.sourceforge.net/\n' >> $tags_path
printf '!_TAG_PROGRAM_NAME\tExuberant Ctags\t//\n' >> $tags_path
printf '!_TAG_PROGRAM_URL\thttp://ctags.sourceforge.net\t/official site/\n' >> $tags_path
printf '!_TAG_PROGRAM_VERSION\t5.8\t//\n' >> $tags_path
#
if test -d "$HOME/.vim/bundle/ncl/res";then
    cd $HOME/.vim/bundle/ncl/res # enter into ~/.vim/bundle/ncl
else
    echo '$HOME/.vim/bundle/ncl/res dosen.t exsit'
    exit
fi

for ifile in `ls *.ncl|sort`;do
    res_type="res"
    res_path=$PWD/$ifile
    list_pattern="^[[:space:]]{3}[a-zA-Z0-9_]+[[:space:]]?\(?[a-zA-Z0-9_]*\)?$"
    res_list=`grep -E $list_pattern $res_path|awk '{print $1}'`

    for ires in $res_list;do
        res_name=$ires
        wks_pattern="^[[:space:]]{3}$res_name[[:space:]]\([a-zA-Z0-9_]+\)$"
        #res_wks=`grep -E $wks_pattern $ifile|grep -Eo "\([a-zA-Z0-9_]+\)"`
        res_wks=`grep -E $wks_pattern $ifile|head -1|grep -Eo "\([a-zA-Z0-9_]+\)"`

        if [[ -z "$res_wks" ]];then
            printf "%s\t%s\t/^   %s\$/;\"\t%s\n" "$res_name" "$res_path" "$res_name" "${res_type:0:1}">>$tags_path
        else
            #echo $res_wks
            printf "%s\t%s\t/^   %s %s\$/;\"\t%s\n" "$res_name" "$res_path" "$res_name" "$res_wks" "${res_type:0:1}">>$tags_path
        fi
    done
    #echo "$res_name\t$res_path\t/^        $res_type $res_name (\$/;\"\t${res_type:0:1}" >>$tags_path
done
