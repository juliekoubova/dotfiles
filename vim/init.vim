call plug#begin()

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'overcache/NeoSolarized'
Plug 'f-person/git-blame.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
colorscheme catppuccin-mocha

filetype plugin on

" Indenting
set autoindent expandtab tabstop=2 shiftwidth=2

set autoread
set cursorline
set encoding=utf-8
set ruler
set nowrap
set number

set incsearch ignorecase smartcase

" Text width
set colorcolumn=80
set textwidth=80

syntax on

" Read :help shortmess for everything else
set shortmess=I 

let g:mapleader = ","
noremap <leader>s :Files<CR>
noremap <leader>b :Buffer<CR>

noremap <C-P> :Files<CR>
noremap <C-A-L> :NvimTreeFindFileToggle<CR>

" Move lines
nnoremap <A-k> <CMD>m .-2<CR>==
nnoremap <A-j> <CMD>m .+1<CR>==

" Clear search with <Esc>
nnoremap <Esc> <Cmd>noh<CR><Esc>
inoremap <Esc> <Cmd>noh<CR><Esc>

" Assume we're in dotfiles/vim/init.vim
let $DOTFILES = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

augroup julie
  autocmd! 
  autocmd BufWritePost $DOTFILES/vim/*.{vim,lua} 
    \ source $MYVIMRC |
    \ echo $MYVIMRC . " reloaded"
augroup END

if has('nvim')
  source $DOTFILES/vim/init-nvim-tree.lua
endif
