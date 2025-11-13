return {
  "nvim-tree/nvim-tree.lua",
  cond = not (vim.g.started_by_firenvim or vim.g.vscode),
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    { "<Leader>ft", "<Cmd>NvimTreeOpen<CR>" },
    { "<C-L>", "<Cmd>NvimTreeFindFile<CR>" },
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
    hijack_cursor = true,
    hijack_directories = { enable = false },
    renderer = {
      group_empty = true,
      indent_markers = { enable = true },
    },
    view = {
      width = 30,
    },
    update_focused_file = { enable = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function(data)
        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1
        if not directory then
          return
        end
        -- change to the directory
        vim.cmd.cd(data.file)
        -- create a new empty buffer
        vim.cmd.enew()
        -- open the tree
        require("nvim-tree.api").tree.toggle({ focus = false })
        -- delete the directory buffer
        vim.cmd.bdelete(data.buf)
      end,
    })

  end,
}
