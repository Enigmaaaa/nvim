
" for VSCode
if exists('g:vscode')
    " VSCode extension
    " setting cursor movement
    nmap <c-k> 20k
    nmap <c-j> 20j
else
    " ordinary neovim
    set nu
    set cul
    noremap <C-j> <C-u>
    noremap <C-k> <C-d>
endif


" ===
" Map setting
" ===
let mapleader = "\<space>"

" ===
" some conmand 
nnoremap <leader>rs :source $MYVIMRC<CR>:echo "successful"<CR>
nnoremap <leader>ss :echo $MYVIMRC<CR>
nnoremap <leader>sh :echo mapleader<CR>
nnoremap <leader>sm :verbose map 
nnoremap <leader>sr :reg<CR>
nnoremap <leader>gh :help 
" nnoremap <leader>es :code $sYVIMRC<CR>

" ===
" Esc at insert mode
inoremap <C-;> <Esc>

" ===
" tab movement
nnoremap > >>
nnoremap < <<
" vnoremap > >gv
" vnoremap < <gv

" ===
" === past and yank
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>x V"_x
noremap x "_x
" function! my_past
"     char_under = strcharpart(getline('.')[col('.') - 1:], 0, 1)
" endfunction


" ===
" === oprator 
onoremap j 1
onoremap l $
onoremap w iw
onoremap 9 i(
onoremap 0 i)
onoremap [ i[
onoremap ] i]

" ===
" === window tags  
nmap E gT
nmap R gt

" ===
" === select
vnoremap aa <Esc>ggVG

" nmap <CR> :echo 