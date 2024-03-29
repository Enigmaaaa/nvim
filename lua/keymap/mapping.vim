let mapleader = "\<space>"


if exists('g:vscode')
    " for VSCode
    " VSCode extension
    " setting cursor movement
    " somen change is writen in VScode Mapping
    " {
    "   "key": "ctrl+k",
    "   "command": "vscode-neovim.ctrl-u",
    "   "when": "editorTextFocus && neovim.ctrlKeysNormal && neovim.init && neovim.mode != 'insert'"
    " }
    " {
          "key": "ctrl+j",
          "command": "vscode-neovim.ctrl-d",
          "when": "editorTextFocus && neovim.ctrlKeysNormal && neovim.init && neovim.mode != 'insert'"
    " }

    
    " ===
    " search setting
    nnoremap / <Cmd>call VSCodeNotify('actions.find')<CR>
    nnoremap ? /
    nnoremap == <Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>
else
    " ordinary neovim
endif


" ===
" Map setting
" ===

" ===
" some conmand 
" function s:resource()
noremap <C-j> 20j
noremap <C-k> 20k

" endfunction
nnoremap <leader>rs :source $MYVIMRC<CR>:echo "successful"<CR>
nnoremap <leader>ss <Cmd>echo $MYVIMRC<CR>
nnoremap <leader>sh <Cmd>echo mapleader<CR>
nnoremap <leader>sm :verbose map 
nnoremap <leader>sr <Cmd>reg<CR>
nnoremap <leader>gh :help 
" nnoremap <leader>es :code $sYVIMRC<CR>

" ===
" Esc at insert mode
inoremap <C-;> <Esc>

" ===
" tab movement
nnoremap > >>
nnoremap < <<
nnoremap <leader>> >>
nnoremap <leader>< <<
vnoremap > >gv
vnoremap < <gv

" vnoremap > >gv
" vnoremap < <gv

" ===
" === past and yank
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>x V"_x
noremap x "_x
nmap daa vaad
nmap yaa vaay
nmap <leader>yaa vaa<leader>y
" function! my_past
"     char_under = strcharpart(getline('.')[col('.') - 1:], 0, 1)
" endfunction


" ===
" === oprator 
onoremap h ^
onoremap l $
onoremap w iw
onoremap 9 i(
onoremap 0 i)
onoremap [ i[
onoremap ] i]


vnoremap w iw
vnoremap 9 i(
vnoremap 0 i)
vnoremap [ i[
vnoremap ] i]
vnoremap { i{
vnoremap } i}

" ===
" === window tags  
nmap E gT
nmap R gt

" ===
" === select
vnoremap aa <Esc>ggVG





" nmap <CR> :echo
" fun! Redraw()
"     let l = winline()
"     let cmd = l * 2 <= winheight(0) + 1 ? l <= (&so + 1) ? 'zb' : 'zt' : 'zz'
"     return cmd
" endf

" nnoremap <expr><c-l> Redraw()