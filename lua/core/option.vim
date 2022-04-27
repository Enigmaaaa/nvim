
if exists('g:vscode')
    " VSCode extension
    " setting cursor movement
else
    " ordinary neovim
    set nu
    set cul
    set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
    set termencoding=utf-8
    set encoding=utf-8
    set tabstop=4
    set shiftwidth=4
    set autoindent
endif

set shada="NONE"