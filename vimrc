set nocompatible                    " vim wont be compatible with older vi
filetype on                         " allows for the detection of filetypes

" Colors
syntax enable
set background=dark
colorscheme solarized

if has('gui_running')
    colorscheme solarized
endif

" Spaces & Tabs
set tabstop=4		                " number of visual spaces per TAB
set softtabstop=4	                " number of spaces in tab when editing
set expandtab		                " tabs are spaces
set nowrap                          " do no wrap lines
set backspace=indent,eol,start      " backspace behaves as it should
set shiftwidth=4                    " tabs are 4 spaces
set autoindent                      " autoindent code
set scrolloff=5                     " keep 5 lines when scrolling
set textwidth=82
set tabpagemax=8                    " maximum of 8 tabs open at once

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0
autocmd Filetype html setlocal ts=2 sw=2 sts=0
autocmd Filetype css setlocal ts=2 sw=2 sts=0
autocmd Filetype ruby setlocal ts=2 sw=2 sts=0

" Enable mouse
if has('mouse')
    set mouse=a
endif

let g:html_indent_inctags="html,body,head,tbody" " more tags autoindent

" UI Config
set number		                    " show line numbers

set laststatus=2

set cursorline		                " highlight current line
set wildmenu		                " visual automplete for command menu
set wildmode=list:longest
set lazyredraw		                " redraw only what we need to
set showmatch		                " highlight matching [{()}]
set mat=2                           " set matching blinking speed

set tabpagemax=8
set showmode                        " show current mode in statusline

" Searching
set incsearch		                " search as characters are entered
set hlsearch		                " highlight matches
set ignorecase                      " ignore case when searching
set smartcase                       " be smart about ignoring case
nnoremap <leader><space> :nohlsearch<CR>
map <leader><c-space> ?

" Folding
set foldenable		                " enable folding
set foldlevelstart=10	            " open most folds by default
set foldnestmax=10	                " 10 nested fold max
nnoremap <space> za	                " space open closes folds
set foldmethod=indent	            " fold based on indent level

" Splitting
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Movement

" move vertiacally by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B 0
nnoremap E $

" fast tabs
nnoremap L gt
nnoremap H gT
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" faster page increments
nnoremap U <c-u>
nnoremap D <c-d>

" highlight last inserted text
nnoremap gV `[v`]

"Leader Shortcuts
let mapleader=","
nnoremap ; :
inoremap jk <esc>

" Plugins
if &compatible
  set nocompatible
endif

set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'toyamarinyon/vim-swift'

call neobundle#end()

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Let vundle manage vundle
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" All of your plugins must be added before following line
call vundle#end()
filetype plugin on
filetype plugin indent on

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', 'pkg']

" CtrlP
let g:ctrlp_map='T'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-jsx
let g:jsx_ext_required = 0
