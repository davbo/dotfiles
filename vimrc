filetype off
filetype plugin indent on
set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Markdown'
Bundle 'SuperTab'
Bundle 'Align'
Bundle 'YankRing.vim'
Bundle "majutsushi/tagbar"
Bundle 'rodjek/vim-puppet'
Bundle 'uggedal/jinja-vim'
Bundle 'groenewege/vim-less'
Bundle 'JavaScript-Indent'

" BAD pyflakes!
let g:pyflakes_use_quickfix = 0

" tComment
Bundle "tComment"
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Security
set modelines=0

" Tabs/spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Basic options
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set number
set backspace=indent,eol,start
set laststatus=2
set undofile
set backup                        " enable backups
set mouse=a

" Undo files
set undodir=~/.vim/tmp/undo//     " undo files
" Backups
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set undodir=~/.vim/tmp/undo//

" Leader
let mapleader = ","

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
map <leader><space> :noh<cr>

" Color scheme (terminal)
syntax on
set t_Co=256
set background=dark
colorscheme wombat

set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [TYPE=%Y\ %{&ff}]%=[%l/%L\]\ (%p%%)
filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent
au FileType py set foldmethod=indent

au BufNewFile,BufRead *.pp set filetype=puppet

" NERD Tree
map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$']

" And make them fucking work, too.
nnoremap j gj
nnoremap k gk

" Easy buffer navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>w <C-w>v<C-w>l

" Folding
set foldlevelstart=0
nnoremap <Space> za
vnoremap <Space> za
au BufNewFile,BufRead *.html map <leader>ft Vatzf

" Various syntax stuff
au BufNewFile,BufRead *.less set filetype=less
au BufRead,BufNewFile *.scss set filetype=scss

au BufNewFile,BufRead *.m*down set filetype=markdown
au BufNewFile,BufRead *.m*down nnoremap <leader>1 yypVr=
au BufNewFile,BufRead *.m*down nnoremap <leader>2 yypVr-
au BufNewFile,BufRead *.m*down nnoremap <leader>3 I### <ESC>

" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
set omnifunc=pythoncomplete#Complete
inoremap <Nul> <C-x><C-o>

" `gf` jumps to the filename under the cursor.  Point at an import statement
" and jump to it!
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" From http://fishshell.org/wiki/moin.cgi/Recipes at 2008-01-06
" Why does VIM give error messages when started from fish?
" (Thanks to James Vega for this solution) 
"
" When run from the fish shell, VIM gives error messages like: "E484: Can't open file /tmp/v916556/0" 
"
" The problem occurs because VIM expects to be run from a POSIX shell, although this is not mentioned anywhere in the documentation. A workaround is to add the following lines to the your local ~/.vimrc or global /etc/vimrc file:
if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif
" Assuming /bin/sh is a link to a POSIX compliant shell - even minimal shells like 'ash' or 'dash' will do.

" Syntax for multiple tag files are
" set tags=/my/dir1/tags, /my/dir2/tags
set tags=tags;$HOME/.vim/tags/

" TagBar Plugin Configuration
map <F4> :TagbarToggle<CR>

" Ack
map <leader>a :Ack 
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Yankring
nnoremap <silent> <F3> :YRShow<cr>
nnoremap <silent> <leader>y :YRShow<cr>

" Faster Esc
inoremap jj <ESC>

" Diff
nmap <leader>d :!hg diff %<cr>

" Edit .vimrc
nmap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Easy filetype switching
nnoremap _dt :set ft=htmldjango<CR>

" Shouldn't need shift
nnoremap ; :

" Stop it, hash key
inoremap # X<BS>#

if has('gui_running')
    set gfn=Inconsolata\ Medium\ 12

    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif
