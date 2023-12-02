call plug#begin()
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'alker0/chezmoi.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'f-person/git-blame.nvim'
Plug 'fatih/vim-go'
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'kylechui/nvim-surround'
Plug 'lewis6991/gitsigns.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'overcache/NeoSolarized'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
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
set noswapfile
set nowrap
set number

set mousemoveevent

set incsearch ignorecase smartcase

" Text width
set colorcolumn=80
set textwidth=80

syntax on

" Read :help shortmess for everything else
set shortmess=I 

let g:mapleader = ","

" git-blame
let g:gitblame_enabled = 1
let g:gitblame_date_format = '%r'
noremap <leader>bl :GitBlameToggle<CR>

" Telescope
noremap <leader>ff <cmd>Telescope find_files<CR>
noremap <leader>fb <cmd>Telescope buffers<CR>
noremap <leader>fs <cmd>Telescope live_grep<CR>
noremap <leader>gs <cmd>Telescope git_status<CR>
noremap <leader>h  <cmd>DiffviewFileHistory<CR>
noremap <leader>g  <cmd>DiffviewOpen<CR>
noremap <leader>v  <cmd>echomsg system('curl -s -m 3 https://vtip.43z.one')<CR>

noremap <C-P>   <cmd>Telescope find_files<CR>
noremap <C-S-F> <cmd>Telescope live_grep<CR>
noremap <C-A-L> <cmd>NvimTreeFindFileToggle<CR>

" Clear search with <Esc>
nnoremap <Esc> <Cmd>noh<CR><Esc>
inoremap <Esc> <Cmd>noh<CR><Esc>

" Disable Ctrl+Z
nnoremap <C-z> <nop>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_enable_fuzzy_match = 1
set completeopt=menuone,noinsert,noselect
