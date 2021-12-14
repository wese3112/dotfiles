call plug#begin('~\AppData\Local\nvim\plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ggandor/lightspeed.nvim'

" colorschemes
Plug 'jacoborus/tender'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'tomasiser/vim-code-dark'

call plug#end()

colorscheme onedark

set ts=4
set sw=4
set number
set relativenumber
set hlsearch
set autoindent
set autochdir
set noeb vb t_vb=  " disable error bell etc.
set ignorecase
set nocompatible
set cursorline
"set completeopt=menuone,noinsert,noselect
set mouse=a
filetype plugin on

" mapping
let mapleader=","

" normal map
nnoremap <CR> o<Esc>
nnoremap <leader>u <Esc>:let @/=""<CR>
nnoremap <leader>et <Esc>:NERDTreeToggle<CR>
nnoremap <leader>ef <Esc>:NERDTreeFocus<CR>
nnoremap <leader>w <Esc>:w<CR>
nnoremap <leader>q <Esc>:q<CR>
nnoremap < <<
nnoremap > >>

nnoremap <leader>gs :G<CR>
nnoremap <leader>gd :Gdiff<CR>

" visual map
vnoremap <leader>. <Esc>
vnoremap < <gv
vnoremap > >gv

" input map
inoremap <leader>. <Esc>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>


" project specific
autocmd! BufNewFile,BufRead *.dd setlocal ft=c

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
