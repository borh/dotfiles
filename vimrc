call pathogen#infect()

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

"" Bundle 'Lokaltog/vim-powerline'
"" python from powerline.ext.vim import source_plugin; source_plugin()
"" let g:Powerline_symbols = 'fancy'
"" let g:Powerline_theme = 'skwp'
"" let g:Powerline_colorscheme = 'skwp'
"" set laststatus=2   " Always show the statusline
"" set encoding=utf-8 " Necessary to show Unicode glyphs

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/syntastic'

set guicursor+=a:blinkon0
if has('gui_running')
	set guifont=Ricty\ Discord\ 14
endif

filetype plugin indent on     " required!
syntax on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
