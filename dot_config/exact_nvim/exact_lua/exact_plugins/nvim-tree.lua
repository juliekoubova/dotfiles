return {
  "nvim-tree/nvim-tree.lua",
  cond = not (vim.g.started_by_firenvim or vim.g.vscode),
  dependencies = { "nvim-tree/nvim-web-devicons" },
  hijack_directories = { enable = true },
  lazy = false,
  keys = {
    { '<Leader>ft', '<Cmd>NvimTreeOpen<CR>', desc = 'NvimTree' },
  },
  opts = {
    actions = {
      open_file = {
        quit_on_open = false,
        resize_window = false,
      },
    },
    filters = {
      custom = {
        "^\\.git",
      },
    },
    git = { enable = false },
    renderer = { group_empty = true, indent_markers = { enable = true } },
    update_focused_file = { enable = true }
  }
}
