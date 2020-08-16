local awful = require('awful')
require('awful.autofocus')
local gears = require('gears')
local modkey = require('configuration.keys.modkey').modkey

local clientkeys = gears.table.join(
    awful.key({modkey}, 'f',
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "Toggle fullscreen", group = "Client actions"}
    ),

    awful.key({modkey}, "q",
        function (c) 
            c:kill()                         
        end,
        {description = "Close focused program", group = "Client actions"}
    ),

    awful.key({modkey}, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end,
        {description = "Toggle minimization", group = "Client actions"}
    )
)

return clientkeys