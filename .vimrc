""""""""""""
" vim-plug "
""""""""""""
call plug#begin()

" interface
Plug 'scrooloose/nerdcommenter'

" File tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Telescope (need to install ripgrep: rg)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'miyakogi/seiya.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" management
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neomake/neomake'

" controls
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'

" languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'buoto/gotests-vim'

" Hashicorp
Plug 'hashivim/vim-nomadproject'
Plug 'hashivim/vim-consul'
Plug 'hashivim/vim-terraform'

" themes
Plug 'navarasu/onedark.nvim'
Plug 'rakr/vim-one'

call plug#end()

" Enable filetype plugins
filetype plugin on

""""""""""""""
" Aesthetics "
""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_splits = 0

set noshowmode
hi Normal ctermbg=None
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"""""""""""""""""""""
" Mobility and Keys "
"""""""""""""""""""""
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=10
set textwidth=0 
set wrapmargin=0

" Don't add a newline at EOF on save
set nofixendofline

" leader key space!
map <Space> <leader>

" go to file extensions
set suffixesadd=.js,.jsx

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

" move between vertical panes
noremap <C-w>l <C-w>k
noremap <C-w>k <C-w>j

" mouse action
set mouse=a

" turn off that scratch shit
"set completeopt-=preview
set completeopt=menu,menuone,noselect

" Set to auto read when a file is changed from the outside
set autoread
au CursorHold * checktime

" Enable highlighting of line number
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END
set cursorline 

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
syntax on

" true colors
if (has("termguicolors"))
  set termguicolors
endif

" nice backgrounds
let g:seiya_auto_enable=1

" edge theme
let g:edge_style = 'aura'
let g:edge_better_performance = 1
let g:edge_enable_italic = 1

" Current Theme
set background=dark
set t_Co=256

if has('nvim')
  colorscheme onedark
endif
if !has('nvim')
  colorscheme one
endif 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set nowrap

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
 
" Use Unix as the standard file type
set ffs=unix,dos,mac

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
noremap <leader>l :tabnext<cr>
noremap <leader>k :tabprev<cr>
noremap <leader>t :bufdo tab split<CR>:tablast<CR>:tabclose<CR>:syntax on<CR>

" spell checking
noremap <leader>z :setlocal spell! spelllang=en_us<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" show full file name
set statusline+=%F

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

" Telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>

" nvim tree
nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>

" Golang
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 1
let g:go_metalinter_autosave = 1
let g:go_fmt_command="gopls"
let g:go_jump_to_error = 0
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
autocmd Filetype go nmap <C-c> :GoCallers<CR>
autocmd Filetype go nmap <C-]> <Plug>(go-def-tab)
autocmd Filetype go nmap <C-\> :GoDefPop<CR>

set cmdheight=1
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ Column:\ %c

" faster vim refresh rate
set updatetime=25

" get that copy/pasta
set clipboard=unnamed

""""""""""""""""
" vim-closetag "
""""""""""""""""
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" Prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Coc
autocmd Filetype javascript nmap <silent> <C-]> :call CocAction('jumpDefinition', 'tabe')<CR>
" <C-o> to go back after definition
autocmd Filetype javascript nmap <silent> gy <Plug>(coc-type-definition)
autocmd Filetype javascript nmap <silent> gi <Plug>(coc-implementation)
autocmd Filetype javascript nmap <silent> <C-\> <Plug>(coc-references)

" Terraform
let g:terraform_fmt_on_save = 1
let g:terraform_align = 1
