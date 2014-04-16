-- [[
-- holo
-- ]]


theme                               = {}

theme.confdir                       = os.getenv("HOME") .. "/.config/awesome/themes/holo"
theme.wallpaper                     = theme.confdir .. "/wall.jpg"

theme.font                          = "Tamsyn 8"
theme.taglist_font                  = "Icons 8"
theme.font_alt                      = "-misc-tamsyn-medium-r-normal--12-87-100-100-c-60-iso8859-1"
theme.bg_normal                     = "#242424"
theme.bg_focus                      = theme.bg_normal
theme.bg_urgent                     = theme.bg_normal
theme.fg_normal                     = "#93A1A1"
theme.fg_focus                      = "#C2C2C2"
theme.fg_urgent                     = "#FF5353"
theme.fg_minimize                   = theme.fg_normal
theme.border_width                  = "1"
theme.border_normal                 = "#1C1C1C"
theme.border_focus                  = "#474747"
theme.border_marked                 = "#6D9CBE"
theme.taglist_fg_focus              = "#FFFFFF"
theme.taglist_bg_focus              = "#303030"
theme.tasklist_bg_normal            = "#222222"
theme.tasklist_fg_focus             = "#4CB7DB"
theme.titlebar_bg_normal            = theme.bg_normal
theme.titlebar_bg_focus             = theme.bg_normal
theme.menu_width                    = "110"
theme.menu_border_width             = "0"
theme.menu_fg_normal                = "#C2C2C2"
theme.menu_fg_focus                 = "#FFFFFF"
theme.menu_bg_normal                = "#303030"
theme.menu_bg_focus                 = "#0099CC"

theme.menu_submenu_icon             = theme.confdir .. "/icons/submenu.png"
theme.widget_temp                   = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                 = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                    = theme.confdir .. "/icons/cpu.png"
theme.widget_mem                    = theme.confdir .. "/icons/mem.png"
theme.widget_netdown                = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                  = theme.confdir .. "/icons/net_up.png"
theme.widget_ac                     = theme.confdir .. "/icons/ac.png"
theme.widget_bat_charge             = theme.confdir .. "/icons/bat_charge.png"
theme.widget_bat                    = theme.confdir .. "/icons/bat.png"
theme.widget_bat_med                = theme.confdir .. "/icons/bat_med.png"
theme.widget_bat_half               = theme.confdir .. "/icons/bat_half.png"
theme.widget_bat_low                = theme.confdir .. "/icons/bat_low.png"
theme.widget_bat_empty              = theme.confdir .. "/icons/battery_empty.png"
theme.widget_clock                  = theme.confdir .. "/icons/clock.png"
theme.widget_vol                    = theme.confdir .. "/icons/vol.png"
theme.widget_vol_med                = theme.confdir .. "/icons/vol-med.png"
theme.widget_vol_low                = theme.confdir .. "/icons/vol-low.png"
theme.widget_vol_no                 = theme.confdir .. "/icons/vol-no.png"
theme.widget_vol_mute               = theme.confdir .. "/icons/vol-mute.png"
theme.widget_note                   = theme.confdir .. "/icons/note.png"
theme.widget_play                   = theme.confdir .. "/icons/play.png"
theme.widget_pause                  = theme.confdir .. "/icons/pause.png"

theme.taglist_squares_sel           = theme.confdir .. "/icons/sel.png"
theme.taglist_squares_unsel         = theme.confdir .. "/icons/unsel.png"

theme.tasklist_disable_icon         = true
theme.tasklist_floating             = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""

theme.layout_floating               = theme.confdir .. "/icons/floating.png"
theme.layout_tile                   = theme.confdir .. "/icons/tile.png"
theme.layout_tileleft               = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom             = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                  = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                  = theme.confdir .. "/icons/fairh.png"

theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"

-- lain related
theme.useless_gap_width             = 5
theme.layout_uselesstile            = theme.confdir .. "/icons/uselesstile.png"
theme.layout_uselesstileleft        = theme.confdir .. "/icons/uselesstileleft.png"

return theme
