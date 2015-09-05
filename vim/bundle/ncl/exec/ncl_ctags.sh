#!/bin/bash
#==========================================================
# Author: fanghuan - fanghuan_nju@163.com
# Filename: ncl_ctags.sh
# Creat time: 2014-03-07 13:17:40
# {{{ comment flod start-----------------------
# Description: $1 the path of *.ncl being edit
# $2 the flag depicts the os
# Last modified: 2015-02-16 13:17:40
# ---------------------------------------------
# Description: new year in sheep year
# Last modified: 2015-02-19 00:13:33
# ---------------------------------------------
# Description: add the multi-os support
# Last modified: 2015-02-17 15:29:54
#
# Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
#    File: ncl-ctags-gen.sh
# Created: Monday, October 24 2011
# License: GPL v3 or later.  <http://www.gnu.org/licenses/gpl.html>

# Description:
# to generate TAGS for ncl source files; -e option to produce emacs format
# NOTE: may fail if the filename has spaces
# usage: ncl-ctags-gen.sh /path/to/ncl/files
# the original explianation end here
# }}} comment flod end
#==========================================================
if test $# -le 0 ;then # {{{  fold start
	echo 'not enough parameters,please give the path of ncl.tags defined by user as $1'
	exit 0
fi # }}}  fold end 

std_tags_path_1=$NCARG_ROOT
std_tags_path_2=$GEODIAG_ROOT
#user_define_tags_path=`echo $1|sed -e "s#$HOME#~#g"`
user_define_tags_path=$1
os_flag=$2


#----os_flag ctags_path find_path---- {{{  fold start 
OS_Detect() { # {{{ function fold start
	os_flag='mac'
} # }}} function fold end

if test -z $os_flag;then
	echo 'os_flag is empty,get the value from function OS_Detect()'
	OS_Detect
fi
#------------------------------------
case $os_flag in # {{{  fold start 
	mac) if test -z `which brew 2>/dev/null`;then
			echo 'this is no Homebrew is the mac os x'
			ctags_path=`which ctags 2>/dev/null`
		else
			ctags_path=`brew --prefix`/bin/ctags
		fi
	find_path=`which find 2>/dev/null`;;

	linux) ctags_path=`which ctags 2>/dev/null`
	find_path=`which find 2>/dev/null`;;

	cygwin) ctags_path=`which ctags 2>/dev/null`
	find_path=`which find 2>/dev/null`;;

	windows) ctags_path=`which ctags 2>/dev/null`
		#echo $ctags_path
		whereis_find=`whereis find 2>/dev/null|grep "/usr/bin/find.exe" -o`
		#echo $whereis_find
		if test -z $whereis_find;then
			find_path=''
		else
			find_path='/usr/bin/find'
		fi
		echo $find_path;;
	*) echo 'Operating System is unkown,'`basename $0`' will exit.'
	exit ;;
esac # }}}  fold end 

if test -z $ctags_path;then # test ctags_path is empty?yes-> no ctags in os
	echo "this no ctags in os,please ensure your system have installed ctags"
	exit
elif test -z $find_path;then # test find_path is empty?yes->no find in os
	echo "this no find in os,please ensure your system have installed find"
	exit
fi # }}} fold end 

