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

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'

" My Bundles here:
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'git://github.com/aharisu/vim_goshrepl.git'
" NeoBundle 'Shougo/unite.vim'
"
filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused
" bundles

" Installation check.
NeoBundleCheck
