local awful = require('awful')
local gears = require('gears')
require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.modkey').modkey
local altkey = require('configuration.keys.modkey').altkey
local shiftkey = require('configuration.keys.modkey').shiftkey
local ctrlkey = require('configuration.keys.modkey').ctrlkey

local apps = require('configuration.apps')

-- {{{ Key bindings
globalkeys = gears.table.join(

	awful.key({modkey}, 'F1',	hotkeys_popup.show_help,
	        {description='Show help', group='Awesome'}),
	
	awful.key({modkey, ctrlkey}, 'r', awesome.restart,
              {description = 'Reload awesome', group = 'Awesome'}),
    
	--Tag Browsing
	awful.key({modkey}, 'w',   awful.tag.viewprev,
	          {description = 'View previous', group = 'Tag Browsing'}),
	
	awful.key({modkey}, 's',  awful.tag.viewnext,
	          {description = 'View next', group = 'Tag Browsing'}),
	
	awful.key({modkey}, 'Escape', awful.tag.history.restore,
              {description = 'Go back', group = 'Tag Browsing'}),

	--Client focusing
	awful.key({modkey}, 'd',
	    function ()
	        awful.client.focus.byidx( 1)
	    end,
	    {description = 'Focus next by index', group = 'Client focusing'}
	),
	awful.key({modkey}, 'a',
	    function ()
	        awful.client.focus.byidx(-1)
	    end,
	    {description = 'Focus previous by index', group = 'Client focusing'}
	),

	awful.key({modkey}, 'u', 
		awful.client.urgent.jumpto, 
		{description = 'Jump to urgent client', group = 'Client focusing'}
	),

	awful.key({modkey},'e',
  		function()
    	        screen.primary.left_panel:toggle(true)
  		end,
  		{description = 'Show main menu', group = 'awesome'} --TODO
    ),

    awful.key({modkey}, 'Tab',
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = 'Previously focused client', group = 'Client focusing'}
    ),

    --Client Actions
    awful.key({ modkey, shiftkey}, 'd',
        function () 
            awful.client.swap.byidx(  1)   
        end,
        {description = "Swap with next client by index", group = "Client actions"}
    ),

    awful.key({ modkey, shiftkey}, 'a', 
        function () 
            awful.client.swap.byidx( -1)    
        end,
    {description = "Swap with previous client by index", group = "Client actions"}
    ),


	--Volume Controls
	awful.key({ }, 'XF86AudioRaiseVolume',
		function()
			awful.spawn.with_shell(os.getenv('HOME') .. '/.config/scripts/volume_control.sh up')
		end,
	{description = 'Raise volume', group = 'Volume Controls'}),

	awful.key({ }, 'XF86AudioLowerVolume',
		function()
			awful.spawn.with_shell(os.getenv('HOME') .. '/.config/scripts/volume_control.sh down')
		end,
	{description = 'Lower volume', group = 'Volume Controls'}),

	awful.key({ }, 'XF86AudioMute',
		function()
			awful.spawn.with_shell(os.getenv('HOME') .. '/.config/scripts/volume_control.sh mute')
		end,
	{description = 'Toggle mute', group = 'Volume Controls'}),

	--Media Controls
	awful.key({ }, 'XF86AudioPlay',
		function()
			awful.spawn.with_shell('playerctl play-pause')
		end,
		{description = 'Play/Pause', group = 'Media Controls'}
	),

	awful.key({ }, 'XF86AudioStop',
		function()
			awful.spawn.with_shell('playerctl stop')
		end,
	{description = 'Stop', group = 'Media Controls'}),

	awful.key({ }, 'XF86AudioNext',
		function()
			awful.spawn.with_shell('playerctl next')
		end,
	{description = 'Next', group = 'Media Controls'}),

	awful.key({ }, 'XF86AudioPrev',
		function()
			awful.spawn.with_shell(os.getenv('HOME') .. '/.config/scripts/previous_song.sh')
		end,
	{description = 'Previous', group = 'Media Controls'}),

    --Rofi menu keybinds
	awful.key({ modkey, }, 'space', 
		function () 
			awful.spawn.with_shell(apps.default.rofi_drun)
		end,
        {description = 'Program search', group = 'Rofi'}),

	awful.key({ modkey, shiftkey }, 'space', 
		function () 
			awful.spawn.with_shell(apps.default.rofi_run)
		end,
        {description = 'Program search (dmenu mode)', group = 'Rofi'}),

	awful.key({modkey, shiftkey}, 'q', 
		function ()
			awful.spawn.with_shell(apps.default.rofi_powermenu)
		end,
        {description = 'Open the power menu', group = 'Rofi'}),
	
	awful.key({modkey, shiftkey}, 'm', 
		function ()
			awful.spawn.with_shell(apps.default.rofi_mountmenu)
		end,
        {description = 'Open the mount menu', group = 'Rofi'}),

    -- Standard programs
    awful.key({modkey}, 'Return', 
        function() 
            awful.spawn(apps.default.terminal) 
        end,
        {description = 'Open a terminal', group = 'Programs'}
    ),

    -- awful.key({modkey}, 'l',
    --     function()
    --         awful.spawn(apps.default.lock)
    --     end,
    --     {description = 'Lock the screen', group = 'Programs'}
    -- ),

    awful.key({modkey}, '`',
        function()
            toggle_quake()
        end,
        {description = 'Quake style terminal', group = 'Programs'}
    ),

    --Layout management
    awful.key({modkey}, 'h',
        function()
            awful.tag.incmwfact(0.05)
        end,
        {description = 'Increase master width factor', group = 'Layout management'}
    ),
    awful.key({modkey}, 'l',
        function()
                awful.tag.incmwfact(-0.05)
        end,
        {description = 'Decrease master width factor', group = 'Layout management'}
    ),

    awful.key({modkey}, 'j',
        function()
            awful.tag.incnmaster(1, nil, true)
        end,
        {description = 'Increase the number of master clients', group = 'Layout management'}
    ),

    awful.key({modkey}, 'k',
        function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {description = 'Decrease the number of master clients', group = 'Layout management'}
    ),

    awful.key({modkey, ctrlkey},'l',
        function()
            awful.tag.incncol(1, nil, true)
        end,
        {description = 'Increase the number of columns', group = 'Layout management'}
    ),

    awful.key({modkey, ctrlkey},'h',
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        {description = 'Decrease the number of columns', group = 'Layout management'}
    ),




    -- awful.key({ modkey, 'Shift'   }, 'q', awesome.quit,
    --           {description = 'quit awesome', group = 'awesome'}),

    -- awful.key({ modkey,           }, 'l',     function () awful.tag.incmwfact( 0.05)          end,
    --           {description = 'increase master width factor', group = 'layout'}),
    -- awful.key({ modkey,           }, 'h',     function () awful.tag.incmwfact(-0.05)          end,
    --           {description = 'decrease master width factor', group = 'layout'}),
    -- awful.key({ modkey, 'Shift'   }, 'h',     function () awful.tag.incnmaster( 1, nil, true) end,
    --           {description = 'increase the number of master clients', group = 'layout'}),
    -- awful.key({ modkey, 'Shift'   }, 'l',     function () awful.tag.incnmaster(-1, nil, true) end,
    --           {description = 'decrease the number of master clients', group = 'layout'}),
    -- awful.key({ modkey, 'Control' }, 'h',     function () awful.tag.incncol( 1, nil, true)    end,
    --           {description = 'increase the number of columns', group = 'layout'}),
    -- awful.key({ modkey, 'Control' }, 'l',     function () awful.tag.incncol(-1, nil, true)    end,
    --           {description = 'decrease the number of columns', group = 'layout'}),
    awful.key({ modkey}, 'c', function () awful.layout.inc( 1)                end,
              {description = 'select next', group = 'layout'}), --tmp fix for tiling 
    -- awful.key({ modkey, 'Shift'   }, 'space', function () awful.layout.inc(-1)                end,
    --           {description = 'select previous', group = 'layout'}),

    -- awful.key({ modkey, 'Control' }, 'n',
    --           function ()
    --               local c = awful.client.restore()
    --               -- Focus restored client
    --               if c then
    --                 c:emit_signal(
    --                     'request::activate', 'key.unminimize', {raise = true}
    --                 )
    --               end
    --           end,
    --           {description = 'restore minimized', group = 'client'}),

    -- Prompt
    awful.key({ modkey },            'r',     function () awful.screen.focused().mypromptbox:run() end,
              {description = 'run prompt', group = 'launcher'}),

    awful.key({ modkey }, 'x',
              function ()
                  awful.prompt.run {
                    prompt       = 'Run Lua code: ',
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. '/history_eval'
                  }
              end,
              {description = 'lua execute prompt', group = 'awesome'}),

    --Screenshots
    awful.key({modkey}, 'Print', 
        function ()
            take_screenshot()
        end,
        {description = 'Take a screenshot', group = 'Screenshots'}
    ),

    awful.key({modkey, shiftkey}, 'Print', 
        function ()
            take_active_window()
        end,
        {description = 'Take a screenshot of the active window', group = 'Screenshots'}
    ),

    awful.key({}, 'Print', 
        function ()
            screenshot_clipboard()
        end,
        {description = 'Copy all the screen to the clipboard', group = 'Screenshots'}
    ),

    awful.key({modkey, shiftkey}, 's', 
        function ()
            selection_clipboard()
        end,
        {description = 'Copy a screen selection to the clipboard', group = 'Screenshots'}
    )
    
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, '#' .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = 'view tag #'..i, group = 'tag'}),
        -- Toggle tag display.
        awful.key({ modkey, 'Control' }, '#' .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = 'toggle tag #' .. i, group = 'tag'}),
        -- Move client to tag.
        awful.key({ modkey, 'Shift' }, '#' .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = 'move focused client to tag #'..i, group = 'tag'}),
        -- Toggle tag on focused client.
        awful.key({ modkey, 'Control', 'Shift' }, '#' .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = 'toggle focused client on tag #' .. i, group = 'tag'})
    )
end

return globalkeys