# {{{ fold start ctags command line(three parts)
Ncl_tags() { # {{{ function fold start
	if test $# -le 1;then
		echo 'not enough parameter for Ncl_tags(required 2)'
		return
	elif test $# -ge 3;then
		echo 'too many parameter for Ncl_tags(required 2)'
		return
	else 
		function_pattern='/^[[:space:]]*function[[:space:]]+([a-zA-Z0-9_]+)[:blank:]*.*/\1/f,function/'
		procedure_pattern='/^[[:space:]]*procedure[[:space:]]+([a-zA-Z0-9_]+)[:blank:]*.*/\1/p,procedure/'
		$ctags_path  -a --verbose=yes -f $2 --langdef=ncl --langmap=ncl:.ncl  \
		--regex-ncl=$function_pattern  --regex-ncl=$procedure_pattern \
		`$find_path $1 -type f \! -path "*UCAS*" -name "*.ncl" 2>/dev/null` > $2'.log'
		# 2>/dev/null remove Permission denied
		# \! -path "*UCAS*" exclude the path contains /UCAS/

		# |sed -e "s#$HOME#~#g" replace $HOME with ~ ,the double quote(",use "
		# $HOME will change into /Users/hubery/) is necessary,can't use single 
		# quote(',use ' $HOME->$HOME)
		echo "successfully update the $2, more detail see $2.log"
	fi
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#                   this section is set for mac os x system                     
#                   added by huerby 2014.10.3 21:22                             
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~split up line~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#`brew --prefix`/bin/ctags -a --verbose=yes -f $Fn3 --langdef=ncl --langmap=ncl:.ncl \
#      --regex-ncl= \
#'/^[[:space:]]*function[[:space:]]+([a-zA-Z0-9_]+)[:blank:]*.*/\1/f,function/' \
#      --regex-ncl= \
#'/^[[:space:]]*procedure[[:space:]]+([a-zA-Z0-9_]+)[:blank:]*.*/\1/p,procedure/' \
#      --ncl-kinds=+p --fields=+iaS --fields=+lS --extra=+q -R \
#     `find . -type f -name "*.ncl"`
##{{{ ~ the ctags command line for mac os x~~~~~~~
## 此处使用`brew --prefix`/bin/ctags 代替 ctags 是因为苹果自带的ctags版本比较老，
## 不能支持 -R 参数，否则报错。因此推荐手动安装新版本的ctags，推荐用brew安装.
## 安装说明：from the internet <https://gist.github.com/nazgob/1570678>
##-------------------------------------------------------------------------------
##|||## you have ctags but it does not work...
##|||$ ctags -R --exclude=.git --exclude=log *
##|||ctags: illegal option -- R
##|||usage: ctags [-BFadtuwvx] [-f tagsfile] file ...
##|||
##|||you need to get new ctags, i recommend homebrew but anything will work
##|||$ brew install ctags
##|||
##|||alias ctags if you used homebrew
##|||$ alias ctags="`brew --prefix`/bin/ctags"
##|||
##|||try again!
##|||ctags -R --exclude=.git --exclude=log *
##|||
##|||puts tags file into you .gitignore (probably global) and you're all set!
##|||
##|||PS. i was inspired to install ctags by https://workshops.thoughtbot.com/vim 
##|||video by @r00k, thanks man!
##-------------------------------------------------------------------------------
##----setting for mac os x ends-----}}}
} # }}} function fold end 

#-{{{---first part--------output nclstd.tags--
if test -z $std_tags_path_1;then # test $NCARG_ROOT is empty? yes->do nothing
	echo '$NCARG_ROOT is not set'
elif test -d $std_tags_path_1;then # test $NCARG_ROOT is empty? yes->do nothing
	Fn1=$std_tags_path_1'/nclstd.tags'
	Ncl_tags $std_tags_path_1 $Fn1
else
	echo '$NCARG_ROOT is not set correctly'
fi # }}} fold end 

#--{{{ -------second part--------output nclgeo.tags---
if test -z $std_tags_path_2;then # test $GEODIAG_ROOT is empty? yes->do nothing
	echo '$GEODIAG_ROOT is not set'
elif test -d $std_tags_path_2;then # test $GEODIAG_ROOT is empty? yes->do nothing
	echo $std_tags_path_2
	Fn2=$std_tags_path_2/'nclgeo.tags'
	Ncl_tags $std_tags_path_2 $Fn2
else
	echo '$GEODIAG_ROOT is not set correctly'
fi # }}}  fold end 

#--{{{ --third part--------output ncludef.tags---
Fn3='ncludef.tags'
if test -z $std_tags_path_1;then # std_tags_path_1 is empty
	if test -z $std_tags_path_2;then # {{{  fold start
		Ncl_tags $PWD $Fn3 
	elif test -d $std_tags_path_2;then
		if test $PWD = $std_tags_path_2;then
			echo 'the $PWD is just the $GEODIAG_ROOT'
		else
			Ncl_tags $PWD $Fn3 
		fi
	else
		Ncl_tags $PWD $Fn3 
	fi # }}}  fold end 
elif test -d $std_tags_path_1 ;then # std_tags_path_1 is an exsit dir
	if test -z $std_tags_path_2;then # {{{  std_tags_path_2 is empty
		if test $PWD = $std_tags_path_1;then
			echo 'the $PWD is just the $NCARG_ROOT'
		else
			Ncl_tags $PWD $Fn3 
		fi
	elif test -d $std_tags_path_2;then # std_tags_path_2 is exsit dir
		if test $PWD = $std_tags_path_1;then
			echo 'the $PWD is just the $NCARG_ROOT'
		elif test $PWD = $std_tags_path_2;then
			echo 'the $PWD is just the $GEODIAG_ROOT'
		else
			Ncl_tags $PWD $Fn3 
		fi
	else # std_tags_path_2 is an unexsit dir,similar with std_tags_path_2 is empty
		if test $PWD = $std_tags_path_1;then
			echo 'the $PWD is just the $NCARG_ROOT'
		else
			Ncl_tags $PWD $Fn3 
		fi
	fi # }}}  fold end 
