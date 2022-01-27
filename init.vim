set relativenumber
set number
set mouse=a
set clipboard=unnamed
set showcmd
set ruler
set encoding=UTF-8
set showmatch
set sw=4
set relativenumber
let mapleader=" "
set laststatus=2
set backspace=2






call plug#begin('~/.vim/plugged')
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'itchyny/lightline.vim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'yuezk/vim-js'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'preservim/nerdtree'
	Plug 'preservim/tagbar'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'glepnir/dashboard-nvim'
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'tpope/vim-commentary'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
	Plug 'vim-python/python-syntax'
	Plug 'ful1e5/onedark.nvim'
	Plug 'tami5/lspsaga.nvim'	
	Plug 'overcache/NeoSolarized'	
call plug#end()


"other files"
source ~/AppData/Local/nvim/config.vim
source ~/.vim/maps.vim




