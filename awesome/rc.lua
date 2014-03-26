-- Include some libraries
local gears     = require("gears")
local awful     = require("awful")
awful.rules     = require("awful.rules")
require("awful.autofocus")
local wibox     = require("wibox")
local beautiful = require("beautiful")
local naughty   = require("naughty")
local menubar   = require("menubar")
local vicious   = require("vicious")


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify( { preset = naughty.config.presets.critical,
                      title  = "Oops, there were errors during startup!",
                      text   = awesome.startup_errors } )
                    end
-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal( "debug::error", function(err)
        -- Avoid infintite loop
        if in_error then return end

        in_error = true
        naughty.notify( { preset = naughty.config.presets.critical,
                          title  = "Oops, an error happened!",
                          text   = err } )
        in_error = false
    end )
  end
-- }}}


-- Set the theme
beautiful.init("/home/scott/.config/awesome/themes/scottburn/theme.lua")


-- {{{ Preferences
modkey     = "Mod4"
terminal   = "urxvtc"
editor     = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor
browser    = "chromium-browser"
mail       = "claws-mail"
volcmd     = "amixer -c 0 -q set Master"
volup      = volcmd .. " 2dB+"
voldown    = volcmd .. " 2dB-"
--}}}


-- {{{ Wallpaper - add to all screens
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized( beautiful.wallpaper, s, true )
    end
end
-- }}}


-- {{{ Tags and layouts

-- Table of layouts to enable, order matters.
local layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}

-- if we have 2 screens make dominant screen number 2
tags = {
   names  = { "一", "二", "三", "四", "五" },
   layout = { layouts[5], layouts[2], layouts[2], layouts[1], layouts[2] }
}
tags2 = {
   names  = { "一", "二", "三" },
   layout = { layouts[2], layouts[2], layouts[1] }
}
for s = 1, screen.count() do
    if s == 1 then
      tags[s] = awful.tag( tags.names,  s, tags.layout )
    else
      tags[s] = awful.tag( tags2.names, s, tags2.layout )
    end
end
-- }}}

-- {{{ Wibox (Widgets)

-- {{{ separator
separator = wibox.widget.textbox()
separator:set_text(" ")
-- }}}

-- Textclock
mytextclock = awful.widget.textclock()

-- CPU
cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.widget_cpu)

cpuwidget = awful.widget.graph()
cpuwidget:set_width(40)
cpuwidget:set_background_color(beautiful.bg_widget)
cpuwidget:set_color(beautiful.widget_gradient)
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")

-- Memory
memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.widget_mem)

memwidget = awful.widget.progressbar()
memwidget:set_vertical(true):set_ticks(true)
memwidget:set_height(12):set_width(8):set_ticks_size(2)
memwidget:set_background_color(beautiful.bg_widget)
memwidget:set_color(beautiful.widget_gradient)
vicious.register(memwidget, vicious.widgets.mem, "$1", 13)

-- Volume
volicon = wibox.widget.imagebox()
volicon:set_image(beautiful.widget_vol)

volbar = awful.widget.progressbar()
volbar:set_vertical(true):set_ticks(true)
volbar:set_height(12):set_width(8):set_ticks_size(2)
volbar:set_background_color(beautiful.bg_widget)
volbar:set_color(beautiful.widget_gradient)

vicious.cache(vicious.widgets.volume)
vicious.register(volbar, vicious.widgets.volume,  "$1",  2, "Master")

volbar:buttons(awful.util.table.join(
   awful.button({}, 1, function ()
       awful.util.spawn_with_shell(terminal .. " -e alsamixer")
   end),
   awful.button({}, 4, function () awful.util.spawn_with_shell( volup,   false) end),
   awful.button({}, 5, function () awful.util.spawn_with_shell( voldown, false) end)
))

-- Set the terminal for applications that require it
menubar.utils.terminal = terminal

-- Create a wibox for each screen and add it
mywibox     = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist   = {}
mytaglist.buttons = awful.util.table.join(
    awful.button( {},         1, awful.tag.viewonly ),
    awful.button( { modkey }, 1, awful.client.movetotag ),
    awful.button( {},         3, awful.tag.viewtoggle ),
    awful.button( { modkey }, 3, awful.client.toggletag ),
    awful.button( {},         4, function(t) awful.tag.viewnext( awful.tag.getscreen(t) ) end ),
    awful.button( {},         5, function(t) awful.tag.viewprev( awful.tag.getscreen(t) ) end )
)
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
    awful.button( {}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() then
                awful.tag.viewonly( c:tags()[1] )
              end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({}, 3, function()
        if instance then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients( { width = 250 })
        end
    end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
        if client.focus then client.focus:raise() end
    end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
        if client.focus then client.focus:raise() end
    end)
)

for s = 1, screen.count() do
    mypromptbox[s] = awful.widget.prompt()
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
        awful.button({}, 1, function() awful.layout.inc(layouts,  1) end),
        awful.button({}, 3, function() awful.layout.inc(layouts, -1) end),
        awful.button({}, 4, function() awful.layout.inc(layouts,  1) end),
        awful.button({}, 5, function() awful.layout.inc(layouts, -1) end)
    ))
    mytaglist[s]  = awful.widget.taglist( s, awful.widget.taglist.filter.all,
                                          mytaglist.buttons )
    mytasklist[s] = awful.widget.tasklist( s, awful.widget.tasklist.filter.currenttags,
                                           mytasklist.buttons )
    mywibox[s]    = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right - inelegant
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then
        right_layout:add(separator)
        right_layout:add(volicon)
        right_layout:add(volbar)
        right_layout:add(separator)
        right_layout:add(cpuicon)
        right_layout:add(cpuwidget)
        right_layout:add(separator)
        right_layout:add(memicon)
        right_layout:add(memwidget)
        right_layout:add(separator)
        right_layout:add(separator)
        right_layout:add(wibox.widget.systray())
        right_layout:add(separator)
        right_layout:add(separator)
        right_layout:add(mytextclock)
        right_layout:add(separator)
    end
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}