else # std_tags_path_1 is an unexsit dir,similar with std_tags_path_1 is empty
	if test -z $std_tags_path_2;then # {{{  std_tags_path_2 is empty
		Ncl_tags $PWD $Fn3 
	elif test -d $std_tags_path_2;then # std_tags_path_2 is exsit dir
		if test $PWD = $std_tags_path_2;then
			echo 'the $PWD is just the $GEODIAG_ROOT'
		else
			Ncl_tags $PWD $Fn3 
		fi
	else #std_tags_path_2 is an unexsit dir,similar with std_tags_path_2 is empty
		Ncl_tags $PWD $Fn3 
	fi # }}}  fold end 
fi # }}}  fold end 
# }}} fold end ctags command line(three parts)
#===============================================================================

#-------------------------------------------------------------------------------
#         this section is for linux system {{{  fold start
#         Last modified on 2014.3.7 20:38 
#         update on 2014.10.3.9:55
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~split up line~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##|#ctags -a --verbose=yes  --langdef=ncl --langmap=ncl:.ncl   \
##|#    --regex-ncl= \
##|#'/^[[:space:]]*function[[:space:]]+([a-zA-Z0-9_]+)[:blank:]*.*/\1/f,function/' \
##|#    --regex-ncl= \
##|#'/^[[:space:]]*procedure[[:space:]]+([a-zA-Z0-9_]+)[:blank:]*.*/\1/p,procedure/' \
##|#    --ncl-kinds=+p --fields=+iaS --fields=+lS --extra=+q -R  \
##|#   `find ${1:-"."} -type f -name "*.ncl"`
##~~~~~~~~~~~~~~~~~~~~~end the ctags command line for mac os x~~~}}} fold end~


#-------------------------------------------------------------------------------
#         this section is for windows system(cygwin) {{{  fold start
#         Last modified on 2014.3.7 20:38 
#         update on 2014.10.3.9:55
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~split up line~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##|#ctags -a --verbose=yes  --langdef=ncl --langmap=ncl:.ncl \
##|#    --regex-ncl= \
##|#'/^[[:space:]]*function[[:space:]]+([a-zA-Z0-9_]+)[:blank:]*.*/\1/f,function/' \
##|#    --regex-ncl= \
##|#'/^[[:space:]]*procedure[[:space:]]+([a-zA-Z0-9_]+)[:blank:]*.*/\1/p,procedure/'\
##|#    --ncl-kinds=+p --fields=+iaS --fields=+lS --extra=+q -R \
##|#    `D:/software/cygwin/bin/find . -type f -name "*.ncl"`
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~end the ctags command line for mac os x~~~~~~~
# need to give the path of find , otherwise the gvim on windows system will run 
# the "find.exe" in C:\windows\system32\find.exe instead of 
# D:\software\cygwin\bin\find.exe . Becasue the useage of find command in cmd is
# differen from it in shell。
#-------------------------------------------------------------------------------
#-----------------------------end setting for cygwin on windows---}}}  fold end


#-------------------------------------------------------------------------------
# {{{ the explaination of the ctags arugement
#ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
#--c++-kinds=+p  : 为C++文件增加函数原型的标签
#--fields=+iaS   : 在标签文件中加入继承信息(i)、类成员的访问控制信息(a)、以及函数的指纹(S)
#--extra=+q      : 为标签增加类修饰符。注意，如果没有此选项，将不能对类成员补全 # -R  : 递归创建

