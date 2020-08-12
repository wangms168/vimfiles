" Modeline and Notes {{{
" vim: set sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:            "foldmarker={{{,}}} spell
"        shiftwidth tabstop softtabstop expandtab
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

        let $config_basedir = '~/.vim'
        set rtp^=$config_basedir        "大多数ex命令不会扩展变量名，即，它们不接受表达式。“ set”不是扩展表达式（变量）的命令之一,但可以接受前缀为$的环境变量.
        "exe 'set rtp^=' . expand(g:config_basedir)
        "将vim-plug存放目录放入rtp，+=添加在后面，^=添加在前面。"set rtp^=g:config_basedir"这些不行，set不接受变不带任何前缀的变量
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
    source $VIM/vimfiles/nonascii.vim
" }}}

" Bundles {{{
    source $VIM/vimfiles/1-plugins.vim
" }}}

" General {{{

    set background=dark         " Assume a dark background

    " Allow to trigger background
    function! ToggleBG()
        let s:tbg = &background
        " Inversion
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
    noremap <leader>bg :call ToggleBG()<CR>

    " if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    " endif
    filetype plugin indent on   " Automatically detect file types.
    "syntax on                   " Syntax highlighting
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
        " backup、writeback、upundofile、swapfile
        if !isdirectory(expand('$HOME/.vim/temp/backup'))         " 该文件夹不存在，保存文件时会报“E509 :无法创建备份文件(请加!强制执)"
            "silent exe "!cd ". $HOME."\\.vim"
            "silent exe "!mkdir ".$HOME."\\.vim\\temp\\backup"    “ silent exe "!mkdir ".$HOME."/.vim/backup" 这样cmd会报命令语法错误。
            silent exe "!mkdir ". shellescape(expand("$HOME/.vim/temp/backup"))
            " expand展开变量、shellescape转义特殊字符。
        endif
        if !isdirectory(expand('$HOME/.vim/temp/undo'))
            silent exe "!mkdir ". shellescape(expand("$HOME/.vim/temp/undo"))
        endif
        if !isdirectory(expand('$HOME/.vim/temp/swap'))
            silent exe "!mkdir ". shellescape(expand("$HOME/.vim/temp/swap"))
        endif

        set backup    " Backups are nice ...
        set backupdir=~/.vim/temp/backup                                  " 结尾有//，下一句就不起作用。
        autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")   " Keep more backups for one file
        set directory=~/.vim/temp/swap//
        set undodir=~/.vim/temp/undo//   "设置备份文件、交换文件、操作历史文件的保存位置。结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名。

        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

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
    colorscheme industry            "彩色主题
    if filereadable(expand(plugdir."/desertEx/colors/desertEx.vim")) | colorscheme desertEx | endif
    "if filereadable(expand(plugdir."/monokai/colors/monokai.vim")) | colorscheme monokai | endif
    if !exists('g:overridezRpf13_bundles') && filereadable(expand(plugdir."/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
    "    color solarized             " Load a colorscheme
    endif
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

    source $VIM/vimfiles/6-statusline.vim

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
    set list
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
    "   let g:spf13_keep_trailing_whitespace = 1
    autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    "autocmd FileType go autocmd BufWritePre <buffer> Fmt
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

    "https://vim.fandom.com/wiki/Find_in_files_within_Vim
    map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" }}}

" Plugins {{{
    source $VIM/vimfiles/8-plugins-config.vim
" }}}

" GUI Settings {{{

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        " 如下自加
        winpos 235 235                          "启动位置
        set lines=25 columns=108                "窗口大小
        "设置gvim隐藏菜单栏，工具栏，滚动条
        "set guioptions-=m  "remove menu bar
        set guioptions-=T  "remove toolbar
        set guioptions-=r  "remove right-hand scroll bar
        set guioptions-=L  "remove left-hand scroll bar

        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if !exists("g:spf13_no_big_font")
            if g:linux && has("gui_running")
                set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
            elseif g:osx && has("gui_running")
                set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
            elseif g:windows && has("gui_running")
                set guifont=DejaVuSansMono_Nerd_Font_Mono:h9,oAndale_Mono:h9,Menlo:h9,Consolas:h9,Courier_New:h9
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
