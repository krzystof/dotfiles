filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Esentials
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-eunuch'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'AndrewRadev/splitjoin.vim'

" Navigation
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'

" Visuals
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'flazz/vim-colorschemes'

" Powertools
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/syntastic'
Plugin 'janko-m/vim-test'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'

" Completion
Plugin 'jiangmiao/auto-pairs'
Plugin 'SirVer/ultisnips'
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/supertab'

" Languages
Plugin 'tpope/vim-endwise'
Plugin 'elixir-lang/vim-elixir'
Plugin 'posva/vim-vue'
Plugin 'elmcast/elm-vim'
Plugin 'wavded/vim-stylus'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'prettier/vim-prettier'

call vundle#end()            " required
filetype plugin indent on    " required

