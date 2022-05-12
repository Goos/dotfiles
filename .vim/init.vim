syntax on

" Localization
set langmenu=en_US.UTF-8
if has('unix')
    language messages C
else
    language messages en
endif

" searching
set incsearch
set ignorecase
set smartcase
set wrapscan
set hlsearch

" text wrapping
set wrap
set linebreak
set nolist
set formatoptions-=t

set wildmenu
if exists("&wildignorecase")
    set wildignorecase
endif

set number
let g:netrw_preview=1

set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab
set softtabstop=4

set cursorline

set backupdir=~/.vim/backup
set backup

" Transpose lines up and down
nnoremap - :.move +1<CR>
nnoremap _ :.move -2<CR>
" Transpose lines up and down in visual mode
vnoremap - :'<,'>move '>+1 \| normal! gv<CR>
vnoremap _ :'<,'>move '<-2 \| normal! gv<CR>

" set vim to chdir for each file
"if exists('+autochdir')
"    set autochdir
"else
"    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
"endif

set background=dark
set termguicolors
colorscheme deep-space

" writing conf
let g:goyo_width=80

function! s:goyo_enter()
    set scrolloff=999
    set tw=80
    set fo=cqt
    set spell
endfunction

function! s:goyo_leave()
   set scrolloff=5
   set tw=0
   set fo=cq
   set nospell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set directory=~/.vim/tmp//,/tmp

"
" File search
"

" bind K to grep word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <silent> <C-p> :FZF<CR> 

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"
" Plugins
"

set rtp+=/usr/local/opt/fzf

packloadall

silent! helptags ALL

execute pathogen#infect()

call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/vim-lsp'
Plug 'machakann/vim-lsp-julia'

call plug#end()

"
" Autocompletion
"

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

autocmd FileType swift setlocal omnifunc=lsp#complete

imap <c-space> <Plug>(asyncomplete_force_refresh)

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>

" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
