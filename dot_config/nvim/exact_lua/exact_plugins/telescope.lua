return {
  "nvim-telescope/telescope.nvim",
  enabled = not (vim.g.started_by_firenvim or vim.g.vscode),
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
    },
  },
  event = "VeryLazy",
  keys = {
    { "<Leader>ff", "<Cmd>Telescope find_files<CR>" },
    { "<Leader>fb", "<Cmd>Telescope buffers<CR>" },
    { "<Leader>fr", "<Cmd>Telescope registers<CR>" },
    { "<Leader>fs", "<Cmd>Telescope live_grep<CR>" },
    { "<Leader>gco", "<Cmd>Telescope git_branches<CR>" },
  },
  opts = {
    layout_config = {
      prompt_position = "top",
    },
    defaults = {
      prompt_prefix = "❯ ",
      sorting_strategy = "ascending",
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        layout_config = {
          height = 0.70,
        },
      },
      buffers = {
        show_all_buffers = true,
        theme = "ivy",
      },
      live_grep = {
        theme = "ivy",
      },
      git_status = {
        git_icons = {
          added = " ",
          changed = " ",
          copied = " ",
          deleted = " ",
          renamed = "➡",
          unmerged = " ",
          untracked = " ",
        },
        previewer = true,
        theme = "ivy",
      },
    },
  },
  config = function(plugin, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
  end,
}
