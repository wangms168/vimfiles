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
 
let g:darwin = has('mac')
let g:osx = has('macunix')
let g:linux  = has('unix') && !has('macunix') && !has('``win32unix')
let g:windows = has('win32') || has('win64')

" 标题{{{
" 中文时vim的内容、英文时nvim的内容
" 
" " 每个 "set" 行显示左侧选项的当前值。Each "set" line shows the current value of an option (on the left).
" " 在 "set" 行上按 <回车> 来执行。Hit <Enter> on a "set" line to execute it.
" "            布尔选项将被切换。A boolean option will be toggled.
" "            对于其他选项，您可以在按 <回车> 之前编辑该值。For other options you can edit the value before hitting <Enter>.
" " 在帮助行上按 <回车> 来打开关于此选项的帮助窗口。Hit <Enter> on a help line to open a help window on this option.
" " 在索引行上按 <回车> 来跳转到那里。Hit <Enter> on an index line to jump there.
" " 在 "set" 行上按 <空格> 来刷新。Hit <Space> on a "set" line to refresh it.
" 
"  1 重要选项  important
"  2 移动、搜索以及正则表达式  moving around, searching and patterns
"  3 标签  tags
"  4 显示文本  displaying text
"  5 语法、高亮和拼写  syntax, highlighting and spelling
"  6 多个窗口  multiple windows
"  7 多个标签页  multiple tab pages
"  8 终端  terminal
"  9 使用鼠标  using the mouse
" 10 图形用户界面  （vim独有）
" 11 打印  （vim独有）
" 12 消息和信息  messages and info
" 13 选择文本  selecting text
" 14 编辑文本  editing text
" 15 Tab 和缩进  tabs and indenting
" 16 折叠  folding
" 17 差异模式  diff mode
" 18 映射  mapping
" 19 读写文件  reading and writing files
" 20 交换文件  the swap file
" 21 命令行编辑  command line editing
" 22 执行外部命令  executing external commands
" 23 运行 make 并跳到错误（快速修复）  running make and jumping to errors (quickfix)
" 24 系统特定  system specific
" 25 语言特定  language specific
" 26 多字节字符  multi-byte characters
" 27 杂项  various
" }}}
 
"  1 重要选项  important {{{
" 
" compatible	非常兼容 Vi（不建议）  behave very Vi compatible (not advisable)
"  	set nocp	cp
" cpoptions	指定 Vi 兼容性的标志列表  list of flags to specify Vi compatibility
"  	set cpo=aABceFs
" insertmode	使用插入模式作为默认模式  （vim独有）
"  	set noim	im
" paste	粘贴模式，按本义插入输入的文本  paste mode, insert typed text literally
"  	set nopaste	pasteF
" pastetoggle	切换粘贴模式的按键序列  （vim独有）
"  	set pt=
" runtimepath	运行时文件和插件使用的目录列表  list of directories used for runtime files and plugins
"  	set rtp=C:\\Users\\Administrator/vimfiles,D:\\Scoop\\apps\\vim-nightly\\current/vimfiles,D:\\Scoop\\apps\\vim-nightly\\current,C:\\Users\\Administrator/vimfiles/after,D:\\Scoop\\apps\\vim-nightly\\current/vimfiles/after
" packpath	插件包使用的目录列表  list of directories used for plugin packages
"  	set pp=C:\\Users\\Administrator/vimfiles,D:\\Scoop\\apps\\vim-nightly\\current/vimfiles,D:\\Scoop\\apps\\vim-nightly\\current,C:\\Users\\Administrator/vimfiles/after,D:\\Scoop\\apps\\vim-nightly\\current/vimfiles/after
" helpfile	主帮助文件的名称  name of the main help file
"  	set hf=D:\\Scoop\\apps\\vim-nightly\\current\\doc\\help.txt
" }}}
set paste            " 可以在粘贴时自动对齐
let $VIMTEMP = $HOME . '\vimtemp'
let $VIMDATA = $HOME . '\vimdata'
set rtp^=$VIMDATA

"  2 移动、搜索以及正则表达式  moving around, searching and patterns {{{
" 
" whichwrap	指定哪些命令折行的标志列表  list of flags specifying which commands wrap to another line
"  	set ww=b,s
" startofline	许多跳转命令将光标移动到第一个非空的位置行中的字符  many jump commands move the cursor to the first non-blank haracter of a line
"  	set sol	nosol
" paragraphs	用于分隔段落的  nroff 宏名 nroff macro names that separate paragraphs
"  	set para=IPLPPPQPP\ TPHPLIPpLpItpplpipbp
" sections	用于分隔小节的  nroff 宏名 nroff macro names that separate sections
"  	set sect=SHNHH\ HUnhsh
" path	用于文件搜索的目录名称列表  list of directory names used for file searching
" 	(全局或局部于缓冲区)  (global or local to buffer)
"  	set pa=.,,
" cdhome	不带参数的 :cd 进入主目录  :cd without argument goes to the home directory
"  	set nocdh	cdh
" cdpath	目录名称列表用于 :cd  list of directory names used for :cd
"  	set cd=,,
" autochdir	切换到缓冲区的文件所在的目录  change to directory of file in buffer
"  	set noacd	acd
" autoshelldir	切换到终端缓冲区的 shell 工作的目录  （vim独有）
"  	set noasd	asd
" wrapscan	搜索在缓冲区折行的命令  search commands wrap around the end of the buffer
"  	set ws	nows
" incsearch	显示匹配部分键入的搜索命令  show match for partly typed search command
"  	set is	nois
" magic	改变反斜杠在搜索模式中的使用方式  change the way backslashes are used in search patterns
"  	set magic	nomagic
" regexpengine	选择默认的正则表达式引擎  select the default regexp engine used
"  	set re=0
" ignorecase	使用搜索模式时忽略大小写  ignore case when using a search pattern
"  	set noic	ic
" smartcase	当模式包含大写字符时，覆盖 'ignorecase'  override 'ignorecase' when pattern has upper case characters
"  	set noscs	scs
" casemap	用什么方法来改变字母的大小写  what method to use for changing case of letters
"  	set cmp=internal,keepascii
" maxmempattern	模式匹配使用的最大内存（以千字节为单位）  maximum amount of memory in Kbyte used for pattern matching
"  	set mmp=1000
" define	宏定义行的模式  pattern for a macro definition line
" 	(全局或局部于缓冲区)  (global or local to buffer)
"  	set def=^\\s*#\\s*define
" include	包含文件行的模式  pattern for an include-file line
" 	(局部于缓冲区)  (local to buffer)
"  	set inc=^\\s*#\\s*include
" includeexpr	用于将包含行转换为文件名的表达式  expression used to transform an include line to a file name
" 	(局部于缓冲区)  (local to buffer)
"  	set inex=
" }}}
set autochdir
if &autochdir
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    " Always switch to the current file directory
endif
set incsearch                   " 默认开启增量搜索
set ignorecase                  " 搜索忽略大小写
set smartcase                   " 当模式包含大写字符时，覆盖 'ignorecase' 当搜索查询包含大写字母时，自动切换到区分大小写的搜索

"  3 标签  tags {{{
" 
" tagbsearch	在标签文件中使用二分法查找  use binary searching in tags files
"  	set tbs	notbs
" taglength	标签名称中的有效字符数，默认为零   number of significant characters in a tag name or zero
"  	set tl=0
" tags	用于搜索标签的文件名列表  list of file names to search for tags
" 	(全局或局部于缓冲区)
"  	set tag=./tags,tags
" tagcase	在标签文件中搜索如何处理大小写: "followic" 跟随 'ignorecase', "ignore" 或者 "match"  how to handle case when searching in tags files:"followic" to follow 'ignorecase', "ignore" or "match"
" 	(全局或局部于缓冲区)  (global or local to buffer)
"  	set tc=followic
" tagrelative	标签文件里的文件名是相对于标签文件的路径  file names in a tags file are relative to the tags file
"  	set tr	notr
" tagstack	:tag 命令将使用 tagstack  a :tag command will use the tagstack
"  	set tgst	notgst
" showfulltag	在插入模式补全标签时显示更多信息  when completing tags in Insert mode show more info
"  	set nosft	sft
" tagfunc	用于执行标签搜索的函数  a function to be used to perform tag searches
" 	(局部于缓冲区)  (local to buffer)
"  	set tfu=
" cscopeprg	执行 cscope 的命令    （vim独有）
"  	set csprg=cscope
" cscopetag	标签命令使用 cscope    （vim独有）
"  	set nocst	cst
" cscopetagorder	0 或 1; ":cstag" 执行搜索的顺序    （vim独有）
"  	set csto=0
" cscopeverbose	在添加 cscope 数据库时给出消息    （vim独有）
"  	set nocsverb	csverb
" cscopepathcomp	显示路径的多少个部分    （vim独有）
"  	set cspc=0
" cscopequickfix	何时为 cscope 打开快速修复窗口    （vim独有）
"  	set csqf=
" cscoperelative	cscope 文件中的文件名是相对于该文件的    （vim独有）
"  	set nocsre	csre
" }}}
" 无

