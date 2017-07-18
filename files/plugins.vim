filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Esentials
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'editorconfig/editorconfig-vim'
" Navigation
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
" Visuals
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
" Powertools
Plugin 'scrooloose/syntastic'
Plugin 'janko-m/vim-test'
" Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'SirVer/ultisnips'
Plugin 'mattn/emmet-vim'
" Languages
Plugin 'elixir-lang/vim-elixir'
Plugin 'posva/vim-vue'

call vundle#end()            " required
filetype plugin indent on    " required

