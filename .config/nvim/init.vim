let mapleader=" "

" ____  _             _
" |  _ \| |_   _  __ _(_)_ __  ___
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"               |___/
"
call plug#begin('~/.local/share/nvim/plugged')
" test zone
Plug 'mhinz/vim-signify'
    let g:signify_sign_add               = '✚'
    let g:signify_sign_delete            = '_'
    let g:signify_sign_delete_first_line = '✖'
    let g:signify_sign_change            = '✹'
Plug 'junegunn/goyo.vim'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'romainl/vim-qf'
Plug 'tpope/vim-repeat'

" bonus
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
if executable('fzf')
    Plug 'junegunn/fzf.vim'
    " make the Rg command only search for text and not the file name
    command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

    " KEYMAPS: FZF
    nnoremap <silent> <Leader>f :Files<CR>
    nnoremap <silent> <Leader>b :Buffers<CR>
    nnoremap <silent> <c-f> :Rg<CR>
    nnoremap <silent> <Leader>/ :BLines<CR>
    nnoremap <silent> <Leader>' :Marks<CR>
    nnoremap <silent> <Leader>H :Helptags<CR>
    nnoremap <silent> <Leader>hh :History<CR>
    nnoremap <silent> <Leader>h: :History:<CR>
    nnoremap <silent> <Leader>h/ :History/<CR>

endif
if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'
    let g:NERDTreeGitStatusIndicatorMapCustom = {
                    \ 'Modified'  :'✹',
                    \ 'Staged'    :'✚',
                    \ 'Untracked' :'✭',
                    \ 'Renamed'   :'➜',
                    \ 'Unmerged'  :'═',
                    \ 'Deleted'   :'✖',
                    \ 'Dirty'     :'✗',
                    \ 'Ignored'   :'☒',
                    \ 'Clean'     :'✔︎',
                    \ 'Unknown'   :'?',
                    \ }
    let g:NERDTreeIgnore = ['^node_modules$']
    nnoremap ç :NERDTreeToggle<cr>
Plug 'w0rp/ale'
"Plug 'Yggdroot/indentLine'
"Plug 'ajh17/VimCompletesMe'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
" Plug 'ludovicchabant/vim-gutentags'

" editing
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-surround'

" use emmet with \",,"
Plug 'mattn/emmet-vim'
    let g:user_emmet_leader_key=','
    let g:user_emmet_install_global = 0
    augroup emmet
        autocmd!
        autocmd FileType html,html.*,css,js EmmetInstall
    augroup END
Plug 'mustache/vim-mustache-handlebars'
    let g:mustache_abbreviations = 1
Plug 'ctholho/fountain.vim'
" Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'sheerun/vim-polyglot'

" theming
" Plug 'vim-airline/vim-airline'
let g:airline_theme = 'codedark'
Plug 'vim-scripts/wombat256.vim'
Plug 'endel/vim-github-colorscheme'
Plug 'tomasiser/vim-code-dark'
call plug#end()

syntax on
set termguicolors
colorscheme codedark

set cursorline

set mouse=a

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

set hidden

nnoremap <c-w>a <c-w>o:vs<cr><c-w>h
nnoremap à :b#<cr>
nnoremap é :wa<cr>
nnoremap c* *Ncgn

" lets me add files with wildcards, like **/*.md for all markdown files, very useful.
nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
nnoremap <leader>e :e **/
nnoremap <leader>m :make<cr>

" remove white spaces on buffer write
autocmd BufWritePre * :%s/\s\+$//e

if exists('&inccommand')
  set inccommand=split
endif

" reload vimrc on buffer save
if has('autocmd')
    augroup reload_vimrc
        autocmd!
        autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
    augroup END
endif
