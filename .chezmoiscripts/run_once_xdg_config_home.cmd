@echo off
echo Setting XDG_CONFIG_HOME to "%USERPROFILE%\.config"
setx XDG_CONFIG_HOME "%USERPROFILE%\.config" || exit 1
exit 0
