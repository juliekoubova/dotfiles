local telescope = require('telescope')

telescope.setup{
  layout_config = {
    prompt_position = 'top',
  },
  defaults = {
    prompt_prefix = '❯ ',
    sorting_strategy = 'ascending',
  },
  pickers = {
    find_files = {
      find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
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
}

telescope.load_extension('fzf')
