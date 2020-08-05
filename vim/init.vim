" Quick settings {{{1 "
set showmode		" Display the mode in the statusbar.  I don't know why you'd have this off.
set showcmd			" Has nothing to do with showing the comand, but shows the visual selection dimensions.
set showmatch		" Show matching pairs when your cursor is on one.
set hidden			" Allows modified buffers to be closed without losing their content.  Will prompt to save on exit.
set autowrite		" Automatically save ONLY when executing commands that involve processing that file (like :make)
set autoread		" Supposed to update the file when changed elsewhere but that doesnt seem to work.
set number			" When this comes before relativenumber, all line numbers are relative excxept the current line.
set relativenumber	" lines are numbered based on their distance from the cursor.
set laststatus=2	" Always show a status bar on each window.
set showtabline=2	" Always show the tab bar.  Alternatively, it can be set to 1 to only show when theres more than one tab.
set scrolloff=10	" A 'scroll padding', makes scrolling in vim feel a little more like other text edfitors and more natural.
set nowrap			" Disable text wrapping, even when it heavily limits your view.  I just hate line wrapping anywhere
" set completeopt=longest,menuone,preview
" set wildmode=list:longest
set wildmode=full	" Neovim default, shows beautiful popup (when its not that ugly magenta one)
set modeline 		" Evaluate modelines, allowing you to set per-file vim options from within the file itself.
set swapfile		" Forces files to exist only in memory and not to be cached to disk.  For me, when set to 'swapfile', trying to openA
set dir=~/tmp       " Sets the directory for the swap files.
set cursorline
" any file results in it warning me about an existing swap file which is annoying as shit.

" search settings
set ignorecase      " Ignore case in search and seek commands
set smartcase       " ...but only in search commands
set incsearch       " Perform searches and highlight matches as you're typing your search
set hlsearch        " Highlight search matches

set mouse=a             " Enable full mouse support
set mousemodel=popup  " Define the mouse model

if has ('nvim')		" only works in vim
	set icm=nosplit     " Perform searches and highlight substitutions as you're typing substitution commands 
else
    set ttymouse=sgr      " Set terminal mouse input mode
    " call setenv('VIMRUNTIME', '/usr/share/vim/vim82')
    syntax on
endif

" Editor tab settings
set tabstop=4           " This should always be 8.  To change the number of spaces for each tab, use softtabstop
set shiftwidth=4        " The number of spaces that any shift operators push you by.  Should be set to your softabstop unless you have any other reason to do so.
set autoindent          " Automatically indent on new line, a standard feature in basically every text editor
set expandtab           " Expand tabs to spaces 
set smarttab            " When on, tabs per spaces is defined by shiftwidth.  Otherwise, it uses (soft)tabstop.  Its confusing so I might be wrong.

" color settings
if exists('+termguicolors')
  set termguicolors
endif

" Misc settings
set wildmenu			" Show popup menu for autocompletions
set history=10000		" Amount of history to save.  
set undofile			" Store undo history in a file 

" in neovim this would be set shada but its
" backwards compatible with set viminfo
set viminfo='1000,<500,s100   
set timeoutlen=300              " shorten the key timeout from the default of 500ms

" set diffopt=                    " clear diff settings
set diffopt+=iwhite,iblank      " ignore whitespace and blank lines when evaluating diff
set foldmethod=marker

filetype plugin indent on
syntax on
" 1}}} "

" Keybinds {{{1 "
inoremap jj <Esc>
noremap J <C-d>
noremap K <C-u>
noremap Q :q!<CR>

noremap H :noh<CR>

noremap <Space><Tab> :Tabular /
noremap <Space>ve :e! ~/.config/nvim/init.vim<CR>
noremap <Space>vr :so %<CR>

noremap <Space>fe :e!<Space>
noremap <Space>fs :w!<CR>
noremap <Space>fc :c!<CR>

noremap <Space>tt :tabnew<CR>
noremap <Space>tn :tabnext<CR>
noremap <Space>tp :tabprevious<CR>
noremap <Space>tc :tabclose<CR>

noremap <Space>tb :Tagbar<CR>
noremap <Space>nt :NERDTreeToggle<CR>

noremap <Space>pr :!python3<Space><C-r>%<CR>

noremap <Space>h :help<Space>
noremap <Space>s :s/

tnoremap <Esc> <C-\><C-n>
" 1}}} "

" Plugins {{{1 "
" start plugins
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'shougo/unite.vim'
Plug 'othree/html5.vim'
Plug 'mbbill/undotree'
Plug 'osyo-manga/vim-over'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-emoji'
Plug 'liuchengxu/vim-which-key'
Plug 'skywind3000/vim-quickui'
Plug 'ryanoasis/vim-devicons'
" Plug 'davidhalter/jedi-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'joshdick/onedark.vim'
Plug 'vim-scripts/c.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'wlemuel/vim-tldr'
Plug 'yggdroot/indentline'
Plug 'chrisbra/csv.vim'
Plug 'kien/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'rust-lang/rust.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'  }
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-sensible'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'sillybun/vim-repl'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim'
Plug 'majutsushi/tagbar'
" 1}}} "

" Plugin config {{{1 "
autocmd FileType javascript setlocal omnifunc=tern#Complete

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical""

let g:airline_powerline_fonts = 1

call plug#end()
so %
PlugInstall

colo onedark

let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
let g:rainbow_active=1
" 1}}} "

" Startup stuff {{{1 "

" nnoremap i :call DoStartup()<CR>
" fun! DoStartup()
"     quit
"     NERDTreeToggle
"     Tagbar
"     exe "normal! \<C-w>l"
"     65sp
"     exe "normal! \<C-w>j"
"     term
"     exe "normal! \<C-w>k"
"     nunmap i
" endf

" 1}}} "

" Python stuff {{{1 "

" 1}}} "
