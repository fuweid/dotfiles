""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" wonderful life
set nocompatible

" allow backspacing in insert mode
set backspace=indent,eol,start

" enable syntax processing
syntax enable

" allow different settings for different filetypes
filetype plugin indent on

" set UTF-8 encoding
scriptencoding utf-8
set encoding=utf-8
set fileformat=unix
set fileencoding=utf-8

" show the line and column number of the cursor position
set ruler

" show the line number
set number

" always show the statusline
set laststatus=2

" show (partial) command in the last line of the screen
set showcmd

" enhance command-line completion operate
set wildmenu

" list all matches and complete till longest common string
set wildmode=list:longest

" keep minimal five lines visible below the cursor
set scrolloff=5

" show invisible characters
set list listchars=tab:»▸,trail:·,nbsp:·",eol:¬

" never create .swapfile
set noswapfile

" highlight the search result
set hlsearch

" hightlight the pattern when typing
set incsearch

" default indent settings
set autoindent expandtab tabstop=2 shiftwidth=2 softtabstop=2

" display a line at the edge of testwidth
set textwidth=80
set colorcolumn=-1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" change mapleader key to ,
let mapleader=','

" hard mode
noremap  <Left>  <NOP>
inoremap <Left>  <NOP>
noremap  <Right> <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
inoremap <Up>    <NOP>
noremap  <Down>  <NOP>
inoremap <Down>  <NOP>

" jj to exit insert mode
inoremap jj <ESC>

" ,d to stop the highlighting for the 'hlsearch' option
nnoremap <Leader>d :nohlsearch<CR>

" ,, to switch to last edit buffer
nnoremap <Leader><Leader> <C-^>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" difference settings for difference filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")

  " setting for c type files
  autocmd filetype c setlocal noexpandtab cindent nolist
    \ tabstop=4 shiftwidth=4 softtabstop=4

endif
