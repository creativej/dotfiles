syntax on

set bs=2

set nocompatible

set ignorecase

" optimize search
set hlsearch
set incsearch

" Enable use of mouse
set mouse=a

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

nmap <CR> i<Enter><Esc>

" Disable beep and flash with an autocmd
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


" Automatically wrap left and right
set whichwrap+=<,>,h,l,[,]

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Clear console on vim close
au VimLeave * execute ":!clear"

set backupdir=~/tmp,/tmp
set directory=~/tmp,/var/tmp,/tmp

filetype off " required
filetype plugin indent on " load filetype plugin/indent settings required
set autochdir " always switch to the current file directory
set clipboard+=unnamed
set wildmenu " turn on command line completion wild style
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,.git*,.*,logs*
set laststatus=2

set linespace=0
set autoread

"Sound
set noerrorbells
set novisualbell

if &term =~ "xterm"
    "256 color --
    let &t_Co=256
    " restore screen after quitting
    set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
endif



" Vim UI
    " set cursorcolumn " highlight the current column
    set cursorline " highlight current line
    set ruler " Always show current positions
    set report=0 "tell us when anything is changed via :....
    set number
    set showcmd " show the command being typed
    set sidescrolloff=10 " Keep 5 lines at the size
    set listchars=tab:>-,trail:- " show tabs and trailing
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    set foldlevel=99
    colorscheme jellybeans_pda

" Text Formatting/Layout
    set smartindent
    set shiftwidth=4
    set expandtab " no real tabs please!
    set tabstop=4
    set softtabstop=4 " when hitting tab or backspace, how many spaces
                        "should a tab be

" Moving line up and down
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-j> :call <SID>swap_up()<CR>
noremap <silent> <c-k> :call <SID>swap_down()<CR>
" /Moving line up and down

"Copy and paste lines
map <leader>d Yp

" Vundle
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle
    " required!
    Bundle 'gmarik/vundle'
    Bundle 'ctrlp.vim'
    Bundle 'Enhanced-Javascript-syntax'
    Bundle 'https://github.com/Lokaltog/vim-powerline.git'
    Bundle 'https://github.com/tpope/vim-fugitive.git'
    Bundle 'Python-Syntax'
    Bundle 'https://github.com/ervandew/supertab.git'
    Bundle 'toggle_mouse'
    "Bundle 'project.tar.gz'
   " Bundle 'php-doc'
    Bundle 'php.vim'
        "
        " Brief help
        " :BundleList          - list configured bundles
        " :BundleInstall(!)    - install(update) bundles
        " :BundleSearch(!) foo - search(or refresh cache first) for foo
        " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
        "
        " see :h vundle for more details or wiki for FAQ
        " NOTE: comments after Bundle command are not allowed..
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required

" CtrlP
let g:ctrlp_map = '<c-t>'
let g:ctrlp_max_height = 16
let g:ctrlp_lazy_update = 1
let g:ctrlp_max_files = 10000

" MiniBufExpl Colors
"    hi MBEVisibleActive guifg=#A6DB29 guibg=fg
"    hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
"    hi MBEVisibleChanged guifg=#F1266F guibg=fg
"    hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
"    hi MBEChanged guifg=#CD5907 guibg=fg
"    hi MBENormal guifg=#808080 guibg=fg
"

let g:Powerline_symbols = 'fancy'
