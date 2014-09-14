" use vim settings, rather then vi settings (much better!).
" this must be first, because it changes other options as a side effect.
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
 "set nobackup		" do not keep a backup file, use versions instead
else
 "set backup		" keep a backup file
endif
"set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set copyindent                " copy the previous indentation on autoindenting
"
" Show matching brackets when text indicator is over them
set showmatch

" Makes search act like search in modern browsers
set incsearch

" Highlight search results
set hls
set wildmode=longest,list
set cmdheight=1

" if longer than 78, it'll create a new line
" annoying when working with go
" set textwidth=78

set winheight=10
set winminheight=7
set winheight=999

" general ruby ignores
set wildignore+=*/vendor/*
set wildignore+=*/coverage/assets/*

" Koding ignores
set wildignore+=*/builders/*
set wildignore+=*/node_modules/*
set wildignore+=*/_archive/*
set wildignore+=*/vagrant/*

set numberwidth=5

set showtabline=0

" tired of moving too much, see toggle below
set relativenumber

" backspace broke for some reason
set backspace=2 " make backspace work like most other apps

set shell=/bin/sh

set numberwidth=2

"set textwidth=61
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

"let Vundle manage Vundle
Bundle 'gmarik/vundle'

"Ruby/Rails
"Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
"Bundle 'vroom'

"Bundle 'danchoi/ri.vim'
"Bundle 'ruby-matchit'
"Bundle 'textobj-rubyblock'
"Bundle 'rubycomplete.vim'
"Bundle 'endwise.vim'
"Bundle 'textobj-user'
"Bundle 'matchit.zip'

" Go
Bundle 'fatih/vim-go'
Bundle 'nsf/gocode', {'rtp': 'vim/'}

" Utilities
Bundle "dgryski/vim-godef"
Bundle 'tpope/vim-fugitive'
Bundle 'The-NERD-Commenter'
Bundle 'Syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'Tagbar'
Bundle 'Lokaltog/vim-powerline'
Bundle 'fugitive.vim'
Bundle 'delimitMate.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'EasyMotion'
Bundle 'AndrewRadev/switch.vim'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'ervandew/supertab'
Bundle 'Tagbar'
Bundle 'Tabular'
"Bundle 'wting/rust.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "sent-hil/vim-snippets"
Bundle "Raimondi/delimitMate"

" JavaScript/CoffeeScript
Bundle 'vim-coffee-script'
Bundle 'scala.vim'

" Bundle 'acoffman/Jumpback.vim'

Bundle 'vim-scripts/greplace.vim'

" Dash
" Bundle 'rizzatti/funcoo.vim'
" Bundle 'rizzatti/dash.vim'

" Bundle "scrooloose/nerdtree"

" call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

let g:EasyMotion_leader_key = '<Leader>'

" ,a to Ack (search in files)
nnoremap <leader>a :Ack "<C-R><C-W>"
"nnoremap <leader>al :Ack "<C-R><C-W>"
"nnoremap <leader>ac :Ack --coffee "<C-R><C-W>"
"nnoremap <leader>aj :Ack --js "<C-R><C-W>"
"nnoremap <leader>ag :Ack --go "<C-R><C-W>"

" ,z to open up command line with :!
nnoremap <leader>z :!

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

if executable('coffeetags')
  let g:tagbar_type_coffee = {
          \ 'ctagsbin' : 'coffeetags',
          \ 'ctagsargs' : '',
          \ 'kinds' : [
          \ 'f:functions',
          \ 'o:object',
          \ ],
          \ 'sro' : ".",
          \ 'kind2scope' : {
          \ 'f' : 'object',
          \ 'o' : 'object',
          \ }
          \ }
endif"}

" open buffer with list of ctags for file
map tt :TagbarToggle<CR>

" complete local variables
imap <leader>l <c-p>

" clear old autocmds in group
" autocmd!

" ? and ! are considered part of method
set iskeyword+=?,!

nnoremap - :Switch<cr>

"" LANGUAGE SPECIFIC
" RUBY
" show docs based on file type
" autocmd FileType ruby nnoremap <jleader>d :call ri#LookupNameUnderCursor()<CR>

" Opens prompt to search ri docs
nnoremap  ,s :call ri#OpenSearchPrompt(0)<cr> " horizontal split

" Look up keyword under cursor in ri
nnoremap  ,kk :call ri#LookupNameUnderCursor()<cr> " keyword lookup

" save & run file
autocmd FileType ruby map ,, :w \|! clear && ruby %<CR>

" open prompt to search ri docs
autocmd FileType ruby nnoremap  <leader>s :call ri#OpenSearchPrompt(0)<CR>

" highlight rspec keywords
autocmd BufRead *_spec.rb syn keyword rubyRspec context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let described_class expect

autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1
autocmd FileType ruby nnoremap <leader>ac :Ack --ruby "<C-R><C-W>"

" autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,coffee set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et

" GO
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.go set textwidth=1000

autocmd FileType go nnoremap <leader>ac :Ack --go "<C-R><C-W>"

" Python
autocmd FileType python nnoremap <leader>ac :Ack --python "<C-R><C-W>"

" run Fmt before saving Go files
" autocmd BufWritePre *.go Fmt

" Scala
au BufRead,BufNewFile *.scala set filetype=scala

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    Fmt
    %s/\s\+$//e
    call cursor(l, c)
endfun

" autocmd FileType go autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" save & run file
autocmd FileType go map .. :w \|! clear && go run %<CR>

au BufRead,BufNewFile *_test.go map .. :w \|! clear && go run %<CR>

" show docs based on file type
" autocmd FileType go map <leader>d :Godoc<CR>

" JAVASCRIPT
autocmd FileType javascript map .. :w \|! clear && node %<CR>
autocmd FileType javascript setl shiftwidth=2 expandtab
autocmd FileType javascript nnoremap <leader>ac :Ack --js "<C-R><C-W>"

" COFFEESCRIPT
au BufRead,BufNewFile *.coffee set filetype=coffee
autocmd FileType coffee map .. :w \|! clear && coffee %<CR>
autocmd FileType coffee map <leader>c :CoffeeCompile<cr>
autocmd FileType coffee map <leader>cw :CoffeeCompile watch vert<cr>
autocmd FileType coffee nnoremap <leader>ac :Ack --coffee "<C-R><C-W>"

au BufRead,BufNewFile *.sls set filetype=yaml

" OTHERS
" autocmd BufRead,BufNewFile *.html source ~/.vim/indent/html_grb.vim
autocmd! BufRead,BufNewFile *.sass setfiletype sass

" TEXT
au BufRead,BufNewFile *.txt set filetype=text
autocmd FileType text set textwidth=0

" markdown syntax highlighting isn't very good, _ screws up everything
au BufRead,BufNewFile *.md set filetype=text

" SYNTASTIC
let g:syntastic_loc_list_height=5
" open error list in bottom buffer
let g:syntastic_auto_loc_list=1
" jump to location of error afer saving
let g:syntastic_auto_jump=1

" YOUCOMPLETEME
"let g:ycm_min_num_of_chars_for_completion = 3

" CNTRP
nnoremap <leader>t :CtrlP<cr>

" buffer search
nnoremap <leader>p :CtrlPBuffer<cr>

" use same file inode, so koding builder doesn't freak
set nowritebackup

let g:SuperTabDefaultCompletionType = "context"

let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

set nofoldenable

function RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! OpenTestAlternate()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '_test\.go$') != -1
  let going_to_spec = !in_spec
  if going_to_spec
    let new_file = substitute(new_file, '\.e\?go$', '_test.go', '')
  else
    let new_file = substitute(new_file, '_test\.go$', '.go', '')
  endif
  exec ':e ' . new_file
endfunction
autocmd FileType go nnoremap <leader>s :call OpenTestAlternate()<cr>

"let g:ctrlp_extensions = ['line']
"let g:ctrlp_prompt_mappings = {
  "\ 'PrtHistory(-1)': ['<c-up>'],
  "\ 'PrtHistory(1)':  ['<c-down>'],
  "\ 'ToggleType(1)':  ['<c-p>'],
  "\ 'ToggleType(-1)': ['<c-l>'],
  "\ 'PrtCurRight()':  ['<right>']
  "\ }
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tags\|vagrant'
let g:ctrlp_clear_cache_on_exit=0

function RunGoTestUnderLine()
  let line_text = getline(".")
  let test_name = matchstr(getline("."), "Test.[a-zA-Z]*")
  if test_name != ""
    exec '!clear && go test -config vagrant -gocheck.f ' . test_name
  else
    echo 'No test under line'
  endif
endfunction
autocmd FileType go nnoremap <leader>t :w \| :call RunGoTestUnderLine()<CR>

set tags=./tags;/

" case sensitive search
" disable this since most of the time you want case insensitive
" set noic

" delete trailing whitespace before save
autocmd BufWritePre * :%s/\s\+$//e

" NERD COMMENTER
" adds space before beginning of comment
let NERDSpaceDelims=1

" prevents duplicate comment prefixes
let NERDDefaultNesting=0

" highlight characters over 80 with red background
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" From https://github.com/amix/vimrc/blob/master/vimrcs/extended.vim

" persist undos across sessions
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U> " delete from current to end of line
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%"

map 0 ^

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

" Show all tabs:
" /\t"

:nmap <silent> <leader>d <Plug>DashSearch

""" move lines up, down
nnoremap <C-u> :m .+1<CR>==
nnoremap <C-i> :m .-2<CR>==

" Insert mode
inoremap <C-u> <ESC>:m .+1<CR>==gi
inoremap <C-i> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-u> :m '>+1<CR>gv=gv
vnoremap <C-i> :m '<-2<CR>gv=gv
"""

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>d <Plug>(go-def)
