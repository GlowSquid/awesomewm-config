--[[
    qNeon theme
--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local common = require("awful.widget.common")

local vpnStatus = false

local os, math, string = os, math, string
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local scriptsDir = awful.util.getdir("config").."/scripts/"

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/qNeon"
theme.wallpaper                                 = theme.dir .. "/../wallpapers/black.png"
theme.font                                      = "Overpass 9"
theme.fg_normal                                 = "#8ee420"
theme.fg_abnormal                               = "80d9d8"
theme.fg_focus                                  = "#bea420"
theme.fg_urgent                                 = "#000000"
theme.bg_normal                                 = "#000000"
theme.bg_focus                                  = "#000000aa"
theme.bg_urgent                                 = "#5F0000aa"
theme.menu_bg_normal                            = "#000000"
theme.menu_bg_focus                             = "#000000"
theme.fg_minimize                               = "#ABABAB"
theme.menu_fg_normal                            = "#aaaaaa"
theme.menu_fg_focus                             = "#ff8c00"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"
theme.widget_uptime                             = theme.dir .. "/../icons/ac.png"
theme.widget_weather                            = theme.dir .. "/../icons/dish.png"
theme.widget_fs                                 = theme.dir .. "/../icons/fs.png"
theme.widget_note                               = theme.dir .. "/../icons/note.png"
theme.widget_note_on                            = theme.dir .. "/../icons/note_on.png"
theme.widget_netdown                            = theme.dir .. "/../icons/net_down.png"
theme.widget_netup                              = theme.dir .. "/../icons/net_up.png"
theme.widget_net                                = theme.dir .. "/../icons/net.png"
theme.widget_clock                              = theme.dir .. "/../icons/clock.png"

theme.taglist_bg_focus                          = "#343434"
theme.taglist_fg_focus                          = "#FFFFBD"
--theme.tasklist_bg_focus                         = "#0000FF"
theme.tasklist_fg_focus                         = "#FFFFBD"


theme.tasklist_bg_image_focus                   = theme.dir .. "/../icons/task_focus.png"
theme.tasklist_bg_image_normal                  = theme.dir .. "/../icons/task_minimize.png"
theme.tasklist_bg_image_urgent                  = theme.dir .. "/../icons/task_urgent.png"
theme.tasklist_bg_image_minimize                = theme.dir .. "/../icons/task_minimize.png"

theme.border_width                              = 1
theme.border_normal                             = "#00002A"
theme.border_focus                              = "#303000"
theme.border_marked                             = "#FF0000"

-- theme.titlebar_bg_focus                         = "#3F3F3F"
-- theme.titlebar_bg_normal                        = "#3F3F3F"
-- theme.titlebar_bg_focus                         = theme.bg_focus
-- theme.titlebar_bg_normal                        = theme.bg_normal
-- theme.titlebar_fg_focus                         = theme.fg_focus

theme.menu_height                               = 20
theme.menu_width                                = 130
theme.menu_submenu_icon                         = theme.dir .. "/../icons/submenu.png"

theme.awesome_icon                              = theme.dir .. "/../icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/../icons/square_a.png"
theme.taglist_squares_unsel                     = theme.dir .. "/../icons/square_b.png"

theme.layout_tile                               = theme.dir .. "/../icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/../icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/../icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/../icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/../icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/../icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/../icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/../icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/../icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/../icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/../icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/../icons/floating.png"

theme.widget_ac                                 = theme.dir .. "/../icons/ac.png"
theme.widget_battery                            = theme.dir .. "/../icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/../icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/../icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/../icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/../icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/../icons/temp.png"

theme.widget_music                              = theme.dir .. "/../icons/music.png"
theme.widget_music_on                           = theme.dir .. "/../icons/note_on.png"
theme.widget_music_pause                        = theme.dir .. "/../icons/pause.png"
theme.widget_music_stop                         = theme.dir .. "/../icons/stop.png"

theme.widget_spotify                            = theme.dir .. "/../icons/spotify.png"
theme.widget_spotify_play                       = theme.dir .. "/../icons/play.png"
theme.widget_spotify_pause                      = theme.dir .. "/../icons/pause.png"
theme.widget_spotify_stop                       = theme.dir .. "/../icons/stop.png"
theme.widget_spotify_prev                       = theme.dir .. "/../icons/prev.png"
theme.widget_spotify_next                       = theme.dir .. "/../icons/next.png"

theme.widget_mail                               = theme.dir .. "/../icons/mail2.png"
theme.widget_mail_on                            = theme.dir .. "/../icons/mail_on.png"
theme.widget_task                               = theme.dir .. "/../icons/certified.png"
theme.widget_scissors                           = theme.dir .. "/../icons/scissors.png"
theme.widget_vol_max                            = theme.dir .. "/../icons/vol_max.png"
theme.widget_vol_high                           = theme.dir .. "/../icons/vol_high.png"
theme.widget_vol_medium                         = theme.dir .. "/../icons/vol_medium.png"
theme.widget_vol_low                            = theme.dir .. "/../icons/vol_low.png"
theme.widget_vol_mute                           = theme.dir .. "/../icons/vol_mute.png"
theme.widget_vpn_on                             = theme.dir .. "/../icons/lock.png"
theme.widget_vpn_off                            = theme.dir .. "/../icons/lock_open.png"
theme.widget_php                                = theme.dir .. "/../icons/php.png"
theme.widget_eur                                = theme.dir .. "/../icons/eur.png"

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_task_name                = true
theme.tasklist_spacing                          = 5
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 5

local markup = lain.util.markup
local separators = lain.util.separators

local dots = wibox.widget.textbox(" ::: ")
--local gpmdp = require("scripts.gpmdp")


local bitcoin = awful.widget.watch(
    "curl -m5 -s 'https://coinbase.com/api/v1/prices/buy'",
    43200, -- half day
    function(widget, stdout)
        local btc, pos, err = require("dkjson").decode(stdout, 1, nil) -- dkjson
        local btc, pos, err = require("lain.util").dkjson.decode(stdout, 1, nil) -- lain
        --local btc_price = (not err and btc and btc["subtotal"]["amount"]) or "N/A"

        -- customize here
--        widget:set_text(btc_price)
        widget:set_markup(markup.fontfg(theme.font, "#1E8022", btc_price))
    end
)


-- IP
local pub_ip = awful.widget.watch(
  "curl https://glowsquid.com/ip", 1800,
  function(widget, stdout)
    widget:set_markup(markup.fontfg(theme.font, "#1E8022", stdout))
  end
)

-- VPN
local vpnicon = awful.widget.watch(
  "ip addr show tun0", 5,
  function(widget, stdout, stderr, exitreason, exitcode)
    if(stdout == '' or stdout==nil or stdout=='Device "tun0" does not exist.') then
        widget:set_image(theme.widget_vpn_off)
        pub_ip:set_markup(markup("#C93032", pub_ip.text))
    else
        widget:set_image(theme.widget_vpn_on)
        pub_ip:set_markup(markup("#1E8022", pub_ip.text))
    end
end,
wibox.widget.imagebox()
)


-- Currency
local phpicon = wibox.widget.imagebox(theme.widget_php)
local php = awful.widget.watch(
  "python3 " .. scriptsDir .. "/php.py", 14400,
  function(widget, stdout, stderr, exitreason, exitcode)
    widget:set_markup(markup.fontfg(theme.font, "#FFFF00", stdout))
  end
)

local euricon = wibox.widget.imagebox(theme.widget_eur)
local eur = awful.widget.watch(
  "python3 " .. scriptsDir .. "/eur.py", 14400,
  function(widget, stdout, stderr, exitreason, exitcode)
    widget:set_markup(markup.fontfg(theme.font, "#FFBD00", stdout))
  end
)


-- Spotify
-- Get it working using this guide https://github.com/streetturtle/awesome-wm-widgets/tree/master/spotify-widget
local GET_SPOTIFY_STATUS_CMD = 'sp status'
local GET_CURRENT_SONG_CMD = 'sp current-oneline'

local spotify_widget = wibox.widget {
    {
        id = 'current_song',
        widget = wibox.widget.textbox,
        font = theme.font
    },
    {
        id = "icon",
        widget = wibox.widget.imagebox,
    },
    layout = wibox.layout.align.horizontal,
    set_status = function(self, is_playing)
        if (is_playing) then
            self.icon.image = theme.widget_spotify_play
        else
            self.icon.image = theme.widget_spotify_pause
        end
    end,
    set_text = function(self, path)
        self.current_song.markup = path
    end,
}

local update_widget_icon = function(widget, stdout, _, _, _)
    stdout = string.gsub(stdout, "\n", "")
    if (stdout == 'Playing') then
        widget:set_status(true)
    else
        widget:set_status(false)
    end
end

local update_widget_text = function(widget, stdout, _, _, _)
    if string.find(stdout, 'Error: Spotify is not running.') ~= nil then
        widget:set_text('')
        widget:set_visible(false)
    else
        widget:set_text(stdout)
        widget:set_visible(true)
    end
end

awful.widget.watch(GET_SPOTIFY_STATUS_CMD, 1, update_widget_icon, spotify_widget)
awful.widget.watch(GET_CURRENT_SONG_CMD, 1, update_widget_text, spotify_widget)

spotify_widget:connect_signal("button::press", function(_, _, _, button)
    if (button == 1) then awful.spawn("sp play", false)      -- left click
    elseif (button == 4) then awful.spawn("sp next", false)  -- scroll up
    elseif (button == 5) then awful.spawn("sp prev", false)  -- scroll down
    end
    awful.spawn.easy_async(GET_SPOTIFY_STATUS_CMD, function(stdout, stderr, exitreason, exitcode)
        update_widget_icon(spotify_widget, stdout, stderr, exitreason, exitcode)
    end)
end)


-- Clock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(markup("#7788af", "%a - %d.%m.%y ") .. markup("#535f7a", "") .. markup("#de5e1e", " %H:%M "))
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.calendar({
    --cal = "cal --color=always",
    attach_to = { mytextclock },
    notification_preset = {
        font = "xos4 Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})


-- Weather
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
    city_id = 3137115,
    notification_preset = { font = "xos4 Terminus 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#eca4c4", "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, "#eca4c4", units .. "°C "))
    end
})


-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol_max)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" or tonumber(volume_now.level) == 0 then
            volume_now.level = volume_now.level
            widget:set_markup(markup.fontfg(theme.font, "#E1406D", volume_now.level .. "% "))
            volicon:set_image(theme.widget_vol_mute)
        else
            widget:set_markup(markup.fontfg(theme.font, "#7493d2", volume_now.level .. "% "))
            if tonumber(volume_now.level) >= 75 then
                volicon:set_image(theme.widget_vol_max)
            elseif tonumber(volume_now.level) >= 50 then
                volicon:set_image(theme.widget_vol_high)
            elseif tonumber(volume_now.level) >= 25 then
                volicon:set_image(theme.widget_vol_medium)
            elseif tonumber(volume_now.level) >= 1 then
                volicon:set_image(theme.widget_vol_low)
            end
        end
    end
})


-- Memory
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e0da37", mem_now.used .. "M "))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
    end
})

