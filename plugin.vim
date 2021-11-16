if empty(stdpath('config').'/autoload')
    if has('win32') || has('win64')
	silent !curl -fLo $VIMCONFIG.'/autoload/plug.vim' --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
endif


call plug#begin($VIMCONFIG.'/plugged')
function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" use normal easymotion when in vim mode
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" use vscode easymotion when in vscode mode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

" === Plug 'justinmk/vim-sneak' setting
Plug 'justinmk/vim-sneak'


Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
call plug#end()