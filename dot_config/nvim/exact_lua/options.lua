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
vim.o.list = true
vim.o.mousemodel = "popup_setpos"
vim.o.mousemoveevent = true
vim.o.number = true
vim.o.numberwidth = 4
vim.o.ruler = true
vim.o.shortmess = "aFIW"
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.wrap = false

-- Search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Text width
vim.wo.colorcolumn = "+1"
vim.o.textwidth = 80

-- Completion
vim.g.completeopt = { "menuone", "noinsert", "noselect" }

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Special UI symbols
vim.o.fillchars = "eob: ,fold:╌"
vim.o.listchars = "extends:…,nbsp:␣,precedes:…,tab:> "

vim.o.title = true

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.wo.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = function()
    if vim.o.buftype == "terminal" then
      vim.opt_local.number = false
      vim.opt_local.signcolumn = 'no'
      vim.cmd.startinsert()
    end
  end,
})

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local windows_to_close = {}
    for _, w in ipairs(vim.api.nvim_list_wins()) do

      local bufno = vim.api.nvim_win_get_buf(w)
      local bufname = vim.api.nvim_buf_get_name(bufno)
      if bufname:match("NvimTree_") ~= nil then
        table.insert(windows_to_close, w)
      end

      local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufno })
      if buftype == "terminal" then
        table.insert(windows_to_close, w)
      end
    end
    for _, w in ipairs(windows_to_close) do
      vim.api.nvim_win_close(w, true)
    end
  end,
})
