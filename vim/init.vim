call plug#begin()

if (has("nvim"))
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif

Plug 'overcache/NeoSolarized'
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
  colorscheme NeoSolarized
endif

if exists('g:started_by_firenvim')
	set lines=80
	set columns=100
endif

filetype plugin on

set autoindent expandtab tabstop=2 shiftwidth=2

set encoding=utf-8
syntax on
set ruler
set nowrap
set number
set colorcolumn=80

set shortmess=I " Read :help shortmess for everything else.

nmap <leader>l NERDTree
