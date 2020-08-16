local awful = require('awful')
local gears = require('gears')
local modkey = require('configuration.keys.modkey').modkey


local mousebuttons = gears.table.join(
  awful.button(
    {},
    1,
    function(c)
      _G.client.focus = c
      c:raise()
    end
  ),
  awful.button({modkey}, 1, awful.mouse.client.move),
  awful.button({modkey}, 3, awful.mouse.client.resize),
  awful.button(
    {modkey},
    4,
    function()
      awful.layout.inc(1)
    end
  ),
  awful.button(
    {modkey},
    5,
    function()
      awful.layout.inc(-1)
    end
  )
)

-- Default bindings
-- {{{ Mouse bindings
-- local mousebuttons = gears.table.join(
--     awful.button({ }, 1, function (c)
--         c:emit_signal("request::activate", "mouse_click", {raise = true})
--     end),
--     awful.button({ modkey }, 1, function (c)
--         c:emit_signal("request::activate", "mouse_click", {raise = true})
--         awful.mouse.client.move(c)
--     end),
--     awful.button({ modkey }, 3, function (c)
--         c:emit_signal("request::activate", "mouse_click", {raise = true})
--         awful.mouse.client.resize(c)
--     end),
--     awful.button({ }, 3, function () mymainmenu:toggle() end),
--     -- awful.button({ }, 4, awful.tag.viewnext),
--       awful.button(
--     {modkey},
--     4,
--     function()
--       awful.layout.inc(1)
--     end
--   ),
--   awful.button(
--     {modkey},
--     5,
--     function()
--       awful.layout.inc(-1)
--     end
--   )--,

--     -- awful.button({ }, 5, awful.tag.viewprev)
    
-- )

return mousebuttons
-- }}}