setl foldmethod=indent

" Automatically format python files with black on save
" autocmd BufWritePre *.py execute ':Black'

autocmd BufWritePre *.py execute ':call BlackFormat()'
