syntax on

" searching
set incsearch
set ignorecase
set smartcase
set wrap
set wrapscan
set wildmenu

set number

set tabstop=2     " a tab is two spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab
set shiftwidth=2
set softtabstop=2

set backspace=indent,eol,start

colorscheme blackboard

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

set directory=~/.vim/tmp//,/tmp

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
