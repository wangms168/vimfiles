if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    "set statusline=%<%f\                     " Filename
    "set statusline+=%w%h%m%r                 " Options
    "if !exists('g:override_spf13_bundles')
    "    set statusline+=%{fugitive#statusline()} " Git Hotness
    "endif
    "set statusline+=\ [%{&ff}/%Y]            " Filetype
    "set statusline+=\ [%{getcwd()}]          " Current dir
    "set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

    function! StatuslineMode() abort
      return { 'n': 'NORMAL', 'v': 'VISUAL',   'i': 'INSERT',  'R': 'REPLACE',
             \ 's': 'SELECT', 't': 'TERMINAL', 'c': 'COMMAND', '!': 'SHELL',
        \ }[mode()]
    endfunction

"        set statusline=\ [%{StatuslineMode()[mode()]}]
"        set statusline+=\ %{toupper(g:currentmode[mode()])}
"        set statusline+=\ [%F]▶[%{strlen(&fenc)?&fenc:'none'},%{&ff}%w%h%m%r%y%=[%{strftime(\"%H:%M\")}][L:%l/%L,C:%c][\ %P]

    " Status Line Custom
    let g:currentmode={
        \ 'n'  : 'Normal',
        \ 'no' : 'Normal·Operator Pending',
        \ 'v'  : 'Visual',
        \ 'V'  : 'V·Line',
        \ "\<C-V>" : 'V·Block',
        \ 's'  : 'Select',
        \ 'S'  : 'S·Line',
        \ "\<C-S>" : 'S·Block',
        \ 'i'  : 'Insert',
        \ 'R'  : 'Replace',
        \ 'Rv' : 'V·Replace',
        \ 'c'  : 'Command',
        \ 'cv' : 'Vim Ex',
        \ 'ce' : 'Ex',
        \ 'r'  : 'Prompt',
        \ 'rm' : 'More',
        \ 'r?' : 'Confirm',
        \ '!'  : 'Shell',
        \ 't'  : 'Terminal'
        \}

    function! FileSize()
      let bytes = getfsize(expand('%:p'))
      if (bytes >= 1024)
        let kbytes = bytes / 1024
      endif
      if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
      endif

      if bytes <= 0
        return '0'
      endif

      if (exists('mbytes'))
        return mbytes . 'MB '
      elseif (exists('kbytes'))
        return kbytes . 'KB '
      else
        return bytes . 'B '
      endif
    endfunction

    function! ReadOnly()
      if &readonly || !&modifiable
        return ''
      else
        return ''
    endfunction

    set statusline=
    set statusline+=%3*\[%n]                                  "buffernr
    set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
    set statusline+=%2*\ %<%F\                                "File+path
    set statusline+=%2*%(%{ReadOnly()}%h%m%w%)\              "Modified? Readonly? Top/bot.
    set statusline+=%1*\ %y\                                  "FileType
    set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
    set statusline+=%2*%{(&bomb?\",BOM\":\"\")}\            "Encoding2
    set statusline+=%1*\ %{&ff}\                              "FileFormat (dos/unix..) 
    set statusline+=%2*%=                                       "Rownumber/total (%)
    set statusline+=%8*\ [%{strftime(\"%H:%M\")}]\                  "Colnr
    set statusline+=%9*\ [%-3(%{FileSize()}%)]\                  " File size
    set statusline+=%8*\ [L%l/%L:C%c]\ 
    set statusline+=%9*\ [%P]\ 

    hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
    hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
    hi User3 guifg=#292b00  guibg=#f4f597
    hi User4 guifg=#112605  guibg=#aefe7B
    hi User5 guifg=#051d00  guibg=#7dcc7d
    hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
    hi User8 guifg=#ffffff  guibg=#5b7fbb
    hi User9 guifg=#ffffff  guibg=#810085

    au InsertEnter * hi statusline guifg=yellow guibg=black ctermfg=black ctermbg=magenta
    au InsertChange * hi statusline guifg=yellow guibg=black ctermfg=black ctermbg=magenta
    au InsertLeave * hi statusline guibg=black guifg=white

    "function! InsertStatuslineColor(mode)
    "if a:mode == 'i'
    "  hi statusline guifg=yellow
    "elseif a:mode == 'r'
    "  hi statusline guifg=blue
    "else
    "  hi statusline guifg=black
    "endif
    "endfunction
    "au InsertEnter * call InsertStatuslineColor(v:insertmode)
    "au InsertChange * call InsertStatuslineColor(v:insertmode)
    "au InsertLeave * hi statusline guibg=black guifg=white
    function! s:statusline_expr()
        "let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
        "let ro  = "%{&readonly ? '[RO] ' : ''}"
        "let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
        "let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
        "let sep = ' %= '
        "let pos = ' %-12(%l : %c%V%) '
        "let pct = ' %P'
        "return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
        
        let num  = "%3*\[%n]"                                  "buffernr
        let mode = "%0*\ %{toupper(g:currentmode[mode()])}\ "  "The current mode
        let file = "%2*\ %<%F\ %<"                               "File+path
        let modi = "%2*%(%{ReadOnly()}%h%m%w%)\ "              "Modified? Readonly? Top/bot.
        let ft   = "%1*\ %y\ "                                 "FileType
        let en   = "%2*\ %{''.(&fenc!=''?&fenc:&enc).''}"      "Encoding
        let bom  = "%2*%{(&bomb?\",BOM\":\"\")}\ "             "Encoding2
        let ff   = "%1*\ %{&ff}\ "                             "FileFormat (dos/unix..) 
        let sep  = '%2*%='                                     "Rownumber/total (%)
        let time = "%8*\ [%{strftime(\"%H:%M\")}]\ "           "Colnr
        let size = "%9*\ [%-3(%{FileSize()}%)]\ "              "File size
        let pos  = "%8*\ [L%l/%L:C%c]\ "
        let pct  = "%9*\ [%P]\ "
        return num.mode.file.modi.ft.en.bom.ff.sep.time.size.pos.pct
    endfunction
    let &statusline = s:statusline_expr()
endif
