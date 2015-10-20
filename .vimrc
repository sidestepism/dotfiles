set nu
set cursorline
set showmatch
set incsearch
set hlsearch
set smartcase
set ignorecase
set scs
set si
set foldmethod=manual
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set showtabline=2
set expandtab
set tabpagemax=50
set fo=cql
set ts=4
set sw=4
set sts=4
set vb t_vb=
set backspace=indent,eol,start
set list
set listchars=tab:»-,trail:-
syntax on
" filetype plugin on
colorscheme default

" let g:neocomplcache_enable_at_startup = 1
let g:jscomplete_use = [ 'dom' ]

vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

command Bo :%! xxd
command Bc :%! xxd -r

function VG(text)
    exe "cex [] | tabdo vimgrepa /" . a:text . "/ % | cw"
    endfunction
    command -nargs=1 VG call VG(<q-args>)
    cnoreabbrev vg VG


"set mouse=a


set nocompatible               " Be iMproved

" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
