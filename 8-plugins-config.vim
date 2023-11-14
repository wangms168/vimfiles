" Modeline and Notes {{{
" vim: set sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker:            "foldmarker={{{,}}} spell
"        shiftwidth tabstop softtabstop expandtab
" }}}

" startify {{{
    let g:startify_custom_header = [
            \ '       _  __     _         __  ___         __     ___ ',
            \ '      / |/ /  __(_)_ _    /  |/  /__ _____/ /    |_  |',
            \ '     /    / |/ / /  ` \  / /|_/ / _ `/ __/ _ \  / __/ ',
            \ '    /_/|_/|___/_/_/_/_/ /_/  /_/\_,_/\__/_//_/ /____/ ',
            \]

    let g:startify_session_dir = $SESSIONDIR


    let g:startify_lists = [
              \ { 'type': 'files',     'header': ['   Files']                        },
              \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
              \ { 'type': 'sessions',  'header': ['   Sessions']                     },
              \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
              \ ]


    let g:startify_session_autoload = 1
    let g:startify_session_delete_buffers = 1
    let g:startify_change_to_vcs_root = 1
    let g:startify_fortune_use_unicode = 1
    let g:startify_session_persistence = 1

    let g:webdevicons_enable_startify = 1

"    function! StartifyEntryFormat()
"            return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
"        endfunction

    let g:startify_bookmarks = [
                \ { 'c': '~/.config/i3/config' },
                \ { 'i': '~/.config/nvim/init.vim' },
                \ { 'z': '~/.zshrc' },
                \ '~/Blog',
                \ '~/Code',
                \ '~/Pics',
                \ ]

    let g:startify_enable_special = 0
" }}}

" vim-which-key {{{
    if isdirectory(expand($PLUGSDIR."/vim-which-key/"))
"        source $CONFIGDIR/5-which-key.vim
    endif
" }}}

" winmanager {{{
    if isdirectory(expand($PLUGSDIR."/winmanager")) && isdirectory(expand($PLUGSDIR."/bufexplorer")) && isdirectory(expand($PLUGSDIR."/taglist.vim"))
        """"""""""""""""""""""""""""""
        " winManager setting
        """"""""""""""""""""""""""""""
        let g:winManagerWindowLayout = "FileExplorer,BufExplorer|TagList"
        let g:winManagerWidth = 30
        let g:defaultExplorer = 0
        nmap <C-W><C-F> :FirstExplorerWindow<cr>
        nmap <C-W><C-B> :BottomExplorerWindow<cr>
        nmap <silent> <leader>wm :WMToggle<cr>
    endif
    " }}}

