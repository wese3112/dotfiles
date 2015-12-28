" activate pathogen: automatically install all plugins located in the
" .vim/bundle folder execute pathogen#infect()
execute pathogen#infect()

" enable syntax and colorscheme
syntax enable
colorscheme kolor

" highlight tailing whitespaces
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

set wrap!
"set wm=0
set number
set hlsearch
set ts=4
set sw=4
set mouse=a
set autoindent
set ignorecase " Groß/Kleinschreibung beim suchen missachten
set foldmethod=marker
"filetype indent on
filetype plugin on

if has("gui_running")
	"set guifont=Source\ Code\ Pro\ 12
	set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
	"set guifont=Source\ Code\ Pro\ for\ Powerline
endif

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

" powerline settings
let g:Powerline_symbols = 'fancy'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

set clipboard=unnamed
" Add Arduino syntax highlighting
"autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
"autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
set runtimepath^=.vim/bundle/vim-startify

" mappings -----------------------------------------------------
let mapleader=","

" normal map
noremap <leader>vimrc :tabe ~/.vimrc<cr>

noremap <CR> o<Esc>
noremap <Space> i<Space><Esc>l

noremap <Leader>s <Esc>:w<CR>
noremap <leader>q <Esc>:q<CR>
noremap <leader>m <Esc>:w<CR>:make<CR>
noremap <leader>n <Esc>:NERDTreeToggle<CR>

noremap <Leader>d "_d
noremap <leader>f /
noremap <leader>r :%s/<C-R><C-W>//g<left><left>
noremap = ?
noremap # `
"noremap <leader>t xhp:Tabularize //<left>

" find word under cursor, show with context
noremap // :g/<C-R><C-W>/z#.3<CR>
noremap <leader>G <Esc>:Grep<CR>

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

" language specific maps
" latex specific macros
"let @r='0/label€ýc€ýb{llllllyi€ýc€ýb{#mi€ýc€ýb\ref€ýc€ýb{p'
" Wort nach links: dawbbelpb
noremap <F8> dawbbelpb
" Wort nach rechts: dawelpb
noremap <F9> dawelpb
"inoremap ,, \
"inoremap .. {}<left>
"inoremap $$ $
"inoremap $ $$<Left>
"inoremap <leader>c $^\circ$
"so ~/.vim/atprc.vim

" others
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)


"autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

""let g:EasyMotion_keys='hklyuionmwertzxcvbasdgjf,'
let g:EasyMotion_keys='abcdefghijklmnorstuvw,'

" example of setting your own highlighting
":syn match ToDo "todo"
":hi def ToDo guibg=#e0e0e0

nmap <leader>u <Esc>:let @/=""<CR>

"autocmd VimEnter * NERDTree
autocmd VimEnter * AddTabularPattern is /=
autocmd VimEnter * AddTabularPattern mc /%

autocmd bufwritepost .vimrc source $MYVIMRC
