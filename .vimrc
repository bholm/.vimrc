set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'vim-airline/vim-airline' 	" Status bar at bottom
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree' 		" File manager
Plugin 'dsolstad/vim-wombat256i' 	" Color scheme
Plugin 'jiangmiao/auto-pairs' 		" Auto closes brackets, etc
Plugin 'vim-syntastic/syntastic'	" Syntax checking
" Plugin 'tpope/vim-fugitive' 		" Git integration
Plugin 'airblade/vim-gitgutter' 	" Git integration
Plugin 'vim-scripts/tComment' 		" Comment easliy with gcc
Plugin 'tpope/vim-repeat' 		" allow plugins to use . command
Plugin 'kien/ctrlp.vim' 		" fuzzy file search with ctrl + p
Plugin 'tpope/vim-surround' 		" add quotes or brackets easily
Plugin 'vim-scripts/YankRing.vim'
Plugin 'qpkorr/vim-renamer'
Plugin 'terryma/vim-multiple-cursors'	" Atom/Sublime like multi cursor editing
Plugin '907th/vim-auto-save'		" Vim auto save
Plugin 'lervag/vimtex'			" LaTeX plug in
"Plugin 'Valloric/YouCompleteMe' 	" Completion
"Plugin 'ervandew/supertab' 		" Tab completion

"To install plugins, in Vim, run :PluginInstall

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Color Scheme
colorscheme wombat256i

" Settings
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
set backupdir=/private/tmp
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set number              " shows line numbers
set cursorline 		" higlights the line the cursor is on
set autoindent 		" always set autoindenting on
let mapleader="," 	" sets leader key to ,

" Relative Numbering when in normal mode
set rnu
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

 " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Airline Setup
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'
let g:airline_skip_empty_sections = 1

" NERDTree Setup
map <C-a> :NERDTreeToggle<CR>

" Shortcut for window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" vimtex setup
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


" spell check
" setlocal spell
" set spelllang=en
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
set tabstop=4
set shiftwidth=4
set expandtab
