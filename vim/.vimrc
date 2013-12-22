" Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Fix F1~F4, Shift+Cursor in screen
set term=xterm

" Plugins
" fork of small fix.
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/ListToggle'
Bundle 'myusuf3/numbers.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'embear/vim-localvimrc'
Bundle 'vim-scripts/restore_view.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'jpalardy/vim-slime'
Bundle 'vim-scripts/SearchComplete'
Bundle 'Raimondi/delimitMate'

" Language syntax/indent/compile/etc.
Bundle 'othree/html5.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'tpope/vim-haml'
Bundle 'gkz/vim-ls'
Bundle 'groenewege/vim-less'
Bundle 'wavded/vim-stylus'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/Cpp11-Syntax-Support'

filetype plugin indent on

" Settings
syntax on
set autoindent
set autoread
set background=dark
set backspace=2
set completeopt=menuone
set confirm
set expandtab
set fileencoding=utf8
set fileencodings=utf8,big5,cp950
set foldmethod=syntax
" set foldnestmax=2
set history=1000
set hlsearch
set incsearch
set lazyredraw
set mouse=a
set number
set ruler
set shiftwidth=2
set showcmd
set smartindent
set softtabstop=2
set t_Co=256
set tabstop=2
set title
set undofile
set viewoptions=cursor,folds,slash,unix
set wildmenu
colorscheme torte

" Custom keybinding
let mapleader='.'
nnoremap ; :
nnoremap <BackSpace> gT
nnoremap <Tab> gt
nnoremap ` <C-w>w
nmap <silent> <leader>/ :nohlsearch<CR>
cmap w!! w !sudo tee % > /dev/null
noremap <S-Up> <Up>
noremap <S-Down> <Down>
inoremap <S-Up> <Up>
inoremap <S-Down> <Down>
nnoremap <leader>a <C-a>
nnoremap <leader>x <C-x>
" imap {<CR> {<ESC>o}<ESC>%a<CR>
set pastetoggle=<F2>

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Custom auto-complete menu colors
highlight PmenuSel ctermfg=white ctermbg=20
highlight Pmenu ctermfg=252 ctermbg=17

" Extra whitespace on line end.
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Filetype specific settings
autocmd BufNewFile,BufRead *.coffee,*.ls setl foldmethod=indent
" YCM doesn't recognize Cpp11 file type.
" autocmd BufNewFile,BufRead *.cpp set filetype=cpp11
" autocmd BufNewFile,BufRead *.h set filetype=cpp11
autocmd BufNewFile,BufRead *.html set filetype=htmldjango

let c_no_curly_error=1

" NERDTree
let NERDTreeWinSize=33
let NERDTreeIgnore=['\.o$', '\.a$', '\.d$', '\.pyc', '\.swo', '\.swp', '\.un\~', '\.un']
let g:nerdtree_tabs_open_on_console_startup=1
nnoremap n :NERDTreeTabsToggle<CR>

" NERDCommenter
let g:NERDSpaceDelims=1

" YouCompleteMe
let g:ycm_confirm_extra_conf=0
noremap <F5> :YcmForceCompileAndDiagnostics<CR>
inoremap <F5> <ESC>:YcmForceCompileAndDiagnostics<CR>
noremap <C-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>
inoremap <C-g> <ESC>:YcmCompleter GoToDefinitionElseDeclaration<CR>
autocmd! BufWritePost * silent YcmForceCompileAndDiagnostics

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_mode_map={ 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checkers=['gjslint']

" EasyMotion
let g:EasyMotion_leader_key='<Leader>'

" Numbers.vim
let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree']

" Local vimrc
let g:localvimrc_whitelist=''

" Indent guide
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

" ListToggle
let g:lt_location_list_toggle_map='<leader>l'
let g:lt_quickfix_list_toggle_map='<leader>q'

" DelimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_balance_matchpairs = 1
inoremap <C-D> <C-R>=delimitMate#JumpMany()<CR>
" prevent confilct with YCM gotodefinition
autocmd BufNewFile,BufRead,BufEnter * silent! iunmap <buffer> <C-g>g

" Status line
highlight StatusLine cterm=none ctermbg=235
highlight StatusLineNC ctermfg=252 ctermbg=235
highlight User1 ctermfg=blue ctermbg=235
highlight User2 ctermfg=red ctermbg=235
highlight User3 ctermfg=yellow ctermbg=235
highlight User4 ctermfg=green ctermbg=235
set laststatus=2
set statusline=%=%1*
set statusline+=%{getcwd()}/%f
set statusline+=\ %2*[%{&encoding}/%{&fileformat}/%Y]
set statusline+=\ %3*%l,%c
set statusline+=\ %4*%-4P

