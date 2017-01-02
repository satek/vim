filetype plugin on

let mapleader=" "

colorscheme Tomorrow-Night

if !has('gui_running')
  set t_Co=256
endif

" set lines=35 columns=150
set colorcolumn=81

filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hlsearch
set showmatch
set hidden
set history=100

" remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" cancel search with Esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

call plug#begin()
Plug 'wincent/command-t'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
call plug#end()

" Command-T
noremap <Leader>r :CommandTFlush<CR>
"
" NERDTree
map <Leader>p :NERDTreeFind<CR>
map <C-p> :NERDTreeToggle<CR>
" open NerdTree on startup if no files were selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close if only NerdTree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
" lightline
set laststatus=2
"
" NERDCommenter
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"
