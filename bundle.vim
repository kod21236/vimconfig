" Install Vundle if it is not already installed
if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle - required!
Plugin 'gmarik/Vundle.vim'
    
" General plugins
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
" Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-surround'
    
" Language plugins

" Color themes
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
