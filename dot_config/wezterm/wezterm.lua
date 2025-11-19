local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.cursor_blink_rate = 0
config.font = wezterm.font("Cascadia Code NF", { weight = "DemiLight" })
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = true
config.prefer_to_spawn_tabs = true
config.tab_bar_at_bottom = true
config.tab_max_width = 42
config.use_fancy_tab_bar = false
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

if wezterm.target_triple:match("-windows-") then
  config.default_cwd = "c:\\src"
  config.default_prog = { "pwsh" }
end

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 800 }
config.keys = require("keys")

wezterm.on("gui-startup", function(cmd)
  if not cmd then
    local window = require("workspaces")()
    local gui_window = window:gui_window()
    gui_window:toggle_fullscreen()
  end
end)

return config
