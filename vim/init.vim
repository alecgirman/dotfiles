" Quick settings {{{1 "
set showmode		" Display the mode in the statusbar.
set showcmd			" Show visual selection dimensions
set showmatch		" Show matching pairs when your cursor is on one.
set hidden			" Allows modified buffers to be closed without losing their content.  Will prompt to save on exit.
set autowrite		" Automatically save ONLY when executing commands that involve processing that file (like :make)
set autoread		" Supposed to update the file when changed elsewhere but that doesn't seem to work.
set number			" Show line numbers
set relativenumber	" Line numbers are relative, except the current line (if number is set)
set laststatus=2	" Always show a status bar on each window.
set showtabline=2	" Always show the tab bar.  Alternatively, it can be set to 1 to only show when theres more than one tab.
set scrolloff=10	" A 'scroll padding', makes scrolling in vim feel a little more like other text edfitors and more natural.
set nowrap			" Disable text wrapping
set wildmode=full	" Neovim default, shows beautiful popup (when its not that ugly magenta one)
set modeline 		" Evaluate modelines, allowing you to set per-file vim options from within the file itself.
set swapfile		" Enable swap files
set dir=~/tmp       " ...but keep them in /tmp
set cursorline      " Change the background style of the current line

" search settings
set ignorecase      " Ignore case in search and seek commands
set smartcase       " ...but not in motions or other commands (:g, :v, :s, etc)
set hlsearch        " Highlight search matches
set incsearch       " Highlight and move to search results as you're typing

set mouse=a             " Enable full mouse support
set mousemodel=popup  " Define the mouse model

if has ('nvim')		" only works in vim
	set icm=nosplit     " Perform searches and highlight substitutions as you're typing substitution commands 
else
    set ttymouse=sgr      " Set terminal mouse input mode
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
set foldmethod=marker           " Use markers for better folds - can be added with fold and foldc snippet

filetype plugin indent on
syntax on
" 1}}} "

" Keybinds {{{1 "

" Quick insert mode escape
inoremap jj <Esc>l

" Full page scrolling
noremap J <C-d>
noremap K <C-u>

" Easy quit
noremap Q :q!<CR>
" Turn off search mode highlighting
noremap H :noh<CR>

" Start tabular
noremap <Space><Tab> :Tabular /


" Edit a file
noremap <Space>fe :e!<Space>
" Save the file
noremap <Space>fs :w!<CR>
" Edit this config file
noremap <Space>ve :e! ~/.config/nvim/init.vim<CR>
" Create a new tab
noremap <Space>tt :tabnew<CR>
" Go to next tab
noremap <Space>tn :tabnext<CR>
" Go to previous tab
noremap <Space>tp :tabprevious<CR>
" Close a tab
noremap <Space>tc :tabclose<CR>


" Open Tagbar
noremap <Space>tb :Tagbar<CR>
" Open NERDTree
noremap <Space>nt :NERDTreeToggle<CR>
" Open Undo tree
noremap <Space>ut :UndotreeToggle<CR>

" Run current file as python script
noremap <Space>pr :!python3<Space><C-r>%<CR>

" Open vim help (type help query)
noremap <Space>h :help<Space>
" Begin substitution
noremap <Space>s :s/

" Quickly exit terminal
tnoremap <Esc> <C-\><C-n>
" 1}}} "

" Plugins {{{1 "

" start plugins
call plug#begin()