-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({}, 3, function() mymainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
))
-- }}}


-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function() mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function() awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function() awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard programs
    awful.key({ modkey,           }, "Return", function() awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r",      awesome.restart),
    awful.key({ modkey, "Shift"   }, "q",      awesome.quit),
    awful.key({ modkey            }, "r",      function() mypromptbox[mouse.screen]:run() end),
    awful.key({ modkey            }, "p",      function() menubar.show() end),

    awful.key({}, "XF86HomePage",
        function() awful.util.spawn_with_shell(browser) end
    ),
    awful.key({}, "XF86Mail",
        function() awful.util.spawn_with_shell(mail) end
    ),
    awful.key({}, "XF86Calculator",
        function() awful.util.spawn_with_shell(terminal .. " -e bc") end
    ),
    awful.key({}, "XF86AudioLowerVolume",
        function() awful.util.spawn_with_shell(voldown, false) end
    ),
    awful.key({}, "XF86AudioRaiseVolume",
        function() awful.util.spawn_with_shell(volup,   false) end
    ),
    awful.key({}, "XF86AudioMute",
        function() awful.util.spawn_with_shell(volcmd .. " toggle", false) end
    ),

    awful.key({ modkey,           }, "l",     function() awful.tag.incmwfact( 0.01)    end),
    awful.key({ modkey,           }, "h",     function() awful.tag.incmwfact(-0.01)    end),
    awful.key({ modkey, "Shift"   }, "h",     function() awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function() awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function() awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function() awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function() awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function() awful.layout.inc(layouts, -1) end),
    awful.key({ modkey, "Control" }, "n",     awful.client.restore),

    awful.key({ modkey }, "x",
        function()
            awful.prompt.run({ prompt = "Run Lua code: " },
                mypromptbox[mouse.screen].widget,
                awful.util.eval, nil,
                awful.util.getdir("cache") .. "/history_eval")
        end
    ),
    awful.key({ modkey }, "F12", function() awful.util.spawn("xscreensaver-command -lock") end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function(c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function(c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                    ),
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                       ),
    awful.key({ modkey,           }, "t",      function(c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end
    )
)

-- Compute the highest digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
    keynumber = math.min(9, math.max(#tags[s], keynumber))
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end)
    )
end

clientbuttons = awful.util.table.join(
    awful.button({        }, 1, function(c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize)
)

root.keys(globalkeys)
-- }}}


-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule       = {},
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus        = awful.client.focus.filter,
                     keys         = clientkeys,
                     buttons      = clientbuttons }
                   },
    { rule       = { class    = "pinentry" },
      properties = { floating = true } },
    { rule       = { class    = "gimp" },
      properties = { floating = true } }
}
-- }}}


-- {{{ Signals
-- New client signal
client.connect_signal("manage", function(c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
           and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the window as slave,
        -- awful.client.setslave(c)

        -- Place windows smartly if they do not set an initial position
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
            awful.button({}, 1, function()
                client.focus = c
                c:raise()
                awful.mouse.client.move(c)
            end),
            awful.button({}, 3, function()
                client.focus = c
                c:raise()
                awful.mouse.client.resize(c)
            end)
        ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus",   function(c) c.border_color = beautiful.border_focus  end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}


-- Function to only start an application once
function run_once(cmd)
    findme = cmd
    firstspace = cmd:find(" ")
    if firstspace then
        findme = cmd:sub(0, firstspace-1)
    end
    awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end


-- Start some applications and services
run_once("xscreensaver -no-splash")
run_once("nm-applet &")
run_once("xfce4-power-manager --restart")
run_once(mail)
run_once("/home/scott/.config/awesome/tmux_ide.sh")

