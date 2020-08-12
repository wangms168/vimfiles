"*****************************************************************************
"" Plug install packages
"*****************************************************************************
"if empty(glob('~/.vim/autoload/plug.vim'))
"    silent exe "!curl -fLo ".$HOME."/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
"    if filereadable(expand("~/.vim/autoload/plug.vim"))
"        source $MYVIMRC | autocmd VimEnter * PlugInstall --sync
"    else
"        echo "vim-plug未安装成功"
"        finish
"   endif
"endif

"*****************************************************************************
"" Vim-Plug core   https://github.com/editor-bootstrap/vim-bootstrap/blob/master/vim_template/vimrc
"*****************************************************************************
let vimplug_exists=expand($config_basedir.'/autoload/plug.vim')
if has('win32')&&!has('win64')
    let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
    let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
    if !executable(curl_exists)
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    if filereadable(vimplug_exists)
        let g:not_finish_vimplug = "yes"
        autocmd VimEnter * PlugInstall --sync
    else
        echo "vim-plug未安装成功"
        finish
    endif
endif

let plugdir=expand($config_basedir.'/plugged')
" Required:
call plug#begin(plugdir)                         "括号内的插件存放目录，vim-plig会自动将其放入rtp。
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
"Plug 'junegunn/vim-plug'                        "If you need Vim help for vim-plug itself (e.g. :help plug-options)
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
if executable('ag')
    Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
elseif executable('ack-grep')
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    Plug 'mileszs/ack.vim'
elseif executable('ack')
    Plug 'mileszs/ack.vim'
endif
Plug 'yianwillis/vimcdoc'                        "中文帮助
Plug 'mhinz/vim-startify'
Plug 'mbbill/desertEx'                           "colorscheme
Plug 'tomasr/molokai'                            "colorscheme
Plug 'altercation/vim-colors-solarized'          "colorscheme
Plug 'Yggdroot/indentLine'                       "显示缩进指示线
let g:indentLine_color_gui = '#A4E57E'
Plug 'liuchengxu/vim-which-key'
Plug 'haya14busa/incsearch.vim'                  "内置incsearch得改进
Plug 'vim-airline/vim-airline'                   "状态栏
Plug 'vim-airline/vim-airline-themes'            "状态栏主题
Plug 'gko/vim-coloresque'                        "颜色预览
Plug 'luochen1990/rainbow'                       "彩虹括号
Plug 'jiangmiao/auto-pairs'                      "自动配对
Plug 'tpope/vim-surround'                        "about "surroundings",关于周围环境：()、[]、“”、XML标记等，轻松地成对删除ds，更改cs和添加ys此类环境。
Plug 'tpope/vim-repeat'                          ".命令重复surround.vim、speeddating.vim、unimpaired.vim、vim-easyclip等的操作。
Plug 'jdpxiaoming/winmanager'                    "winmanager有3个插件：winmanager.vim、winfileexplorer.vim、wintagexplorer.vim。winmanager负责界面布局；
                                                 "winfileexplorer是改良的Explorer(即现在的netrw)，负责浏览文件；wintagexplorer负责浏览标志列表，用taglist插件代替
Plug 'vim-scripts/taglist.vim'                   "wintagexplorer.vim – winmanager提供的tag插件，用处不大,用taglist.vim替换。
Plug 'jlanzarotta/bufexplorer'                   "winmanager配合bufexplorer，用于浏览buffer
Plug 'whatot/gtags-cscope.vim'                   "包含gtags-cscope.vim和gtags.vim
Plug 'tpope/vim-scriptease'
Plug 'kien/ctrlp.vim'                            "终端则使用FZF如果gvim使用CtrlP
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
" Initialize plugin system
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

"" Vundle.vim插件
"if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
"    silent exe "!cd ".$HOME
"    silent exe "!git clone https://github.com/VundleVim/Vundle.vim.git " . $HOME . "/.vim/bundle/Vundle.vim"
"    source $MYVIMRC | autocmd VimEnter * PluginInstall
"    if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
"        echo "Vundle.vim插件未安装成功"
"   endif
"else
"    set nocompatible              " be iMproved, required
"    filetype off                  " required
"
"    " set the runtime path to include Vundle and initialize
"    set rtp+=~/.vim/bundle/Vundle.vim
"    call vundle#begin('~/.vim/bundle')
"    " let Vundle manage Vundle, required
"    Plugin 'VundleVim/Vundle.vim'
"    Plugin 'vim-airline/vim-airline'                   "状态栏
"    Plugin 'vim-airline/vim-airline-themes'            "状态栏主题
"    Plugin 'gko/vim-coloresque'                        "颜色预览
"    Plugin 'luochen1990/rainbow'                       "彩虹括号
"    Plugin 'jiangmiao/auto-pairs'                      "自动配对
"    Plugin 'tpope/vim-surround'                        "about "surroundings",关于周围环境：()、[]、“”、XML标记等，轻松地成对删除ds，更改cs和添加ys此类环境。
"    Plugin 'tpope/vim-repeat'                          ".命令重复surround.vim、speeddating.vim、unimpaired.vim、vim-easyclip等的操作。
"    Plugin 'jdpxiaoming/winmanager'                    "winmanager有3个插件：winmanager.vim、winfileexplorer.vim、wintagexplorer.vim。winmanager负责界面布局；
"                                                     "winfileexplorer是改良的Explorer(即现在的netrw)，负责浏览文件；wintagexplorer负责浏览标志列表，用taglist插件代替
"    Plugin 'vim-scripts/taglist.vim'                   "wintagexplorer.vim – winmanager提供的tag插件，用处不大,用taglist.vim替换。
"    Plugin 'jlanzarotta/bufexplorer'                   "winmanager配合bufexplorer，用于浏览buffer
"    Plugin 'whatot/gtags-cscope.vim'                   "包含gtags-cscope.vim和gtags.vim
"    Plugin 'tpope/vim-scriptease'
"    Plugin 'kien/ctrlp.vim'                            "终端则使用FZF如果gvim使用CtrlP
"    Plugin 'junegunn/fzf'
"    Plugin 'junegunn/fzf.vim'
"    "Plugin 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
"    "Plugin 'Yggdroot/LeaderF'
"
"    " All of your Plugins must be added before the following line
"    call vundle#end()            " required
"    filetype plugin indent on    " required
"    " To ignore plugin indent changes, instead use:
"    "filetype plugin on
"    "
"    " Brief help
"    " :PluginList       - lists configured plugins
"    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
"    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"    "
"    " see :h vundle for more details or wiki for FAQ
"    " Put your non-Plugin stuff after this line
"endif
