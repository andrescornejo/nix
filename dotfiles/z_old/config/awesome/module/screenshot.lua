local awful = require('awful')
local gears = require('gears')
local naughty = require('naughty')

function take_screenshot()
    awful.spawn.with_shell(gears.filesystem.get_configuration_dir() .. "/scripts/screenshot.sh -f")
    naughty.notify{ 
        title = "Screenshot taken", 
        text = "Saved in: ~/Pictures/Screenshots/",
        timeout = 2 
    }
end

function take_active_window()
    awful.spawn.with_shell(gears.filesystem.get_configuration_dir() .. "/scripts/screenshot.sh -w")
    naughty.notify{ 
        title = "Screenshotted active window", 
        text = "Saved in: ~/Pictures/Screenshots/",
        timeout = 2 
    }
end

function screenshot_clipboard()
    awful.spawn.with_shell(gears.filesystem.get_configuration_dir() .. "/scripts/screenshot.sh -fc")
    naughty.notify{
        title = "Screen copied to clipboard", 
        timeout = 2
    }
end

function selection_clipboard()
    awful.spawn.with_shell(gears.filesystem.get_configuration_dir() .. "/scripts/screenshot.sh -s")
    naughty.notify{
        title = "Selection will be copied to clipboard", 
        timeout = 2
    }   
end