" ------------------------------------------------------------------------
" file:     ~/.vimrc
" author:  serdotlinecho
" vim:fenc=utf-8:ai:si:et:ts=4:sw=4:fdm=marker:fdn=1:ft=vim:
" ------------------------------------------------------------------------

" ----- general {{{
set nocompatible            " we're running Vim, not Vi!
filetype plugin indent on   " filetype detection and settings
set encoding=utf-8          " we like utf-8
set ff=unix                 " file format - dos, unix or mac
set ffs=unix,dos,mac        " file formats to look for

" }}}
" ----- vundle {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle "garbas/vim-snipmate"
Bundle 'tomtom/tcomment_vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "mbbill/undotree"
Bundle 'flazz/vim-colorschemes'

" }}}
" ----- highlighting {{{
if $DISPLAY =~ ":"
  set t_Co=256
endif
syntax on
set background=dark
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" }}}
" ----- vim behaviour {{{
set wildmenu            " enhanced tab-completion shows all matching cmds in a popup menu
set cursorline          " highlight current line
set norelativenumber    " show no relative line numbers
set nobackup            " disable backup files (filename~)
set noswapfile          " do not write annoying intermediate swap files
set laststatus=2        " always show the status line

" }}}
" ----- editing behaviour {{{
set tabstop=4           " tabs appear as n number of columns
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " n cols for auto-indenting
set expandtab           " insert spaces instead of tabs
set autoindent          " auto indents next new line
set backspace=2         " full backspacing capabilities (indent,eol,start)
set ruler               " show line and column number
set linebreak           " attempt to wrap lines cleanly
set cpoptions=ces$      " `cw` put dollar sign at the end

" }}}
" ----- search {{{
set hlsearch            " highlight all search results
set incsearch           " show match for partly typed search command
set ignorecase          " case-insensitive search
set smartcase           " override 'ignorecase' when pattern has upper case characters

" }}}
" ----- custom mapping and command {{{
" change map <leader> from \ to ,
let mapleader = ","

" reload .vimrc
map <silent> <leader>v :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'Source completed!'"<CR>

" allows writing to files with root priviledges
" command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
cmap w!! w !sudo tee % > /dev/null

" copy to X clipboard
" cmap cc w !xsel -ib > /dev/null
" copy and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" toggle line numbers
nnoremap <leader>n :set invnu<CR>

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" useful mappings for managing tabs
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

" disable arrow keys on normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" easier split window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ROT13
map <F12> ggVGg?

" Undotree
nmap <leader>u :UndotreeToggle <CR>

" NERDtree
nmap <leader>d :NERDTreeToggle <CR>
nmap <leader>nf :NERDTreeFind <CR>

" trailing whitespace detection
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>


" }}}
" ----- settings for plugins {{{
" vim-airline settings
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '^V' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '^S' : 'S',
      \ }

" }}}