-- Coretemp (lain, average)
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#f1af5f", coretemp_now .. "°C "))
    end
})

-- fs
local fsicon = wibox.widget.imagebox(theme.widget_fs)
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "xos4 Terminus 10" },
    settings = function()
        local fsp = string.format(" %3.2f %s ", fs_now["/"].free, fs_now["/"].units)
        widget:set_markup(markup.fontfg(theme.font, "#80d9d8", fsp))
    end
})


-- Battery
local baticon = wibox.widget.imagebox(theme.widget_batt)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.font(theme.font, " AC "))
                baticon:set_image(theme.widget_ac)
                return
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.fontfg(theme.font, "#AAAAAA", bat_now.perc .. "% "))
        else
            widget:set_markup()
            baticon:set_image(theme.widget_ac)
        end
    end
})

-- Net Speed
local neticon = wibox.widget.imagebox(theme.widget_net)
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        if iface ~= "network off" and
           string.match(theme.weather.widget.text, "N/A")
        then
            theme.weather.update()
        end

        widget:set_markup(markup.fontfg(theme.font, "#e54c62", net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(theme.font, "#87af5f", net_now.received /2 .. " "))
    end
})


-- Taskwarrior
-- local task = wibox.widget.imagebox(theme.widget_task)
-- lain.widget.contrib.task.attach(task, {
--     -- do not colorize output
--     show_cmd = "task | sed -r 's/\\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g'"
-- })
-- task:buttons(my_table.join(awful.button({}, 1, lain.widget.contrib.task.prompt)))



