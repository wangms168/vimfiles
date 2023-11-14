"突出/高亮显示非ASCII字符
"https://stackoverflow.com/questions/26116926/why-dont-the-syntax-match-plus-highlight-commands-work
"https://stackoverflow.com/questions/27682324/set-item-to-higher-highlight-priority-on-vim/27687580#27687580
" \v"\w+"/匹配""内

"highlight nonASCII guifg=white guibg=red       "定义一个名为nonASCII的高亮组
"highlight link nonASCII ErrorMsg                "为已有的高亮分组起别名，只需要将新的分组连接到已有的分组即可。https://juejin.im/post/59314d110ce4630057f9f9f1
autocmd BufWrite,BufEnter,BufRead _vimrc,*.vim syntax match ErrorMsg "[^\x00-\x7F]"                              "这两句同效果。尾部加containedin=ALL，注释中也匹配。
"autocmd BufWrite,BufEnter,BufRead * :call matchadd('Error', '\v%(^.{-}".{-})@<![^\x00-\x7F]')        "这两句同效果

function HighlightNonAsciiOff()
    echom "Setting non-ascii highlight off"
    syn clear ErrorMsg
    let g:is_non_ascii_on=0
endfunction
function HighlightNonAsciiOn()
    echom "Setting non-ascii highlight on"
    syntax match ErrorMsg "[^\x00-\x7F]" containedin=ALL
    let g:is_non_ascii_on=1
endfunction
function ToggleHighlightNonascii()
    if g:is_non_ascii_on == 1 | call HighlightNonAsciiOff() | else |  call HighlightNonAsciiOn() | endif
endfunction
let g:is_non_ascii_on=0
nnoremap <leader>l :call ToggleHighlightNonascii()<CR>

"https://stackoverflow.com/questions/16987362/how-to-get-vim-to-highlight-non-ascii-characters/16987522
"function! NonPrintable()
"   setlocal enc=utf8
"   if search('\v%(^.{-}".{-})@<![^\x00-\x7F]') != 0
"     call matchadd('Error', '\v%(^.{-}".{-})@<![^\x00-\x7F]')
"     echo 'Non printable characters in text'
"   else
"     setlocal enc=latin1
"     echo 'All characters are printable'
"   endif
"endfunction
"autocmd BufWritePre * :call NonPrintable()


