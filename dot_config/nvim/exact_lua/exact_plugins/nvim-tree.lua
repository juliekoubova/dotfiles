return {
  "nvim-tree/nvim-tree.lua",
  enabled = not vim.g.started_by_firenvim and not vim.g.vscode,
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
      renderer = { group_empty = true },
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

