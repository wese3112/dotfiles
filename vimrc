" activate pathogen: automatically install all plugins located in the
" .vim/bundle folder execute pathogen#infect()
execute pathogen#infect()

" enable syntax and colorscheme
syntax enable
colorscheme tender

set wrap!
"set wm=0
set number
set hlsearch
set ts=4
set sw=4
set mouse=a
set autoindent
set autochdir
set ignorecase " Groﬂ/Kleinschreibung beim suchen missachten
set foldmethod=marker
filetype indent on
filetype plugin on

"set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline
set guifont=Source\ Code\ Pro\ for\ Powerline\ 14

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

" airline settings
let g:airline_powerline_fonts = 1
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

set clipboard=unnamed
" Add Arduino syntax highlighting
"autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
"autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
set runtimepath^=.vim/bundle/vim-startify
set runtimepath^=.vim/bundle/ctrlp.vim

" mappings -----------------------------------------------------
let mapleader=","

" normal map
noremap <leader>vimrc :tabe ~/.vimrc<cr>

noremap <CR> o<Esc>
noremap <Space> a<Space><Esc>l

noremap <Leader>s <Esc>:w<CR>
noremap <leader>q <Esc>:q<CR>
noremap <leader>m <Esc>:w<CR>:make<CR>
noremap N <Esc>:NERDTreeToggle<CR>

noremap <Leader>d "_d
noremap <leader>f /
noremap <leader>r :%s/<C-R><C-W>//g<left><left>
noremap = ?
noremap # `
"noremap <leader>t xhp:Tabularize //<left>

" find word under cursor, show with context
noremap // :g/<C-R><C-W>/z#.3<CR>

noremap <F2> <Esc>:cnext<CR>
noremap <F3> <Esc>:cprev<CR>
noremap <F4> <Esc>:tabp<CR>
noremap <F5> <Esc>:tabn<CR>
"noremap <leader>e <Esc>:tabp<CR>
"noremap <leader>t <Esc>:tabn<CR>

noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

noremap <C-Up> ddkP
noremap <C-Down> ddp

noremap <leader>wl :vsplit <C-w><C-l>
noremap <leader>wj :split <C-w><C-j>
"noremap <leader>z <Esc>:tabn<CR>
"noremap <leader>e <Esc>:tabp<CR>

" visual map
"vnoremap <leader>. <Esc>
vnoremap < <gv
vnoremap > >gv
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

" insert map
inoremap <leader>. <Esc>
inoremap <C-Space> <Esc>la

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O<Tab>
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O<Tab>
inoremap ((     (
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O<Tab>
inoremap [[     [
inoremap []     []

inoremap "      ""<Left>
inoremap ""     "
inoremap '      ''<Left>
inoremap ''     '

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

""let g:EasyMotion_keys='hklyuionmwertzxcvbasdgjf,'
let g:EasyMotion_keys='abcdefghijklmnorstuvw,'

nmap <leader>u <Esc>:let @/=""<CR>

autocmd bufwritepost .vimrc source $MYVIMRC
