" /hakirot .vimrc

" Custom Config File for the only editor I ever learned.
"
" This Config file is copied straight from the Windows-side of this machine,
" no notes included for settings imported outside WSL.

set nocompatible	
syntax enable
filetype plugin on
filetype off
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Custom colorscheme currently not in use
Plugin 'lifepillar/vim-solarized8'

Plugin 'tpope/vim-fugitive'

Plugin 'git://git.wincent.com/command-t.git'

Plugin 'file:///home/gmarik/path/to/plugin'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'rust-lang/rust.vim'

"Currently used awesome colorscheme
Plugin 'morhetz/gruvbox'

call vundle#end()

" Colorschemes

" gruvbox init
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" ---- end colorschemes

set colorcolumn=110
highlight ColorColumn ctermbg=black

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

" This resolves the error causing vim to start in REPLACE mode 
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

" - - - - - - - - - SNIPPITS - - - - - - - - - 
" extract C code skeleton for speedier writes
nnoremap ,initc :-1read /home/hakirot/Documents/snippits/initc.c<Enter>ggA
nnoremap ,usage :-1read /home/hakirot/Documents/snippits/usage.c<Enter>jf[l
