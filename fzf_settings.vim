" Requires The Silver Searcher, to install `apt-get install silversearcher-ag`

" Mapping selecting mappings
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>s :Ag<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
