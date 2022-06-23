" Vim mode - must be first as it changes subsequent options
:set nocp	" non-compatible, use vim features (as opposed to vi)!

" Colour if supported by terminal
if &t_Co > 2 || has("gui_running")
  syntax on			" syntax highlighting
  set hlsearch		" highlight search results
endif

" Display
set showcmd			" show incomplete (in-progress) commands in bottom right
set title			" show info in window title
set titleold=""		" restore window title when leaving vim
set wildmenu		" show visual menu during autocomplete

" Moving around, searching and patterns
set incsearch		" incremental search; show matches as characters are entered
set ignorecase		" ignore case when using a search pattern
set smartcase		" override 'ignorecase' when pattern has upper case characters

" Text Manipulation
set backspace=indent,eol,start	" make backspace work as expected
set autoindent
filetype plugin indent on	" enable indentation based on filetype
set tabstop=4				" number of visual spaces per TAB

" Folding
set foldenable			" enable folding
set foldlevelstart=10	" value for 'foldlevel' when starting to edit a file

" Vim Operations
set history=500
set undolevels=1000		" max number of changes that can be undone
set undoreload=10000	" max number of lines to save for undo on a buffer reload
set lazyredraw			" redraw the screen only when we need to --> faster macros

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" Mouse support
if has('mouse')
  set mouse=a
endif
