let mapleader=" "

if !has('gui_running')
  set t_Co=256
endif

" set lines=35 columns=150
set colorcolumn=81
set encoding=UTF-8

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

source ~/.vim/fzf_settings.vim

set pastetoggle=<F2>

nmap <Leader>w :w<CR>

set background=dark
colorscheme PaperColor

" remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" cancel search with Esc
nnoremap <silent> <leader>q :nohl<CR><ESC>

" NERDTree
let g:NERDTreeWinSize=50
map <Leader>' :NERDTreeFind<CR>
map <Leader># :NERDTreeToggle<CR>
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

" RSpec.vim mappings
let g:rspec_command = "Dispatch rspec {spec}"
nmap <C-x><C-d> :call RunCurrentSpecFile()<CR>
nmap <C-x><C-s> :call RunNearestSpec()<CR>
nmap <C-x><C-l> :call RunLastSpec()<CR>
nmap <C-x><C-a> :call RunAllSpecs()<CR>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable folding
set foldmethod=indent
set foldlevel=99

" TSlime
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

let g:javascript_plugin_flow = 1

if has("autocmd")
    " If the filetype is Makefile then we need to use tabs
    " So do not expand tabs into space.
    autocmd FileType make set noexpandtab
    autocmd FileType make set tabstop=4
    augroup rubex
      au!
      autocmd BufNewFile,BufRead *.rubex set syntax=ruby
    augroup END
endif

" search visually selected text
vnoremap // y/<C-R>"<CR>