"" cscope {{{
"    " exec '!cscope add "'. $VIM .'\vim.out"'
"    " 首先，您需要验证代码是C还是C ++。
"    " 其次，cscope -Rbkq在代码项目下执行命令以生成cscope.out文件。
"    " Autoloading Cscope Database  "https://github.com/SpaceVim/SpaceVim/issues/1692
"    function! LoadCscope()
"      let db = findfile("cscope.out", ".;")
"      if (!empty(db))
"        echo "有db"
"        let path = strpart(db, 0, match(db, "/cscope.out$"))
"        "echo "db=" . db . "path=" . path
"        set nocscopeverbose " suppress 'duplicate connection' error
"        exe "cs add " . db . " " . path
"        set cscopeverbose
"      " else add the database pointed to by environment variable 
"      elseif $CSCOPE_DB != "" 
"        echo "没有db"
"        cs add $CSCOPE_DB
"      endif
"    endfunction
"    "au BufEnter /* call LoadCscope()
"    "：wcd $VIM
"    "au BufEnter /* call LoadCscope()
"" }}}
"
" " Gtags-cscope {{{
"     "GNU GLOBAL即gtags，含有gtags、global两个可执行文件或说两个命令：gtags(管理员命令执行gtags -v)→生成索引文件。global(global -u)→找到标识符。
"     "https://zhuanlan.zhihu.com/p/36279445
"     let $GTAGSCONF = 'D:\Portable/glo663wb(gtags)/share/gtags/gtags.conf'      "$GTAGSCONF必须设置，否则会找不到 native-pygments 和 language map 的定义，
"     "export GTAGSCONF='D:\Portable/glo663wb(gtags)/share/gtags/gtags.conf'
"     let $GTAGSLABEL = 'native-pygments'               "$GTAGSLABEL 告诉 gtags 默认 C/C++/Java 等六种原生支持的代码直接使用 gtags 本地分析器，而其他语言使用 pygments 模块。
"     "export GTAGSLABEL='native-pygments'
" 
"     "exec 'cd ' . fnameescape($VIM)
"     ":cd $VIM
"     " Configure
"     " ---------
"     " You can use the following variables in $HOME/.vimrc.
"     "
"     " To use the default key/mouse mapping:
"     let GtagsCscope_Auto_Map = 1
"     " To ignore letter case when searching:
"     let GtagsCscope_Ignore_Case = 1
"     " To use absolute path name:
"     "       let GtagsCscope_Absolute_Path = 1
"     " To deterring interruption:
"     let GtagsCscope_Keep_Alive = 1
"     " If you hope auto loading:
"     let GtagsCscope_Auto_Load = 1                 "有启动cmd。这个开关没打开，let GtagsCscope_Auto_Map = 1这个设置就不起作用，即就没有这些键绑定设置。
"     " To use 'vim -t ', ':tag' and '<C-]>'
"     "	set cscopetag
"      
"     " 上面是自动连接GTAGS，下面是手动的：
"     "https://vi.stackexchange.com/questions/4991/using-gnu-global-and-gtags-cscope-in-vim
"     "https://www.cnblogs.com/cascle/p/5148389.html
"     " set cscopetag              "使用 cscope 作为 tags 命令
"     " set csprg=gtags-cscope     "使用 gtags-cscope 代替 cscope。没有这条设置,cs add GTAGS时报“E609: Cscope 错误: cscope: cannot read file version from file D:\Vim\GTAGS”错误。
"     " cs add GTAGS               "将标志文件GTAGS添加到cs。
" " }}}

" vimgrep {{{
    if executable("rg")
        set grepprg=rg\ --vimgrep\
        set grepformat=%f:%l:%c:%m
        "https://vim.fandom.com/wiki/Find_in_files_within_Vim
        map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
    endif
" }}}

" FZF {{{
    if isdirectory(expand($PLUGSDIR."/fzf.vim"))
        source $CONFIGDIR/7-fzf.vim
    endif
" }}}

" LeaderF {{{
    if isdirectory(expand($PLUGSDIR."/LeaderF"))
        let g:Lf_ShortcutF = "<leader>ff"
        noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
        noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
        noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
        noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

     endif
" }}}

" GoLang {{{
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_structs = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1
        let g:go_fmt_command = "goimports"
        let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
        let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
        au FileType go nmap <Leader>s <Plug>(go-implements)
        au FileType go nmap <Leader>i <Plug>(go-info)
        au FileType go nmap <Leader>e <Plug>(go-rename)
        au FileType go nmap <leader>r <Plug>(go-run)
        au FileType go nmap <leader>b <Plug>(go-build)
        au FileType go nmap <leader>t <Plug>(go-test)
        au FileType go nmap <Leader>gd <Plug>(go-doc)
        au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
        au FileType go nmap <leader>co <Plug>(go-coverage)
" }}}

"  " TextObj Sentence {{{
"          augroup textobj_sentence
"            autocmd!
"            autocmd FileType markdown call textobj#sentence#init()
"            autocmd FileType textile call textobj#sentence#init()
"            autocmd FileType text call textobj#sentence#init()
"          augroup END
"  " }}}
"  
"  " TextObj Quote {{{
"          augroup textobj_quote
"              autocmd!
"              autocmd FileType markdown call textobj#quote#init()
"              autocmd FileType textile call textobj#quote#init()
"              autocmd FileType text call textobj#quote#init({'educate': 0})
"          augroup END
"  " }}}

" PIV {{{
    if isdirectory(expand($PLUGSDIR."/PIV"))
        let g:DisableAutoPHPFolding = 0
        let g:PIVAutoClose = 0
    endif
" }}}

" Misc {{{
    if isdirectory(expand($PLUGSDIR."/nerdtree"))
        let g:NERDShutUp=1
    endif
    if isdirectory(expand($PLUGSDIR."/matchit.zip"))
        let b:match_ignorecase = 1
    endif
" }}}

" OmniComplete {{{
        if has("autocmd") && exists("+omnifunc")
            autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
        endif

        hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        " Some convenient mappings
        "inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        if exists('g:spf13_map_cr_omni_complete')
            inoremap <expr> <CR>     pumvisible() ? "\<C-y>" : "\<CR>"
        endif
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " Automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menu,preview,longest
" }}}

"    " Ctags {{{
"        set tags=./tags;/,~/.vimtags
"
"        " Make tags placed in .git/tags file available in all levels of a repository
"        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
"        if gitroot != ''
"            let &tags = &tags . ',' . gitroot . '/.git/tags'
"        endif
"    " }}}

" AutoCloseTag {{{
    " Make it so AutoCloseTag works for xml and xhtml files as well
    au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
    nmap <Leader>ac <Plug>ToggleAutoCloseMappings
" }}}

" SnipMate {{{
    " Setting the author var
    " If forking, please overwrite in your .vimrc.local file
    let g:snips_author = 'Steve Francia <steve.francia@gmail.com>'
" }}}

" NerdTree {{{
    if isdirectory(expand($PLUGSDIR."/nerdtree"))
        map <C-e> <plug>NERDTreeTabsToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    endif
" }}}

" Tabularize {{{
    if isdirectory(expand($PLUGSDIR."/tabular"))
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
        vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
        nmap <Leader>a=> :Tabularize /=><CR>
        vmap <Leader>a=> :Tabularize /=><CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a,, :Tabularize /,\zs<CR>
        vmap <Leader>a,, :Tabularize /,\zs<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    endif
" }}}

" Session List {{{
    set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
    if isdirectory(expand($PLUGSDIR."/sessionman.vim/"))
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
        nmap <leader>sc :SessionClose<CR>
    endif
" }}}

" JSON {{{
    nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
    let g:vim_json_syntax_conceal = 0
" }}}

" PyMode {{{
    " Disable if python support not present
    if !has('python') && !has('python3')
        let g:pymode = 0
    endif

    if isdirectory(expand($PLUGSDIR."/python-mode"))
        let g:pymode_lint_checkers = ['pyflakes']
        let g:pymode_trim_whitespaces = 0
        let g:pymode_options = 0
        let g:pymode_rope = 0
    endif
" }}}

" ctrlp {{{
    if isdirectory(expand($PLUGSDIR."/ctrlp.vim/"))
        let g:ctrlp_working_path_mode = 'ra'
        "nnoremap <silent> <D-t> :CtrlP<CR>
        "nnoremap <silent> <D-r> :CtrlPMRU<CR>
        nnoremap <silent> <Leader>p :CtrlP<CR>
        nnoremap <silent> <Leader>f :CtrlPMRU<CR>
        nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
        "nmap <Leader>b :CtrlPBuffer<CR>                  "nmap这样绑定不行
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

        if executable('ag')
            let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
        elseif executable('ack-grep')
            let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
        elseif executable('ack')
            let s:ctrlp_fallback = 'ack %s --nocolor -f'
        " On Windows use "dir" as fallback command.
        elseif g:windows
            let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
        else
            let s:ctrlp_fallback = 'find %s -type f'
        endif
        if exists("g:ctrlp_user_command")
            unlet g:ctrlp_user_command
        endif
        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': s:ctrlp_fallback
        \ }

        if isdirectory(expand($PLUGSDIR."/ctrlp-funky/"))
            " CtrlP extensions
            let g:ctrlp_extensions = ['funky']

            "funky
            nnoremap <Leader>fu :CtrlPFunky<Cr>
        endif
    endif
"}}}

" TagBar {{{
    if isdirectory(expand($PLUGSDIR."/tagbar/"))
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
    endif
"}}}

" Rainbow {{{
    if isdirectory(expand($PLUGSDIR."/rainbow/"))
        let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
    endif
"}}}

" Fugitive {{{
    if isdirectory(expand($PLUGSDIR."/vim-fugitive/"))
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        " Mnemonic _i_nteractive
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        nnoremap <silent> <leader>gg :SignifyToggle<CR>
    endif
"}}}

" YouCompleteMe {{{
        let g:acp_enableAtStartup = 0

        " enable completion from tags
        let g:ycm_collect_identifiers_from_tags_files = 1

        " remap Ultisnips for compatibility for YCM
        let g:UltiSnipsExpandTrigger = '<C-j>'
        let g:UltiSnipsJumpForwardTrigger = '<C-j>'
        let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

        " Haskell post write lint and check with ghcmod
        " $ `cabal install ghcmod` if missing and ensure
        " ~/.cabal/bin is in your $PATH.
        if !executable("ghcmod")
            autocmd BufWritePost *.hs GhcModCheckAndLintAsync
        endif

        " For snippet_complete marker.
        if !exists("g:spf13_no_conceal")
            if has('conceal')
                set conceallevel=2 concealcursor=i
            endif
        endif

        " Disable the neosnippet preview candidate window
        " When enabled, there can be too much visual noise
        " especially when splits are used.
        set completeopt-=preview
" }}}

" neocomplete {{{
        let g:acp_enableAtStartup = 0
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#enable_auto_delimiter = 1
        let g:neocomplete#max_list = 15
        let g:neocomplete#force_overwrite_completefunc = 1


        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
                    \ 'default' : '',
                    \ 'vimshell' : $HOME.'/.vimshell_hist',
                    \ 'scheme' : $HOME.'/.gosh_completions'
                    \ }

        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings {{{
            " These two lines conflict with the default digraph mapping of <C-K>
            if !exists('g:spf13_no_neosnippet_expand')
                imap <C-k> <Plug>(neosnippet_expand_or_jump)
                smap <C-k> <Plug>(neosnippet_expand_or_jump)
            endif
            if exists('g:spf13_noninvasive_completion')
                inoremap <CR> <CR>
                " <ESC> takes you out of insert mode
                inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
                " <CR> accepts first, then sends the <CR>
                inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
                " <Down> and <Up> cycle like <Tab> and <S-Tab>
                inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
                inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
                " Jump up and down the list
                inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
                inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
            else
                " <C-k> Complete Snippet
                " <C-k> Jump to next snippet point
                imap <silent><expr><C-k> neosnippet#expandable() ?
                            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                            \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
                smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

                inoremap <expr><C-g> neocomplete#undo_completion()
                inoremap <expr><C-l> neocomplete#complete_common_string()
                "inoremap <expr><CR> neocomplete#complete_common_string()

                " <CR>: close popup
                " <s-CR>: close popup and save indent.
                inoremap <expr><s-CR> pumvisible() ? neocomplete#smart_close_popup()."\<CR>" : "\<CR>"

                function! CleverCr()
                    if pumvisible()
                        if neosnippet#expandable()
                            let exp = "\<Plug>(neosnippet_expand)"
                            return exp . neocomplete#smart_close_popup()
                        else
                            return neocomplete#smart_close_popup()
                        endif
                    else
                        return "\<CR>"
                    endif
                endfunction

                " <CR> close popup and save indent or expand snippet
                imap <expr> <CR> CleverCr()
                " <C-h>, <BS>: close popup and delete backword char.
                inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
                inoremap <expr><C-y> neocomplete#smart_close_popup()
            endif
            " <TAB>: completion.
            inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
            inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

            " Courtesy of Matteo Cavalleri

            function! CleverTab()
                if pumvisible()
                    return "\<C-n>"
                endif
                let substr = strpart(getline('.'), 0, col('.') - 1)
                let substr = matchstr(substr, '[^ \t]*$')
                if strlen(substr) == 0
                    " nothing to match on empty string
                    return "\<Tab>"
                else
                    " existing text matching
                    if neosnippet#expandable_or_jumpable()
                        return "\<Plug>(neosnippet_expand_or_jump)"
                    else
                        return neocomplete#start_manual_complete()
                    endif
                endif
            endfunction

            imap <expr> <Tab> CleverTab()
        " }}}

        " Enable heavy omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
            let g:neocomplete#sources#omni#input_patterns = {}
        endif
        let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
" }}}

" neocomplcache {{{
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_enable_auto_delimiter = 1
        let g:neocomplcache_max_list = 15
        let g:neocomplcache_force_overwrite_completefunc = 1

        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
                    \ 'default' : '',
                    \ 'vimshell' : $HOME.'/.vimshell_hist',
                    \ 'scheme' : $HOME.'/.gosh_completions'
                    \ }

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns._ = '\h\w*'

        " Plugin key-mappings {{{
            " These two lines conflict with the default digraph mapping of <C-K>
            imap <C-k> <Plug>(neosnippet_expand_or_jump)
            smap <C-k> <Plug>(neosnippet_expand_or_jump)
            if exists('g:spf13_noninvasive_completion')
                inoremap <CR> <CR>
                " <ESC> takes you out of insert mode
                inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
                " <CR> accepts first, then sends the <CR>
                inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
                " <Down> and <Up> cycle like <Tab> and <S-Tab>
                inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
                inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
                " Jump up and down the list
                inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
                inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
            else
                imap <silent><expr><C-k> neosnippet#expandable() ?
                            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                            \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
                smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

                inoremap <expr><C-g> neocomplcache#undo_completion()
                inoremap <expr><C-l> neocomplcache#complete_common_string()
                "inoremap <expr><CR> neocomplcache#complete_common_string()

                function! CleverCr()
                    if pumvisible()
                        if neosnippet#expandable()
                            let exp = "\<Plug>(neosnippet_expand)"
                            return exp . neocomplcache#close_popup()
                        else
                            return neocomplcache#close_popup()
                        endif
                    else
                        return "\<CR>"
                    endif
                endfunction

                " <CR> close popup and save indent or expand snippet
                imap <expr> <CR> CleverCr()

                " <CR>: close popup
                " <s-CR>: close popup and save indent.
                inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()."\<CR>" : "\<CR>"
                "inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

                " <C-h>, <BS>: close popup and delete backword char.
                inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
                inoremap <expr><C-y> neocomplcache#close_popup()
            endif
            " <TAB>: completion.
            inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
            inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
        " }}}

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
" }}}

" Normal Vim omni-completion {{{
" To disable omni complete, add the following to your .vimrc.before.local file:
        " Enable omni-completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" }}}

" Snippets {{{

        " Use honza's snippets.
        let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

        " Enable neosnippet snipmate compatibility mode
        let g:neosnippet#enable_snipmate_compatibility = 1

        " For snippet_complete marker.
        if !exists("g:spf13_no_conceal")
            if has('conceal')
                set conceallevel=2 concealcursor=i
            endif
        endif

        " Enable neosnippets when using go
        let g:go_snippet_engine = "neosnippet"

        " Disable the neosnippet preview candidate window
        " When enabled, there can be too much visual noise
        " especially when splits are used.
        set completeopt-=preview
" }}}

" ghcmod {{{
    " FIXME: Isn't this for Syntastic to handle?
    " Haskell post write lint and check with ghcmod
    " $ `cabal install ghcmod` if missing and ensure
    " ~/.cabal/bin is in your $PATH.
    if !executable("ghcmod")
        autocmd BufWritePost *.hs GhcModCheckAndLintAsync
    endif
" }}}

" UndoTree {{{
    if isdirectory(expand($PLUGSDIR."/undotree/"))
        nnoremap <Leader>u :UndotreeToggle<CR>
        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle=1
    endif
" }}}

" indent_guides {{{
    if isdirectory(expand($PLUGSDIR."/vim-indent-guides/"))
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    endif
" }}}

" Wildfire {{{
    let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
            \ "html,xml" : ["at"],
            \ }
" }}}

" vim-airline {{{
    " Set configuration options for the statusline plugin vim-airline.
    " Use the powerline theme and optionally enable powerline symbols.
    " To use the symbols , , , , , , and .in the statusline
    " segments add the following to your .vimrc.before.local file:
    "   let g:airline_powerline_fonts=1
    " If the previous symbols do not render for you then install a
    " powerline enabled font.

    " See `:echo g:airline_theme_map` for some more choices
    " Default in terminal vim is 'dark'
    if isdirectory(expand($PLUGSDIR."/vim-airline-themes/"))
        if !exists('g:airline_theme')
            let g:airline_theme = 'powerlineish'
            "let g:airline_theme = 'solarized'
        endif
        if !exists('g:airline_powerline_fonts')
            " Use the default set of separators with a few customizations
            let g:airline_powerline_fonts = 1 
            "let g:airline_left_sep='›'  " Slightly fancier than '>'
            "let g:airline_right_sep='‹' " Slightly fancier than '<'
            let g:airline_left_sep = ''             " ''
            let g:airline_left_alt_sep = '|'        " ''
            let g:airline_right_sep = ''
            let g:airline_right_alt_sep = '|'       " ''
        endif
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
        let g:airline#extensions#tabline#show_tab_nr = 1
        let g:airline#extensions#tabline#formatter = 'default'
        let g:airline#extensions#tabline#buffer_nr_show = 0
        let g:airline#extensions#tabline#fnametruncate = 16
        let g:airline#extensions#tabline#fnamecollapse = 2
        let g:airline#extensions#tabline#buffer_idx_mode = 1
    endif

" }}}

"" vim-devicons {{{
"    " loading the plugin
"    let g:webdevicons_enable = 1
"    " adding the flags to NERDTree
"    "let g:webdevicons_enable_nerdtree = 1
"    " adding to vim-airline's tabline
"    let g:webdevicons_enable_airline_tabline = 1
"    " adding to vim-airline's statusline
"    let g:webdevicons_enable_airline_statusline = 1
"    " ctrlp glyphs
"    let g:webdevicons_enable_ctrlp = 1
"" }}}

" vim-repl {{{
     if isdirectory(expand($PLUGSDIR."/vim-repl/"))
        let g:repl_program = {
                    \   'python': ['python'],
                    \   'default': ['zsh'],
                    \   'r': 'R',
                    \   'lua': 'lua',
                    \   'vim': 'vim -e',
                    \   }
        let g:repl_predefine_python = {
                    \   'numpy': 'import numpy as np',
                    \   'matplotlib': 'from matplotlib import pyplot as plt'
                    \   }
        let g:repl_auto_sends = ['class ', 'def ', 'for ', 'if ', 'while ', 'with ']
        let g:repl_cursor_down = 1
        let g:repl_python_automerge = 1
        let g:repl_unhide_when_send_lines = 0
        let g:repl_output_copy_to_register = "t"
        let g:repl_position = 0
        nnoremap <leader>r :REPLToggle<Cr>
        " nnoremap <leader>e :REPLSendSession<Cr>
     endif
" }}}