-- Mail IMAP check
local mailicon = wibox.widget.imagebox(theme.widget_mail)
--[[ commented because it needs to be set before use
mailicon:buttons(my_table.join(awful.button({ }, 1, function () awful.spawn(mail) end)))
local mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            widget:set_text(" " .. mailcount .. " ")
            mailicon:set_image(theme.widget_mail_on)
        else
            widget:set_text("")
            mailicon:set_image(theme.widget_mail)
        end
    end
})
--]]


-- MPD
-- local musicplr = awful.util.terminal .. " -title Music -g 130x34-320+16 -e ncmpcpp"
-- local mpdicon = wibox.widget.imagebox(theme.widget_music)
-- mpdicon:buttons(my_table.join(
--     awful.button({ modkey }, 1, function () awful.spawn.with_shell(musicplr) end),
--     awful.button({ }, 1, function ()
--         awful.spawn.with_shell("mpc prev")
--         theme.mpd.update()
--     end),
--     awful.button({ }, 2, function ()
--         awful.spawn.with_shell("mpc toggle")
--         theme.mpd.update()
--     end),
--     awful.button({ }, 3, function ()
--         awful.spawn.with_shell("mpc next")
--         theme.mpd.update()
--     end)))
-- theme.mpd = lain.widget.mpd({
--     settings = function()
--         if mpd_now.state == "play" then
--             artist = " " .. mpd_now.artist .. " "
--             title  = mpd_now.title  .. " "
--             mpdicon:set_image(theme.widget_music_on)
--             widget:set_markup(markup.font(theme.font, markup("#FF8466", artist) .. " " .. title))
--         elseif mpd_now.state == "pause" then
--             widget:set_markup(markup.font(theme.font, " mpd paused "))
--             mpdicon:set_image(theme.widget_music_pause)
--         else
--             widget:set_text("")
--             mpdicon:set_image(theme.widget_music)
--         end
--     end
-- })