#**********************************************************************
#−−langdef=name {{{
#Defines a new user-defined language, name, to be parsed with regular 
#expressions. Once defined, name may be used in other options taking language 
#names. The #typical use of this option is to first define the language, then 
#map file names to it using −−langmap, then specify regular expressions using
#−−regex−<LANG> #to define how its tags are found. }}}
#−−langmap=map[,map[...]] {{{
#**********************************************************************
#Controls how file names are mapped to languages (see the −−list−maps option). 
#Each comma-separated map consists of the language name (either a built-in or 
#user-defined language), a colon, and a list of file extensions and/or file name
#patterns. A file extension is specified by preceding the extension with a 
#period (e.g. ".c"). A file name pattern is specified by enclosing the pattern 
#in parentheses (e.g. "([Mm]akefile)"). If appropriate support is available 
#from the runtime library of your C compiler, then the file name pattern may 
#contain the usual shell wildcards common on Unix (be sure to quote the option 
#parameter to protect the wildcards from being expanded by the shell before 
#being passed to ctags). You can determine if shell wildcards are available on 
#your platform by examining the output of the −−version option, which will 
#include "+wildcards" in the compiled feature list; otherwise, the file name 
#patterns are matched against file names using a simple textual comparison. 
#When mapping a file extension, it will first be unmapped from any other languages.

#If the first character in a map is a plus sign, then the extensions and file 
#name patterns in that map will be appended to the current map for that 
#language; otherwise, the map will replace the current map. For example, to 
#specify that only files with extensions of .c and .x are to be treated as C 
#language files, use "−−langmap=c:.c.x"; to also add files with extensions of .j
#as Java language files, specify "−−langmap=c:.c.x,java:+.j". To map #makefiles 
#(e.g. files named either "Makefile", "makefile", or having the extension ".mak")
#to a language called "make", specify "−−langmap=make:([Mm]#akefile).mak". To map
#files having no extension, specify a period not followed by a non-period 
#character (e.g. ".", "..x", ".x."). To clear the mapping for #a particular 
#language (thus inhibiting automatic generation of tags for that language),
#specify an empty extension list (e.g. "−−langmap=fortran:"). To #restore the 
#default language mappings for all a particular language, supply the keyword 
#"default" for the mapping. To specify restore the default language #mappings 
#for all languages, specify "−−langmap=default". Note that file extensions are 
#tested before file name patterns when inferring the language of a #file.
#*************************************************************************}}}
#−−regex−<LANG>=/regexp/replacement/[kind−spec/][flags]{{{
#The /regexp/replacement/ pair define a regular expression replacement pattern,
#similar in style to sed substitution commands, with which to generate tags from
#source files mapped to the named language, <LANG>, (case-insensitive; either a 
#built-in or user-defined language). The regular expression, regexp, defines an
#extended regular expression (roughly that used by egrep(1)), which is used to 
#locate a single source line containing a tag and may specify tab characters 
#using \t. When a matching line is found, a tag will be generated for the name 
#defined by replacement, which generally will contain the special back-references
#\1 through \9 to refer to matching sub-expression groups within regexp. The 
#’/’ separator characters shown in the parameter to the option can actuallye
#replaced by any character. Note that whichever separator character is used will
#have to be escaped with a backslash (’\’) character wherever it is used inhe
#parameter as something other than a separator. The regular expression defined 
#by this option is added to the current list of regular expressions for the
#specified language unless the parameter is omitted, in which case the current list is cleared.

#Unless modified by flags, regexp is interpreted as a Posix extended regular 
#expression. The replacement should expand for all matching lines to a non-empty
#string of characters, or a warning message will be reported. An optional kind 
#specifier for tags matching regexp may follow replacement, which will determine 
#what kind of tag is reported in the "kind" extension field (see TAG FILE FORMAT, 
#below). The full form of kind−spec is in the form of a single letter, a comma, 
#a name (without spaces), a comma, a description, followed by a separator, which
#specify the short and long forms of the kind value and its textual description
#(displayed using −−list−kinds). Either the kind name and/or the description may
#be omitted. If kind−spec is omitted, it defaults to "r,regex". Finally, flags 
#are one or more single-letter characters having the following effect upon the 
#interpretation of regexp:
#b-----------The pattern is interpreted as a Posix basic regular expression.
#e-----------The pattern is interpreted as a Posix extended regular expression (default).
#i-----------The regular expression is to be applied in a case-insensitive manner.
#Note that this option is available only if ctags was compiled with support for 
#regular expressions, which depends upon your platform. You can determine if 
#support for regular expressions is compiled in by examining the output of the}}}

#−−version option, which will include "+regex" in the compiled feature list.
#For more information on the regular expressions used by ctags, see either the 
#regex(5,7) man page, or the GNU info documentation for regex (e.g. "info
#regex") }}}  fold end 
#* vim:set foldlevel=0: *
