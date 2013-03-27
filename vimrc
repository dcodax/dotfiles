"Dann's vimrc

set nocompatible              " This must be first, because it changes other options as side effect
filetype off                  " required!
if &term =~ '256color'
	" Disable Background Color Erase (BCE) so that color schemes
	" work properly when Vim is used inside tmux and GNU screen.
	" See also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

"------------------------"  
""VUNDLE  
"------------------------"  
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'scrooloose/nerdtree'
Bundle 'guns/xterm-color-table.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
""Bundle 'Lokaltog/powerline' "updated version in python
""Bundle 'tpope/vim-fugitive'
""Bundle 'Lokaltog/vim-easymotion'
""Bundle 'rstacruz/sparkup', {'rtp': 'vim/'} "HTML magic
""Bundle 'tpope/vim-rails.git'
" vim-scripts repos
""Bundle 'L9'
""Bundle 'FuzzyFinder'
" non github repos
""Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory


"------------------------"  
""PATHOGEN  
"------------------------" 
execute pathogen#infect()
syntax on
filetype plugin indent on


"------------------------"  
""GENERAL 
"------------------------" 
set showmode
set tabstop=3
set shiftwidth=4
set autoindent
set number
set antialias
set mouse=a

set mouse+=a
if &term =~ '^screen'
	" tmux knows the extended mouse mode
	set ttymouse=xterm2
endif

set smartcase                 " almost inscase searchs
set ruler                     " view character/line number on the bottom right corner
set hidden                    " allow vim to manage multiple buffers effectively
set wildmode=list:longest     " completion useful
set hlsearch                  " highlight search terms...
set incsearch                 " ...dynamically as they are typed.
set visualbell                " do Not make noise
set noerrorbells
set showcmd                   " show current command in status bar
set showmatch                 " show matching braces
set laststatus=2              " always show the status window
"set term=screen-256color
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

set ai                        " Auto indent
set si                        " Smart indent
set wrap                      " Wrap lines


" Statusline {
		" " Not needed now when I use powerline.
		"set statusline=%t                                            " Tail of the filename.
		"set statusline+=%m                                           " Modified flag.
		"set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},            " File encoding.
		"set statusline+=%{&ff}]                                      " File format.
		"set statusline+=%h                                           " Help file flag.
		"set statusline+=%r                                           " Read only flag.
		"set statusline+=%y                                           " Filetype.
		"set statusline+=['%{getline('.')[col('.')-1]}'\ \%b\ 0x%B]   " Value of byte

		"set statusline+=%=                                           " Left/right-aligned separator.
		"set statusline+=[\%b\ 0x%B]\                                " Value of byte under cursor.
		"set statusline+=[0x%O]\                                     " Byte offset from start.
		"set statusline+=%l/%L,                                       " Cursor line/total lines.
		"set statusline+=%c                                           " Cursor column.
		"set statusline+=\ %P                                         " Percent through file.
		"set statusline+=\ 0x%B                                       " Character valur under cursor.
" " }

"------------------------"  
""COLOR SCHEME
"------------------------" 
if has("gui_running")
	colorscheme badwolf
	set guioptions-=T
	set guioptions-=l
	set guioptions-=L
	set guioptions-=r
	set guioptions-=R

else
	colorscheme badwolf
endif

let mapleader = ","           " Change <Leader> mapleader


	" NERDTree {
			let g:NERDTreeCaseSensitiveSort=1                            " Sort case sensitive.
			let g:NERDTreeMouseMode=3                                    " Single click opens folders and files.
			let NERDTreeHighlightCursorline = 1
			let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$',
                   \ '.*\.pyc$']
			nmap <leader>n :NERDTreeToggle<CR>  
			                                                             " Shortcut for NERDTreeToggle  
			"let NERDTreeShowHidden=1                                    " Show hidden files in NerdTree  
			"autocmd vimenter * NERDTree                                 " Open a NERDTree automatically when vim starts up
			"autocmd vimenter * if !argc() | NERDTree | endif            " Autoopen NERDTree when vim starts up if no files
			autocmd bufenter * if (winnr("$") == 1 &&
				\exists("b:NERDTreeType") &&
				\b:NERDTreeType == "primary") | q | endif                 " Close vim if only one left open nt
			"let g:NERDTreeQuitOnOpen=1                                  " Close tree after open.
	" }
	
	"Powerline {
			set nocompatible                                             " Disable vi-compatibility
			set laststatus=2                                             " Always show the statusline
			set encoding=utf-8                                           " Necessary to show Unicode glyphs
			let g:Powerline_symbols = 'fancy'                             " Options: compatible,unicode,fancy
	"}

"------------------------"
"WINDOWS SHORTCUTS
"------------------------"
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
"
" " window resizing shortcuts, ctrl u i o p
" nnoremap <c-u> <c-w><
" nnoremap <c-p> <c-w>>
" nnoremap <c-i> <c-w>+
" nnoremap <c-o> <c-w>-

