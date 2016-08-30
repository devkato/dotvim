" ================================================================================
"
" ================================================================================

" --------------------------------------------------------------------------------
" Editor Display Settings
" --------------------------------------------------------------------------------
syntax enable
set encoding=utf8
filetype on
set background=dark
set autoindent
set copyindent
set autoread
set autowrite
set splitright
set splitbelow
set ttimeout
set notimeout
set nottimeout
set number
set norelativenumber
set noruler

set tabstop=2
set shiftwidth=2
set softtabstop=2

set expandtab
set smarttab
set backspace=indent,eol,start
set shiftround
set laststatus=2
set showcmd
set showmode
set title
set wildmenu
set wildmode=list:longest
set cmdheight=2
set scrolloff=2
set autoread 
set ttyfast
set mouse = 


" draw performance tuning ------------------------------------------------------------- {{{
let loaded_matchparen=1
set foldmethod=manual
set nofoldenable
set noshowmatch
set nocursorline
set nocursorcolumn
set lazyredraw
set scrolljump=8
set winminwidth=0
let html_no_rendering=1
set nobackup
set noswapfile
set noundofile
set synmaxcol=128
syntax sync minlines=256
" }}}


" ---------------------------------------------------------------------- {{{
" ???
set hidden
set modelines=0
set list
set listchars=tab:>-
" }}}


" ---------------------------------------------------------------------- {{{
" Search Settings
set ignorecase
set smartcase
set wrapscan
set gdefault
set incsearch
set hlsearch

set history=100
let undolevels=100
" }}}


" ---------------------------------------------------------------------- {{{
" Bell Settings
set novisualbell
set noerrorbells
" }}}

" ---------------------------------------------------------------------- {{{
" ColorSchemes
" colorscheme default
colorscheme desert
" }}}
"
"set clipboard=unnamed
set clipboard+=unnamed


set wrap
set textwidth=100
set formatoptions=qrn1

let mapleader = ","
nnoremap / /\v
vnoremap / /\v
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>
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


" ---------------------------------------------------------------------- {{{
" Wrap visual selections with chars
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
" }}}


" ---------------------------------------------------------------------- {{{
" Map the auto-close for non-quotes
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

" autocmd Syntax html,vim inoremap < <lt>><Left>

function! QuoteDelim(char)
  let line = getline('.')
  let col = col('.')
  if line[col - 2] == "\\"
    "Inserting a quoted quotation mark into the string
    return a:char
  elseif line[col - 1] == a:char
    "Escaping out of the string
    return "\<Right>"
  else
    "Starting a string
    return a:char.a:char."\<Left>"
  endif
endf 

inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
" }}}


" ---------------------------------------------------------------------- {{{
" Internal grep
au QuickfixCmdPost vimgrep cw
set grepprg=internal
" }}}


vnoremap * "zy:let @/ = @z<CR>n


" ======================================================================
" Plugins
" ======================================================================

let g:python3_host_prog = '/usr/local/bin/python3'

" ---------------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')

Plug 'vim-coffee-script', { 'for': 'coffee' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'nginx.vim', { 'for': 'nginx' }
Plug 'othree/html5-syntax.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'LeafCage/yankround.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'osyo-manga/vim-monster'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-scripts/tComment'
Plug 'kana/vim-smartchr'
Plug 'Tabular'

call plug#end()

filetype plugin indent on

" ---------------------------------------------------------------------- {{{
" monster.vim
" Set async completion.
let g:monster#completion#rcodetools#backend = "async_rct_complete"
" With deoplete.nvim
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}


" ---------------------------------------------------------------------- {{{
" yankround.vim
" nmap p <Plug>(miniyank-startput)
" nmap <C-p> <Plug>(miniyank-cycle)
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 50
" }}}

let g:deoplete#enable_at_startup = 1
let g:pymode_python = 'python3'

" ---------------------------------------------------------------------- {{{
" Tabularize
nmap <silent> <Leader>a= :Tabularize /=<CR>
vmap <silent> <Leader>a= :Tabularize /=<CR>
nmap <silent> <Leader>a: :Tabularize /:\zs<CR>
vmap <silent> <Leader>a: :Tabularize /:\zs<CR>
nmap <silent> <Leader>al :Tabularize /,\zs<CR>
vmap <silent> <Leader>al :Tabularize /,\zs<CR>
" }}}


" ---------------------------------------------------------------------- {{{
" smartchr
inoremap <expr> => smartchr#one_of(' => ')
inoremap <expr> -> smartchr#one_of(' ->')
inoremap <expr> == smartchr#one_of(' == ')
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
set wildignore+=crawler " Shikidori
" }}}


" ---------------------------------------------------------------------- {{{
" Japanese Encoding Auto Detection
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
end
" }}}

" ---------------------------------------------------------------------- {{{
" fzf.vim
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_buffers_jump = 1

nmap <silent> <Leader>f :<C-u>CtrlPClearCache<CR>
nmap <silent> <Leader>t :<C-u>Files<CR>
nmap <silent> <Leader>b :<C-u>Buffers<CR>
" }}}


" ---------------------------------------------------------------------- {{{
" pi method

" change indent
vnoremap <silent> > > v '>
vnoremap <silent> < < v '>