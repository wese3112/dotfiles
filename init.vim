call plug#begin('~\AppData\Local\nvim\plugged')

" must keep plugins
Plug 'romainl/vim-cool' " removes search highlight after movement
Plug 'scrooloose/nerdcommenter'
Plug 'mg979/vim-visual-multi'

" language tools
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" editing & navigating
Plug 'tpope/vim-surround'
"Plug 'ggandor/lightspeed.nvim'
Plug 'justinmk/vim-sneak'
Plug 'yamatsum/nvim-cursorline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'nvim-lua/completion-nvim'

" ui plugins
Plug 'folke/which-key.nvim'
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'

" utility plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" file browsing & operating system
Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'scrooloose/nerdtree'
Plug 'voldikss/vim-floaterm'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" colorschemes
Plug 'jacoborus/tender'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'tomasiser/vim-code-dark'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

colorscheme tokyonight

let g:gitgutter_git_excecutable = 'C:\Program Files\Git\bin\git.exe'
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'

let g:airline_powerline_fonts = 1

let g:floaterm_keymap_new = '<F5>'
let g:floaterm_keymap_kill = '<F6>'
let g:floaterm_keymap_next = '<F7>'
let g:floaterm_keymap_toggle = '<F12>'

let g:sneak#label = 1

let g:floaterm_borderchars = '─│─│╭╮╯╰'
hi Floaterm guibg=black
hi FloatermBorder guibg=none guifg=cyan

lua require('lspconfig').tsserver.setup{}
lua require('lspconfig').clangd.setup{}
lua require('lspconfig').rust_analyzer.setup{}
lua require('which-key').setup{}
lua require('lualine').setup()
lua require('bufferline').setup{}

filetype plugin on

set tm=200
set ts=4
set sw=4
set number
set relativenumber
"set autoindent
set autochdir
set noeb vb t_vb=  " disable error bell etc.
set ignorecase
set nocompatible
set nocursorline
"set completeopt=menuone,noinsert,noselect
set mouse=a
set nowrap
set splitbelow
set splitright
set signcolumn=yes
set termguicolors


""highlight Normal ctermbg=none
"highlight NonText ctermbg=none
"highlight Normal guibg=none
"highlight NonText guibg=none

" mapping
let mapleader=","

" normal map
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <CR> o<Esc>

"nnoremap <leader>u <Esc>:let @/=""<CR> " obsoleted by vim-cool
nnoremap <leader>et <Esc>:NERDTreeToggle<CR>
nnoremap <leader>ef <Esc>:NERDTreeFocus<CR>
nnoremap <leader>w <Esc>:w<CR>
nnoremap <leader>q <Esc>:q<CR>
nnoremap <leader>ve <Esc>:tabe ~/AppData/Local/nvim/init.vim<CR>
nnoremap <leader>vg <Esc>:tabe ~/AppData/Local/nvim/ginit.vim<CR>
nnoremap <leader>vs <Esc>:source ~/AppData/Local/nvim/init.vim<CR>

" LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>

nnoremap <silent> <leader>lh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>ls <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lk <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>lj <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>lr :LspRestart<CR>

" there is also:
" incoming_calls
" list_workspace_folders
" outgoing_calls
" range_code_action
" references
" rename
" type_definintion
" workspace_symbol

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
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" input map
inoremap <leader>. <Esc>
inoremap ( ()<left>
"inoremap (<CR> (<CR>)<Esc>O
inoremap { {}<left>
"inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<left>
"inoremap [<CR> [<CR>]<Esc>O
inoremap " ""<left>
inoremap <C-j> <esc>:m .+1<CR>==a
inoremap <C-k> <esc>:m .-2<CR>==a

" project specific
autocmd! BufNewFile,BufRead *.dd setlocal ft=c

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
	  enable = true,
  },

  incremental_selection = {
	  enable = true,
  },
}
EOF

" which key plugin
let g:which_key_map = {}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0

highlight default link WhichKey Operator
highlight default link WhichKeySeparator DiffAdded
highlight default link WhichKeyGroup Identifier
highlight default link WhichKeyDesc Function

" Hide status line
autocmd! FileType which_key
autocmd FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['q'] = [ '<Esc>:q', 'close buffer' ]
let g:which_key_map['w'] = [ '<Esc>:w', 'save buffer' ]

"call which_key#register(',', "g:which_key_map")
