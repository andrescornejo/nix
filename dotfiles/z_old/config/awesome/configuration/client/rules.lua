local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local clientkeys = require('configuration.client.client')
local clientbuttons = require('configuration.client.mouse')

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  { rule = { },
    properties = { border_width = beautiful.border_width,
                    border_color = beautiful.border_normal,
                    focus = awful.client.focus.filter,
                    raise = true,
                    keys = clientkeys,
                    buttons = clientbuttons,
                    screen = awful.screen.preferred,
                    placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  },

  -- Floating clients.
  { rule_any = {
      instance = {
        "DTA",  -- Firefox addon DownThemAll.
        "copyq",  -- Includes session name in class.
        "pinentry",
      },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "MessageWin",  -- kalarm.
        "Sxiv",
        "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
        "Wpa_gui",
        "veromix",
        "xtightvncviewer"},

      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        "Event Tester",  -- xev.
      },
      role = {
        "AlarmWindow",  -- Thunderbird's calendar.
        "ConfigManager",  -- Thunderbird's about:config.
        "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
      }
    }, properties = { floating = true }},

  ---------------------------------------------
    -- Start application on specific workspace --
    ---------------------------------------------
    -- Browsing
    { rule_any = {
      class = {
          "Firefox",
          "qutebrowser",
      },
      except_any = {
          role = { "GtkFileChooserDialog" },
          type = { "dialog" }
      },
    }, properties = { screen = 1, tag = awful.screen.focused().tags[1] } },

    --Editing
    { rule_any = {
      class = {
        "Emacs",
        "Subl3",
        "vscodium",
        },
    }, properties = { screen = 1, tag = awful.screen.focused().tags[2] } },

    -- Games
    { rule_any = {
        class = {
            "dota2",
            "Terraria.bin.x86",
            "dontstarve_steam",
            "Wine",
        },
    }, properties = { screen = 1, tag = awful.screen.focused().tags[5] } },

    -- Gaming clients
    { rule_any = {
      class = {
          "Steam",
          "battle.net.exe",
          "Lutris",
      },
    }, properties = { screen = 1, tag = awful.screen.focused().tags[5] } },

    -- Chatting
    { rule_any = {
        class = {
            "discord",
            "TelegramDesktop",
            "Signal",
            "TeamSpeak 3",
        },
    }, properties = { screen = 1, tag = awful.screen.focused().tags[6], floating = false } },

  -- Photo editing
  { rule_any = {
      class = {
          "Gimp",
          "Inkscape",
      },
  }, properties = { screen = 1, tag = awful.screen.focused().tags[7] } }

  -- Set Firefox to always map on the tag named "2" on screen 1.
  -- { rule = { class = "Firefox" },
  --   properties = { screen = 1, tag = "2" } },
}
-- }}}
