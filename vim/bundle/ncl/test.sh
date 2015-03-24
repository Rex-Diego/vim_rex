#!/bin/bash
function_pattern='/^[[:space:]]+function[[:space:]]+([a-zA-Z0-9_]+)[[:space:]]*\($/\1/f,function/'
procedure_pattern='/^[[:space:]]+procedure[[:space:]]+([a-zA-Z0-9_]+)[[:space:]]\($/\1/p,procedure/'
ctags  -a --verbose=yes   --langdef=ncl --langmap=ncl:.ncl  \
--regex-ncl=$function_pattern  --regex-ncl=$procedure_pattern \
`find $HOME/.vim/bundle/ncl/func -type f \! -path "*UCAS*" -name "*.ncl" 2>/dev/null`
