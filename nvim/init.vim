"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" wonderful life
set nocompatible

" allow backspacing in insert mode
set backspace=indent,eol,start

" enable syntax processing
syntax enable

" set UTF-8 encoding
scriptencoding utf-8
set encoding=utf-8
set fileformat=unix
set fileencoding=utf-8

" do not redraw while running macros (faster)
set lazyredraw

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
" and use <Tab> to complete the option
set wildmode=list:longest,full

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

" enable modeline
set modeline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" simplify windows navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" simplify split window
nnoremap <C-_> :split<CR>
nnoremap <C-\> <C-W><C-V>

" ,r to reload .vimrc
nnoremap <Leader>r :source $MYVIMRC<CR>

" ,z to close Preview Window
nnoremap <Leader>z <C-W><C-z>

" ESC to exit terminal mode
tnoremap <Esc> <C-\><C-n>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" difference settings for difference filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" the autocmd feature is optional if you want to compile your own vim.
" anyway, this condition does not hurt.
if has("autocmd")

  " allow different settings for different filetypes
  filetype plugin indent on

  " setting for c type files
  autocmd Filetype c setlocal
    \ expandtab
    \ cindent
    \ nolist
    \ tabstop=4 shiftwidth=4 softtabstop=4

  " in makefile, don't expand tabs to spaces, since actual tab char are needed
  autocmd BufRead,BufNewFile *Makefile* setlocal filetype=make
  autocmd Filetype make setlocal
    \ noexpandtab
    \ nolist
    \ tabstop=4 shiftwidth=4 softtabstop=4

  " setting for shell script
  autocmd Filetype sh setlocal
    \ expandtab
    \ tabstop=2 shiftwidth=2 softtabstop=2

  " setting for golang
  autocmd Filetype go setlocal
    \ expandtab
    \ cindent
    \ nolist
    \ tabstop=4 shiftwidth=4 softtabstop=4
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin management by junegunn/vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" unite and create user interface
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" show differences with style
Plug 'mhinz/vim-signify'

" syntax checking
Plug 'scrooloose/syntastic'

" color palette
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" explore filesystem and open file/dir
Plug 'scrooloose/nerdtree'

" align text
Plug 'junegunn/vim-easy-align'

" vim-go~~~~
Plug 'fatih/vim-go'

" delve vs gdb and ....
Plug 'sebdah/vim-delve'

" auto neocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" powerful text search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" tagbar
Plug 'majutsushi/tagbar'

call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color palette
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline/vim-airline-themes
let g:airline_theme='base16'

" altercation/vim-color-solarized
" dark background
set background=dark

" enable solarized scheme
" use silent to ignore error when install plugins by command line
silent! colorscheme solarized

" use transparent background of the terminal emulator
let g:solarized_termtrans=1

" use 256 color for solarized palette
let g:solarized_termcolors = 256

" enable 256 color
set t_Co=256

" show 80th column to indicate the boundary
set colorcolumn=80



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrooloose/syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enrich statusline to show warningmsg
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrooloose/nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ,t to open NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ,a to start interactive EasyAlign in visual mode
xmap <Leader>a <Plug>(EasyAlign)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shougo/unite.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ,e to select one opened buffer
nnoremap <leader>e :<C-u>Unite  buffer<CR>

" default use grep to search if there is no ag command
if executable('ag')
  " set ag to search
  let g:unite_source_grep_command = 'ag'

  " setup ag search options
  let g:unite_source_grep_default_opts = '--nocolor --nogroup'

  " set grep recursive option to empty
  let g:unite_source_grep_recursive_opt = ''
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shougo/deoplete.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fatih/vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlight for golang's functions/methods/structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" goimports organizes package by group
let g:go_fmt_command = "goimports"

" disable :GoFmt when save
let g:go_fmt_autosave = 0



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf in fullscreen
let g:fzf_layout = {}

" text search with preview
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview('up:60%'), <bang>0)

" ,s to start global search
nnoremap <Leader>s :Ag! 

" files search with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('up:60%'), <bang>0)

" ,f to start files search
nnoremap <Leader>f :Files<CR>

" ,<tab> to show mapping keys in normal mode
nmap <leader><tab> <plug>(fzf-maps-n)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" majutsushi/tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar for golang. Before use this, we need to install gotags
" go get -u github.com/jstemmer/gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
