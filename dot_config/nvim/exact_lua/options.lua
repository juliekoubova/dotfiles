-- Indenting
vim.o.autoindent         = true
vim.o.expandtab          = true
vim.o.tabstop            = 2
vim.o.shiftwidth         = 2

vim.o.autoread           = true
vim.o.encoding           = "utf-8"
vim.o.swapfile           = false
vim.o.undofile           = true

vim.o.cursorline         = true
vim.o.list               = true
vim.o.mousemodel         = 'popup_setpos'
vim.o.mousemoveevent     = true
vim.o.number             = true
vim.o.numberwidth        = 4
vim.o.ruler              = true
vim.o.shortmess          = 'aFIW'
vim.o.showmode           = false
vim.o.termguicolors      = true
vim.o.wrap               = false

-- Search
vim.o.incsearch          = true
vim.o.ignorecase         = true
vim.o.smartcase          = true

-- Text width
vim.wo.colorcolumn       = '+1'
vim.o.textwidth          = 80

-- Completion
vim.g.completeopt        = { "menuone", "noinsert", "noselect" }

-- Disable netrw for nvim-tree
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.o.title = true

vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    vim.wo.relativenumber = false
  end,
})

vim.cmd('autocmd TermOpen * setlocal nonumber')
vim.cmd('autocmd TermEnter * setlocal signcolumn=no')

vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
  callback = function()
    if vim.o.buftype == 'terminal' then
      vim.cmd.startinsert()
    end
  end,
})
