
require('nvim-tree').setup({
  actions = {
    open_file = { quit_on_open = true },
  },
  filters = {
    custom = {
      "^\\.git",
    },
  },
  git = { enable = false },
  update_focused_file = { enable = true }
})

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function(data)
  if vim.fn.isdirectory(data.file) == 1 then
    vim.cmd.cd(data.file)
    vim.cmd.enew()
    require('nvim-tree.api').tree.open()
  end
end })