-- Separators
local arrow = separators.arrow_left
local arrow_right = separators.arrow_right

function theme.powerline_rl(cr, width, height)
    local arrow_depth, offset = height/2, 0

    -- Avoid going out of the (potential) clip area
    if arrow_depth < 0 then
        width  =  width + 2*arrow_depth
        offset = -arrow_depth
    end

    cr:move_to(offset + arrow_depth         , 0        )
    cr:line_to(offset + width               , 0        )
    cr:line_to(offset + width - arrow_depth , height/2 )
    cr:line_to(offset + width               , height   )
    cr:line_to(offset + arrow_depth         , height   )
    cr:line_to(offset                       , height/2 )

    cr:close_path()
end


function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)


    local function list_update(w, buttons, label, data, objects)
        common.list_update(w, buttons, label, data, objects)
        w:set_max_widget_size(28)
    end

    s.mytasklist = awful.widget.tasklist(s,
    awful.widget.tasklist.filter.currenttags,
    awful.util.tasklist_buttons,
    nil,
    list_update,
    wibox.layout.flex.horizontal())


    -- Create the wibox
    s.mywibox = awful.wibar({
      position = "top",
      screen = s,
      height = 20,
      bg = theme.bg_normal,
      fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
            dots,
            --spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets

            layout = wibox.layout.fixed.horizontal,
            --arrow(theme.bg_normal, "#343434"),
            --wibox.container.background(wibox.container.margin(wibox.widget { spotify_widget, spotifyicon, layout = wibox.layout.align.horizontal }, 4, 7), "#343434"),
            --arrow("#343434", theme.bg_normal),
            --wibox.container.margin(vpnicon, 4, 8),
            --arrow(theme.bg_normal, "#343434"),
            -- wibox.container.background(wibox.container.margin(task, 3, 7), "#343434"),
            --arrow("#343434", theme.bg_normal),
            --wibox.container.background(wibox.container.margin(wibox.widget { mpdicon, theme.mpd.widget, layout = wibox.layout.align.horizontal }, 3, 6), theme.bg_focus),
            wibox.container.background(wibox.container.margin(wibox.widget { spotify_widget, layout = wibox.layout.align.horizontal }, 4, 7), theme.bg_focus),
            wibox.widget.systray(),
            arrow(theme.bg_normal, "#343434"),
            wibox.container.background(wibox.container.margin(wibox.widget { mailicon, mail and mail.widget, layout = wibox.layout.align.horizontal }, 4, 7), "#343434"),
            arrow("#343434", theme.bg_normal),
            wibox.container.background(wibox.container.margin(wibox.widget { netdowninfo, neticon, netupinfo, layout = wibox.layout.align.horizontal }, 4, 7), theme.bg_focus),
            arrow(theme.bg_normal, "#343434"),
            wibox.container.background(wibox.container.margin(wibox.widget { phpicon, php, layout = wibox.layout.align.horizontal }, 4, 7), "#343434"),
            arrow("#343434", theme.bg_normal),
            wibox.container.background(wibox.container.margin(wibox.widget { euricon, eur, layout = wibox.layout.align.horizontal }, 4, 7), theme.bg_focus),
            arrow(theme.bg_normal, "#343434"),
            wibox.container.background(wibox.container.margin(wibox.widget { weathericon, theme.weather.widget, layout = wibox.layout.align.horizontal }, 4, 7), "#343434"),
            arrow("#343434", theme.bg_normal),
            wibox.container.background(wibox.container.margin(wibox.widget { vpnicon, pub_ip, layout = wibox.layout.align.horizontal }, 4, 7), theme.bg_focus),
            arrow(theme.bg_normal, "#343434"),
            wibox.container.background(wibox.container.margin(wibox.widget { memicon, mem.widget, layout = wibox.layout.align.horizontal }, 4, 7), "#343434"),
            arrow("#343434", theme.bg_normal),
            wibox.container.background(wibox.container.margin(wibox.widget { cpuicon, cpu.widget, layout = wibox.layout.align.horizontal }, 4, 7), theme.bg_focus),
            arrow(theme.bg_normal, "#343434"),
            wibox.container.background(wibox.container.margin(wibox.widget { tempicon, temp.widget, layout = wibox.layout.align.horizontal }, 4, 7), "#343434"),
            arrow("#343434", theme.bg_normal),
            wibox.container.background(wibox.container.margin(wibox.widget { fsicon, theme.fs.widget, layout = wibox.layout.align.horizontal }, 4, 7), theme.bg_focus),
            arrow(theme.bg_normal, "#343434"),
            wibox.container.background(wibox.container.margin(wibox.widget { volicon, theme.volume.widget, layout = wibox.layout.align.horizontal }, 4, 7), "#343434"),
            arrow("#343434", theme.bg_normal),
            wibox.container.background(wibox.container.margin(wibox.widget { baticon, bat.widget, layout = wibox.layout.align.horizontal }, 4, 7), theme.bg_focus),
            arrow(theme.bg_normal, "#343434"),
            wibox.container.background(wibox.container.margin(wibox.widget { clockicon, mytextclock, layout = wibox.layout.align.horizontal }, 4, 7), "#343434"),
            arrow_right("#343434", theme.bg_normal),
            s.mylayoutbox,
            --mylauncher,
        },
    }
end

return theme
