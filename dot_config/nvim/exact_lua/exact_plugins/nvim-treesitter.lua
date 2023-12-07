return {
  "nvim-treesitter/nvim-treesitter",
  enabled = not vim.g.vscode,
  config = function()
    if vim.fn.has('windows') then
      -- MSVC results in "foo.so is not a valid Win32 application"
      -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting
      require('nvim-treesitter.install').compilers = { "clang" }
    end
    require('nvim-treesitter.configs').setup({
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      highlight = {
        enable = true,
      },
    })
  end
}
