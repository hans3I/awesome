client.connect_signal("request::titlebars", function(c)
  -- buttons for the titlebar
  local buttons = gears.table.join(
    awful.button({ }, 1, function()
      client.focus = c
      c:raise()
      awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
      client.focus = c
      c:raise()
      awful.mouse.client.resize(c)
    end)
  )
  awful.titlebar(c, {
    size = 30,
  }):setup {
    {
      { -- Left
        awful.titlebar.widget.iconwidget(c),
        buttons = buttons,
        layout = wibox.layout.fixed.horizontal,
      },
      { -- Middle
        { -- Title
          align  = 'center',
          widget = awful.titlebar.widget.titlewidget(c)
        },
        buttons = buttons,
        layout  = wibox.layout.flex.horizontal
      },
      { -- Right
        {
          awful.titlebar.widget.floatingbutton(c),
          awful.titlebar.widget.minimizebutton(c),
          -- awful.titlebar.widget.maximizedbutton(c),
          awful.titlebar.widget.closebutton(c),
          spacing = dpi(15),
          layout = wibox.layout.fixed.horizontal()
        },
        top = dpi(5),
        bottom = dpi(5),
        widget = wibox.container.margin
      },
      layout = wibox.layout.align.horizontal
    },
    right = dpi(10),
    left = dpi(10),
    top = dpi(3),
    bottom = dpi(3),
    widget = wibox.container.margin
  }
end)
