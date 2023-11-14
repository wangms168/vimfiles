"*****************************************************************************
"" Vim-Plug core   https://github.com/editor-bootstrap/vim-bootstrap/blob/master/vim_template/vimrc
"*****************************************************************************
" https://github.com/Tao-Quixote/vim/blob/master/plugin/vim-plug.md 
" if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" https://blog.csdn.net/iteye_10194/article/details/82553195
" 如果你希望在其它目录里安装插件的话，建议使用 $VIMRUNTIME 的目录结构作为模版， 将必要的目录结构创建完整，像这样：
"+ 
"    +  autoload
"    +  bitmaps
"  +  colors
"  +  compiler
"  +  doc
"  +  etc
"  +  ftdetect
"  +  ftplugin
"  +  indent
"  +  keymap
"  +  plugin
"  +  syntax
" 自定义插件安装目录如下并将其放入&rtp(其下autoload目录才能起作用)：
 
let $VIMDATA = $HOME . '\vimdata'
set rtp^=$VIMDATA
let autoload_dir= $VIMDATA . '\autoload'  
let vim_plug = autoload_dir . '\plug.vim'

" https://tratt.net/laurie/teaching/2018_2019/apt/.vimrc
if empty(glob(vim_plug))
    if !executable('curl')
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    "if !isdirectory(autoload_dir)
    "    call mkdir(autoload_dir, "p", 0700)
    "endif
    if executable('curl') == 1
        silent exec "!curl -fLo " . shellescape(vim_plug) . " --create-dirs --ssl-no-revoke
               \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
        "silent !curl -fLo vim_plug --create-dirs --ssl-no-revoke
        "       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    if filereadable(vim_plug)
        let g:not_finish_vimplug = "yes"
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    else
        echo "vim-plug未安装成功"
        finish
    endif
endif

let $PLUGSDIR = $VIMDATA . '\plugged'

call plug#begin($PLUGSDIR)                "括号内的插件存放目录，vim-plig会自动将其放入rtp。
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

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
Plug 'yianwillis/vimcdoc'                        " 中文帮助
Plug 'mhinz/vim-startify'
Plug 'mbbill/desertEx'                           " colorscheme
Plug 'tomasr/molokai'                            " colorscheme
Plug 'altercation/vim-colors-solarized'          " colorscheme
Plug 'Yggdroot/indentLine'                       " 显示缩进指示线
let g:indentLine_color_gui = '#A4E57E'
Plug 'liuchengxu/vim-which-key'                  " which key
Plug 'haya14busa/incsearch.vim'                  " 内置incsearch得改进
Plug 'vim-airline/vim-airline'                   " 状态栏
Plug 'vim-airline/vim-airline-themes'            " 状态栏主题
Plug 'preservim/nerdtree'                        " 文件系统浏览器
Plug 'gko/vim-coloresque'                        " 颜色预览
Plug 'luochen1990/rainbow'                       " 彩虹括号
Plug 'jiangmiao/auto-pairs'                      " 自动配对
Plug 'tpope/vim-surround'                        " about 'surroundings' ,关于周围环境：()、[]、“”、XML标记等，轻松地成对删除ds，更改cs和添加ys此类环境。
Plug 'tpope/vim-repeat'                          " .命令重复surround.vim、关于speeddating.vim、unimpaired.vim、vim-easyclip等的操作。
Plug 'jdpxiaoming/winmanager'                    " winmanager有3个插件：winmanager.vim、winfileexplorer.vim、wintagexplorer.vim。winmanager负责界面布局；
                                                 " winfileexplorer是改良的Explorer(即现在的netrw)，负责浏览文件；wintagexplorer负责浏览标志列表，用taglist插件代替
" Plug 'vim-scripts/taglist.vim'                   "wintagexplorer.vim – winmanager提供的tag插件，用处不大,用taglist.vim替换。
Plug 'jlanzarotta/bufexplorer'                   " winmanager配合bufexplorer，用于浏览buffer
" Plug 'whatot/gtags-cscope.vim'                   "包含gtags-cscope.vim和gtags.vim
Plug 'tpope/vim-scriptease'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" Plug 'kien/ctrlp.vim'                            " 终端则使用FZF如果gvim使用CtrlP
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'                    " 向各种vim插件添加文件类型的标志符号(图标)
Plug 'sillybun/vim-repl'                         " python repl
Plug 'voldikss/vim-floaterm'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" Automatically install missing plugins on startup
" autocmd VimEnter *
"  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"  \|   PlugInstall --sync | q
"  \| endif

