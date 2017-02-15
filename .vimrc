syntax on

" searching
set incsearch
set ignorecase
set smartcase
set wrapscan
set nohlsearch

" text wrapping
set wrap
set wildmenu
if exists("&wildignorecase")
    set wildignorecase
endif

set scrolloff=999
set number
let g:netrw_preview=1

set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab
set softtabstop=4

set backupdir=~/.vim/backup
set backup

colorscheme jellybeans
if (has("termguicolors"))
 set termguicolors
endif

let g:python_host_prog = '/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python'

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

set directory=~/.vim/tmp//,/tmp

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

call plug#begin('~/.vim/plugged')

Plug 'critiqjo/lldb.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end() 

let g:deoplete#enable_at_startup = 1

let g:clang_complete_auto = 0 
let g:clang_use_library = 1
let g:clang_periodic_quickfix = 0
let g:clang_close_preview = 1

set runtimepath^=~/.vim/bundle/ctrlp.vim
