return {
  "nvim-tree/nvim-tree.lua",
  cond = not (vim.g.started_by_firenvim or vim.g.vscode),
  dependencies = { "nvim-tree/nvim-web-devicons" },
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
    hijack_cursor = true,
    hijack_directories = { enable = false },
    renderer = {
      group_empty = true,
      indent_markers = { enable = true },
    },
    view = {
      width = 30,
    },
    update_focused_file = { enable = true }
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
      end
    })

    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        local nvimtree_windows = {}
        for _, w in ipairs(vim.api.nvim_list_wins()) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match("NvimTree_") ~= nil then
            table.insert(nvimtree_windows, w)
          end
        end
        -- Should quit, so we close all invalid windows.
        for _, w in ipairs(nvimtree_windows) do
          vim.api.nvim_win_close(w, true)
        end
      end
    })
  end
}
