#!/bin/bash
#==========================================================
# Author: fanghuan - fanghuan_nju@163.com
# Filename: Res_help_tags.sh
# Creat time: 2015-03-21 00:11:35
# {{{ comment flod start-----------------------
# Description: generate tags for Res_help_list.ncl
# Last modified: 2015-03-21 00:11:35
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
    tags_name="ncl_func_help.tags"
    tags_path="$tags_path/$tags_name"
fi

printf '!_TAG_FILE_FORMAT\t2\t/extended format; --format=1 will not append ;\" to lines/\n' > $tags_path
printf '!_TAG_FILE_SORTED\t1\t/0=unsorted, 1=sorted, 2=foldcase/\n' >> $tags_path
printf '!_TAG_PROGRAM_AUTHOR\tDarren Hiebert\t/dhiebert@users.sourceforge.net/\n' >> $tags_path
printf '!_TAG_PROGRAM_NAME\tExuberant Ctags\t//\n' >> $tags_path
printf '!_TAG_PROGRAM_URL\thttp://ctags.sourceforge.net\t/official site/\n' >> $tags_path
printf '!_TAG_PROGRAM_VERSION\t5.8\t//\n' >> $tags_path
#
if test -d "$HOME/.vim/bundle/ncl/func";then
    cd $HOME/.vim/bundle/ncl/func # enter into ~/.vim/bundle/ncl
else
    echo '$HOME/.vim/bundle/ncl/func dosen.t exsit'
    exit
fi

for ifile in `ls *-help.ncl|sort`;do
    function_name=`echo $ifile|awk -F '-' '{print $1}'`
    function_path=$PWD/$ifile
    grep_pattern="^[[:space:]]{8}[a-zA-Z0-9_]+[[:space:]]$function_name[[:space:]]\($"
    Mark=`grep -E $grep_pattern $function_path`
    function_type=`echo $Mark|awk '{print $1}'`
    #echo "$function_name\t$function_path\t/^        $function_type $function_name (\$/;\"\t${function_type:0:1}" >>$tags_path
    printf "%s\t%s\t/^        %s %s (\$/;\"\t%s\n" "$function_name" "$function_path" "$function_type" "$function_name" "${function_type:0:1}">>$tags_path
done
