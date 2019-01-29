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

Plug 'dunstontc/vim-vscode-theme'
Plug 'vim-scripts/tComment'
Plug 'kana/vim-smartchr'

" Plug 'valloric/youcompleteme'

call plug#end()
" }}}


" ---------------------------------------------------------------------- {{{
" fzf.vim
" let $FZF_DEFAULT_COMMAND = 'ag --ignore vendor -g ""'
" let $FZF_DEFAULT_COMMAND = 'fzf --ignore vendor --ignore node_modules -g ""'
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


" ---------------------------------------------------------------------- {{{
" ColorSchemes
" colorscheme default
" colorscheme desert
colorscheme dark_plus
" }}}


" ---------------------------------------------------------------------- {{{
" smartchr
inoremap <expr> => smartchr#one_of(' => ')
inoremap <expr> -> smartchr#one_of(' -> ')
inoremap <expr> == smartchr#one_of(' == ')
" }}}


" ---------------------------------------------------------------------- {{{
" auto pair(Vanilla vim script)
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" }}}


" ---------------------------------------------------------------------- {{{
" WildMenu
set wildignore+=.hg,.git,.svn                         " VCS
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg        " Images
set wildignore+=bin/*,vendor/*,log/*,tmp/*                  " Rails
set wildignore+=*.jar,*.class                         " Java
set wildignore+=rebar,tags,*.beam,deps/*,rel/*,doc/*,*/ebin/* " Erlang
set wildignore+=*.lzo,*.zip,*.gz,*.tgz,*.tar          " Compressed files
set wildignore+=*.log,BLANK,*.log.[0-9]*,*.lock,*.pid " log, lock, pid files"
set wildignore+=*.DS_Store                            " OS X
set wildignore+=CVS                           " OS X
set wildignore+=coverage                      " OS X
set wildignore+=spec/reports                  " OS X
set wildignore+=*.pyc                         " Python
set wildignore+=chef-repo/cookbooks,cookbooks " chef
set wildignore+=node_modules                  " Titanium
set wildignore+=docs,fuel/vendor,fuel/packages,fuel/core " Python
set wildignore+=Pods " XCode
set wildignore+=src/vendor " gae
" }}}
