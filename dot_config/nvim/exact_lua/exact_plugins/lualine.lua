return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- Based on Eviline config for lualine
    -- Author: shadmansaleh
    -- Credit: glepnir

    -- Color table for highlights
    -- stylua: ignore
    local colors = {
      yellow   = '#ECBE7B',
      cyan     = '#008080',
      darkblue = '#081633',
      green    = '#98be65',
      orange   = '#FF8800',
      violet   = '#a9a1e1',
      magenta  = '#c678dd',
      blue     = '#51afef',
      red      = '#ec5f67',
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local lsp_server = {
      function()
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return ''
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return ''
      end,
      color = { fg = '#ffffff', gui = 'bold' },
    }

    require('lualine').setup({
      options = {
        disabled_filetypes = { 'Prompt', 'NvimTree' },
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = {
          { 'filename', cond = conditions.buffer_not_empty },
          'location',
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
          }
        },
        lualine_x = {
          lsp_server,
          {
            'o:encoding', -- option component same as &encoding in viml
            cond = conditions.hide_in_width,
            color = { gui = 'bold' },
          },
          {
            'fileformat',
            fmt = string.lower,
            icons_enabled = false,
            color = { fg = colors.green, gui = 'bold' },
          },
          {
            'branch',
            icon = '',
            color = { fg = colors.violet, gui = 'bold' },
          },
          {
            'diff',
            -- Is it me or the symbol for modified us really weird
            symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.orange },
              removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
          }
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end
}
