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
Plugin 'kana/vim-textobj-user'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'embear/vim-localvimrc'

" Custom text objects
Plugin 'kana/vim-textobj-line'

" Navigation
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'

" Visuals
Plugin 'itchyny/lightline.vim'
Plugin 'nlknguyen/papercolor-theme'
Plugin 'rakr/vim-one'
Plugin 'jacoborus/tender'
Plugin 'flazz/vim-colorschemes'

" Powertools
Plugin 'tpope/vim-dispatch'
" Plugin 'scrooloose/syntastic'
Plugin 'janko-m/vim-test'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
Plugin 'jebaum/vim-tmuxify'

" Completion
Plugin 'jiangmiao/auto-pairs'
Plugin 'SirVer/ultisnips'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'

" Languages
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-endwise'
Plugin 'mattn/emmet-vim'
" Plugin 'elixir-lang/vim-elixir'
Plugin 'elmcast/elm-vim'
Plugin 'posva/vim-vue'
" Plugin 'wavded/vim-stylus'
Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
" Plugin 'prettier/vim-prettier'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'shawncplus/phpcomplete.vim'

call vundle#end()            " required
filetype plugin indent on    " required