" Massive syntax highlighting pack
Plug 'sheerun/vim-polyglot'
" File browser
Plug 'scrooloose/nerdtree'
" More input buffers
Plug 'shougo/unite.vim'
" HTML5 stuff
Plug 'othree/html5.vim'
" Git-like file history
Plug 'mbbill/undotree'
" Peek registers during paste or macro execution
Plug 'junegunn/vim-peekaboo'
" Emoji support for vim
Plug 'junegunn/vim-emoji'
" Quick UI for vim
Plug 'skywind3000/vim-quickui'
" Adds cool icons to NERDTree - Requires a Nerd Font, see below
Plug 'ryanoasis/vim-devicons'
" An amazing snippet engine
Plug 'SirVer/ultisnips'
" Library of snippets to use with UltiSnips
Plug 'honza/vim-snippets'
" A cool statusbar
Plug 'vim-airline/vim-airline'
" Themes for vim-airline
Plug 'vim-airline/vim-airline-themes'
" Ability to edit with multiple cursors
Plug 'terryma/vim-multiple-cursors'
" My favorite color scheme
Plug 'joshdick/onedark.vim'
" Features for programming in C/C++
Plug 'vim-scripts/c.vim'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Integration for tldr shell command (TLDR for man pages)
Plug 'wlemuel/vim-tldr'
" Display indent lines
Plug 'yggdroot/indentline'
" Features for editing CSV files
Plug 'chrisbra/csv.vim'
" Buffer finder
Plug 'kien/ctrlp.vim'
" Coloring for parenthesees and braces
Plug 'luochen1990/rainbow'
" Git integration
Plug 'tpope/vim-fugitive'
" Speedy HTML editing
Plug 'mattn/emmet-vim'
" Rust and Cargo integration
Plug 'rust-lang/rust.vim'
" Shows uncommitted changes
Plug 'airblade/vim-gitgutter'
" Automatically adds closing pairs
Plug 'jiangmiao/auto-pairs'
" Javascript completer
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'  }
" Adjusts editor settings to match .editorconfig file
Plug 'editorconfig/editorconfig-vim'
" Asynchronous Lint Engine
Plug 'w0rp/ale'
" Syntax checking
Plug 'scrooloose/syntastic'
" Extra functions for vim
Plug 'xolox/vim-misc'
" Sensible dotfile settings
Plug 'tpope/vim-sensible'
" Improved markdown editing
Plug 'plasticboy/vim-markdown'
" Easy whitespace formatting 
Plug 'godlygeek/tabular'
" Comment and uncomment code
Plug 'tpope/vim-commentary'
" Add, change, or delete surrounding pairs
Plug 'tpope/vim-surround'
" Easily jump around files
Plug 'easymotion/vim-easymotion'
" Commander of Completion - Best completion plugin
Plug 'neoclide/coc.nvim'
" Menu that shows variables, functions, and classes in current file
Plug 'majutsushi/tagbar'
" Highlights the word under the cursor
Plug 'RRethy/vim-illuminate'
" Improved JS support
Plug 'pangloss/vim-javascript'
" Text exchange operator
Plug 'tommcdo/vim-exchange'

" NERD FONT INFO:
" --------------------------------------------------
" Nerd Fonts add cool icons into your font by replacing unused Unicode
" characters.  Fonts can be directly downloaded from their Github page.
"
" To insert a symbol, find the hex code from the website and do
" <C-v>u followed by the four digit hex code while in insert mode in vim.
"
" 爵 https://www.nerdfonts.com/ 
"   https://github.com/ryanoasis/nerd-fonts
" Current font: Fira Code Retina Complete Nerd Font
" --------------------------------------------------

" Unneeded in neovim
" Plug 'osyo-manga/vim-over'

"" 1}}} "

" Plugin config {{{1 "

" Enable tern completer for javascript
autocmd FileType javascript setlocal omnifunc=tern#Complete

" UltiSnips configuration
"
" Snippets must be triggered with <C-j>
" let g:UltiSnipsExpandTrigger="tab"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical""

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Enable Nerd Fonts in airline
let g:airline_powerline_fonts = 1

" indentline overrides conceallevel and concealcursor settings so this must be set here

" Disable concealed text while in insert mode - useful for markdown
let g:indentLine_concealcursor = 'nc'
" Makes concealed text not block cursor movement
let g:indentLine_conceallevel = 1

" Finish plugin loading
call plug#end()
so %
PlugInstall

" Set color scheme to One Dark
colo onedark

" Configure rainbow
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
let g:rainbow_active=1

" 1}}} "
