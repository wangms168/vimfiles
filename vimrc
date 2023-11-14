" Modeline and Notes {{{
" vim: set sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:            "foldmarker={{{,}}} spell
" sw(shiftwidth)缩进4个字符;ts(tabstop)制表符4个空格;sts(softtabstop)插入Tab时算作4个空格;et(expandtab);tw(textwidth)最大文本宽度
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
" }}}

" Environment {{{
    " Identify platform {{{
        "silent function! OSX()
        "    return has('macunix')
        "endfunction
        "silent function! LINUX()
        "    return has('unix') && !has('macunix') && !has('win32unix')
        "endfunction
        "silent function! WINDOWS()
        "    return  (has('win32') || has('win64'))
        "endfunction
        let g:darwin = has('mac')
        let g:osx = has('macunix')
        let g:linux  = has('unix') && !has('macunix') && !has('``win32unix')
        let g:windows = has('win32') || has('win64')
        "let mapleader      = ' '
        "let maplocalleader = ' '
        if has('nvim')
            let $CONFIGDIR = fnamemodify($MYVIMRC, ':p:h')
        else
            if g:windows
               let $CONFIGDIR = fnamemodify($MYVIMRC, ':p:h')           " $HOME.'\vimfiles'  '~/vimfiles'这样写会报open_buffers错
            else
               let $CONFIGDIR = '~/.vim'
            endif
        endif
        " 在windows系统，由于这个目录是vim默认在rtp中，故无需下句rtp^=设置。
        " set rtp^=$CONFIGDIR              "大多数ex命令不会扩展变量名，即，它们不接受表达式。“ set”不是扩展表达式（变量）的命令之一,但可以接受前缀为$的环境变量.
        " exe 'set rtp^=' . expand(g:VIMDIR)
        " 将vim-plug存放目录放入rtp，+=添加在后面，^=添加在前面。"set rtp^=g:VIMDIR"这些不行，set不接受变不带任何前缀的变量
        " https://superuser.com/questions/806595/why-the-runtimepath-in-vim-cannot-be-set-as-a-variable

    " }}}

    " Basics {{{
        set nocompatible        " Must be first line
        if !g:windows
            set shell=/bin/sh
        endif
    " }}}

    " Windows Compatible {{{
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if g:windows
          "set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }}}

    " Arrow Key Fix {{{
        " https://github.com/spf13/spf13-vim/issues/780
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }}}

" }}}

" Environment {{{
    " form .vimrc.bundles

    " Basics {{{
        set nocompatible        " Must be first line
    " }}}

    " Windows Compatible {{{
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if has('win32') || has('win64')
          "set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

          " Be nice and check for multi_byte even if the config requires
          " multi_byte support most of the time
          if has("multi_byte")
            " Windows cmd.exe still uses cp850. If Windows ever moved to
            " Powershell as the primary terminal, this would be utf-8
            set termencoding=utf-8                 "cp850
            " Let Vim use utf-8 internally, because many scripts require this
            set encoding=utf-8
            setglobal fileencoding=utf-8
            " Windows has traditionally used cp1252, so it's probably wise to
            " fallback into cp1252 instead of eg. iso-8859-15.
            " Newer Windows files might contain utf-8 or utf-16 LE so we might
            " want to try them first.
            set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
            "set fileencodings=ucs-bom,utf-8,chinese,latin1
          endif
          set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
        endif
    " }}}
    source $CONFIGDIR/nonascii.vim

    if has('nvim')
        if has('win32')
            " let g:python3_host_prog=expand('~/AppData/Local/Programs/Python/Python39/python.exe')
            let g:python3_host_prog="D:/Scoop/shims/python38.exe"
        else
            let $PYTHONHOME='/usr/local/bin'
            let $PYTHONPATH='/usr/local/lib/python39.zip:/usr/local/lib/python3.9:/usr/local/lib/python3.9/lib-dynload:/home/honeywell/.local/lib/python3.9/site-packages:/usr/local/lib/python3.9/site-packages'
            let g:python3_host_prog='/bin/python3'
        endif
    else
        if has('win32')
            let &pythonhome='D:\wingetAPP\Python.2'
            let &pythondll='D:\wingetAPP\Python.2\python27.dll'

            " :py3 print("hello") 表示调用python3；:py print("hello")表示调用python2.
            let &pythonthreehome='D:\wingetAPP\Python.3.11'                  " expand('~/AppData/Local/Programs/Python/Python39')
            let &pythonthreedll='D:\wingetAPP\Python.3.11\python311.dll'     " expand('~/AppData/Local/Programs/Python/Python39/python39.dll')
        else
            let $PYTHONHOME='/usr/local/bin'
            let $PYTHONPATH='/usr/local/lib/python39.zip:/usr/local/lib/python3.9:/usr/local/lib/python3.9/lib-dynload:/home/honeywell/.local/lib/python3.9/site-packages:/usr/local/lib/python3.9/site-packages'
            let &pythonthreehome=expand('/bin')
            let &pythonthreedll=expand('/usr/local/lib/libpython3.9.so')
        endif
    endif
    " if has('win32')
    "    set pythondll=C:\Miniconda\envs\27\python27.dll
    "    set pythonhome=C:\Miniconda\envs\27
    "    set pythonthreedll=C:\Miniconda\python36.dll
    "    set pythonthreehome=C:\Miniconda
    " endif

