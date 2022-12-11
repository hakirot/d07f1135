" hakirot Vim Config File
" Custom Config File for the only editor I ever really wanted to learn.

set nocompatible	
syntax enable
filetype plugin on
filetype off
filetype plugin indent on

call plug#begin()

" https://github.com/rstacruz/sparkup
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" Yes.
"Plug 'morhetz/gruvbox'

" Helpful, fast
Plug 'ap/vim-css-color'

" vim surround tool, instructions in vim notes
Plug 'tpope/vim-surround'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

call plug#end()

" Colorschemes

" TRUE COLOR - Must come before vim highlights
set termguicolors

set background=dark
colorscheme everforest

" Error Fix: no language syntax when inside tmux
" https://vi.stackexchange.com/questions/10708/no-syntax-highlighting-in-tmux
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Change tab bar colors

" fg=inactiveTabText
" INACTIVE 
highlight TabLine ctermfg=none ctermbg=none guifg=#e67e80 guibg=#2d353b
" null / main bar background
highlight TabLineFill ctermfg=none ctermbg=none guifg=#ffffff guibg=#2d353b
" SELECTED tab color / text
highlight TabLineSel ctermfg=none ctermbg=none guifg=#2d353b guibg=#e67e80
"
" Change the highlight search colors
highlight Search ctermfg=magenta guifg=#d3c6aa
highlight Search ctermbg=grey guibg=#543a48
highlight IncSearch ctermfg=red guifg=#2d353b
highlight IncSearch ctermbg=grey guibg=#e67e80

" color column
set colorcolumn=110
highlight ColorColumn ctermbg=black guibg=#343f44

set number
set relativenumber
set nowrap
set scrolloff=5
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
"set t_u7=

" Force backspace to behave like most programs, currently commented out to use
"   vim as a more editor style, pressing less buttons.
" set backspace=indent,eol,start
set autoindent

" Apparently not default
set incsearch
set hls

" Stop typing 'tabnew' because annoying
ca tn tabnew
" .. same for 'Files' for fzf
ca fl Files
"  and yeah
ca vimrc $MYVIMRC
" move tabs
ca tm tabmove

" Keep temp files in temporary folder
set backupdir=~/temp/
set directory=~/temp/
set undodir=~/temp/

" <Space> for custom commands
let mapleader = " "

" Line format helpers
" nnoremap <leader>f 0111lbi<Enter><esc>$i
" nnoremap <leader>d 0i<BS><Space><esc>dwi<Space><esc>$

" EJS macros: Insert
"nnoremap <leader>ejs% 0I<%<esc>A<Space>%><esc>0j
"nnoremap <leader>ejs= a<%=<Space>%><esc>bhi<Space>

" Comment and uncomment; Javascript 
"let @c="0i//\<esc>j"
"let @u="0xx\<esc>j"
"let @v="i/*\<esc>}i*/\<esc>"

" Anything yanked goes into the windows clipboard :D
"autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif

" Enable Sparkup in .ejs files
"au BufNewFile,BufRead *.ejs set filetype=html


" - - - - - - - - - SNIPPITS - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" extract C code skeleton for speedier writes
"nnoremap <leader>initc :-1read /home/hakirot/Documents/snippits/initc.c<Enter>ggA
"nnoremap <leader>usage :-1read /home/hakirot/Documents/snippits/usage.c<Enter>jf[l
"nnoremap <leader>html :-1read /home/hakirot/Documents/snippits/skeleton.html<Enter>4jf>a
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
