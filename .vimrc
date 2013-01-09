" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible               " be iMproved
filetype off                   " required!

syntax on
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

set rtp+=~/.vim/bundle/vundle/

filetype plugin indent on

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Remember more commands and search history
set history=1000

" Make tab completion for files/buffers act like bash
set wildmenu

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
 set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set laststatus=2
set showmatch
set incsearch
set hls
set wildmode=longest,list
set cmdheight=1

" if longer than 78, it'll create a new line
set textwidth=78

:nnoremap <CR> :nohlsearch<CR>/<BS>

let mapleader=","

"switches between recently open files
nnoremap ;; <c-^>

" highlight current line
" set cursorline
hi CursorLine cterm=NONE ctermbg=black

augroup myfiletypes
  "clear old autocmds in group
  autocmd!
  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et
augroup END

autocmd BufRead,BufNewFile *.html source ~/.vim/bundle/misc/indent/html_grb.vim
autocmd FileType htmldjango source ~/.vim/bundle/misc/indent/html_grb.vim
autocmd! BufRead,BufNewFile *.sass setfiletype sass

" Map ,e to open files in the same directory as the current file
map <leader>e :e <C-R>=expand("%:h")<cr>/

autocmd BufRead,BufNewFile *.feature set sw=4 sts=4 et

set numberwidth=5

command! W :w

set showtabline=0

" Esc is too hard to reach
imap jj <Esc>

command!  W :w
command!  Q :q
command! Wq :wq

command! Qall :qall

:map <C-j> <C-w>j
:map <C-k> <C-w>k
:map <C-l> <C-w>l
:map <C-h> <C-w>h
:map <C-o> <C-w>o
:map qq <C-w>q

" No Help, please
nmap <F1> <Esc>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

if &diff
  nmap <c-h> :diffget 1<cr>
  nmap <c-l> :diffget 3<cr>
  nmap <c-k> [cz.
  nmap <c-j> ]cz.
  set nonumber
endif

set winheight=10
set winminheight=7
set winheight=999

map q <Nop>

" highlight rspec keywords
autocmd BufRead *_spec.rb syn keyword rubyRspec context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let described_class expect

" ? and ! are considered part of method
autocmd BufRead,BufNewFile *.rb set iskeyword+=?,!

" toggle setting dir to current file
map <leader>d :set relative! relative?<CR>

" opens cmd to enter terminal commands
map <leader>z :!<space>

set wildignore+=vendor/**
set wildignore+=coverage/assets/**

" tired of moving too much, see toggle below
set relativenumber

" toggle between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" toggle line numbers
map <leader>n :set number! number?<CR>

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" cut with shift x
vmap <C-x> :!pbcopy<CR>

" cut with shift c
vmap <C-c> :w !pbcopy<CR><CR>

" backspace broke for some reason
set backspace=2 " make backspace work like most other apps

set shell=/bin/sh

let g:Powerline_symbols = 'fancy'

call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Programming
Bundle 'rails.vim'
Bundle 'ruby.vim'
Bundle 'vroom'
Bundle 'ruby-matchit'
Bundle 'endwise.vim'
Bundle 'textobj-user'
Bundle 'textobj-rubyblock'

" Utility
Bundle 'repeat.vim'
Bundle 'surround.vim'
Bundle 'The-NERD-Commenter'
Bundle 'Syntastic'
Bundle 'fugitive.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'matchit.zip'
Bundle 'AutoClose'
Bundle 'mileszs/ack.vim'
Bundle 'Tagbar'
Bundle 'ctrlp.vim'

call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" ,a to Ack (search in files)
nnoremap <leader>a :Ack 

nmap <Leader>90 <Plug>ToggleAutoCloseMappings

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <C-S> <Esc>:Update<CR>
vnoremap <C-S> <Esc>:update<CR>

set numberwidth=2

set textwidth=61
