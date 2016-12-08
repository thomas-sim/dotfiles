" installer vim signify qui a l'air cool :)
" vim latex
" remap arrow to something usefull (like split management ?)
" remap split switching to something practical


" this dotfile is obviously not compatible with vi.
set nocompatible
let mapleader=" " " set leader to space

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Vundle Configuration
"{{{

" Basic Configuration
filetype off

" on détermine le répertoire des plugins vims selon l'OS hôte.
if has("unix")
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
else
    set rtp +=$HOME/vimfiles/bundle/vundle/
    call vundle#begin('$USERPROFILE/vimfiles/bundle/')
endif


" packages
"{{{

" Vundle package : vundle will auto update himself
Plugin 'gmarik/vundle'

" undoTree 
Plugin 'sjl/gundo.vim'

" Nerdtree : a reaaaally sweet sidebare explorer !!
Plugin 'scrooloose/nerdtree.git'
" NerdTreeGit : will display git status flags before files in NERDtree
Plugin 'Xuyuanp/nerdtree-git-plugin'
let NERDTreeQuitOnOpen = 1

" Ctrl-P : Sublime's Swag (and more !) in Vim ;)
" TODO replace with unite ?
Plugin 'ctrlpvim/ctrlp.vim'
imap <c-p> <Nop>
let g:ctrlp_map = '<c-p><c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" Ctrl-P basic
imap <c-p><c-p> <Esc>:CtrlP<CR>
nmap <c-p><c-p> :CtrlP<CR>
" Ctrl-P directory
imap <c-p><c-d> <Esc>:CtrlPDir<Cr>
nmap <c-p><c-d> :CtrlPDir<Cr>
" Ctrl-P MRU
imap <c-p><c-r> <Esc>:CtrlPMRU<CR>
nmap <c-p><c-r> :CtrlPMRU<CR>
" Ctrl-P line search in current buffer
imap <c-p><c-l> <Esc>:CtrlPLine %<CR>
nmap <c-p><c-l> :CtrlPLine %<CR>
" Ctrl-P buffer manager
imap <c-p><c-b> <Esc>:CtrlPBuffer<CR>
nmap <c-p><c-b> :CtrlPBuffer<CR>
" Quick switch between last used buffer
imap <c-p><c-s> <Esc>:CtrlPBuffer<CR><CR>
nmap <c-p><c-s> :CtrlPBuffer<CR><CR>
" Ctrl-P mixed mode for everything !
imap <c-p><c-m> <Esc>:CtrlPMixed<CR>
nmap <c-p><c-m> :CtrlPMixed<CR>
" Ctrp-changes modes
imap <c-p><c-c> <Esc>:CtrlPChangeAll<CR>
nmap <c-p><c-c> :CtrlPChangeAll<CR>


" Airline : sexy status bar
Plugin 'vim-airline/vim-airline'
set laststatus=2 "Will display airline on the startup of gvim
" Format the status line



" some sexy theme
Plugin 'morhetz/gruvbox'
set guifont=DejaVu\ Sans\ Mono\ 10
Plugin 'altercation/vim-colors-solarized'
Plugin 'freeo/vim-kalisi'

" Markdown syntax highlighting
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc#spell#default_langs=['fr', 'en']

" Easy Motion FTW
Plugin 'easymotion/vim-easymotion'
" let g:EasyMotion_do_mapping = 0 " disable default mapping
map <Leader> <Plug>(easymotion-prefix)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>s <Plug>(easymotion-overwin-f2)
" map <Leader>s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" Change the start screen of vim
Plugin 'mhinz/vim-startify'

" add ack search to VIM
Plugin 'mileszs/ack.vim'

"}}}

" ending 
call vundle#end()
filetype plugin indent on

"}}}

" Aesthetic tweaking
"{{{

" vertical column
set colorcolumn=80
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

syntax on " Turn on syntax highlighting
set enc=utf-8 " fix bug when displaying accents
set number " Show line number
set background=dark " select the dark theme
set visualbell " error will make the cursor blink and won't make sound

try
    colorscheme gruvbox
catch
endtry


if has ('gui_running')
        " set lines=999 columns=999 " start Vim maximize, not usefull with i3

        set guioptions-=T " no toolbar
        set guioptions-=rL " no scroll bar
        if has("win32")
            set guifont=Consolas:h11
        else
            set guifont=DejaVu\ Sans\ Mono\ 11
        endif

        set guicursor+=a:blinkon0 " no cursor blink
endif
"}}}

" Vim Behaviour tweaking
"{{{
set noswapfile " No swap file 
set lazyredraw " Vim won't redraw sreen while executing Macro
"The intro message won't display
set shortmess+=I

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
set mouse=a "Enable mouse for all modes

" indenting
" Vim will keep current identing if no filetype-specific
" indenting specified
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

set wildmenu " Better command-line completion
set wildmode=longest,full
set autoread " vim will autoread when a file is changed from outside 

" vim will hide buffers without prompting annoying stuff and will autosave
" when switching buffers.
set hidden
set autowrite

" Split behaviour
set splitbelow
set splitright


" Search Parameters
"{{{
set gdefault " vim will replace all occurencies in line by default
" set ignorecase " search will ignore case
set smartcase " if there is capital letter, vim will take case in count 
set incsearch " research as you type
" Search is highlightened and Leader L will clear highlighting
set hlsearch
map <Leader>l :noh<CR>:<CR>
"}}}
" changing the backspace behaviour : deleting indent, start of line...
set backspace=indent,eol,start

"}}}

" Shortcuts
" {{{

" jk make vim switch to normal mode <3 <3
inoremap jk <ESC>
" Ctrl backspace delete a word
imap <C-BS> <C-W>

" j and k will pass a full line and not just visual line
nnoremap j gj
nnoremap k gk

" system clipboard integration is now a breeze 
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" save me the pain of gg and G
nnoremap <CR> G
nnoremap <BS> gg

" Put the end of the line 
"}}}

