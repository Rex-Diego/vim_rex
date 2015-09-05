""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Normal settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set encoding=utf-8
"set fileencodings=utf-8,gbk,gb18030
set nu
set smartindent
set modelines=10
set autoindent
set nocompatible 
set backspace=indent,eol,start
set mouse=a
syntax enable
colorscheme zenburn
"For MMA
au BufRead,BufNewFile *.m set filetype=mma
au! Syntax newlang source $VIM/mma.vim 
au BufRead,BufNewFile *.m set dictionary=~/.vim/dictionary/mma.dic
"For NCL
au BufRead,BufNewFile *.ncl set filetype=ncl
au! Syntax newlang source $VIM/ncl.vim 
au BufRead,BufNewFile *.ncl set dictionary=~/.vim/dictionary/ncl.dic
"Remember the last edit position
autocmd BufReadPost *
	\ if line("'\"")>0&&line("'\"")<=line("$") |
	\	exe "normal g'\"" |
	\ endif
"GVIM-settings
if has('gui_running')
	set background=dark
	colorscheme solarized
	let g:Powerline_symbols = 'fancy'
	set guifont=Monospace\ 15 
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Hotkey
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> :up<CR>
map <F3> :up<CR>:q<CR>
""map <F4> :q!<CR>     
map <F5> :bp<CR>    
map <F6> :bn<CR>   
map <F7> :if exists("syntax_on") <BAR>
\   syntax off  <BAR><CR>
\ else<BAR>
\   syntax  enable  <BAR>
\ endif <CR>
map <F8> :set hls!<BAR>set  hls?<CR> 
map <F9> :NumbersToggle<CR>
"map <F9> :set paste!<BAr>set   paste?<CR>
"set  pastetoggle=<F9>
map <F10> :call CompileCode()<CR> :call RunResult()<CR>
imap <F10> <ESC>:call CompileCode()<CR> :call RunResult()<CR>
vmap <F10> <ESC>:call CompileCode()<CR> :call RunResult()<CR>
map <F11>  :%!xxd   <CR>        " 回复正常显示
map <F12>  :%!xxd   -r<CR>        " 回复正常显示

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin-----Easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin-Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set t_Co=256 
"let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme='solarized256'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin-----Taglist(p.s.winmanager)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Use_Right_Window = 1         
let Tlist_Show_One_File=0
let Tlist_Exit_OnlyWindow = 1
let g:winManagerWindowLayout='TagList|FileExplorer'
nmap wm :WMToggle<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin-Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap tb :TagbarToggle<cr>
let g:tagbar_updateonsave_maxlines = 1 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin-Minibufexplore
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin-Tabularize
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','
    nmap <Leader>= :Tabularize /=<CR>
    vmap <Leader>= :Tabularize /=<CR>
    nmap <Leader>: :Tabularize /:\zs<CR>
    vmap <Leader>: :Tabularize /:\zs<CR>
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin-Autocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Show autocomplete menus.
set complete-=k complete+=k " Add dictionary search (as per dictionary option)
set wildmode=list:full
set wildmenu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin-Neocomplcache
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NeoComplCache_EnableAtStartup = 1
let g:neocomplcache_enable_auto_select = 1 
let g:acp_enableAtStartup = 1
let g:SuperTabDefaultCompletionType="<C-X><C-U>"
let g:NeoComplCache_DisableAutoComplete = 0

    au Bufread,BufNewfile *.ncl set tags=$NCARG_ROOT/nclstd.tags
    au Bufread,BufNewfile *.ncl set tags+=$HOME/.vim/bundle/ncl/exec/ncl_func_help.tags
    au Bufread,BufNewfile *.ncl set tags+=$HOME/.vim/bundle/ncl/exec/ncl_res_help.tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin-Ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin-Numbers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:numbers_exclude = ['fileexplorer', 'tagbar', 'gundo', 'minibufexpl', 'nerdtree']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"One key Run
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! CompileGcc()
    exec "w"
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi/.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut/.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv/.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp/.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math/.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! CompileGpp()
    exec "w"
    let compilecmd="!g++ "
    let compileflag="-o %< "
    if search("mpi/.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut/.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv/.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp/.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math/.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc

func! CompileJava()
    exec "!javac %"
endfunc

func! CompileFor()
    exec "w"
    let compilecmd="!ifort "
    let compileflag="-o %< "
    exec compilecmd." % ".compileflag
endfunc

func! CompileCode()
        exec "w"
        if &filetype == "cpp"
                exec "call CompileGpp()"
        elseif &filetype == "c"
                exec "call CompileGcc()"
        elseif &filetype == "python"
                exec "call RunPython()"
        elseif &filetype == "java"
                exec "call CompileJava()"
        elseif &filetype == "fortran"
                exec "call CompileFor()"
        endif
endfunc

func! RunResult()
        exec "w"
        if search("mpi/.h") != 0
            exec "!mpirun -np 4 ./%<"
        elseif &filetype == "cpp"
            exec "! ./%<"
        elseif &filetype == "c"
            exec "! ./%<"
        elseif &filetype == "python"
            exec "!python ./%"
        elseif &filetype == "java"
            exec "!java %<"
        elseif &filetype == "ncl"
            exec "!ncl %"
        elseif &filetype == "sh"
            exec "!bash ./%"
        elseif &filetype == "fortran"
            exec "! ./%<"
        elseif &filetype == "mma"
            exec "!math -script %"
        endif
endfunc
"---------------------add by fanghuan -----------------"
" indent-guides setting
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
set scrolloff=3
ab {{{  {{{  fold start
ab }}}  }}}  fold end
"{{{ 进行版权声明的设置
map <F4> :call TitleDet()<cr>
function TitleDet() "{{{ function fold start
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
    let CommentFlag = FileDet()
    let n=1
    "默认为添加
    while n < 200
        let Line = strpart(getline(n),2,4)
        if Line == 'Last'
            call UpdateTitle(CommentFlag,n)
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle(CommentFlag)
    unlet CommentFlag
endfunction "}}} function fold end

function FileDet() "{{{ function fold start  根据文件类型确定注释符号
	"let Suffix = tolower(expand("%:e"))
	"let FileName = tolower(expand("%:t"))
	"let FirstChar = strpart(FileName,0,1) "get the first letter of filename
	"if FirstChar == '.'
	"if  empty(Suffix)
	"	let CommentFlag = "#"
	"elseif Suffix=="ncl"
	"	let CommentFlag = ";"
	"elseif match(["f","f90","f77","for"],Suffix)>=0
	"	let CommentFlag = "!"
	"elseif Suffix == "sh"
	"	let CommentFlag = "#"
	"elseif match(Suffix,"vim")>=0
	"	let CommentFlag= '"'
	"endif
	if  &filetype == "python" || &filetype == "sh" || &filetype == "expect"
		let CommentFlag = "#"
	elseif &filetype == "ncl"
		let CommentFlag = ";"
	elseif &filetype == "matlab"
		let CommentFlag = "%"
	elseif &filetype == "vim"
		let CommentFlag = '"'
	elseif &filetype == "fortran"
		let CommentFlag = "!"
	else
		let CommentFlag = " "
	endif
	return CommentFlag
endfunction "}}} function fold end

function AddTitle(CommentFlag) "{{{ function fold start 添加或更新copyright
    call append(1,a:CommentFlag."==========================================================")
    call append(2,a:CommentFlag." Author: fanghuan - fanghuan_nju@163.com")
    call append(3,a:CommentFlag." Filename: ".expand("%:t"))
    call append(4,a:CommentFlag." Creat time: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(5,a:CommentFlag." {{{ comment flod start-----------------------")
    call append(6,a:CommentFlag." Description: ")
    call append(7,a:CommentFlag." Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(8,a:CommentFlag." }}} comment flod end")
    call append(9,a:CommentFlag."==========================================================")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf "}}} function fold end

function UpdateTitle(CommentFlag,Line) "{{{ function fold start 更新最近修改时间和文件名
    "normal m'
    "execute '/; Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")@'
    "normal ''
    "normal mk
    execute '/'.a:CommentFlag.' Filename:/s@:.*$@\=": ".expand("%:t")@'
    "execute "noh"
    "normal 'k
    call append(a:Line+0,a:CommentFlag." ---------------------------------------------")
    call append(a:Line+1,a:CommentFlag." Description: ")
    call append(a:Line+2,a:CommentFlag." Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction "}}} function fold end
"}}}
