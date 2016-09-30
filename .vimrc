""""""""""""
" vim-plug "
""""""""""""
call plug#begin()
 
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tikhomirov/vim-glsl'
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
Plug 'evidens/vim-twig'
Plug 'Yggdroot/indentLine'

Plug 'miyakogi/seiya.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'alvan/vim-closetag'

call plug#end()

""""""""""""""
" Aesthetics "
""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [['mode', 'paste'], ['fugitive', 'readonly', 'filename' ]]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
      \ }
let g:Powerline_symbols='fancy'
set noshowmode
hi Normal ctermbg=none

"""""""""""""""""""""
" Mobility and Keys "
"""""""""""""""""""""
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=10
set textwidth=0 
set wrapmargin=0

" leader key space!
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
colorscheme onedark 


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

" the old line numbers
set number

" automatic indents
set autoindent
 
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

"""""""""""""""""""""""""""
" => Misc 
"""""""""""""""""""""""""""

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" NERDTree "
nmap <silent> <C-T> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1 

set cmdheight=1
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ Column:\ %c

" nice backgrounds
let g:seiya_auto_enable=1

" faster vim refresh rate
set updatetime=250

" get that copy/pasta
set clipboard=unnamed

""""""""""""""""
" vim-closetag "
""""""""""""""""
let g:closetag_filenames = "*.php,*.html,*.xhtml,*.phtml"

" cpp highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error = 1

" txt highlighting
let g:notes_suffix = '.txt'

" Indents
let g:indentLine_char = '┆'
let g:indentLine_color_term = 239
