os = require("os")
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/machinespecific/hypr/?.lua"
require("machinespecific")

local terminal = "foot"
local menu = "bemenu-run --binding vim"

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("GDK_SCALE", "1")
hl.env("GDK_SCALE", "1")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("MOZ_DBUS_REMOTE", "1")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("KITTY_ENABLE_WAYLAND", "1")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

hl.window_rule({match = {class="^(xwaylandvideobridge)$"}, opacity = 0.0, no_anim = true, no_focus = true, no_initial_focus = true})
hl.window_rule({match = {title="^(flameshot)"}, move = {0,0}})
hl.window_rule({match = {class="gamescope"}, max_size = {1920, 1080}, min_size = {1920, 1080}, immediate = true, float = true, opaque = true, size = {1920, 1080}})
hl.window_rule({match = {class=".*steam.*"}, workspace = "9 silent", no_initial_focus = true})
hl.window_rule({match = {class=".*discord.*"}, workspace = "10 silent", no_initial_focus = true})
hl.window_rule({match = {class=".*bemenu-run.*"}, pin = true, float = true, stay_focused = true})
hl.window_rule({match = {class=".*dunst.*"}, pin = true, float = true})
hl.window_rule({match = {title="^(notificationstoasts_.*_desktop)$", class="^(steam)$"}, no_focus = true})

hl.on("hyprland.start", function ()
    hl.exec_cmd("dunst")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("xwaylandvideobridge")
    hl.exec_cmd("waybar")
end)

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle=45 },
            inactive_border = "rgba(595959aa)",
        },
        allow_tearing = true,
        layout = "dwindle",
    },
    decoration = {
        rounding = 5,
        blur = {
            enabled = false,
            size = 3,
            passes = 1,
        },
        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        }
    },
    animations = {
        enabled = true,
    }
})

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "default"})
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default" })

hl.config({
    dwindle = {
        preserve_split = true,
        -- pseudotile = true,
    },
})

hl.config({
    master = { new_status = "master", },
})

hl.config({
    scrolling = { fullscreen_on_one_column = true },
})

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = false,
        disable_splash_rendering = true,
    }
})

hl.config({
    input = {
        kb_layout = "gb",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        accel_profile = "flat",
        force_no_accel = true,
        touchpad = {
            natural_scroll = false
        },
        sensitivity = 0
    }
})

hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + CTRL + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float())
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grimshot copy area"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + I", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(0))

hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({x = 20, y = 0, relative = true}), {repeating = true})
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({x = -20, y = 0, relative = true}), {repeating = true})
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({x = 0, y = -20, relative = true}), {repeating = true})
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({x = 0, y = 20, relative = true}), {repeating = true})
hl.bind(mainMod .. " + SHIFT + ALT + L", hl.dsp.window.resize({x = 100, y = 0, relative = true}), {repeating = true})
hl.bind(mainMod .. " + SHIFT + ALT + H", hl.dsp.window.resize({x = -100, y = 0, relative = true}), {repeating = true})
hl.bind(mainMod .. " + SHIFT + ALT + K", hl.dsp.window.resize({x = 0, y = -100, relative = true}), {repeating = true})
hl.bind(mainMod .. " + SHIFT + ALT + J", hl.dsp.window.resize({x = 0, y = 100, relative = true}), {repeating = true})

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({workspace = i}))
end

hl.bind(mainMod .. " + G", hl.dsp.focus({workspace = "name:G"}))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.window.move({workspace = "name:G"}))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {mouse = true})

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -1 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), {locked = true, non_consuming = true, repeating = true, transparent = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -1 1.5 @DEFAULT_AUDIO_SINK@ 5%-"), {locked = true, non_consuming = true, repeating = true, transparent = true})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {locked = true, non_consuming = true, transparent = true})
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-source-mute @DEFAULT_SOURCE@ toggle"), {locked = true, non_consuming = true, transparent = true})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl -ai firefox play-pause"), {locked = true, non_consuming = true, transparent = true})
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl -ai firefox next"), {locked = true, non_consuming = true, transparent = true})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl -ai firefox previous"), {locked = true, non_consuming = true, transparent = true})
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl -ai firefox stop"), {locked = true, non_consuming = true, transparent = true})



