call plug#begin()
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'f-person/git-blame.nvim'
Plug 'fatih/vim-go'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kylechui/nvim-surround'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'overcache/NeoSolarized'
Plug 'sindrets/diffview.nvim'
call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " needed on Windows
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

" git-blame
let g:gitblame_enabled = 0
let g:gitblame_date_format = '%r'
noremap <leader>bl :GitBlameToggle<CR>

" Telescope
noremap <leader>ff <cmd>Telescope find_files<CR>
noremap <leader>fg <cmd>Telescope live_grep<CR>
noremap <leader>fb <cmd>Telescope buffers<CR>
noremap <leader>h  <cmd>DiffviewFileHistory<CR>
noremap <leader>g  <cmd>DiffviewOpen
noremap <leader>v  <cmd>echomsg system('curl -s -m 3 https://vtip.43z.one')<CR>

noremap <C-P>   <cmd>Telescope find_files<CR>
noremap <C-S-F> <cmd>Telescope live_grep<CR>
noremap <C-A-L> <cmd>NvimTreeFindFileToggle<CR>

" Clear search with <Esc>
nnoremap <Esc> <Cmd>noh<CR><Esc>
inoremap <Esc> <Cmd>noh<CR><Esc>

" Disable Ctrl+Z
nnoremap <C-z> <nop>

