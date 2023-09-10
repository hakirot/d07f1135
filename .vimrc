" hakirot Vim Config File

set nocompatible	
syntax enable
filetype plugin on
filetype off
filetype plugin indent on

call plug#begin()

" https://github.com/rstacruz/sparkup
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" lightline status bar
Plug 'itchyny/lightline.vim'

" Yes.
"Plug 'morhetz/gruvbox'

Plug 'jelera/vim-javascript-syntax'

" Helpful, fast
Plug 'ap/vim-css-color'

" vim surround tool, instructions in vim notes
Plug 'tpope/vim-surround'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'


call plug#end()

" Colorschemes

" TRUE COLOR - Must come before vim highlights
"set termguicolors

set background=dark
" colorscheme everforest

" Error Fix: no language syntax when inside tmux
" https://vi.stackexchange.com/questions/10708/no-syntax-highlighting-in-tmux
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Change tab bar colors

" fg=inactiveTabText
" INACTIVE 
highlight TabLine ctermfg=green ctermbg=black guifg=#e67e80 guibg=#2d353b
" null / main bar background
highlight TabLineFill ctermfg=black ctermbg=black guifg=#ffffff guibg=#2d353b
" ACTIVE tab color / text
highlight TabLineSel ctermfg=black ctermbg=green guifg=#2d353b guibg=#e67e80

" Lightline
set laststatus=2

" Change the highlight search colors
highlight Search ctermfg=black guifg=#d3c6aa
highlight Search ctermbg=cyan guibg=#543a48
highlight IncSearch ctermfg=red guifg=#2d353b
highlight IncSearch ctermbg=grey guibg=#e67e80

" color column
set colorcolumn=110
highlight ColorColumn ctermbg=black guibg=#343f44

set number
"set relativenumber
set nowrap
set scrolloff=5
set pastetoggle=<F2>

set tabstop=2
set softtabstop=2
set smartcase
set smartindent
set shiftwidth=2
set expandtab
set ignorecase
"
" Force backspace to behave like most programs, currently commented out to use
"   vim as a more editor style, pressing less buttons.
" set backspace=indent,eol,start
set autoindent

" Apparently not default
set incsearch
set hls
"
" Commonly referenced useful setting that needs research for using files
set path +=.,**
set wildmenu

" Auto-Bracket via remap function
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Please no
set belloff=all

" Simple bug resolve keeps vim from starting in REPLACE mode
"set t_u7=

" Stop typing 'tabnew' because annoying
ca tn tabnew
" .. same for 'Files' for fzf
ca fl Files
"  and yeah
ca vimrc $MYVIMRC
" move tabs
ca tm tabmove

" Keep temp files in temporary folder
set backupdir=~/.tmp/
set directory=~/.tmp/
set undodir=~/.tmp/

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
au BufNewFile,BufRead *.ejs set filetype=html
nnoremap <leader><leader> :Ex<CR>

" - - - - - - - - - SNIPPITS - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" extract C code skeleton for speedier writes
"nnoremap <leader>initc :-1read /home/hakirot/Documents/snippits/initc.c<Enter>ggA
"nnoremap <leader>usage :-1read /home/hakirot/Documents/snippits/usage.c<Enter>jf[l
"nnoremap <leader>html :-1read /home/hakirot/Documents/snippits/skeleton.html<Enter>4jf>a
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! NetrwOpenMultiTab(current_line,...) range
    " Get the number of lines
    let n_lines = a:lastline - a:firstline + 1

    " This is the command to be built up
    let command = "normal "

    " Iterator
    let i = 1

    " Virtually iterate over each line and build the command
    while i < n_lines
        let command .= "tgT:" . ( a:firstline + i ) . "\<CR>:+tabmove\<CR>"
        let i += 1
    endwhile
    let command .= "tgT"

    " Restore the Explore tab position
    if i != 1
        let command .= ":tabmove -" . ( n_lines - 1 ) . "\<CR>"
    endif

    " Restore the previous cursor line
    let command .= ":" . a:current_line . "\<CR>"

    " Check function arguments
    if a:0 > 0
        if a:1 > 0 ** a:1 <= n_lines
            " The current tab is for the nth file
            let command .= ( tabpagenr() + a:1 ) . "gt"
        else
            " The current tab is for the last selected file
            let command .= (tabpagenr() + n_lines) . "gt"
        endif
    endif
    " The current tab is for the Explore tab by default

    " Execute the custom command
    execute command
endfunction

" Define mappings
augroup NetrwOpenMultiTabGroup
    autocmd!
    autocmd Filetype netrw vnoremap <buffer> <silent> <expr> t ":call NetrwOpenMultiTab(" . line(".") . "," . "v:count)\<CR>"
    autocmd Filetype netrw vnoremap <buffer> <silent> <expr> T ":call NetrwOpenMultiTab(" . line(".") . "," . (( v:count == 0) ? '' : v:count) . ")\<CR>"
augroup end
