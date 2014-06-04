" Vundle
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Fix F1~F4, Shift+Cursor in screen
set term=xterm

" Plugins
Plugin 'SirVer/ultisnips'
Plugin 'peter50216/VimSnippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/ListToggle'
Plugin 'myusuf3/numbers.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'embear/vim-localvimrc'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'jpalardy/vim-slime'
Plugin 'vim-scripts/SearchComplete'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Language syntax/indent/compile/etc.
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-haml'
Plugin 'gkz/vim-ls'
Plugin 'groenewege/vim-less'
Plugin 'wavded/vim-stylus'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/Cpp11-Syntax-Support'
Plugin 'slim-template/vim-slim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'dag/vim2hs'
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" Settings
syntax on
set autoindent
set autoread
set background=dark
set backspace=2
set completeopt=menuone
set confirm
set display=lastline
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
let NERDTreeWinSize=20
let NERDTreeIgnore=['\.o$', '\.a$', '\.d$', '\.pyc', '\.swo', '\.swp', '\.un\~', '\.un']
let g:nerdtree_tabs_open_on_console_startup=1
nnoremap n :NERDTreeTabsToggle<CR>

" NERDCommenter
let g:NERDSpaceDelims=1

" YouCompleteMe
let g:ycm_confirm_extra_conf=0
" To avoid problem with hack below for UltiSnip
let g:ycm_key_list_select_completion = []
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

" UltiSnip
" Hack from http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-N>"
    else
      return "\<TAB>"
    endif
  endif
  return ""
endfunction

let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<C-E>"
let g:UltiSnipsJumpBackwardTrigger="<C-Q>"
let g:UltiSnipsListSnippets="<C-L>"
let g:UltiSnipsEditSplit="horizontal"
autocmd BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Vim-Go
let g:go_auto_type_info=1

" Colors
highlight Folded ctermfg=243 ctermbg=234 guifg=Cyan guibg=DarkGrey
highlight FoldColumn ctermbg=234 guifg=Cyan guibg=Grey

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

