" VUNDLE START
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'vim-scripts/SearchComplete'
Bundle 'kien/ctrlp.vim'

Bundle 'jnurmine/Zenburn'
Bundle 'altercation/vim-colors-solarized.git'
Bundle '29decibel/codeschool-vim-theme'


filetype plugin indent on
" VUNDLE STOP

" General
set number
let mapleader = ","

" Folding
set nofoldenable

" Indent
set shiftwidth=2
set tabstop=2
set smartindent

" Search
set showmatch
set incsearch
set ignorecase

" Syntax Highlight
syntax enable
colorscheme zenburn

" GUI
if has("gui_running")
	if has("gui_gtk2")
		set guifont=Inconsolata\ 13
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	endif
endif

set guioptions=egmrt
let &guicursor = &guicursor . ",a:blinkon0" " No Blink

" Console
set t_Co=256
set mouse=a
set clipboard=unnamed
set vb t_vb= " No Beep
set icon
set ttyfast
set title

" Nerd-Tree
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Makefile
:map <Leader>mm :w<CR>:!make<CR>

" Tabs
set showtabline=2
:map <Leader>tp :tabprevious<cr>
:map <Leader>tn :tabnext<cr>
:map <Leader>tt :tabnew<cr>

" undo
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" Latex
let g:LatexBox_no_mappings=1
let g:LatexBox_viewer = 'okular --unique'
:map <Leader>lt :LatexTOC<cr>
:map <Leader>ll :Latexmk<cr>
:map <Leader>lv :LatexView<cr>
:map <Leader>lw :w<cr>:Latexmk<cr>
function! SyncTexForward()
	let s:syncfile = fnamemodify(fnameescape(Tex_GetMainFileName()), ":r").".pdf"
	let execstr = "silent !okular --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' &'
	exec execstr
endfunction
nmap <Leader>lf :call SyncTexForward()<CR>

" Directory
:map <Leader>cd :cd %:p:h<CR>
