@echo off
rem Help Mason.nvim find Python; it probably doesn't like that the WindowsApps
rem stub a reparse point.
"%LocalAppData%\Microsoft\WindowsApps\python.exe" %*
