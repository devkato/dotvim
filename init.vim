set number
set norelativenumber
set noruler

set smarttab
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start

set clipboard=unnamed
set hls
set laststatus=2

set showcmd
set showmode

syntax enable
set encoding=utf8
filetype on
set autoindent
set copyindent
set autoread
set autowrite

set splitright
set splitbelow

set notimeout
set nottimeout

" ---------------------------------------------------------------------- {{{
" ???
set hidden
set modelines=0
set list
set listchars=tab:>-
" }}}

" ---------------------------------------------------------------------- {{{
" ColorSchemes
" colorscheme default
colorscheme desert
" }}}


" draw performance tuning ------------------------------------------------------------- {{{
let loaded_matchparen=1
set foldmethod=manual
set nofoldenable
set noshowmatch
set nocursorline
set nocursorcolumn
set scrolljump=8
set winminwidth=0
let html_no_rendering=1
set nobackup
set noswapfile
set noundofile
set synmaxcol=256
syntax sync minlines=256
" }}}

" ---------------------------------------------------------------------- {{{
" disable allow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}


let mapleader = ","

nnoremap / /\v
vnoremap / /\v
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>


" ---------------------------------------------------------------------- {{{
" plug.vim
call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf/'
Plug 'junegunn/fzf.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'

call plug#end()
" }}}


" ---------------------------------------------------------------------- {{{
" fzf.vim
" let $FZF_DEFAULT_COMMAND = 'ag --ignore vendor -g ""'
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_layout = { 'up': '~20%' }
let g:fzf_buffers_jump = 1

nmap <silent> <Leader>f :<C-u>CtrlPClearCache<CR>
nmap <silent> <Leader>t :<C-u>Files<CR>
nmap <silent> <Leader>b :<C-u>Buffers<CR>
" }}}



" ---------------------------------------------------------------------- {{{
" nerdtree.vim
map <C-n> :NERDTreeToggle<CR>
" }}}



