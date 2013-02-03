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

set winheight=10
set winminheight=7
set winheight=999

set wildignore+=vendor/**
set wildignore+=coverage/assets/**

set numberwidth=5

set showtabline=0

" tired of moving too much, see toggle below
set relativenumber

" backspace broke for some reason
set backspace=2 " make backspace work like most other apps

set shell=/bin/sh

set numberwidth=2

set textwidth=61
set wrap
set linebreak

set complete-=i

:nnoremap <CR> :nohlsearch<CR>/<BS>

let mapleader=","

"switches between recently open files
nnoremap ;; <c-^>

" highlight current line
" set cursorline
hi CursorLine cterm=NONE ctermbg=black

" Map ,e to open files in the same directory as the current file
map <leader>e :e <C-R>=expand("%:h")<cr>/

command! W :w

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

" close file
:map qq <C-w>q

if &diff
  nmap <c-h> :diffget 1<cr>
  nmap <c-l> :diffget 3<cr>
  nmap <c-k> [cz.
  nmap <c-j> ]cz.
  set nonumber
endif

map q <Nop>

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

let g:Powerline_symbols = 'fancy'

set rtp+=$GOROOT/misc/vim
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Ruby/Rails
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vroom'
Bundle 'ruby-matchit'
Bundle 'textobj-rubyblock'
Bundle 'rubycomplete.vim'
Bundle 'danchoi/ri.vim'

" Go
Bundle 'jnwhiteh/vim-golang'
Bundle 'nsf/gocode', {'rtp': 'vim/'}

" Utilities
Bundle 'endwise.vim'
Bundle 'textobj-user'
Bundle 'The-NERD-Commenter'
Bundle 'Syntastic'
Bundle 'fugitive.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'matchit.zip'
Bundle 'mileszs/ack.vim'
Bundle 'Tagbar'
Bundle 'ctrlp.vim'
Bundle 'Supertab'
Bundle 'delimitMate.vim'

" snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" ,a to Ack (search in files)
nnoremap <leader>a :Ack 

nmap <Leader>90 <Plug>ToggleAutoCloseMappings

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Cntrl + s saves file
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

let g:stop_autocomplete=0

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" open buffer with list of ctags for file
map tt :TagbarToggle<CR>

" single tab activates snipmate

" activate omni completion
imap <leader>o <c-x><c-o>

" complete local variables
imap <leader>l <c-p>

" clear old autocmds in group
" autocmd!

" RUBY
" show docs based on file type
autocmd FileType ruby nnoremap <leader>d :call ri#LookupNameUnderCursor()<CR>

" save & run file
autocmd FileType ruby map ,, :w \|! clear && ruby %<CR>

" open prompt to search ri docs
autocmd FileType ruby nnoremap  <leader>s :call ri#OpenSearchPrompt(0)<CR>

" highlight rspec keywords
autocmd BufRead *_spec.rb syn keyword rubyRspec context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let described_class expect

" ? and ! are considered part of method
autocmd BufRead,BufNewFile *.rb set iskeyword+=?,!

autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1

"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et

" Opens prompt to search ri docs
nnoremap  ,s :call ri#OpenSearchPrompt(0)<cr> " horizontal split

" Look up keyword under cursor in ri
nnoremap  ,kk :call ri#LookupNameUnderCursor()<cr> " keyword lookup

" GO
au BufRead,BufNewFile *.go set filetype=go

" run Fmt before saving Go files
autocmd BufWritePre *.go Fmt

" save & run file
autocmd FileType go map ,, :w \|! clear && go run %<CR>

" show docs based on file type
autocmd FileType go map <leader>d :Godoc<CR>

" OTHERS
autocmd BufRead,BufNewFile *.html source ~/.vim/indent/html_grb.vim
autocmd! BufRead,BufNewFile *.sass setfiletype sass
