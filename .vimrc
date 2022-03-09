" hakirot .vimrc
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

" Helpful, fast
Plugin 'ap/vim-css-color'

" vim surround tool, instructions in vim notes
Plugin 'tpope/vim-surround'

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

" fg=inactiveTabText  bg=
highlight TabLine ctermfg=none ctermbg=none guifg=#689d6a guibg=#1d2021
highlight TabLineFill ctermfg=none ctermbg=none guifg=#1d2021 guibg=#1d2021
" fg=activeTabText  bg=
highlight TabLineSel ctermfg=none ctermbg=none guifg=#1d2021 guibg=#689d6a 
"
" Change the highlight search colors
highlight Search ctermfg=magenta guifg=#8a1712
highlight Search ctermbg=grey guibg=#ebdbb2
highlight IncSearch ctermfg=red guifg=#8a1712
highlight IncSearch ctermbg=grey guibg=#ebdbb2

" color column
set colorcolumn=110
highlight ColorColumn ctermbg=black guibg=#282828

set number
set relativenumber
set nowrap
set pastetoggle=<F2>

set tabstop=4
set softtabstop=4
set smartcase
set smartindent
set shiftwidth=4
set expandtab

" Auto-Bracket via remap function
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Please no
set belloff=all

" Commonly referenced useful setting that needs research for using files
set path +=.,**
set wildmenu

" Simple bug resolve keeps vim from starting in REPLACE mode
set t_u7=

" Force backspace to behave like most programs, currently commented out to use
"   vim as a more editor style, pressing less buttons.
" set backspace=indent,eol,start
set autoindent

" Apparently not default
set incsearch
set hls

" Stop typing 'tabnew' because it is annoying
ca tn tabnew

" Keep temp files in temporary folder
set backupdir=~/temp/
set directory=~/temp/
set undodir=~/temp/

" Line format helpers
nnoremap ,f 0111lbi<Enter><esc>$i
nnoremap ,d 0i<BS><Space><esc>dwi<Space><esc>$

" EJS macros: Insert
nnoremap ,ejs% 0I<%<esc>A<Space>%><esc>0j
nnoremap ,ejs= a<%=<Space>%><esc>bhi<Space>

" Comment and uncomment; Javascript 
let @c="0i//\<esc>j"
let @u="0xx\<esc>j"
let @v="i/*\<esc>}i*/\<esc>"

" Anything yanked goes into the windows clipboard :D
autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif

" Enable Sparkup in .ejs files
au BufNewFile,BufRead *.ejs set filetype=html

" - - - - - - - - - SNIPPITS - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" extract C code skeleton for speedier writes
nnoremap ,initc :-1read /home/hakirot/Documents/snippits/initc.c<Enter>ggA
nnoremap ,usage :-1read /home/hakirot/Documents/snippits/usage.c<Enter>jf[l
nnoremap ,html :-1read /home/hakirot/Documents/snippits/skeleton.html<Enter>4jf>a
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
