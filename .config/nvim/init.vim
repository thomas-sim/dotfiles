syntax on
set termguicolors
set background=light

set cursorline

set mouse=a

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

set hidden

set linebreak
let mapleader=" "

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

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-repeat'

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'rmagatti/auto-session'
    Plug 'rmagatti/session-lens'

Plug 'lambdalisue/fern.vim'
Plug 'machakann/vim-highlightedyank'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'EdenEast/nightfox.nvim'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'

Plug 'neovim/nvim-lspconfig'
" This is the main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" test zone
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
" Plug 'justinmk/vim-sneak'
Plug 'ggandor/lightspeed.nvim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-unimpaired'

Plug 'romainl/vim-qf'

" bonus
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
if executable('fzf')
    " make the Rg command only search for text and not the file name
    command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
endif

if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif

Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'

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
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
" let g:gutentags_ctags_exclude=['node_modules']

" editing
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tommcdo/vim-exchange'
Plug 'chiedo/vim-case-convert'

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
" Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'sheerun/vim-polyglot'

" theming
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
let g:one_allow_italics = 1 " I love italic for comments
Plug 'zefei/cake16'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='solarized'

call plug#end()
colorscheme one

set guifont=FantasqueSansMono\ NF:h7
let g:neovide_cursor_animation_length=0.05

cabbr <expr> %% expand('%:p:h')

nnoremap à :b#<CR>
