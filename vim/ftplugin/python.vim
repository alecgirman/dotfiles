setl foldmethod=indent

" Automatically format python files with black on save
" autocmd BufWritePre *.py execute ':Black'

augroup custom_python
    autocmd!
    autocmd BufWritePre *.py execute ':call BlackFormat()'
augroup end
