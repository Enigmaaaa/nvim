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
if empty(stdpath('config').'/autoload')
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
    nmap <c-k> 20k
    nmap <c-j> 20j
else
    set nu
    set cul
    noremap <C-j> <C-u>
    noremap <C-k> <C-d>
    " ordinary neovim
    set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
    set termencoding=utf-8
    set encoding=utf-8
    set tabstop=4
    set shiftwidth=4
    set autoindent
endif

" ===
" Esc at insert mode
" ===
let mapleader = "\<space>"
" nnoremap <leader>es :code $sYVIMRC<CR>
nnoremap <leader>rs :source $MYVIMRC<CR>:echo "successful"<CR>
nnoremap <leader>ss :echo $MYVIMRC<CR>
nnoremap <leader>sh :echo mapleader<CR>
nnoremap <leader>gh :help 

" ===
" Esc at insert mode
" ===
inoremap <C-;> <Esc>

" ===
" tab movement
" ===
nnoremap > >>
nnoremap < <<

" ===
" === past and yank
" ===
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>x V"_x
noremap x "_x

" ===
" === oprator 
" ===
onoremap j 1
onoremap l $
onoremap w iw
onoremap 9 i(
onoremap 0 i)
onoremap [ i[
onoremap ] i]

