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
" setting base enviroment args
" ===
let $VIMCONFIG = stdpath('config')
let $VIMDATA = stdpath('data')
let $VIMHOME = $HOME . '/.vim'
if has('win32') || has('win64')
    let VIMHOME = $VIM . '/.vim'
endif


" ===
" === Auto load for first time uses
" ===
if empty(stdpath('config'.'autoload'))
    if has('win32') || has('win64')
	silent !curl -fLo $VIMCONFIG.'/autoload/plug.vim' --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
endif


call plug#begin($VIMCONFIG.'/plugged')
call plug#end()

" for VSCode
if exists('g:vscode')
    " VSCode extension
    " setting cursor movement
    nmap E gT
    nmap R gt
    nmap <c-j> 20j
    nmap <c-k> 20k


else
    set nu
    set cul
    inoremap ;; <Esc>
    noremap <C-j> <C-u>
    noremap <C-k> <C-d>
    " ordinary neovim
endif
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set autoindent
" set paste

let mapleader = "\<space>"
" nnoremap <leader>es :code $sYVIMRC<CR>
nnoremap <leader>rs :source $MYVIMRC<CR>:echo "successful"<CR>
nnoremap <leader>ss :echo $MYVIMRC<CR>
nnoremap <leader>sh :echo mapleader<CR>
nnoremap <leader>gh :help 

" setting mouse movment
noremap j k
noremap k j
noremap > >>
noremap < <<

noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>x V"_x
noremap x "_x