return {
  "akinsho/toggleterm.nvim",
  opts = {
    auto_scroll = true,
    close_on_exit = true,
    direction = 'vertical',
    hide_numbers = true,
    insert_mappings = false,
    open_mapping = { '<Leader>tt' },
    start_in_insert = true,
    terminal_mappings = false,
    float_opts = { border = 'rounded' },
    persist_mode = false,
    size = function (term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return 60
      end
    end
  },
  init = function()
    vim.api.nvim_create_autocmd('TermOpen', {
      callback = function()
        local opts = { buffer = 0 }
        vim.keymap.set('t', 'jk',    [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end
    })
  end
}
