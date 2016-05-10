""""""""""""
" vim-plug "
""""""""""""
call plug#begin()
 
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'cocopon/iceberg.vim'
Plug 'miyakogi/seiya.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'joonty/vdebug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

""""""""""""""
" Aesthetics "
""""""""""""""
let g:airline_theme='lucius'

"""""""""""""""""""""
" Mobility and Keys "
"""""""""""""""""""""
set tabstop=2
set shiftwidth=2
set scrolloff=10
set textwidth=0 
set wrapmargin=0

map <Space> <leader>

" movement keys
noremap j h
noremap k j
noremap l k
noremap ; l

" select the active split
nnoremap <leader>j <C-w>h
nnoremap <leader>; <C-w>l

" jump up or down
noremap <C-k> <C-d>
noremap <C-l> <C-u>

" mouse action
set mouse=a

" turn off that scratch shit
set completeopt-=preview

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au CursorHold * checktime

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set sidescroll=1

" Ignore case when searching
set ignorecase
 
" When searching try to be smart about cases 
set smartcase
 
" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch
 
" Don't redraw while executing macros (good performance config)
set lazyredraw
 
" For regular expressions turn magic on
set magic
 
" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
 
set t_Co=256
colorscheme iceberg

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
 
" Use Unix as the standard file type
set ffs=unix,dos,mac

set nowrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" the old line numbers
set number

" Be smart when using tabs ;)
set smarttab
 
" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove
noremap <leader>l :tabn<cr>
noremap <leader>k :tabp<cr>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
       return 'PASTE MODE  '
    en
    return ''
endfunction

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'

" NERDTree "
nmap <silent> <C-T> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1 

set cmdheight=1
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ Column:\ %c

let g:seiya_auto_enable=1