" }}}

" Bundles {{{
    source $CONFIGDIR/1-plugins.vim
" }}}

" General {{{

    " set background=dark         " Assume a dark background

    " Allow to trigger background
"    function! ToggleBG()
"        let s:tbg = &background
"        " Inversion
"        if s:tbg == "dark"
"            set background=light
"        else
"            set background=dark
"        endif
"    endfunction
    noremap <leader>bg :call ToggleBG()<CR>

    " if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    " endif

    " filetype plugin indent on   " Automatically detect file types.
    " syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened; to prevent this behavior, add the following to
    " your .vimrc.before.local file:
    "   let g:spf13_no_autochdir = 1
       
    set autochdir
    if !exists('g:spf13_no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " Always switch to the current file directory
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    "set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    " To disable this, add the following to your .vimrc.before.local file:
    "   let g:spf13_no_restore_cursor = 1
    if !exists('g:spf13_no_restore_cursor')
        function! ResCur()
            if line("'\"") <= line("$")
                silent! normal! g`"
                return 1
            endif
        endfunction

        augroup resCur
            autocmd!
            autocmd BufWinEnter * call ResCur()
        augroup END
    endif

    " Setting up the directories {{{
        " swap/backup/undo
        " backup、writeback、upundofile、swapfile
        " "silent exe "!mkdir ".$HOME."\\.vim\\temp\\backup"    silent exe "!mkdir ".$HOME."/.vim/backup" 这样cmd会报命令语法错误。
        " expand展开变量、shellescape转义特殊字符。
        "let $VIMTEMP = fnamemodify($MYVIMRC, ':p:h') . '\vimtemp'
        let $VIMTEMP = $HOME . '\vimtemp'
        
        " 交换文件  :set swapfile 这是默认的，:swapname 获得当前的交换文件的保存路径。
        " let &g:directory.='/swap//'
        let &g:directory = expand($VIMTEMP . '/swap//')
        if isdirectory(&g:directory) == 0
            ":silent !mkdir -p &g:directory >/dev/null 2>&1
            silent! call mkdir(&g:directory, 'p', 0700)
        endif

        " 备份文件  :set nobackup 和 :set writebackup 是默认的
        let &g:backupdir = expand($VIMTEMP . '/backup//')
        if isdirectory(&g:backupdir) == 0
            silent! call mkdir(&g:backupdir, 'p', 0700)
        endif
        autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")   " Keep more backups for one file
        set backup    " Backups are nice ...
        
        " 撤销文件 :set undofile 是默认的
        let &g:undodir = expand($VIMTEMP . '/undo//')
        if isdirectory(&g:undodir) == 0
            silent! call mkdir(&g:undodir, 'p', 0700)
        endif
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

        " 会话信息
        let $SESSIONDIR = expand($VIMTEMP . '/session//')
        if ! isdirectory($SESSIONDIR)
            silent! call mkdir($SESSIONDIR, 'p', 0700)
        endif
        
        " 信息文件。包括历史记录（命令历史、搜索历史、输入历史）、寄存器内容、标注、缓冲区列表、全局变量等等
        set viminfo+=n$VIMTEMP/_viminfo       " 指定viminfo文件的位置

        " 设置交换文件、备份文件、操作历史文件的保存位置。结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名。

        " To disable views add the following to your .vimrc.before.local file:
        "   let g:spf13_no_views = 1
        if !exists('g:spf13_no_views')
            " Add exclusions to mkview and loadview
            " eg: *.*, svn-commit.tmp
            let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
        endif
    " }}}
    
" }}}

" Vim UI {{{
    if filereadable(expand($PLUGSDIR."/desertEx/colors/desertEx.vim")) | colorscheme desertEx | endif
    if filereadable(expand($PLUGSDIR."/monokai/colors/monokai.vim")) | colorscheme monokai | endif
    colorscheme industry
"    if !exists('g:overridezRpf13_bu:wndles') && filereadable(expand($PLUGSDIR."/vim-colors-solarized/colors/solarized.vim"))
"        let g:solarized_termcolors=256
"        let g:solarized_termtrans=1
"        let g:solarized_contrast="normal"
"        let g:solarized_visibility="normal"
"        color solarized             " Load a colorscheme
"    endif
    "execute "set colorcolumn=" . join(range(120,335), ',')
    let &colorcolumn="120,".join(range(122,999),",")      "垂直参考线
    "let &colorcolumn="120"
    "highlight ColorColumn ctermbg=0 guibg=#222128         "#2E2E2E

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line
    hi CursorLine guibg=#333333

    "highlight clear SignColumn      " SignColumn should match background
    "highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number
    
    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    source $CONFIGDIR/6-statusline.vim

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set nolist
    "set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }}}

" Formatting {{{

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    " To disable the stripping of whitespace, add the following to your
    " .vimrc.before.local file:
    " let g:spf13_keep_trailing_whitespace = 1
"    autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    " autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
    " preceding line best in a plugin but here for now.

    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " Workaround vim-commentary for Haskell
    autocmd FileType haskell setlocal commentstring=--\ %s
    " Workaround broken colour highlighting in Haskell
    autocmd FileType haskell,rust setlocal nospell

" }}}

" Key (re)Mappings {{{
    map <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
    "https://vim.fandom.com/wiki/Find_in_files_within_Vim
    map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

    " https://www.py.cn/jishu/jichu/13159.html
    "一键运行代码
    function PythonRun() 
        setlocal makeprg=python\ -u  
        set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
        silent make %
        copen 
    "  set efm 是设置quickfix的errorformat，以便vim识别  
    "  makeprg 是vim内置的编译命令，可以通过更改来实现编译对应类型文件。具体可参考vim官方说明文件。
    "  copen是打开quickfix，n用来设置quichfix窗口大小，如 cope5。在错误描述上回车，可以直接跳转到错误行。
    endfunction
    "一个是普通模式下，一个是插入模式下
    au filetype python map <f5>  :call PythonRun() <cr>
    au filetype python imap <f5> <esc>  :call PythonRun() <cr></cr></cr></esc></f5></cr></cr></f5>

" }}}

" Plugins {{{
    source $CONFIGDIR/8-plugins-config.vim
" }}}

" GUI Settings {{{

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        " 如下自加
        " winpos 235 235                          "启动位置, 不适合nvim
        set lines=25 columns=108                "窗口大小
        "设置gvim隐藏菜单栏，工具栏，滚动条
        "set guioptions-=m  "remove menu bar
        set guioptions-=T  "remove toolbar
        set guioptions-=r  "remove right-hand scroll bar
        set guioptions-=L  "remove left-hand scroll bar

        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if !has("nvim")
            if !exists("g:spf13_no_big_font")			" 以下set guifont设置不适合nvim
               if g:linux && has("gui_running")
                   set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
               elseif g:osx && has("gui_running")
                   set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
               elseif g:windows && has("gui_running")
                   " set guifont=JetBrains_Mono:h10,oAndale_Mono:h9,Menlo:h9,Consolas:h9,Courier_New:h9
                   set guifont=DejaVu_Sans_Mono:h9,DejaVuSansMono_Nerd_Font_Mono:h9,oAndale_Mono:h9,Menlo:h9,Consolas:h9,Courier_New:h9
               endif
            endif
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

" }}}

" Functions {{{
" ...
" }}}

