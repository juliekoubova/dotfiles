local wezterm  = require "wezterm"
local config = wezterm.config_builder()

config.font = wezterm.font("Cascadia Code NF", { weight = "DemiLight" })
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.tab_max_width = 42
config.color_scheme = 'Catppuccin Mocha'
config.window_padding = { left = 0, right = 0, top = 0, bottom =0 }

if wezterm.target_triple:match "-windows-" then
  config.default_cwd = "c:\\src"
  config.default_prog = { "pwsh" }
end

return config 
