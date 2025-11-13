-- invoked from .chezmoiscripts/run_after_nvim.{cmd,sh}
require("lazy").sync({ wait = true })
vim.cmd("TSUpdateSync")
