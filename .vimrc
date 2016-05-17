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
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()

""""""""""""""
" Aesthetics "
""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'seoul256',
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

" nice backgrounds
let g:seiya_auto_enable=1

" faster vim refresh rate
set updatetime=250

""""""""""""""""""""""""""""""""""""""""""""""""
" one.vim by AlexMax                           "
" A theme based on the One Dark theme for Atom "
""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "one"

" Color definitions.
let s:G_Mono1='#ABB2BF' " Default Text
let s:G_Mono2='#828997'
let s:G_Mono3='#5C6370'
let s:G_Hue1='#56B6C2'  " Cyan
let s:G_Hue2='#61AFEF'  " Blue
let s:G_Hue3='#C678DD'  " Purple
let s:G_Hue4='#98C379'  " Green
let s:G_Hue5='#E06C75'  " Red 1
let s:G_Hue52='#BE5046' " Red 2
let s:G_Hue6='#D19A66'  " Orange 1
let s:G_Hue62='#E5C07B' " Orange 2
let s:G_SyntaxFG=s:G_Mono1
let s:G_SyntaxBG='#282C34'
let s:G_SyntaxGutter='#636D83'
let s:G_SyntaxGuide='#3B3F48'
let s:G_SyntaxAccent='#528BFF'

if &t_Co == 256
	let s:T_Mono1='249'
	let s:T_Mono2='245'
	let s:T_Mono3='241'
	let s:T_Hue1='73'
	let s:T_Hue2='75'
	let s:T_Hue3='170'
	let s:T_Hue4='150'
	let s:T_Hue5='167'
	let s:T_Hue52='131'
	let s:T_Hue6='180'
	let s:T_Hue62='179'
	let s:T_SyntaxFG=s:T_Mono1
	let s:T_SyntaxBG='236'
	let s:T_SyntaxGutter='60'
	let s:T_SyntaxGuide='237'
	let s:T_SyntaxAccent='69'
else
	let s:T_Mono1='Gray'
	let s:T_Mono2='DarkGray'
	let s:T_Mono3='DarkGray'
	let s:T_Hue1='Cyan'
	let s:T_Hue2='Blue'
	let s:T_Hue3='Magenta'
	let s:T_Hue4='Green'
	let s:T_Hue5='Red'
	let s:T_Hue52='DarkRed'
	let s:T_Hue6='Yellow'
	let s:T_Hue62='DarkYellow'
	let s:T_SyntaxFG=s:T_Mono1
	let s:T_SyntaxBG='Black'
	let s:T_SyntaxGutter='DarkGray'
	let s:T_SyntaxGuide='DarkGray'
	let s:T_SyntaxAccent='DarkGray'
endif

" Base vim color scheme
exe 'hi Normal ctermfg='.s:T_SyntaxFG.' guifg='.s:G_SyntaxFG.' guibg='.s:G_SyntaxBG
exe 'hi LineNr ctermfg='.s:T_SyntaxGutter.' guifg='.s:G_SyntaxGutter
exe 'hi NonText ctermfg='.s:T_SyntaxGuide.' guifg='.s:G_SyntaxGuide

" Base vim syntax highlighting
exe 'hi Comment ctermfg='.s:T_Mono3.' gui=Italic guifg='.s:G_Mono3
exe 'hi link Character String'
exe 'hi Constant ctermfg='.s:T_Hue6.' guifg='.s:G_Hue6
exe 'hi link Delimiter Normal'
exe 'hi Identifier cterm=NONE ctermfg='.s:T_Hue5.' guifg='.s:G_Hue5
exe 'hi PreProc ctermfg='.s:T_Hue3.' guifg='.s:G_Hue3
exe 'hi Special ctermfg='.s:T_Hue1.' guifg='.s:G_Hue1
exe 'hi Statement gui=NONE ctermfg='.s:T_Hue3.' guifg='.s:G_Hue3
exe 'hi String ctermfg='.s:T_Hue4.' guifg='.s:G_Hue4
exe 'hi Type gui=NONE ctermfg='.s:T_Hue3.' guifg='.s:G_Hue3

" Mode-specific syntax highlighting
exe 'hi phpComparison ctermfg='.s:T_SyntaxFG.' guifg='.s:G_SyntaxFG
exe 'hi phpMemberSelector ctermfg='.s:T_SyntaxFG.' guifg='.s:G_SyntaxFG
exe 'hi phpOperator ctermfg='.s:T_SyntaxFG.' guifg='.s:G_SyntaxFG
exe 'hi phpFunctions ctermfg='.s:T_Hue1.' guifg='.s:G_Hue1
exe 'hi phpRelation ctermfg='.s:T_SyntaxFG.' guifg='.s:G_SyntaxFG
exe 'hi phpVarSelector ctermfg='.s:T_Hue5.' guifg='.s:G_Hue5
exe 'hi pythonBuiltin ctermfg='.s:T_Hue1.' guifg='.s:G_Hue1
exe 'hi pythonFunction ctermfg='.s:T_Hue2.' guifg='.s:G_Hue2
exe 'hi rubyAccess ctermfg='.s:T_Hue2.' guifg='.s:G_Hue2
exe 'hi rubyAttribute ctermfg='.s:T_Hue2.' guifg='.s:G_Hue2
exe 'hi rubyConstant ctermfg='.s:T_Hue6.' guifg='.s:G_Hue6
exe 'hi rubyFunction ctermfg='.s:T_Hue2.' guifg='.s:G_Hue2
exe 'hi rubyInterpolation ctermfg='.s:T_Hue4.' guifg='.s:G_Hue4
exe 'hi rubyInterpolationDelimiter ctermfg='.s:T_Hue52.' guifg='.s:G_Hue52
exe 'hi rubyLocalVariableOrMethod ctermfg='.s:T_Hue1.' guifg='.s:G_Hue1
exe 'hi rubyRegexp ctermfg='.s:T_Hue1.' guifg='.s:G_Hue1
exe 'hi rubyRegexpAnchor ctermfg='.s:T_Hue1.' guifg='.s:G_Hue1
exe 'hi rubyRegexpCharClass ctermfg='.s:T_Hue1.' guifg='.s:G_Hue1
exe 'hi rubyRegexpDelimiter ctermfg='.s:T_Hue1.' guifg='.s:G_Hue1
exe 'hi rubyRegexpQuantifier ctermfg='.s:T_Hue1.' guifg='.s:G_Hue1
exe 'hi rubyStringDelimiter ctermfg='.s:T_Hue4.' guifg='.s:G_Hue4
exe 'hi rubySymbol ctermfg='.s:T_Hue1.' guifg='.s:G_Hue1

" octol/vim-cpp-enhanced-highlight
exe 'hi cCustomFunc ctermfg='.s:T_Hue2.' guifg='.s:G_Hue2

" StanAngeloff/php.vim
exe 'hi phpClass ctermfg='.s:T_Hue62.' guifg='.s:G_Hue62
exe 'hi phpClassExtends ctermfg='.s:T_Hue4.' guifg='.s:G_Hue4
exe 'hi phpFunction ctermfg='.s:T_Hue2.' guifg='.s:G_Hue2
exe 'hi phpMethodsVar ctermfg='.s:T_Hue6.' guifg='.s:G_Hue6
exe 'hi phpParent ctermfg='.s:T_SyntaxFG.' guifg='.s:G_SyntaxFG
exe 'hi phpStaticClasses ctermfg='.s:T_Hue62.' guifg='.s:G_Hue62

