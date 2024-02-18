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
Plug 'justinmk/vim-sneak'
Plug 'yamatsum/nvim-cursorline'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'windwp/nvim-autopairs'

" snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" ui plugins
Plug 'folke/which-key.nvim'
Plug 'nvim-lualine/lualine.nvim'

" utility plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" file browsing & operating system
Plug 'mhinz/vim-startify'
Plug 'nvim-telescope/telescope.nvim'
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
Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox

let g:cursorline_timeout = 0

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

set completeopt=menu,menuone,noselect

" LSP servers
"lua require('lspconfig').tsserver.setup{}
"lua require('lspconfig').clangd.setup{}
"lua require('lspconfig').rust_analyzer.setup{}
"lua require('lspconfig').jedi_language_server.setup{on_attach=on_attach}
lua require('lspconfig').pyright.setup{}

lua require('which-key').setup{}
lua require('lualine').setup()
lua require('nvim-autopairs').setup{}

filetype plugin on

"set tm=200
set ts=4
set sw=4
set number
set relativenumber
"set autoindent
set autochdir
set noeb vb t_vb=  " disable error bell etc.
set ignorecase
set nocompatible
set cursorline
set completeopt=menuone,noinsert,noselect
set mouse=a
set nowrap
set splitbelow
set splitright
set signcolumn=yes
set termguicolors
set expandtab
set list
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

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

" Telescope
nnoremap <leader>ff m'<cmd>Telescope find_files<CR>
nnoremap <leader>fg m'<cmd>Telescope live_grep<CR>
nnoremap <leader>fs m'<cmd>Telescope grep_string<CR>
nnoremap <leader>fb m'<cmd>Telescope current_buffer_fuzzy_find fuzzy=true case_mode=ignore_case<CR>
nnoremap <leader>fr m'<cmd>Telescope resume<CR>
nnoremap <leader>fq m'<cmd>Telescope quickfix<CR>

" LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>

nnoremap <silent> <leader>lh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>ld <cmd>lua vim.diagnostic.open_float()<CR>
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
nnoremap <leader>co :copen<CR>
nnoremap <down>     :cn<CR>zz
nnoremap <up>       :cp<CR>zz
nnoremap <right>    :cc<CR>zz
nnoremap <leader>cl :cclose<CR>

" scroll
nnoremap J 5<C-e>
nnoremap K 5<C-y>

" change windows
nnoremap H <C-w>h
nnoremap L <C-w>l

map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F3> :vimgrep //j **<left><left><left><left><left>

nnoremap <leader>gs :G<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Git blame<CR>

nmap <leader>hj :GitGutterNextHunk<CR>
nmap <leader>hk :GitGutterPrevHunk<CR>
"nmap gt :BufferLineCycleNext<CR>
"nmap gT :BufferLineCyclePrev<CR>

" visual map
vnoremap <leader>. <Esc>
vnoremap < <gv
vnoremap > >gv
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" input map
inoremap <leader>. <Esc>
"inoremap ( ()<left>
"inoremap { {}<left>
"inoremap [ []<left>
"inoremap "" "
"inoremap " ""<left>
inoremap <C-j> <esc>:m .+1<CR>==a
inoremap <C-k> <esc>:m .-2<CR>==a

" project specific
au BufNewFile,BufRead *.DDL setlocal ft=dd
au BufNewFile,BufRead *.DDL compiler ant
au BufNewFile,BufRead *.DDL setlocal makeprg=ant\ -f\ .\Tokenize.FDI.xml\ "1_Create\ Package"

au BufNewFile,BufRead *.dd setlocal ft=dd
au BufNewFile,BufRead *.dd compiler ant
au BufNewFile,BufRead *.dd setlocal makeprg=ant\ -f\ .\Tokenize.FDI.xml\ "1_Create\ Package"

"     [exec] C:\work\ars_fdi_package\ARSicFdiPackageProject\Menus.dd(327): Error Comma or right...
au BufNewFile,BufRead *.DDL setlocal efm=%.%#exec\]\ %f\(%l\)\:\ %m,%C\ %.%#,%-G%.%#
au BufNewFile,BufRead *.dd setlocal efm=%.%#exec\]\ %f\(%l\)\:\ %m,%C\ %.%#,%-G%.%#

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
      enable = false,
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
let g:startify_custom_header = [
		\ "   ooooo      ooo oooooooooooo   .oooooo.   oooooo     oooo ooooo ooo        ooooo",
		\ "   `888b.     `8' `888'     `8  d8P'  `Y8b   `888.     .8'  `888' `88.       .888'",
		\ "    8 `88b.    8   888         888      888   `888.   .8'    888   888b     d'888",
		\ "    8   `88b.  8   888oooo8    888      888    `888. .8'     888   8 Y88. .P  888",
		\ "    8     `88b.8   888    \"    888      888     `888.8'      888   8  `888'   888",
		\ "    8       `888   888       o `88b    d88'      `888'       888   8    Y     888",
		\ "   o8o        `8  o888ooooood8  `Y8bood8P'        `8'       o888o o8o        o888o",
		\ ]

lua << EOF
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    -- ['<CR>'] = cmp.mapping.confirm {
      -- behavior = cmp.ConfirmBehavior.Replace,
      -- select = false,
    -- },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  },
}

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = ''} }))
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
EOF

"lua << EOF
"local cmp = require'cmp'
"cmp.setup({
    "mapping = {
        "['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    "},
    "sources = cmp.config.sources({
        "{name = 'nvim_lsp'},
        "{name = 'vsnip'}
    "}, {
        "{name = 'buffer'}
    "})
"})

"cmp.setup.cmdline('/', {
    "sources = {
        "{name = 'buffer' }
    "}
"})

"local capabilities = require('cmp_nvim_lsp').update_capabilities(
    "vim.lsp.protocol.make_client_capabilities()
")
"require('lspconfig')['pyright'].setup {
    "capabilities = capabilities
"}
"EOF
