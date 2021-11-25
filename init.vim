" __  ____   __  _   ___     _____ __  __ ____   ____
" |  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
" | |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
" |_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @Enigmaaaa

" Checkout-list
" vim-esearch
" fmoralesc/worldslice
" SidOfc/mkdx


" ===
" === setting base enviroment args
" ===
let $VIMCONFIG = stdpath('config')
let $VIMDATA = stdpath('data')
let $VIMHOME = $HOME . '/.vim'
if has('win32') || has('win64')
    let VIMHOME = $VIM . '/.vim'
endif

let s:config_files = [
        \ $VIMCONFIG.'/option.vim',
        \ $VIMCONFIG.'/mapping.vim',
        \]
        " \ $VIMCONFIG.'/plugin.vim',
        " \ $VIMCONFIG.'/command.vim',

function s:load_config()
    for l:filename in s:config_files
        execute 'source ' . expand(l:filename)
    endfor
endfunction

call s:load_config()

if has('nvim') 
    lua require('nvim_init')
endif

" if has('nvim') 
"     lua require('nvim_init')
" else
"     let s:config_files = [
"             \ $VIMCONFIG.'/option.vim',
"             \ $VIMCONFIG.'/mapping.vim',
"             \ $VIMCONFIG.'/plugin.vim',
"             \]
"             " \ $VIMCONFIG.'/command.vim',

"     function s:load_config()
"         for l:filename in s:config_files
"             execute 'source ' . expand(l:filename)
"         endfor
"     endfunction

"     call s:load_config()
" endif


" ===
" === Auto load for first time uses
" ===
