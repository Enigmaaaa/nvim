let mapleader = "\<space>"


" for VSCode
if exists('g:vscode')
    " VSCode extension
    " setting cursor movement
    map <c-k> 20k
    map <c-j> 20j
    " nnoremap <c-f> <Cmd>call VSCodeCall('actions.find')<CR>
    " nnoremap <c-f> <Cmd>call VSCodeNotify('actions.find')<CR>
    " nnoremap ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
    
    " ===
    " search setting
    nnoremap / <Cmd>call VSCodeNotify('actions.find')<CR>
    nnoremap ? /
    nnoremap <CR> :echo 
    nnoremap == <Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>
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

" ===
" some conmand 
    function s:resource()

endfunction
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

" ===
" === find
" === in plugin.vim :
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
nnoremap t f
nnoremap T F




" nmap <CR> :echo
" fun! Redraw()
"     let l = winline()
"     let cmd = l * 2 <= winheight(0) + 1 ? l <= (&so + 1) ? 'zb' : 'zt' : 'zz'
"     return cmd
" endf

" nnoremap <expr><c-l> Redraw()