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

vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    local buftype = vim.bo.buftype
    if buftype == "prompt" or buftype == "nofile" then
      return
    end
    vim.wo.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    vim.wo.relativenumber = false
  end,
})