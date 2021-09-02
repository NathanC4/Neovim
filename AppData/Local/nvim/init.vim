set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
"Vim 8.2.3013 downloaded from https://github.com/vim/vim-win32-installer/releases/

"""MAPPINGS"""
let mapleader = ","
nnoremap <space> :
vnoremap <space> :
inoremap jk <Esc>
nnoremap M :marks<cr>
noremap <C-t> :tabedit 

noremap <F1> :!runscript.pl<cr><cr>
noremap <F2> :lcd %:p:h<cr>
noremap <F3> :Files C:\ApexAccounts\<cr>
noremap <F4> :Files ~<cr>
noremap <F5> :!start explorer %:p:h<cr><cr>
noremap <F6> :Rg 
noremap <F7> :call ToggleColumn()<cr>

" Stop F15 from appearing in input and command mode because of Caffeine
map! <F15> <nop>

" Tab mappings
nnoremap <Tab> :tabnext<cr>
nnoremap <S-Tab> :tabprev<cr>

" T for new tab + jump to mark
nnoremap T :tabnew<cr>'

" C-s saves file
noremap <C-s> :w<cr>
inoremap <C-s> <C-o>:w<cr>

" C-q quits all
noremap <C-q> :qa!<cr> 

" C-j joins next line
noremap <C-j> J

" C-w closes buffer
noremap <C-w> :bd!<cr>

" C-u undo in insert mode
inoremap <C-u> <Esc>ui

" C-a select all
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG

" C-z undo
noremap <C-z> u
inoremap <C-z> <C-o>u

" C-x redo
noremap <C-x> <C-r>
inoremap <C-x> <C-o><C-r>

" Make C-v paste in all modes, move visual block command to C-b
noremap <C-c> y
noremap <C-v> "+p
cnoremap <C-v> <C-r>+
inoremap <C-v> <C-r>+
noremap <C-b> <C-v>

"Also C-p for insert mode
inoremap <C-p> <C-r>+

" C-d/C-f for half page up/down
noremap <C-d> <C-u>
noremap <C-f> <C-d>

" Z saves if modified and closes window
nnoremap Z ZZ

" Better HJKL
noremap H 0
noremap J 5j
noremap K 5k
noremap L $
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Make o & O not enter insert mode
noremap o o<Esc>k
noremap O O<Esc>j

" Swap mark keys
noremap ' `
noremap ` '

" vimrc editing
nnoremap <leader>e :tabedit $MYVIMRC<cr>

augroup source_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Turn off search highlighting
nmap <silent> <leader>f :silent :nohlsearch<CR>

" Toggle list chars
nmap <silent> <leader>s :set nolist!<CR>
set listchars=eol:§,tab:│·,precedes:«,extends:»,nbsp:‡

"""""BASICS"""""
set nocompatible "Expands options so we aren't limited to what only works with Vi
filetype plugin indent on
syntax on

set hidden
set history=1000
set title
set noshowmode                  "Hide current mode down the bottom
set showcmd
set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim
set modelines=0                 "Security setting
set laststatus=2                "Status bar always on
set t_Co=256                    "Terminal colors
set autochdir                   "Auto change working directory
set nopaste                     "Format on paste

" Neovim
set mouse=a

"""""""""""""""""""""""""""""""""""
"""""""""""PLUGINS"""""""""""""""""
"""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mechatroner/rainbow_csv'

call plug#end()

" Pathogen:
" auto-pairs
execute pathogen#infect()

" Rainbow CSV 
nmap <silent> <leader>w :RainbowNoDelim<cr>
nmap <silent> <leader>r :RainbowDelim<cr>
let g:rcsv_max_columns = 100
let g:rcsv_colorpairs = [['red', 'red'], ['yellow', 'yellow'], ['cyan', 'cyan'], ['green', 'green'], ['magenta', 'magenta'], ['NONE', 'NONE'], ['darkred', 'darkred'], ['darkcyan', 'darkcyan'], ['darkgreen', 'darkgreen'], ['darkmagenta', 'darkmagenta']]

"""""""""""""""""""""""""""""""""""
""""""""""DISPLAY OPTIONS""""""""""
"""""""""""""""""""""""""""""""""""

"""WINDOW"""
set splitright splitbelow   "Windows should default to splitting to the right or below
set nu rnu                  "Set line number and relative line numbering options on.
set go-=r                   "Turn off right scrollbar
set go-=L                   "Turn off left scrollbar

"""TEXT COLOR and FONT"""
colo molokai

" Airline settings
let g:airline_powerline_fonts=0
let g:airline_theme='luna'
let g:airline#extensions#whitespace#enabled = 0
let airline_section_z='%p%%%#__accent_bold# %l/%L%#__restore__# col %#__accent_bold#%v%#__restore__#'

" Tabline
let g:airline#extensions#tabline#enabled = 1               " enable airline tabline
let g:airline#extensions#tabline#formatter = 'unique_tail' " use only file name for tab labels
let g:airline#extensions#tabline#show_close_button = 0     " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#show_tab_type = 0         " don't label tab types 
let g:airline#extensions#tabline#show_tab_nr = 0           " don't show tab numbers
let g:airline#extensions#tabline#tab_min_count = 2         " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_buffers = 0          " dont show buffers in the tabline
let g:airline#extensions#tabline#show_tab_count = 0        " dont show tab numbers on the right
let g:airline#extensions#tabline#show_splits = 0           " disables the buffer name that displays on the right of the tabline

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" ALE settings
let g:ale_fixers = {'perl': ['perltidy', 'trim_whitespace', 'remove_trailing_lines']}
let g:ale_linters = {'perl': ['perl','perlcritic'] }
"let g:ale_completion_enabled = 1

"""FORMATTING OPTIONS""""
set tabstop=4 shiftwidth=4 expandtab "Autoreplace tabs with space, use 4 spaces and mark tabs at 4 spaces each.
set nowrap       "Don't wrap lines.
set autoindent   "indentation automatically set based on the previous line.

"""SEARCH OPTIONS"""
set ignorecase  " Search ignores case
set smartcase   " ...unless there's capital letters 
set wrapscan    " Searches loop back to begining of file and don't just stop.
set hlsearch    " Highlight all the occurences of the last search.
set incsearch   " Highlight dynamically as search is typed
set gdefault    " Search is global by default
let g:fzf_layout = { 'down': '40%' }

"""BACKGROUND SYSTEM OPTIONS"""
set belloff=all "disable the bell sound for everything.

"Cross platform clipboard use ([p] and [y] in Vim will match <C-c> or <C-v> in
"  non-Vim programs.
set clipboard^=unnamed,unnamedplus

"""MISC"""
set scrolloff=3 "start scrolling 3 lines before screen border
set ruler
set backspace=indent,eol,start
set shortmess=atI   " Avoid press Enter messages
set lz              "Sets lazy redraw.  (prevents redrawing while macro is running).

" Call checktime every second to check if file has been changed by another program
if !exists("g:CheckUpdateStarted")
    let g:CheckUpdateStarted=1
    call timer_start(1,'CheckUpdate')
endif
function! CheckUpdate(timer)
    silent! checktime
    call timer_start(1000,'CheckUpdate')
endfunction

" Enable better % matching functionality
runtime macros/matchit.vim 

" Enable better tab completion
set wildmode=list:longest,full

" Store temp files in single directory
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupcopy=yes

" Disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""FUNCTIONS"""
" Toggle highlighting of a column
function ToggleColumn()
    let str = &cc
    let curCol = virtcol('.')

    if matchstr(str,curCol)
        execute 'set cc-=' . curCol
    else
        execute 'set cc+=' . curCol
    endif
endfunction
