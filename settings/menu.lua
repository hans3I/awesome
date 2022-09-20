local menubar = require("menubar")
local menu = {
  { "Refresh", awesome.restart },
  { "Logout", function() awesome.quit() end },
  { "PowerOff", function() awful.spawn.with_shell('loginctl poweroff') end },
  { "Restart", function() awful.spawn.with_shell('loginctl reboot') end },
}

local main = awful.menu {
  items = {
    {
      "Awesome",
      menu,
    },
    { "Launcher", function() menubar.show() end },
    { "Terminal", "kitty" },
    { "Browser", "firefox" },
    { "Editor", "kitty nvim" },
  }
}

main.wibox.shape = help.rrect(2)

root.buttons(gears.table.join(
  awful.button({ }, 3, function () main:toggle() end)
))
