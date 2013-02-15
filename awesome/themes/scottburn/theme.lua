-------------------------------
-- Adapted by me from:       --
--  "Zenburn" awesome theme  --
-------------------------------

-- {{{ Main
theme           = {}
path            = "/home/scott/.config/awesome/themes/scottburn/"
theme.wallpaper = path .."back.jpg"
-- }}}

-- {{{ Styles
theme.font = "Ubuntu bold 10.5"

-- {{{ Colors
theme.fg_normal  = "#DCDCCC"
theme.fg_focus   = "#F0DFAF"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#3F3F3F"
theme.bg_focus   = "#1E2320"
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = 2
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
theme.fg_widget        = "#AECF96"
theme.fg_center_widget = "#88A175"
theme.fg_end_widget    = "#FF5656"
theme.bg_widget        = "#494B4F"
theme.border_widget    = "#3F3F3F"
theme.widget_gradient = { type  = "linear",
                          from  = { 0, 0 },
                          to    = { 0, 20 },
                          stops = { { 0,   theme.fg_end_widget    },
                                    { 0.5, theme.fg_center_widget },
                                    { 1,   theme.fg_widget        } }
}
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 15
theme.menu_width  = 100
-- }}}

-- {{{ Icons
--
-- {{{ Taglist
theme.taglist_squares_sel   = path .. "taglist/squarefz.png"
theme.taglist_squares_unsel = path .. "taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon      = path .. "awesome-icon.png"
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = path .. "layouts/tile.png"
theme.layout_tileleft   = path .. "layouts/tileleft.png"
theme.layout_tilebottom = path .. "layouts/tilebottom.png"
theme.layout_tiletop    = path .. "layouts/tiletop.png"
theme.layout_fairv      = path .. "layouts/fairv.png"
theme.layout_fairh      = path .. "layouts/fairh.png"
theme.layout_spiral     = path .. "layouts/spiral.png"
theme.layout_dwindle    = path .. "layouts/dwindle.png"
theme.layout_max        = path .. "layouts/max.png"
theme.layout_fullscreen = path .. "layouts/fullscreen.png"
theme.layout_magnifier  = path .. "layouts/magnifier.png"
theme.layout_floating   = path .. "layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus               = path .. "titlebar/close_focus.png"
theme.titlebar_close_button_normal              = path .. "titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active        = path .. "titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = path .. "titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active       = path .. "titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = path .. "titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active     = path .. "titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = path .. "titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active    = path .. "titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = path .. "titlebar/maximized_normal_inactive.png"
-- }}}

-- {{{ Widgets
theme.widget_cpu   = path .. "widgets/cpu.png"
theme.widget_mem   = path .. "widgets/mem.png"
theme.widget_vol   = path .. "widgets/vol.png"
theme.widget_music = path .. "widgets/music.png"
-- }}}
-- }}}

return theme
