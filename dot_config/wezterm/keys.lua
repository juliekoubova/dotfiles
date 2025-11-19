local wezterm = require("wezterm")
local act = wezterm.action
local function leader_action(key, action)
  return {
    key = key,
    mods = "LEADER",
    action = action,
  }
end

local actions = {
  leader_action(
    "v",
    wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })
  ),
  leader_action("[", act.ActivateTabRelative(-1)),
  leader_action("]", act.ActivateTabRelative(1)),
  leader_action("h", act.ActivatePaneDirection("Left")),
  leader_action("j", act.ActivatePaneDirection("Down")),
  leader_action("k", act.ActivatePaneDirection("Up")),
  leader_action("l", act.ActivatePaneDirection("Right")),
  leader_action("q", act.CloseCurrentPane({ confirm = false })),
  leader_action("t", act.SpawnTab("CurrentPaneDomain")),
  leader_action("1", act.ActivateTab(0)),
  leader_action("2", act.ActivateTab(1)),
  leader_action("3", act.ActivateTab(2)),
  leader_action("4", act.ActivateTab(3)),
  leader_action("5", act.ActivateTab(4)),
  leader_action("6", act.ActivateTab(5)),
  leader_action("7", act.ActivateTab(6)),
  leader_action("8", act.ActivateTab(7)),
  leader_action("9", act.ActivateTab(-1)),
}

return actions