"  4 显示文本  displaying text {{{
" 
" scroll	按 CTRL-U 和 CTRL-D 滚动的行数  number of lines to scroll for CTRL-U and CTRL-D
" 	(局部于窗口)  (local to window)
"  	set scr=5  (nvim:scr=17)
" smoothscroll	scroll by screen line   （vim独有）
" 	(局部于窗口)
"  	set nosms	sms
" scrolloff	在光标周围显示的屏幕行数  number of screen lines to show around the cursor
"  	set so=5  (nvim:so=0)
" wrap	长行折行  long lines wrap
" 	(局部于窗口)  (local to window)
"  	set wrap	nowrap
" linebreak	在 'breakat' 中的字符处对长行折行  wrap long lines at a character in 'breakat'
" 	(局部于窗口)  (local to window)
"  	set nolbr	lbr
" breakindent	在折行文本中保持缩进  preserve indentation in wrapped text
" 	(局部于窗口)  (local to window)
"  	set nobri	bri
" breakindentopt	调整 breakindent 的行为  adjust breakindent behaviour
" 	(局部于窗口)  (local to window)
"  	set briopt=
" breakat	哪些字符可能导致换行  which characters might cause a line break
"  	set brk=\ \	!@*-+;:,./?
" showbreak	放在折回的屏幕行之前的字符串  string to put before wrapped screen lines
"  	set sbr=
" sidescroll	水平滚动的最小列数  minimal number of columns to scroll horizontally
"  	set ss=0  (nvim:ss=1)
" sidescrolloff	保留在光标左右的最小列数  minimal number of columns to keep left and right of the cursor
"  	set siso=0
" display	包含 "lastline" 来显示最后一行，即使它显示不下包含 "uhex" 以十六进制显示不可打印字符  include "lastline" to show the last line even if it doesn't fit include "uhex" to show unprintable characters as a hex number
"  	set dy=truncate  (nvim:dy=lastline)
" fillchars	用于状态行、折叠和填充行的字符  characters to use for the status line, folds and filler lines
"  	set fcs=vert:\|,fold:-,eob:~,lastline:@    (nvim:fcs=)
" cmdheight	用于命令行的行数   number of lines used for the command-line
"  	set ch=1
" columns	显示的宽度  width of the display
"  	set co=80     (nvim:co=274)
" lines	显示的行数  number of lines in the display
"  	set lines=25     (nvim:lines=72)
" window	按 CTRL-F 和 CTRL-B 滚动的行数  number of lines to scroll for CTRL-F and CTRL-B
"  	set window=24   (nvim:window=71)
" lazyredraw	在执行宏时不要重新绘制  don't redraw while executing macros
"  	set nolz	lz
" redrawtime	'hlsearch' 和 :match 高亮的超时时间（以毫秒计） timeout for 'hlsearch' and :match highlighting in msec
"  	set rdt=2000
" writedelay	每个字符写到显示的延时（以毫秒计；用于调试）  delay in msec for each char written to the display (for debugging)
"  	set wd=0
" list	以 ^I 显示 <Tab>, 以 $ 显示行尾  show <Tab> as ^I and end-of-line as $
" 	(局部于窗口)  (local to window)
"  	set nolist	list
" listchars	用于 list 模式的字符串列表  list of strings used for list mode
"  	set lcs=eol:$    (nvim:lcs=tab:>\ ,trail:-,nbsp:+) 
" number	对每一行显示行号   show the line number for each line
" 	(局部于窗口)  (local to window)
"  	set nonu	nu
" relativenumber	显示每行的相对行号  show the relative line number for each line
" 	(局部于窗口)  (local to window)
"  	set nornu	rnu
" numberwidth	用于行号的列数  number of columns to use for the line number
" 	(局部于窗口)  (local to window)
"  	set nuw=4
" conceallevel	控制是否隐藏可隐藏文本  controls whether concealable text is hidden
" 	(局部于窗口)  (local to window)
"  	set cole=0
" concealcursor	可隐藏光标行的文本的模式  modes in which text in the cursor line can be concealed
" 	(局部于窗口)  (local to window)
"  	set cocu=
" }}}
" if !has('nvim') 
"     winpos 25 25                      "启动位置, 不适合nvim
" endif
" set columns=1080                      " 启动时窗口的大小，显示的宽带(列数)
" set lines=120                         " 启动时窗口的大小，显示的行数"
autocmd GUIEnter * simalt ~x            " 启动时全屏 
set relativenumber number               " 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
" au FocusLost * :set norelativenumber number
" au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <F2> :call NumberToggle()<cr>
"set cmdheight=2     " Prevent 'Press Enter' message after most commands

"  5 语法、高亮和拼写  syntax, highlighting and spelling {{{
" 
" background	"dark" 或者 "light"；背景色亮度  "dark" or "light"; the background color brightness
"  	set bg=light    (nvim:bg=dark)
" filetype	文件类型; 在设置时触发 FileType 事件  type of file; triggers the FileType event when set
" 	(局部于缓冲区)  (local to buffer)
"  	set ft=
" syntax	使用中的语法高亮显示的名称  name of syntax highlighting used
" 	(局部于缓冲区)  (local to buffer)
"  	set syn=
" synmaxcol	寻找语法项的最大列  maximum column to look for syntax items
" 	(局部于缓冲区)  (local to buffer)
"  	set smc=3000
" highlight	在不同场合使用哪些高亮提示  which highlighting to use for various occasions
"  	set hl=8:SpecialKey,~:EndOfBuffer,@:NonText,d:Directory,e:ErrorMsg,i:IncSearch,l:Search,y:CurSearch,m:MoreMsg,M:ModeMsg,n:LineNr,a:LineNrAbove,b:LineNrBelow,N:CursorLineNr,G:CursorLineSign,O:CursorLineFold,r:Question,s:StatusLine,S:StatusLineNC,c:VertSplit,t:Title,v:Visual,V:VisualNOS,w:WarningMsg,W:WildMenu,f:Folded,F:FoldColumn,A:DiffAdd,C:DiffChange,D:DiffDelete,T:DiffText,>:SignColumn,-:Conceal,B:SpellBad,P:SpellCap,R:SpellRare,L:SpellLocal,+:Pmenu,=:PmenuSel,[:PmenuKind,]:PmenuKindSel,{:PmenuExtra,}:PmenuExtraSel,x:PmenuSbar,X:PmenuThumb,*:TabLine,#:TabLineSel,_:TabLineFill,!:CursorColumn,.:CursorLine,o:ColorColumn,q:QuickFixLine,z:StatusLineTerm,Z:StatusLineTermNC
" hlsearch	高亮显示最后使用的搜索模式的所有匹配项  highlight all matches for the last used search pattern
"  	set nohls	hls    (nvim:set hls	nohls)
" wincolor	窗口使用的高亮组  （vim独有）
" 	(局部于窗口)
"  	set wcr=
" termguicolors	use GUI colors for the terminal    （nvim独有）
"  	set tgc	notgc
" cursorcolumn	突出显示光标的屏幕列  highlight the screen column of the cursor
" 	(局部于窗口)  (local to window)
"  	set nocuc	cuc
" cursorline	突出显示光标的屏幕行  highlight the screen line of the cursor
" 	(局部于窗口)  (local to window)
"  	set nocul	cul
" cursorlineopt	指定 'cursorline' 高亮显示的区域  specifies which area 'cursorline' highlights
" 	(局部于窗口)  (local to window)
"  	set culopt=both
" colorcolumn	要高亮的列  columns to highlight
" 	(局部于窗口)  (local to window)
"  	set cc=
" spell	高亮拼写错误  highlight spelling mistakes
" 	(局部于窗口)  (local to window)
"  	set nospell	spell
" spelllang	接受的语言列表  list of accepted languages
" 	(局部于缓冲区)  (local to buffer)
"  	set spl=en
" spellfile	"zg" 添加正确单词的文件  file that "zg" adds good words to
" 	(局部于缓冲区)  (local to buffer)
"  	set spf=
" spellcapcheck	定位句子尾部的模式  pattern to locate the end of a sentence
" 	(局部于缓冲区)  (local to buffer)
"  	set spc=[.?!]\\_[\\])'\"\	\ ]\\+
" spelloptions	更改拼写检查工作方式的标志  flags to change how spell checking works
" 	(局部于缓冲区)  (local to buffer)
"  	set spo=
" spellsuggest	用于建议修正的方法  methods used to suggest corrections
"  	set sps=best
" mkspellmem	:mkspell 在压缩前使用的内存量  amount of memory used by :mkspell before compressing
"  	set msm=460000,2000,500
" }}}
set background=light 
filetype plugin indent on		" 同时启用'检测Detection'、'插件Plugin'和'缩进Indent'。
" 类似于以下命令的组合
" filetype on
" filetype plugin on
" filetype indent on
" set syntax=on             " 这样写无效
syntax enable               " enable syntax highlighting
syntax on                   " follows colorscheme to highlight.
set hlsearch                " 搜索时高亮匹配结果
nnoremap <CR> :noh<CR>      " <CR>:<backspace>
" set cursorcolumn            " 高亮列
set cursorline              " 高亮行
set colorcolumn=120         " 要高亮的列

" 行號顏色
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
                                                    " 設定行號為：粗體，前景色為深灰色，沒有背景色
                                                    " hi 為 highlight 指令的縮寫，擁有同樣的效果
                                                    " LineNr 指定為 line number 的顏色設定
                                                    " cterm 指的是爲 color terminal 的環境 ( 在 linux 桌面環境所開的 terminal ) 做設定，其他還有 term ( 一般 terminal，例如透過 putty 連上的工作環境 )、gui。
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
                                                    " 設定游標所在的行號為：粗體，前景色為綠色，沒有背景色
                                                    " 配合 :hi LineCr 就可以很清楚的知道現在游標所在的位置
                                                    
