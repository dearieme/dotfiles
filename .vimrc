set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugin
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set N lines to the cursors - when moving vertical..
set so=4
set wildmenu                   "Turn on WiLd menu
set ruler                      "Always show current position
set cmdheight=2                "The commandbar height
set hid                        "Change buffer - without saving
set backspace=eol,start,indent "Set backspace config
set whichwrap+=<,>,h,l         "Allow more keys to wrap
set showmatch                  "Show matching brackets
set mat=2                      "How many tenths of a second to blink
set wildmode=longest,list      "Bash style tab completion
set showcmd		                 "display incomplete commands
set laststatus=2               "always have a status line
set mousehide                  "hide the mouse when not in use

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Change cursor per mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                   "Highlight search things
set incsearch                  "Incrememntal search

map ' :set hls!<bar>set hls?<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
colorscheme desert256

set encoding=utf8

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set sts=2               " set the soft tab stop to 2 spaces
set et                  " expand tabs to spaces
set sw=2                " set shiftwidth to 2 spaces
set tabstop=2           " set hard tab width to 2 spaces
set smarttab            " tab at beginning of line inserts spaces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab configuration
map ,t :tabnew<cr>
map ,n :tabnext<cr>
map ,p :tabprevious<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=2
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Perl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set iskeyword+=:        " Perl class name auto completion
nnoremap ,y  :%!perltidy -q<cr>   " for 'normal' mode
vnoremap ,y  :!perltidy -q<cr>    " for 'visual' mode

