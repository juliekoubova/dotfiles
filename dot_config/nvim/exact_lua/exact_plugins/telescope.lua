return {
  {
    "nvim-telescope/telescope.nvim",
    enabled      = not (vim.g.started_by_firenvim or vim.g.vscode),
    dependencies = { "nvim-lua/plenary.nvim" },
    keys         = {
      { '<leader>ff', '<cmd>Telescope find_files<CR>' },
      { '<leader>fb', '<cmd>Telescope buffers<CR>' },
      { '<leader>fr', '<cmd>Telescope registers<CR>' },
      { '<leader>fs', '<cmd>Telescope live_grep<CR>' },
      { '<leader>gco', '<cmd>Telescope git_branches<CR>' },
    },
    opts         = {
      layout_config = {
        prompt_position = 'top',
      },
      defaults = {
        prompt_prefix = '❯ ',
        sorting_strategy = 'ascending',
      },
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
          layout_config = {
            height = 0.70
          }
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
          theme = "ivy"
        }
      }
    },
    init         = function()
      require('telescope').load_extension('fzf')
    end
  }, {
  'nvim-telescope/telescope-fzf-native.nvim',
  build =
  'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
}

}
