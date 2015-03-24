#!/bin/bash
#==========================================================
# Author: fanghuan - fanghuan_nju@163.com
# Filename: html2text_for_ncl.sh
# Creat time: 2015-03-20 14:53:59
# {{{ comment flod start-----------------------
# Description: delete the useless text in *_help.ncl from *.shtml
# Last modified: 2015-03-20 14:53:59
# ---------------------------------------------
# Description:  modify the bugs in test command
# Last modified: 2015-03-20 23:46:03
# ---------------------------------------------
# Description: generate the help doc for functions in ncl
# Last modified: 2015-03-20 15:14:32
# }}} comment flod end
#=========================================================
if test -d "$HOME/.vim/bundle/ncl";then
    cd $HOME/.vim/bundle/ncl # enter into ~/.vim/bundle/ncl
else
    echo '$HOME/.vim/bundle/ncl dosen.t exsit'
    exit
fi

Source_file="ncl_func_from_dict"
Find_ouput="ncl_func_html_from_find"
Docu_path="$HOME/Public/Website/CISL/Document"

if test -z $Source_file ;then
    echo "$Source_file doesn't exsit"
    exit
fi

if test -d 'func' ;then
    echo "func folder already exsit"
else
    mkdir func
fi

if test -d 'res' ;then
    echo "res folder already exsit"
else
    mkdir res
fi

if test -f $Find_ouput ;then
    echo "$Find_ouput already exsit"
else
    echo "$Find_ouput  doesn't exsit"
    find $Docu_path -type f -name "*.shtml" 2>/dev/null >$Find_ouput
fi

# deal with ncl functions in $Docu_path/Functions
for Funcname in `cat $Source_file`;do
    #echo $Funcname
    Shtml_path=`grep -w "$Funcname" $Find_ouput 2>/dev/null|head -1`
    if test ! -z "$Shtml_path" ;then
        if [[ -f "$Shtml_path" ]];then
            ofile='func/'$Funcname'-help.ncl'
            lynx -dump -crawl $Shtml_path 2>/dev/null >$ofile

            if test -f $ofile;then
                ifile=$ofile
                # delete the useless text
                Line=`grep -n "NCL Home" $ifile 2>/dev/null|grep -o "[0-9]\+"`
                #echo $Line

                if test -z $Line ;then
                    echo "NCL Home not found in $ifile"
                else
                    Line=$[Line-1]
                    #echo $Line
                    sed -i "" "3,$Line d" $ifile
                fi
            else
                echo "$ofile dosen't exsit"
            fi
        else
            echo "$Shtml_path dosen't exsit"
        fi
    else
        echo '$Shtml_path is empty'
    fi
done

# deal with ncl resources in $Docu_path/Graphics/Resources
ofile=res/Res_help_list.ncl
lynx -dump -crawl $Docu_path/Graphics/Resources/list_alpha_res.shtml 2>/dev/null >$ofile

if test -f $ofile;then
    ifile=$ofile
    # delete the useless text
    Line=`grep -n "NCL Home" $ifile 2>/dev/null|grep -o "[0-9]\+"`
    #echo $Line

    if test -z $Line ;then
        echo "NCL Home not found in $ifile"
    else
        Line=$[Line-1]
        #echo $Line
        sed -i "" "3,$Line d" $ifile
        echo "# vim:set foldmethod=indent foldlevel=0:"  >>$ifile
    fi
else
    echo "$ofile dosen't exsit"
fi
