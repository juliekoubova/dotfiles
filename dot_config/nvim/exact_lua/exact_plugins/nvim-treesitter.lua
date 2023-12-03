return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require('nvim-treesitter.configs').setup({
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      highlight = {
        enable = true,
        disable = function()
          -- check if 'filetype' option includes 'chezmoitmpl'
          if string.find(vim.bo.filetype, 'chezmoitmpl') then
            return true
          end
        end,
      },
    })
  end
}