"  6 多个窗口  multiple windows {{{
" 
" laststatus	0, 1 或 2；何时为最后一个窗口使用状态行    0, 1, 2 or 3; when to use a status line for the last window
"  	set ls=1  (nvim:ls=2)
" statuscolumn	custom format for the status column  (nvim独有)
" 	(local to window)
"  	set stc=
" statusline	用于状态行的替代格式   alternate format to be used for a status line
"  	set stl=
" equalalways	当添加/删除窗口时，使所有窗口的大小相同  make all windows the same size when adding/removing windows
"  	set ea	noea
" eadirection	'equalalways' 的工作方向："ver", "hor" 或者 "both"  in which direction 'equalalways' works: "ver", "hor" or "both"
"  	set ead=both
" winheight	当前窗口的最小行数  minimal number of lines used for the current window
"  	set wh=1
" winminheight	任何窗口的最小行数  minimal number of lines used for any window
"  	set wmh=1
" winfixheight	保持窗口的高度  keep the height of the window
" 	(局部于窗口)  (local to window)
"  	set nowfh	wfh
" winfixwidth	保持窗口的宽度  keep the width of the window
" 	(局部于窗口)  (local to window)
"  	set nowfw	wfw
" winwidth	当前窗口的最小列数  minimal number of columns used for the current window
"  	set wiw=20
" winminwidth	任何窗口的最小列数  minimal number of columns used for any window
"  	set wmw=1
" helpheight	帮助窗口的初始高度  initial height of the help window
"  	set hh=20
" previewpopup	使用弹出窗口来预览    (vim独有)
"  	set pvp=
" previewheight	预览窗口的默认高度  default height for the preview window
"  	set pvh=12
" previewwindow	标识预览窗口  identifies the preview window
" 	(局部于窗口)  (local to window)
"  	set nopvw	pvw
" hidden	当缓冲区不再显示在窗口中时，不要卸载它  don't unload a buffer when no longer shown in a window
"  	set nohid	hid    (nvim:set hid	nohid)
" switchbuf	当向缓冲区跳转时可使用窗口: "useopen" 和/或 "split" "useopen" and/or "split"; which window to use when jumping to a buffer
"  	set swb=   (nvim:swb=uselast)
" splitbelow	新窗口放在当前窗口的下面  a new window is put below the current one
"  	set nosb	sb
" splitkeep	决定分割窗口的滚动行为 determines scroll behavior for split windows
"  	set spk=cursor     (nvim:set cursorspk	spk)
" splitright	新窗口放在当前窗口的右边  a new window is put right of the current one
"  	set nospr	spr
" scrollbind	此窗口与其他已绑定的窗口一起滚动  this window scrolls together with other bound windows
" 	(局部于窗口)  (local to window)
"  	set noscb	scb
" scrollopt	'scrollbind' 的选项列表: "ver", "hor" 和/或 "jump"    "ver", "hor" and/or "jump"; list of options for 'scrollbind'
"  	set sbo=ver,jump
" cursorbind	此窗口的光标与其他已绑定的窗口一起移动  this window's cursor moves together with other bound windows
" 	(局部于窗口)  (local to window)
"  	set nocrb	crb
" termwinsize	终端窗口的大小      (vim独有)
" 	(局部于窗口)
"  	set tws=
" termwinkey	终端窗口中 Vim 命令的前导键      (vim独有)
" 	(局部于窗口)
"  	set twk=
" termwinscroll	终端窗口中用于回滚的最大行数      (vim独有)
" 	(局部于窗口)
"  	set twsl=10000
" termwintype	终端窗口的 pty 类型      (vim独有)
"  	set twt=
" winptydll	winpty 动态库的名称      (vim独有)
"  	set winptydll=winpty64.dll
" }}}
set laststatus=2                "显示状态栏(默认值为1, 无法显示状态栏)
set statusline=  "[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=[
if v:version >= 600
    set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
    set statusline+=%{&fileencoding}, " encoding
