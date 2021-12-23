call plug#begin('~\AppData\Local\nvim\plugged')

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'folke/which-key.nvim'
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
Plug 'voldikss/vim-floaterm'
Plug 'dominikduda/vim_current_word'

" colorschemes
Plug 'jacoborus/tender'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'tomasiser/vim-code-dark'

call plug#end()

let g:gitgutter_git_excecutable = 'C:\Program Files\Git\bin\git.exe'
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'

lua require('lspconfig').tsserver.setup{}
lua require('lspconfig').clangd.setup{}
lua require('lspconfig').rust_analyzer.setup{}
lua require('which-key').setup{}

colorscheme onedark

set tm=500
set ts=4
set sw=4
set number
set relativenumber
set autoindent
set autochdir
set noeb vb t_vb=  " disable error bell etc.
set ignorecase
set nocompatible
set cursorline
"set completeopt=menuone,noinsert,noselect
set mouse=a
set nowrap
set splitbelow
set splitright
set signcolumn=yes
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
nnoremap <leader>ve <Esc>:tabe ~/AppData/Local/nvim/init.vim<CR>
nnoremap <leader>vg <Esc>:tabe ~/AppData/Local/nvim/ginit.vim<CR>
nnoremap <leader>vs <Esc>:source ~/AppData/Local/nvim/init.vim<CR>
nnoremap < <<
nnoremap > >>

" quickfix list
nnoremap <leader>c :copen<CR>
nnoremap <down> :cn<CR>zz
nnoremap <up> :cp<CR>zz

" change windows
nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l

map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F3> :vimgrep //j **<left><left><left><left><left>

nnoremap <leader>gs :G<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Git blame<CR>

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
