-- Indenting
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.autoread = true
vim.o.encoding = "utf-8"
vim.o.swapfile = false
vim.o.undofile = true

vim.o.cursorline = true
vim.o.shortmess = 'aI'
vim.o.wrap = false
vim.o.number = true
vim.o.ruler = true
vim.o.list = true
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.mousemoveevent = true

-- Search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Text width
vim.o.colorcolumn = 80
vim.o.textwidth = 80

-- gitblame
vim.g.gitblame_enabled = 1
vim.g.gitblame_date_format = '%r'

-- Completion
vim.g.completeopt = { "menuone", "noinsert", "noselect" }

-- Disable nterw for nvim-tree
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    vim.wo.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    vim.wo.relativenumber = false
  end,
})