endif
set statusline+=%{&fileformat}] " file format
set statusline+=%= " right align
"set statusline+=%2*0x%-8B\ " current char
set statusline+=0x%-8B\ " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset
if filereadable(expand("~/vimfiles/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()} " vim buddy
endif
set splitbelow
set splitright

"  7 多个标签页  multiple tab pages {{{
" 
" showtabline	0, 1 或 2; 何时使用标签页行  0, 1 or 2; when to use a tab pages line
"  	set stal=1
" tabpagemax	-p 和 "tab all" 打开的最大标签页数    maximum number of tab pages to open for -p and "tab all"
"  	set tpm=10  (nvim:tpm=50) 
" tabline	自定义标签页行  custom tab pages line
"  	set tal=
" guitablabel	为 GUI 自定义标签页的标签      (vim独有)
"  	set gtl=
" guitabtooltip	为 GUI 自定义标签页的工具提示      (vim独有)
"  	set gtt=
" }}}
" 无
 
"  8 终端  terminal {{{
" 
" term	使用中的终端的名字     (vim独有)
"  	set term=builtin_gui
" ttytype	'term' 的别名     (vim独有)
"  	set tty=builtin_gui
" ttybuiltin	首先检查内置的 termcaps     (vim独有)
"  	set tbi	notbi
" ttyfast	终端连接速度很快     (vim独有)
"  	set tf	notf
" xtermcodes	当检测到 xterm 时，请求终端键码     (vim独有)
"  	set xtermcodes	noxtermcodes
" weirdinvert	终端需要额外的重绘     (vim独有)
"  	set nowiv	wiv
" keyprotocol	what keyboard protocol to use for which terminal     (vim独有)
"  	set kpc=kitty:kitty,foot:kitty,wezterm:kitty,xterm:mok2
" esckeys	识别在插入模式下以 <Esc> 开头的键     (vim独有)
"  	set ek	noek
" scrolljump	一次滚动的最少行数minimal number of lines to scroll at a time
"  	set sj=1
" ttyscroll	可以使用滚动代替重绘的最大行数     (vim独有)
"  	set tsl=999
" guicursor	指定光标在不同模式下的样子  specifies what the cursor looks like in different modes
"  	set gcr=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
" title	在窗口标题中显示信息  show info in the window title
"  	set title	notitle    (nvim:set notitle	title) 
" titlelen	窗口标题的 'columns' 的百分比  percentage of 'columns' used for the window title
"  	set titlelen=85
" titlestring	非空时，用于窗口标题的字符串  when not empty, string to be used for the window title
"  	set titlestring=
" titleold	退出 Vim 时用于恢复标题的字符串  string to restore the title to when exiting Vim
"  	set titleold=Thanks\ for\ flying\ Vim
" icon	设置此窗口图标的文本  set the text of the icon for this window
"  	set icon	noicon
" iconstring	非空时，设置此窗口图标的文本  when not empty, text for the icon of this window
"  	set iconstring=
" restorescreen	退出 Vim 时恢复屏幕内容      (vim独有)
"  	set rs	nors
" }}}
" 无
 
"  9 使用鼠标  using the mouse {{{
" 
" mouse	使用鼠标时的标志列表  list of flags for using the mouse
"  	set mouse=nvi
" mousefocus	带有鼠标指针的窗口成为当前窗口      (vim独有)
"  	set nomousef	mousef
" scrollfocus	带有鼠标指针的窗口随鼠标滚轮滚动      (vim独有)
"  	set noscf	scf
" mousehide	在输入时隐藏鼠标指针      (vim独有)
"  	set mh	nomh
" mousemoveevent	报告鼠标移动事件      (vim独有)
"  	set nomousemev	mousemev
" mousemodel	"extend", "popup" 或 "popup_setpos"; 鼠标右键用于什么  "extend", "popup" or "popup_setpos"; what the right mouse button is used for
"  	set mousem=popup     (nvim:mousem=popup_setpos)
" mousetime	识别双击的最大时间（以毫秒计） maximum time in msec to recognize a double-click
"  	set mouset=500
" ttymouse	"xterm", "xterm2", "sgr" 等; 鼠标类型      (vim独有)
"  	set ttym=
" mouseshape	鼠标指针在不同模式下的样子      (vim独有)
"  	set mouses=i-r:beam,s:updown,sd:udsizing,vs:leftright,vd:lrsizing,m:no,ml:up-arrow,v:rightup-arrow
" }}}
set mouse=a
" n 普通模式
" v 可视模式
" i 插入模式
" c 命令行模式
" h 在帮助文件里，以上所有的模式
" a 以上所有的模式
" r 跳过 |hit-enter| 提示
" A 在可视模式下自动选择

" 10 图形用户界面      (vim独有) {{{
" 
" guifont	在 GUI 中使用的字体名称列表
"  	set gfn=
" guifontwide	用于双宽度字符的字体名称列表
"  	set gfw=
" guioptions	指定 GUI 工作方式的标志列表
"  	set go=egmrLT
" renderoptions	文本渲染选项
"  	set rop=
" guipty	对外部命令的 I/O 使用伪终端
"  	set guipty	noguipty
" browsedir	"last", "buffer" 或 "current"; 文件浏览器使用哪个目录
"  	set bsdir=last
" langmenu	菜单使用的语言
"  	set langmenu=
" menuitems	单个菜单中的最大项目数量
"  	set mis=25
" winaltkeys	"no", "yes" 或 "menu"; 如何使用 ALT 键
"  	set wak=menu
" linespace	字符之间使用的像素行数
"  	set lsp=1
" balloondelay	延迟指定毫秒后，气泡可能会弹出
"  	set bdlay=600
" ballooneval	在 GUI 中使用气泡求值
"  	set nobeval	beval
" balloonexpr	在气泡求值中显示的表达式
"  	set bexpr=
" }}}
if has('gui_running')
    if !has("nvim")
        if g:linux
            set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        elseif g:osx
            set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
        elseif g:windows
            " set guifont=JetBrains_Mono:h10,oAndale_Mono:h9,Menlo:h9,Consolas:h9,Courier_New:h9
            set guifont=Consolas:h9,DejaVu_Sans_Mono:h9,DejaVuSansMono_Nerd_Font_Mono:h9,oAndale_Mono:h9,Menlo:h9,Courier_New:h9
        endif
    endif
    set go=egmrL           " 设置gvim隐藏菜单栏，工具栏，滚动条。指定 GUI 工作方式的标志列表m=menu bar, T=toolbar, r=right-hand scroll bar,L=left-hand scroll bar
endif

" 11 打印      (vim独有) {{{
" 
" printoptions	控制 :hardcopy 输出格式的项目列表
"  	set popt=
" printdevice	用于 :hardcopy 的打印机名称
"  	set pdev=
" printfont	:hardcopy 使用的字体名称
"  	set pfn=Courier_New:h10
" printheader	用于 :hardcopy 的标头格式
"  	set pheader=%<%f%h%m%=Page\ %N
" printmbcharset	:hardcopy 用于 CJK 输出的 CJK 字符集
"  	set pmbcs=
" printmbfont	:hardcopy 用于 CJK 输出的字体名称列表
"  	set pmbfn=
" }}}
" 无
 
" 12 消息和信息    messages and info {{{
" 
" terse	在 'shortmess' 中添加 's' 标志（不显示搜索消息）  add 's' flag in 'shortmess' (don't show search message)
"  	set noterse	terse
" shortmess	使消息更短的标志列表    list of flags to make messages shorter
"  	set shm=filnxtToOS
" showcmd	show (partial) command keys in location given by 'showcmdloc'
"  	set sc	nosc
" showcmdloc	location where to show the (partial) command keys for 'showcmd'
"  	set sloc=last
" showmode	在状态行中显示当前模式  display the current mode in the status line
"  	set smd	nosmd
" ruler	在每个窗口下方显示光标的位置    show cursor position below each window
"  	set ru	noru
" rulerformat	ruler 的替代格式    alternate format to be used for the ruler
"  	set ruf=
" report	报告已更改行数的阈值    threshold for reporting number of changed lines
"  	set report=2
" verbose	等级越高，给出的信息越多    the higher the more messages are given
"  	set vbs=0
" verbosefile	用于写入消息的文件    file to write messages in
"  	set vfile=
" more	当屏幕满时暂停显示清单    pause listings when the screen is full
"  	set more	nomore
" confirm	当命令失败时开启对话框    start a dialog when a command fails
"  	set nocf	cf
" errorbells	错误信息响铃    ring the bell for error messages
"  	set noeb	eb
" visualbell	使用视觉铃声代替响铃    use a visual bell instead of beeping
"  	set novb	vb
" belloff	不要为这些原因响铃    do not ring the bell for these reasons
"  	set belloff=      (nvim:belloff=all) 
" helplang	查找帮助的首选语言列表    list of preferred languages for finding help
"  	set hlg=en
" }}}
" set showcmd               " 状态栏显示当前执行的指令，默认开启。
" set showmode              " 状态行显示当前的模式，默认开启。
 
" 13 选择文本    selecting texta {{{
" 
" selection	"old", "inclusive" 或 "exclusive"; 如何选择文本     "old", "inclusive" or "exclusive"; how selecting text behaves
"  	set sel=inclusive
" selectmode	"mouse", "key" 和/或 "cmd"; 何时启动选择模式而不是可视模式    "mouse", "key" and/or "cmd"; when to start Select mode instead of Visual mode
"  	set slm=
" clipboard	"unnamed": 像无名寄存器一样使用 * 寄存器"; "autoselect": 将选择的文本始终放在剪贴板上    "unnamed" to use the * register like unnamed register "autoselect" to always put selected text on the clipboard
"  	set cb=
" keymodel	"startsel" 和/或 "stopsel"; 特殊键可以做    "startsel" and/or "stopsel"; what special keys can do
"  	set km=
" }}}
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" 14 编辑文本    editing text {{{
" 
" undolevels	可以撤销的最大更改数    maximum number of changes that can be undone
" 	(全局或局部于缓冲区)    (global or local to buffer)
"  	set ul=1000
" undofile	自动保存和恢复撤销历史    automatically save and restore undo history
"  	set noudf	udf
" undodir	撤销文件的目录列表    list of directories for undo files
"  	set udir=.
" undoreload	缓冲区重新加载时为撤销保存的最大行数    maximum number lines to save for undo on a buffer reload
"  	set ur=10000
" modified	已经做出了修改，但没有被写入文件    changes have been made and not written to a file
" 	(局部于缓冲区)    (local to buffer)
"  	set nomod	mod
" readonly	缓冲区不会被写入    buffer is not to be written
" 	(局部于缓冲区)
"  	set noro	ro
" modifiable	可以对文本进行更改    changes to the text are possible
" 	(局部于缓冲区)    (local to buffer)
"  	set ma	noma
" textwidth	超过行长度就断行    line length above which to break a line
" 	(局部于缓冲区)    (local to buffer)
"  	set tw=0
" wrapmargin	断行开始的右边距    margin from the right in which to break a line
" 	(局部于缓冲区)    (local to buffer)
"  	set wm=0
" backspace	指定 <BS>, CTRL-W 等在插入模式下可以做什么    specifies what <BS>, CTRL-W, etc. can do in Insert mode
"  	set bs=indent,eol,start
" comments	定义注释行长什么样    definition of what comment lines look like
" 	(局部于缓冲区)    (local to buffer)
"  	set com=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
" formatoptions	控制自动格式化如何工作的标志列表    list of flags that tell how automatic formatting works
" 	(局部于缓冲区)    (local to buffer)
"  	set fo=tcq         (nvim:fo=tcqj) 
" formatlistpat	识别编号列表的模式    pattern to recognize a numbered list
" 	(局部于缓冲区)    (local to buffer)
"  	set flp=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
" formatexpr	用 "gq" 格式化行时使用的表达式    expression used for "gq" to format lines
" 	(局部于缓冲区)    (local to buffer)
"  	set fex=
" complete	指定使用 CTRL-N 和 CTRL-P 进行插入模式补全的工作方式    specifies how Insert mode completion works for CTRL-N and CTRL-P
" 	(局部于缓冲区)    (local to buffer)
"  	set cpt=.,w,b,u,t,i
" completeopt	是否在插入模式补全时使用弹出菜单    whether to use a popup menu for Insert mode completion
"  	set cot=menu,preview
" completepopup	插入模式补全信息弹框的选项     (vim独有)
"  	set cpp=
" pumheight	弹出菜单的最大高度    maximum height of the popup menu
"  	set ph=0
" pumwidth	弹出菜单的最小宽度    minimum width of the popup menu
"  	set pw=15
" completefunc	用于插入模式补全的用户定义函数    user defined function for Insert mode completion
" 	(局部于缓冲区)    (local to buffer)
"  	set cfu=
" omnifunc	用于特定文件类型的插入模式补全的函数    function for filetype-specific Insert mode completion
" 	(局部于缓冲区)    (local to buffer)
"  	set ofu=
" dictionary	用于关键字补全的字典文件列表    list of dictionary files for keyword completion
" 	(全局或局部于缓冲区)    (global or local to buffer)
"  	set dict=
" thesaurus	用于关键字补全的同义词字典文件列表    list of thesaurus files for keyword completion
" 	(全局或局部于缓冲区)    (global or local to buffer)
"  	set tsr=
" thesaurusfunc	用于同义词字典补全的函数    function used for thesaurus completion
" 	(全局或局部于缓冲区)    (global or local to buffer)
"  	set tsrfu=
" infercase	调整关键字补全匹配的大小写    adjust case of a keyword completion match
" 	(局部于缓冲区)    (local to buffer)
"  	set noinf	inf
" digraph	支持使用 c1 <BS> c2 输入二合字符    enable entering digraphs with c1 <BS> c2
"  	set nodg	dg
" tildeop	"~"命令表现得像操作符    the "~" command behaves like an operator
"  	set notop	top
" operatorfunc	"g@" 操作符调用的函数    function called for the "g@" operator
"  	set opfunc=
" showmatch	当插入括号时，短暂地跳转到匹配它的括号    when inserting a bracket, briefly jump to its match
"  	set nosm	sm
" matchtime	显示 'showmatch' 的匹配的时长（以十分之一秒计）    tenth of a second to show a match for 'showmatch'
"  	set mat=5
" matchpairs	"%" 命令匹配的对列表    list of pairs that match for the "%" command
" 	(局部于缓冲区)    (local to buffer)
"  	set mps=(:),{:},[:]
" joinspaces	连接行时，在 '.' 后面添加两个空格    use two spaces after '.' when joining a line
"  	set js	nojs     (nvim:set nojs	js)
" nrformats	"alpha", "octal", "hex", "bin" 和/或 "unsigned"
" 	CTRL-A 和 CTRL-X 命令识别的数字的格式    "alpha", "octal", "hex", "bin" and/or "unsigned"; number formats recognized for CTRL-A and CTRL-X commands
" 	(局部于缓冲区)    (local to buffer)
"  	set nf=bin,hex
" }}}
set undofile
" 撤销文件 :set undofile 是默认的
let &g:undodir = expand($VIMTEMP . '/undo//')
if isdirectory(&g:undodir) == 0
    silent! call mkdir(&g:undodir, 'p', 0700)
endif
if has('persistent_undo')
    set undofile                    " So is persistent undo ...
    set undolevels=1000             " Maximum number of changes that can be undone
    set undoreload=10000            " Maximum number lines to save for undo on a buffer reload
endif
set textwidth=78
set backspace=2                     " 在 insert 模式啟用 backspace 鍵;启用退格键的删除功能
set complete=.,w,b,u,t,ii           " 默认开启自动完成
set completeopt=menu,preview        " 默认的
set infercase                       " 调整关键字补全匹配的大小写 
set showmatch                       " 当插入括号时，短暂地跳转到匹配它的括号

" 15 Tab 和缩进    tabs and indenting {{{
" 
" tabstop	<Tab> 在文本中代表的空格数    number of spaces a <Tab> in the text stands for
" 	(局部于缓冲区)    (local to buffer)
"  	set ts=8
" shiftwidth	每步（自动）缩进所使用的空格数    number of spaces used for each step of (auto)indent
" 	(局部于缓冲区)    (local to buffer)
"  	set sw=8
" vartabstop	tab 代表的空格数的列表    list of number of spaces a tab counts for
" 	(局部于缓冲区)    (local to buffer)
"  	set vts=
" varsofttabstop	软制表符代表的空格数的列表    list of number of spaces a soft tabsstop counts for
" 	(局部于缓冲区)    (local to buffer)
"  	set vsts=
" smarttab	用 <Tab> 键缩进时插入 'shiftwidth' 个空格    a <Tab> in an indent inserts 'shiftwidth' spaces
"  	set nosta	sta
" softtabstop	如果非零，为 <Tab> 插入的空格数    if non-zero, number of spaces to insert for a <Tab>
" 	(局部于缓冲区)    (local to buffer)
"  	set sts=0
" shiftround	用 "<<" 和 ">>" 缩进时，插入 'shiftwidth' 整数倍个空格    round to 'shiftwidth' for "<<" and ">>"
"  	set nosr	sr
" expandtab	在插入模式下将 <Tab> 展开为空格    expand <Tab> to spaces in Insert mode
" 	(局部于缓冲区)    (local to buffer)
"  	set noet	et
" autoindent	自动设置新行缩进    automatically set the indent of a new line
" 	(局部于缓冲区)    (local to buffer)
"  	set noai	ai    (nvim:set ai	noai)
" smartindent	智能自动缩进    do clever autoindenting
" 	(局部于缓冲区)    (local to buffer)
"  	set nosi	si
" cindent	为 C 代码启用特定的缩进    enable specific indenting for C code
" 	(局部于缓冲区)    (local to buffer)
"  	set nocin	cin
" cinoptions	C 风格缩进的选项    options for C-indenting
" 	(局部于缓冲区)    (local to buffer)
"  	set cino=
" cinkeys	在插入模式下触发 C 风格缩进的键    keys that trigger C-indenting in Insert mode
" 	(局部于缓冲区)    (local to buffer)
"  	set cink=0{,0},0),0],:,0#,!^F,o,O,e
" cinwords	导致更多 C 风格缩进的单词列表    list of words that cause more C-indent
" 	(局部于缓冲区)    (local to buffer)
"  	set cinw=if,else,while,do,for,switch
" cinscopedecls	cino-g 使用的作用域声明名称列表    list of scope declaration names used by cino-g
" 	(局部于缓冲区)    (local to buffer)
"  	set cinsd=public,protected,private
" indentexpr	用于获取一行缩进的表达式    expression used to obtain the indent of a line
" 	(局部于缓冲区)    (local to buffer)
"  	set inde=
" indentkeys	在插入模式下使用 'indentexpr' 触发缩进的键    keys that trigger indenting with 'indentexpr' in Insert mode
" 	(局部于缓冲区)    (local to buffer)
"  	set indk=0{,0},0),0],:,0#,!^F,o,O,e
" copyindent	为缩进从上一行复制空白字符    copy whitespace for indenting from previous line
" 	(局部于缓冲区)    (local to buffer)
"  	set noci	ci
" preserveindent	在更改缩进时保留空白类型    preserve kind of whitespace when changing indent
" 	(局部于缓冲区)    (local to buffer)
"  	set nopi	pi
" lisp	启用 lisp 模式    enable lisp mode
" 	(局部于缓冲区)    (local to buffer)
"  	set nolisp	lisp
" lispwords	改变 lisp 如何缩进的单词    words that change how lisp indenting works
"  	set lw=defun,define,defmacro,set!,lambda,if,case,let,flet,let*,letrec,do,do*,define-syntax,let-syntax,letrec-syntax,destructuring-bind,defpackage,defparameter,defstruct,deftype,defvar,do-all-symbols,do-external-symbols,do-symbols,dolist,dotimes,ecase,etypecase,eval-when,labels,macrolet,multiple-value-bind,multiple-value-call,multiple-value-prog1,multiple-value-setq,prog1,progv,typecase,unless,unwind-protect,when,with-input-from-string,with-open-file,with-open-stream,with-output-to-string,with-package-iterator,define-condition,handler-bind,handler-case,restart-bind,restart-case,with-simple-restart,store-value,use-value,muffle-warning,abort,continue,with-slots,with-slots*,with-accessors,with-accessors*,defclass,defmethod,print-unreadable-object
" lispoptions	options for Lisp indenting
"  	set lop=
" }}}
set tabstop=4               " 一个<Tab> 在文本中代表的空格数
set shiftwidth=4            " 每步（自动）缩进所使用的空格数
set smarttab                " 用 <Tab> 键缩进时插入 'shiftwidth' 个空格
set softtabstop=4           " Tab 转为多少个空格。按退格键时可以一次删掉 4 个空格
set shiftround              " 用 "<<" 和 ">>" 缩进时，插入 'shiftwidth' 整数倍个空格    round to 'shiftwidth' for "<<" and ">>"
set expandtab               " 在插入模式下将 <Tab> 展开为空格。将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set autoindent              " 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致。
set smartindent             " 智能自动缩进。
" sw(shiftwidth)缩进4个字符;ts(tabstop)制表符4个空格;sts(softtabstop)插入Tab时算作4个空格;et(expandtab)

" 16 折叠    folding {{{
" 
" foldenable	取消设置以打开所有折叠    unset to display all folds open
" 	(局部于窗口)    (local to window)
"  	set fen	nofen
" foldlevel	等级比这个数字高的折叠将被关闭    folds with a level higher than this number will be closed
" 	(局部于窗口)    (local to window)
"  	set fdl=0
" foldlevelstart	开始编辑文件时，'foldlevel' 的值    value for 'foldlevel' when starting to edit a file
"  	set fdls=-1
" foldcolumn	用来指示折叠的列的宽度    width of the column used to indicate folds
" 	(局部于窗口)    (local to window)
"  	set fdc=0
" foldtext	用于显示已关闭折叠的表达式    expression used to display the text of a closed fold
" 	(局部于窗口)    (local to window)
"  	set fdt=foldtext()
" foldclose	设置为 "all" 来在光标离开时关闭折叠    set to "all" to close a fold when the cursor leaves it
"  	set fcl=
" foldopen	指定会打开折叠的命令
"  	set fdo=block,hor,mark,percent,quickfix,search,tag,undo    specifies for which commands a fold will be opened
" foldminlines	可关闭折叠所需的最小屏幕行数    minimum number of screen lines for a fold to be closed
" 	(局部于窗口)    (local to window)
"  	set fml=1
" commentstring	注释的模板，用于放置折叠标记    template for comments; used to put the marker in
"  	set cms=/*%s*/    (nvim:cms=)
" foldmethod	折叠类型："manual", "indent", "expr", "marker", "syntax" 或者 "diff"    folding type: "manual", "indent", "expr", "marker", "syntax" or "diff"
" 	(局部于窗口)    (local to window)
"  	set fdm=manual
" foldexpr	当 'foldmethod' 为 "expr" 时使用的表达式    expression used when 'foldmethod' is "expr"
" 	(局部于窗口)    (local to window)
"  	set fde=0
" foldignore	当 'foldmethod' 为 "indent" 时用于忽略行    used to ignore lines when 'foldmethod' is "indent"
" 	(局部于窗口)    (local to window)
"  	set fdi=#
" foldmarker	当 'foldmethod' 为 "marker" 时所使用的标记    markers used when 'foldmethod' is "marker"
" 	(局部于窗口)    (local to window)
"  	set fmr={{{,}}}
" foldnestmax	当 'foldmethod' 为 "indent" 或 "syntax" 时的最大折叠深度    maximum fold depth for when 'foldmethod' is "indent" or "syntax"
" 	(局部于窗口)    (local to window)
"  	set fdn=20
" }}}
"代码折叠
"    "设置折叠模式
"    set foldcolumn=4
"    "光标遇到折叠，折叠就打开
"    "set foldopen=all
"    "移开折叠时自动关闭折叠
"    "set foldclose=all
"    "zf zo zc zd zr zm zR zM zn zi zN
"    "依缩进折叠
"    "   manual  手工定义折叠
"    "   indent  更多的缩进表示更高级别的折叠
"    "   expr    用表达式来定义折叠
"    "   syntax  用语法高亮来定义折叠
"    "   diff    对没有更改的文本进行折叠
"    "   marker  对文中的标志折叠
"    set foldmethod=syntax
"    "启动时不要自动折叠代码
"    set foldlevel=100
"    "依标记折叠
"    set foldmethod=marker

" set fdl=99                      " foldlevel	等级比这个数字高的折叠将被关闭
" set fdm=marker " foldmethod, "manual"(手工折叠),"indent"(用缩进表示折叠), "expr", "marker"(默认标记是 {{{ 和 }}}), "syntax" 或者 "diff"
" let g:FoldMethod = 0
" map <leader>zz :call ToggleFold()<cr>
" fun! ToggleFold()
"     if g:FoldMethod == 0
"         exe "normal! zM"
"         let g:FoldMethod = 1
"     else
"         exe "normal! zR"
"         let g:FoldMethod = 0
"     endif
" endfun

" 17 差异模式    diff mode {{{
" 
" diff	对当前窗口使用差异模式    use diff mode for the current window
" 	(局部于窗口)    (local to window)
"  	set nodiff	diff
" diffopt	使用差异模式的选项    options for using diff mode
"  	set dip=internal,filler,closeoff
" diffexpr	用于获取差异文件的表达式    expression used to obtain a diff file
"  	set dex=
" patchexpr	用于给文件打补丁的表达式    expression used to patch a file
"  	set pex=
" }}}
" 无
 
" 18 映射    mapping {{{
" 
" maxmapdepth	最大映射深度    maximum depth of mapping
"  	set mmd=1000
" remap	识别已映射键中的映射    (vim独有)
"  	set remap	noremap
" timeout	允许在映射中途超时    allow timing out halfway into a mapping
"  	set to	noto
" ttimeout	允许在键码中途超时    allow timing out halfway into a key code
"  	set ttimeout	nottimeout
" timeoutlen	'timeout' 的时间（以毫秒计）  time in msec for 'timeout'
"  	set tm=1000
" ttimeoutlen	'ttimeout' 的时间（以毫秒计）    time in msec for 'ttimeout'
"  	set ttm=100    (nvim:ttm=50)
" }}}
" 无
 
" 19 读写文件    reading and writing files {{{
" 
" modeline	读取文件时是否使用 modeline 里的设置    enable using settings from modelines when reading a file
" 	(局部于缓冲区)    (local to buffer)
"  	set ml	noml
" modelineexpr	允许从 modeline 中设置表达式选项    allow setting expression options from a modeline
"  	set nomle	mle
" modelines	为 modeline 而检查的行数    number of lines to check for modelines
"  	set mls=5
" binary	二进制文件编辑   binary file editing
" 	(局部于缓冲区)    (local to buffer)
"  	set nobin	bin
" endofline	文件的最后一行有换行符    last line in the file has an end-of-line
" 	(局部于缓冲区)    (local to buffer)
"  	set eol	noeol
" endoffile	last line in the file followed by CTRL-Z    
" 	(局部于缓冲区)    (local to buffer)
"  	set noeof	eof
" fixendofline	修复文本文件末尾缺少换行符的问题    fixes missing end-of-line at end of text file
" 	(局部于缓冲区)    (local to buffer)
"  	set fixeol	nofixeol
" bomb	在文件前加上字节顺序标记    prepend a Byte Order Mark to the file
" 	(局部于缓冲区)    (local to buffer)
"  	set nobomb	bomb
" fileformat	换行符格式： "dos", "unix" 或 "mac"    end-of-line format: "dos", "unix" or "mac"
" 	(局部于缓冲区)    (local to buffer)
"  	set ff=dos
" fileformats	编辑文件时要检查的文件格式列表    list of file formats to look for when editing a file
"  	set ffs=dos,unix
" textmode	已废止，用 'fileformat'    (vim独有)
" 	(局部于缓冲区)    (local to buffer)
"  	set tx	notx
" textauto	已废止，用 'fileformats'    (vim独有)
"  	set ta	nota
" write	允许写入文件    writing files is allowed
"  	set write	nowrite
" writebackup	覆盖文件前先写入备份文件    write a backup file before overwriting a file
"  	set wb	nowb
" backup	覆盖文件后保留备份    keep a backup after overwriting a file
"  	set nobk	bk
" backupskip	不备份的文件的模式    patterns that specify for which files a backup is not made
"  	set bsk=C:\Users\ADMINI~1\AppData\Local\Temp\*
" backupcopy	通过复制还是重命名已有文件进行备份    whether to make the backup as a copy or rename the existing file
" 	(全局或局部于缓冲区)    (global or local to buffer)
"  	set bkc=auto
" backupdir	存放备份文件的目录列表    list of directories to put backup files in
"  	set bdir=.,C:\\Users\\ADMINI~1\\AppData\\Local\\Temp,c:\\tmp,c:\\temp
" backupext	备份文件使用的扩展名    file name extension for the backup file
"  	set bex=~
" autowrite	在离开修改过的缓冲区时自动写入文件    automatically write a file when leaving a modified buffer
"  	set noaw	aw
" autowriteall	类似于 'autowrite'，但适用于更多命令    as 'autowrite', but works with more commands
"  	set noawa	awa
" writeany	写文件时总是不需要确认    always write without asking for confirmation
"  	set nowa	wa
" autoread	在 Vim 之外修改了文件时，自动读取文件     automatically read a file when it was modified outside of Vim
" 	(全局或局部于缓冲区)    (global or local to buffer)
"  	set noar	ar
" patchmode	保存最旧版本的文件；指定文件扩展名    keep oldest version of a file; specifies file name extension
"  	set pm=
" fsync	文件写入后强制同步到磁盘    forcibly sync the file to disk after writing it
"  	set nofs	fs
" shortname	使用 8.3 格式的文件名    (vim独有)
" 	(局部于缓冲区)    (local to buffer)
"  	set nosn	sn
" cryptmethod	写入文件时使用的加密算法：zip, blowfish 或 blowfish2    (vim独有)
" 	(局部于缓冲区)    (local to buffer)
"  	set cm=blowfish2
" }}}
set modeline            " 已默认开启
set writebackup         " 已默认开启
set backup
let &g:backupdir = expand($VIMTEMP . '/backup//')
if isdirectory(&g:backupdir) == 0
    silent! call mkdir(&g:backupdir, 'p', 0700)
endif
autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")   " Keep more backups for one file
set autowrite               " 离开修改过的缓冲区时自动写入文件
set autoread                " 在 Vim 之外修改了文件时，自动读取文件

" 20 交换文件    the swap file {{{
" 
" directory	交换文件的目录列表    list of directories for the swap file
"  	set dir=.,C:\\Users\\ADMINI~1\\AppData\\Local\\Temp,c:\\tmp,c:\\temp
" swapfile	对这个缓冲区使用交换文件    use a swap file for this buffer
" 	(局部于缓冲区)    (local to buffer)
"  	set swf	noswf
" swapsync	"sync", "fsync" 或留空; 将交换文件刷新到磁盘的方式   (vim独有)
"  	set sws=fsync
" updatecount	导致交换文件更新的字符数    number of characters typed to cause a swap file update
"  	set uc=200
" updatetime	更新交换文件前所需的毫秒数    time in msec after which the swap file will be updated
"  	set ut=4000
" maxmem	单个缓冲区使用的最大内存量（以千字节为单位）   (vim独有)
"  	set mm=12392394
" maxmemtot	所有缓冲区使用的最大内存量（以千字节为单位）   (vim独有)
"  	set mmt=12392394
" }}}
set swapfile                " 已默认开启
let &g:directory = expand($VIMTEMP . '/swap//')
if isdirectory(&g:directory) == 0
    ":silent !mkdir -p &g:directory >/dev/null 2>&1
    silent! call mkdir(&g:directory, 'p', 0700)
endif

" 21 命令行编辑    command line editing {{{
" 
" history	记住的命令行数    how many command lines are remembered
"  	set hi=200
" wildchar	触发命令行扩展的键    key that triggers command-line expansion
"  	set wc=9
" wildcharm	类似 'wildchar'，但也可以在映射中使用    like 'wildchar' but can also be used in a mapping
"  	set wcm=0
" wildmode	指定命令行如何补全    specifies how command line completion works
"  	set wim=full
" suffixes	优先级低的文件扩展名列表    list of file name extensions that have a lower priority
"  	set su=.bak,~,.o,.h,.info,.swp,.obj
" suffixesadd	搜索文件时添加的文件扩展名列表    list of file name extensions added when searching for a file
" 	(局部于缓冲区)    (local to buffer)
"  	set sua=
" wildignore	文件名补全所忽略文件的模式列表    list of patterns to ignore files for file name completion
"  	set wig=
" fileignorecase	使用文件名时忽略大小写    ignore case when using file names
"  	set fic	nofic
" wildignorecase	补全文件名时忽略大小写    ignore case when completing file names
"  	set nowic	wic
" wildmenu	命令行补全时显示匹配列表    command-line completion shows a list of matches
"  	set wmnu	nowmnu
" cedit	用于打开命令行窗口的键    key used to open the command-line window
"  	set cedit=
" cmdwinheight	命令行窗口的高度    height of the command-line window
"  	set cwh=7
" }}}
set wildmode=list:full      " 指定命令行如何补全 show matches above cmdline <C-N/P>
set wildmenu                " 命令行补全时显示匹配列表，已默认开启
set cmdwinheight=10

" 22 执行外部命令    executing external commands {{{
" 
" shell	用于外部命令的 shell 程序的名称    name of the shell program used for external commands
"  	set sh=C:\\WINDOWS\\system32\\cmd.exe
" shellquote	用于包围 shell 命令的字符    character(s) to enclose a shell command in
"  	set shq=
" shellxquote	类似 'shellquote'，但包含重定向    like 'shellquote' but include the redirection
"  	set sxq=(
" shellxescape	'shellxquote' 为 ( 时需要转义的字符    characters to escape when 'shellxquote' is (
"  	set sxe=\"&\|<>()@^
" shellcmdflag	'shell' 执行命令的参数    argument for 'shell' to execute a command
"  	set shcf=/c
" shellredir	用于将命令输出重定向到文件    used to redirect command output to a file
"  	set srr=>%s\ 2>&1
" shelltemp	对 shell 命令使用临时文件而不是管道    use a temp file for shell commands instead of using a pipe
"  	set stmp	nostmp
" equalprg	用于 "=" 命令的程序    program used for "=" command
" 	(全局或局部于缓冲区)
"  	set ep=
" formatprg	用 "gq" 命令格式化代码时使用的程序    program used to format lines with "gq" command
"  	set fp=
" keywordprg	用于 "K" 命令的程序    program used for the "K" command
"  	set kp=:help
" warn	当使用 shell 命令并且缓冲区有修改时发出警告    warn when using a shell command and a buffer has changes
"  	set warn	nowarn
" }}}
" 无
 
" 23 运行 make 并跳到错误（快速修复）    running make and jumping to errors (quickfix) {{{
" 
" errorfile	包含错误消息的文件的名称    name of the file that contains error messages
"  	set ef=errors.err
" errorformat	错误消息的格式列表    list of formats for error messages
" 	(全局或局部于缓冲区)    (global or local to buffer)
"  	set efm=%f(%l)\ \\=:\ %t%*\\D%n:\ %m,%*[^\"]\"%f\"%*\\D%l:\ %m,%f(%l)\ \\=:\ %m,%*[^\ ]\ %f\ %l:\ %m,%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,%f\|%l\|\ %m
" makeprg	用于 ":make" 命令的程序    program used for the ":make" command
" 	(全局或局部于缓冲区)    (global or local to buffer)
"  	set mp=make
" shellpipe	用于将 ":make" 的输出放在错误文件中的字符串    string used to put the output of ":make" in the error file
"  	set sp=>%s\ 2>&1
" makeef	'makeprg' 命令的错误文件的名称    name of the errorfile for the 'makeprg' command
"  	set mef=
" grepprg	用于 ":grep" 命令的程序    program used for the ":grep" command
" 	(全局或局部于缓冲区)    (global or local to buffer)
"  	set gp=findstr\ /n
" grepformat	'grepprg' 的输出格式列表    list of formats for output of 'grepprg'
"  	set gfm=%f:%l:%m,%f:%l%m,%f\ \ %l%m
" makeencoding	":make" 和 ":grep" 输出的编码    encoding of the ":make" and ":grep" output
" 	(全局或局部于缓冲区)    (global or local to buffer)
"  	set menc=
" quickfixtextfunc	用于在快速修复窗口中显示文本的函数    (vim独有)
"  	set qftf=
" }}}
" 无
 
" 24 系统特定    system specific {{{
" 
" shellslash	在文件名中使用正斜杠；用于类 Unix shell    use forward slashes in file names; for Unix-like shells
"  	set nossl	ssl
" completeslash	指定补全时使用的斜杠/反斜杠    specifies slash/backslash used for completion
"  	set csl=
" }}}
" http://yyq123.github.io/learn-vim/learn-vi-102-plugin-plug.html 下载 plug.vim 文件，根据操作系统不同，放置在以下autoload目录中：
" Linux: ~/.vim/autoload
" Windows: ~\vimfiles\autoload\plug.vim

" 25 语言特定    language specific {{{
" 
" isfname	指定文件名中的字符    specifies the characters in a file name
"  	set isf=@,48-57,/,\\,.,-,_,+,,,#,$,%,{,},[,],:,@-@,!,~,=
" isident	指定标识符中的字符   specifies the characters in an identifier
"  	set isi=@,48-57,_,128-167,224-235
" iskeyword	指定关键字中的字符    specifies the characters in a keyword
" 	(局部于缓冲区)    (local to buffer)
"  	set isk=@,48-57,_,192-255
" isprint	指定可打印字符    specifies printable characters
"  	set isp=@,~-255
" quoteescape	指定字符串中的转义字符    specifies escape characters in a string
" 	(局部于缓冲区)    (local to buffer)
"  	set qe=\\
" rightleft	从右到左显示缓冲区        display the buffer right-to-left
" 	(局部于窗口)    (local to window)
"  	set norl	rl
" rightleftcmd	何时从右到左编辑命令行    when to edit the command-line right-to-left
" 	(局部于窗口)    (local to window)
"  	set rlc=search
" revins	倒序插入字符    insert characters backwards
"  	set nori	ri
" allowrevins	在插入和命令行模式下允许 CTRL-_ 切换 'revins'    allow CTRL-_ in Insert and Command-line mode to toggle 'revins'
"  	set noari	ari
" aleph	希伯来字母表第一个字母的 ASCII 码    the ASCII code for the first letter of the Hebrew alphabet
"  	set al=224
" hkmap	使用希伯来语键盘映射    use Hebrew keyboard mapping
"  	set nohk	hk
" hkmapp	使用希伯来语的语音键盘映射    use phonetic Hebrew keyboard mapping
"  	set nohkp	hkp
" arabic	准备编辑阿拉伯语文本    prepare for editing Arabic text
" 	(局部于窗口)    (local to window)
"  	set noarab	arab
" arabicshape	阿拉伯语的字形重整    perform shaping of Arabic characters
"  	set arshape	noarshape
" termbidi	终端支持双向文本    terminal will perform bidi handling
"  	set notbidi	tbidi
" keymap	键盘映射名称    name of a keyboard mapping
"  	set kmp=
" langmap	在普通模式下转换的字符列表    list of characters that are translated in Normal mode
"  	set lmap=
" langremap	对映射的字符应用 'langmap'    apply 'langmap' to mapped characters
"  	set nolrm	lrm
" iminsert	插入模式：1：使用 :lamp；2：使用输入法；0：都不用    in Insert mode: 1: use :lmap; 2: use IM; 0: neither
" 	(局部于窗口)    (local to window)
"  	set imi=0
" imstyle	输入法样式：0：on-the-spot；1：over-the-spot    (vim独有)
"  	set imst=0
" imsearch	输入搜索模式时：1：使用 :lamp；2：使用输入法；0：都不用    entering a search pattern: 1: use :lmap; 2: use IM; 0: neither
" 	(局部于窗口)    (local to window)
"  	set ims=-1
" }}}
" 无
 
" 26 多字节字符    multi-byte characters {{{
" 
" encoding	在 Vim 中使用的字符编码："latin1", "utf-8", "euc-jp", "big5" 等    character encoding used in Nvim: "utf-8"
"  	set enc=utf-8
" fileencoding	当前文件的字符编码    character encoding for the current file
" 	(局部于缓冲区)    (local to buffer)
"  	set fenc=
" fileencodings	自动检测字符编码    automatically detected character encodings
"  	set fencs=ucs-bom,utf-8,default,latin1
" termencoding	终端使用的字符编码    (vim独有)
"  	set tenc=
" charconvert	用于字符编码转换的表达式    expression used for character encoding conversion
"  	set ccv=
" delcombine	删除组合字符本身    delete combining (composing) characters on their own
"  	set nodeco	deco
" maxcombine	显示的最大字符组合数    maximum number of combining (composing) characters displayed
"  	set mco=2    (nvim:mco=6)
" ambiwidth	宽度有歧义字符的宽度    width of ambiguous width characters
"  	set ambw=single
" emoji	表情字符视作全宽    emoji characters are full width
"  	set emo	noemo
" }}}
if g:windows
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
 
" 27 杂项    various {{{
" 
" virtualedit	何时使用虚拟编辑："block", "insert", "all" 和/或 "onemore"    when to use virtual editing: "block", "insert", "all" and/or "onemore"
"  	set ve=
" eventignore	要忽略的自动命令事件列表    list of autocommand events which are to be ignored
"  	set ei=
" loadplugins	启动时加载插件脚本    load plugin scripts when starting up
"  	set lpl	nolpl
" exrc	启用读取在当前目录下的 .vimrc/.exrc/.gvimrc    enable reading .vimrc/.exrc/.gvimrc in the current directory
"  	set noex	ex
" secure	在当前目录下使用脚本文件时更安全    safer working with script files in the current directory
"  	set nosecure	secure
" gdefault	打开 ":substitute" 的 'g' 标志    use the 'g' flag for ":substitute"
"  	set nogd	gd
" edcompatible	":substitute" 的 'g' and 'c' 标志用作开关切换    (vim独有)
"  	set noed	ed
" opendevice	允许读写设备    (vim独有)
"  	set noodev	odev
" maxfuncdepth	函数调用的最大深度    maximum depth of function calls
"  	set mfd=100
" sessionoptions	指定放入会话文件的内容的单词列表    list of words that specifies what to put in a session file
"  	set ssop=blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal
" viewoptions	指定 :mkview 保存的内容的单词列表    list of words that specifies what to save for :mkview
"  	set vop=folds,options,cursor,curdir
" viewdir	:mkview 存放文件的目录    directory where to store files with :mkview
"  	set vdir=C:\\Users\\Administrator/vimfiles/view
" viminfo	指定在 viminfo 文件中写入的内容的列表    list that specifies what to write in the ShaDa file
"  	set vi='100,<50,s10,h,rA:,rB:
" viminfofile	viminfo 文件使用的文件名    (vim独有)
"  	set vif=
" bufhidden	当缓冲区不再位于窗口中时，会发生什么    what happens with a buffer when it's no longer in a window
" 	(局部于缓冲区)    (local to buffer)
"  	set bh=
" buftype	空, "nofile", "nowrite", "quickfix" 等; 缓冲区类型    empty, "nofile", "nowrite", "quickfix", etc.: type of buffer
" 	(局部于缓冲区)    (local to buffer)
"  	set bt=
" buflisted	缓冲区是否显示在缓冲区列表中    whether the buffer shows up in the buffer list
" 	(局部于缓冲区)    (local to buffer)
"  	set bl	nobl
" debug	设置为 "msg" 以查看所有错误消息    set to "msg" to see all error messages
"  	set debug=
" signcolumn	是否显示标号列    whether to show the signcolumn
" 	(局部于窗口)    (local to window)
"  	set scl=auto
" luadll	Lua 动态库的名字        (vim独有)
"  	set luadll=lua54.dll
" perldll	Perl 动态库的名字        (vim独有)
"  	set perldll=perl532.dll
" pyxversion	是否使用 Python 2 和 3    whether to use Python 2 or 3
"  	set pyx=0
" pythondll	Python 2 动态库的名字        (vim独有)
"  	set pythondll=python27.dll
" pythonhome	Python 2 主目录的名字        (vim独有)
"  	set pythonhome=
" pythonthreedll	Python 3 动态库的名字        (vim独有)
"  	set pythonthreedll=python311.dll
" pythonthreehome	Python 3 主目录的名字        (vim独有)
"  	set pythonthreehome=
" rubydll	Ruby 动态库的名字        (vim独有)
"  	set rubydll=x64-ucrt-ruby320.dll
" tcldll	Tcl 动态库的名字        (vim独有)
"  	set tcldll=
" mzschemedll	MzScheme 动态库的名字        (vim独有)
"  	set mzschemedll=libracket3m_dcgt6o.dll
" mzschemegcdll	MzScheme GC 动态库的名字        (vim独有)
"  	set mzschemegcdll=libracket3m_dcgt6o.dll
" }}}
set gdefault                          " 打开 ':substitute' 的 'g' 标志    use the 'g' flag for '':substitute'
set viewdir=$VIMTEMP/view             " :mkview 存放文件的目录 
set viminfo+=n$VIMTEMP/_viminfo       " 指定viminfo文件的位置。信息文件。包括历史记录（命令历史、搜索历史、输入历史）、寄存器内容、标注、缓冲区列表、全局变量等等
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif       " 恢复上次文件打开位置

if has('nvim')
    if has('win32')
        " let g:python3_host_prog=expand('~/AppData/Local/Programs/Python/Python39/python.exe')
        let g:python3_host_prog='D:/Scoop/shims/python38.exe'         " 右边值必须加引号
    else
        let g:python3_host_prog='/bin/python3'
    endif
else
    if has('win32')
        " :py3 print("hello") 表示调用python3；:py print("hello")表示调用python2.
        set pythondll=D:\wingetAPP\Python.2\python27.dll                " 右边值不能加引号
        set pythonhome=D:\wingetAPP\Python.2
        set pythonthreedll=D:\wingetAPP\Python.3.11\python311.dll
        set pythonthreehome=D:\wingetAPP\Python.3.11
    else
        set pythondll=
        set pythonhome=
        set pythonthreedll=
        set pythonthreehome=
    endif
endif

" if has('nvim')
"     if has('win32')
"         " let g:python3_host_prog=expand('~/AppData/Local/Programs/Python/Python39/python.exe')
"         let g:python3_host_prog="D:/Scoop/shims/python38.exe"
"     else
"         let g:python3_host_prog='/bin/python3'
"     endif
" else
"     if has('win32')
"         " :py3 print("hello") 表示调用python3；:py print("hello")表示调用python2.
"         let &pythondll='D:\wingetAPP\Python.2\python27.dll'
"         let &pythonhome='D:\wingetAPP\Python.2'
"         let &pythonthreedll='D:\wingetAPP\Python.3.11\python311.dll'     " expand('~/AppData/Local/Programs/Python/Python39/python39.dll')
"         let &pythonthreehome='D:\wingetAPP\Python.3.11'                  " expand('~/AppData/Local/Programs/Python/Python39')
"     else
"         let &pythondll=
"         let &pythonhome=
"         let &pythonthreedll=expand('/usr/local/lib/libpython3.9.so')
"         let &pythonthreehome=expand('/bin')
"     endif
" endif
 
colorscheme industry

map <F3> I<C-R>=CommentType(1)<CR><ESC>><ESC>
map <F4> :s/<C-R>=CommentType(0)<CR>/<CR>
function! CommentType(isC)
    if &filetype == 'c'
        " 这个if语句里是c文件的配置
        return a:isC == 1 ? "\/\/ " : "\\\/\\\/ "
    else
        " 这里以.vimrc自身的注释方式为栗子作为其他文件的配置示例
        return a:isC == 1 ? "\" " : "\\\" "  
    endif
endfunction
autocmd! bufwritepost $MYVIMRC source %			" vimrc文件修改之后自动加载, windows

" to an HTML-enabled web forum.
function! MyToHtml(line1, line2)
    " make sure to generate in the correct format
    let old_css = 1
    if exists('g:html_use_css')
        let old_css = g:html_use_css
    endif
    let g:html_use_css = 0
    " generate and delete unneeded lines
    exec a:line1.','.a:line2.'TOhtml'
    %g/<body/normal k$dgg
    " convert body to a table
    %s/<body\s*\(bgcolor="[^"]*"\)\s*text=\("[^"]*"\)\s*>/<table \1 cellPadding=0><tr><td><font color=\2>/
    %s#</body>\(.\|\n\)*</html>#\='</font></td></tr></table>'#i
    " restore old setting
    let g:html_use_css = old_css
endfunction
command! -range=% MyToHtml :call MyToHtml(<line1>,<line2>)

function! SetStatusline()
    set statusline=
    set statusline+=\%#StatusSeparator#\|\%#StatusStop#
    set statusline+=\%#StatusBufferNumber#\b:%n
    set statusline+=\%#StatusSeparator#\|\%#StatusStop#
    set statusline+=\%#StatusReadOnly#\%r\%#StatusList#\%q
    "set statusline+=\ \%#StatusFugitive#\%{fugitive#statusline()} " plugin fugitive
    "set statusline+=\%#StatusFugitive#\%{HGRev()?'[r'.HGRev().']':''} " plugin hgrev
    "/rvm
    "set statusline+=\ \%{virtualenv#statusline()}
    set statusline+=\%#StatusChar#\pain\»
    set statusline+=\ \%#StatusModFlag#\%{&modified?'✖':''}
                \\%#StatusModFlag2#\%{&modified?'':'✔'}
    "set statusline+=\ \%#StatusProgramInfo#\%{SyntasticStatuslineFlag()} " plugin Syntastic
    set statusline+=\ \%#StatusFilePath#\%<%t
    "set statusline+=\ \%#StatusProgramInfo#\%{cfi#get_func_name()} " plugin current-func-info
    "set statusline+=\ \%#StatusProgramInfo#\%{(tagbar#currenttag('%s','','s')?tagbar#currenttag('%s',''):'')} " plugin tagbar
    " set statusline+=\ \%#StatusProgramInfo#\%{tagbar#currenttag("[%s]", "", "f")}
    " set statusline+=\ \%#StatusProgramInfo#\%{tagbar#currenttag("[%p]", "")} " prototype
    set statusline+=\%#StatusHELP#\%H
    set statusline+=\%=
    "set statusline+=\ \%{rvm#statusline()} " plugin vim-rvm
    " set statusline+=\%#StatusFileType#\%y
    " set statusline+=\%#StatusFileType#\%{neocomplcache#get_context_filetype()==#&ft?'['.&ft.']':'['.neocomplcache#get_context_filetype().']'} " plugin neocomplcache
    " set statusline+=\%#StatusSeparator#\|\%#StatusStop#
    set statusline+=\ \%<%(\%#StatusNormal#\%{&ff==#'unix'?'':&ff}%)
    set statusline+=\%#StatusChar#\%{&ff=~'unix'&&&fenc==#'utf-8'?'':'•'}
    set statusline+=\%#StatusNormal#\%{&fenc==#'utf-8'?'':&fenc}
    " set statusline+=\%#StatusSeparator#\|\%#StatusStop#
    " set statusline+=\ \%#StatusLineNumber#\%-(L:%l/%L\ C:%c%V%)
    set statusline+=\ \%#StatusLineNumber#\%-(⭡:%l/%c%)
    set statusline+=\ \%#StatusPercent#\%P
endfunction

" if Powerline is not available, use my custom statusline settings.
if !exists('g:Powerline_loaded')
    call SetStatusline()
endif

