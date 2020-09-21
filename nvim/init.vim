call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'brooth/far.vim'

call plug#end()

" setting up deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" setting up gruvbox
let g:gruvbox_italic     = 1
let g:gruvbox_bold       = 1

let g:gruvbox_contrast_dark = 'hard'

set cursorline
colorscheme gruvbox

" settings for vim
set ruler
set showmode
set showcmd
set number 

set tabstop=4 
set shiftwidth=4 
set softtabstop=4
set tw=80

set expandtab
set modeline
set nohlsearch
set noerrorbells

" file settings
set nobackup
set noswapfile

" setting mouse
set mouse=a

" leader key
let mapleader=" "

" assembly syntax
autocmd BufNewFile,BufRead *.asm set syntax=nasm

" moving lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" copy all 
nnoremap <Leader>ac :%y+<Esc>

" adding a line without insert
nnoremap <Leader>O O<Esc>j
vnoremap <Leader>O O<Esc>j
nnoremap <Leader>o o<Esc>k
vnoremap <Leader>o o<Esc>k

" NERDTree mappings
nnoremap <Leader>N :NERDTree<CR>
vnoremap <Leader>N :NERDTree<CR>
nnoremap <Leader>T :NERDTreeToggle<CR>
vnoremap <Leader>T :NERDTreeToggle<CR>

" split resize
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" split navigation mappings
noremap <silent> <Leader>K :wincmd k<CR>
noremap <silent> <Leader>H :wincmd h<CR>
noremap <silent> <Leader>J :wincmd j<CR>
noremap <silent> <Leader>L :wincmd l<CR>

"copy paste poggers
noremap <Leader>c "+y
noremap <Leader>v "*p

" filetype commands
autocmd Filetype python call PythonComs()
autocmd Filetype cpp    call CppComs()

" autoload functions
function PythonComs()
    " comments
    nnoremap <Leader>C V:s/^/# /g<Esc>
    vnoremap <Leader>C :s/^/# /g<Esc>
    nnoremap <Leader>U V:s/^# //g<Esc>
    vnoremap <Leader>U :s/^# //g<Esc> 
    
    " execute
    nnoremap <Leader>E :!python3 %:t<Esc>
endfunction

function CppComs()
    " comments
    nnoremap <Leader>C V:s/^/\/\/ /g<Esc>
    vnoremap <Leader>C :s/^/\/\/ /g<Esc>
    nnoremap <Leader>U V:s/^\/\/ //g<Esc>
    vnoremap <Leader>U :s/^\/\/ //g<Esc> 
    
    " execute
    nnoremap <Leader>E :!g++ %:t -std=c++2a && ./a.out<Esc>
endfunction
