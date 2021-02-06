set foldmethod=indent

" Automatically format python files with black on save
" autocmd BufWritePre *.py execute ':Black'

func! BlackFormat()
    silent! execute "!black " . bufname('%')
    edit!
endf

autocmd BufWritePre *.py execute ':call BlackFormat()'
