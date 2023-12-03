return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('nvim-tree').setup({
      actions = {
        open_file = { quit_on_open = false },
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
  end
}

