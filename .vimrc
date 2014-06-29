" .vimrc
" johan

set nocompatible "use vim settings instead of vi
set backspace=indent,eol,start "allow backspace in insert
 
set backup "keep a backup file

set history=1000
set ruler "show the cursor position all the time
set showcmd "display incomplete commands
set incsearch "do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" fix CTRL-U
inoremap <C-U> <C-G>u<C-U>

if has('mouse')
  set mouse=a "use mouse if ok
endif

if &t_Co > 2 || has("gui_running")
  syntax on "syntax highlighting
  set hlsearch "highlight last used search pattern
endif

if has("autocmd") " Only do this part when compiled with support for autocommands.
  filetype plugin indent on " Enable file type detection and indention.
else
  set autoindent		" always set autoindenting on
endif

"set tabstop=4
"set shiftwidth=4
"set softtabstop=4

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set hidden " hide buffers instead of closing them
set undolevels=1000

filetype plugin on

if has ("gui_running")
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
	set lines=40
	set columns=120
	winpos 350 40
endif
	
set t_Co=256
colorscheme zenburn

"latex stuff
"setlocal makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ $*\\\|\ grep\ \-E\ '\\w+:[0-9]{1,4}:\\\ ' 
"setlocal errorformat=%f:%l:\ %m 
"map <buffer> <F3> :w<CR>:make %<<CR>
"map <buffer> <F3> :!~/bin/mlwrRelPath.sh ThesisReport ~/Dropbox/ThesisReport_v1_WSL<CR>
"map <buffer> <F4> :!evince %<.pdf &<CR>
"map <F5> :cprev<CR> 
"map <F6> :cnext<CR> 
"map <F7> :clist<CR>

let mapleader = ","

" Switch between buffers
map <Leader>bb :ls<CR>:buffer<Space>
map <Leader>ee :bnext<cr>
map <Leader>ww :bprevious<cr>

" Save and load session
" To source the current file do (good for sourcing this rc):
"	:so %
map <Leader>ms :mksession! ~/.vim/jl_session.vim
map <Leader>os :source ~/.vim/jl_session.vim

"step over rows in editor instead of wrapped lines
nnoremap j gj
nnoremap k gk

"toggle mode, to not have any indentation for paste
set pastetoggle=<F2>

"sudo write
cmap w!! w !sudo tee % >/dev/null

"remove startup message
set shortmess+=I

"shell-like autocompletion
set wildmode=longest,list

"split below and to the right
set splitbelow
set splitright

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Toggle spell checking on and off with ',s'
nmap <silent> <leader>s :set spell!<CR>

"Enable and disable mouse use
cnoremap <F1> :call ToggleMouse() <CR>
function! ToggleMouse()
if &mouse == 'a'
set mouse=
echo "Mouse usage disabled"
else
set mouse=a
echo "Mouse usage enabled"
endif
endfunction

" vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
filetype plugin indent on

" Switching between relative and absolute line numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
	set norelativenumber
  else
    set relativenumber
	set nonumber
  endif
endfunc
nnoremap <leader>n :call NumberToggle()<cr>

"" Disable arrow keys to learn the hjkl
"map <Left> <Nop>
"map <Right> <Nop>
"map <Up> <Nop>
"map <Down> <Nop>
"map <PageUp> <Nop>
"map <PageDown> <Nop>
"
"" Disable mouse in insert mode
"if &mouse=='a'
":imap <LeftMouse> <nop>
":imap <2-LeftMouse> <nop>
"else
":map <LeftMouse> <nop>
":map <2-LeftMouse> <nop>
"endif
