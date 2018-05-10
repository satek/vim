filetype plugin on

let mapleader=" "

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

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'ecomba/vim-ruby-refactoring'
" Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jgdavey/tslime.vim'
Plug 'rhysd/vim-crystal'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'klen/python-mode'
Plug 'integralist/vim-mypy'
Plug 'plytophogy/vim-virtualenv'
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'
" Plug 'w0rp/ale'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

set background=dark
colorscheme PaperColor

" ale
" packloadall
" silent! helptags ALL

set runtimepath^=~/.vim/bundle/ctrlp.vim

" remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" cancel search with Esc
nnoremap <silent> <leader>q :nohl<CR><ESC>

" NERDTree
map <Leader>p :NERDTreeFind<CR>
map <Leader>o :NERDTreeToggle<CR>
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
" RSpec.vim mappings
let g:rspec_command = "Dispatch rspec {spec}"
map <Leader>d :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>"
"
" NeoComplete
" Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
    " \ 'default' : '',
    " \ 'vimshell' : $HOME.'/.vimshell_hist',
    " \ 'scheme' : $HOME.'/.gosh_completions'
        " \ }

" Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
    " let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
  " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
" NeoSnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0


if has("autocmd")
    " If the filetype is Makefile then we need to use tabs
    " So do not expand tabs into space.
    autocmd FileType make set noexpandtab
    autocmd FileType make set tabstop=4
endif
