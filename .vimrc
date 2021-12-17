" /hakirot .vimrc
" Custom Config File for the only editor I ever really wanted to learn.

set nocompatible	
syntax enable
filetype plugin on
filetype off
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

":Git {git commands}    git log looks great in here
Plugin 'tpope/vim-fugitive'

" Fuzzy file explorer: \t   C-n / C-p   C-t or C-c
Plugin 'git://git.wincent.com/command-t.git'

" https://github.com/rstacruz/sparkup
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Yes.
Plugin 'morhetz/gruvbox'

" Not feeling it
"Plugin 'vim-airline/vim-airline'

call vundle#end()

" Colorschemes

" TRUE COLOR - Must come before vim highlights
set termguicolors
" Error Fix: no language syntax when inside tmux
" https://vi.stackexchange.com/questions/10708/no-syntax-highlighting-in-tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Terminal/Tmux/Vim all gruvbox
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

" Change tab bar colors
highlight TabLineFill ctermfg=none ctermbg=none guifg=#d79921 guibg=#1d2021
highlight TabLine ctermfg=none ctermbg=none guifg=#458588 guibg=#1d2021
highlight TabLineSel ctermfg=none ctermbg=none guifg=#1d2021 guibg=#458588

" Change the highlight search colors
highlight Search ctermfg=magenta guifg=#3c3836
highlight Search ctermbg=grey guibg=#d79921
highlight IncSearch ctermfg=red guifg=#9d0006
highlight IncSearch ctermbg=grey guibg=#ebdbb2

" color column
set colorcolumn=110
highlight ColorColumn ctermbg=black guibg=#282828

set number
set relativenumber

set tabstop=4
set softtabstop=4
set smartcase
set smartindent
set shiftwidth=4
set expandtab

inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

"Operate in silence
set belloff=all

" Commonly referenced useful setting that needs research for using files
set path +=.,**
set wildmenu

" Simple bug resolve keeps vim from starting in REPLACE mode
set t_u7=

" Force backspace to behave like most programs, currently commented out to use
" vim as a more editor style, pressing less buttons.
" set backspace=indent,eol,start

set autoindent

" Apparently not default
set incsearch
set hls


" Move all temporary files to temporary folder
set backupdir=~/temp/
set directory=~/temp/
set undodir=~/temp/

" Line format helpers
nnoremap ,f 0111lbi<Enter><esc>$
nnoremap ,d 0i<BS><Space><esc> 
nnoremap ,% 0I<%<esc>A<Space>%><esc>0j

" Anything yanked goes into the windows clipboard :D
autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif

" Enable sparkup in .ejs files
au BufNewFile,BufRead *.ejs set filetype=html

" - - - - - - - - - SNIPPITS - - - - - - - - - 
" extract C code skeleton for speedier writes
nnoremap ,initc :-1read /home/hakirot/Documents/snippits/initc.c<Enter>ggA
nnoremap ,usage :-1read /home/hakirot/Documents/snippits/usage.c<Enter>jf[l
nnoremap ,html :-1read /home/hakirot/Documents/snippits/skeleton.html<Enter>4jf>a
