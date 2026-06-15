-- CachyOS Hyprland Lua Configuration
-- Migrated from legacy hyprland.conf

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- COLORS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

local colors = {
	cachylgreen  = "rgba(82dcccff)",
	cachymgreen  = "rgba(00aa84ff)",
	cachydgreen  = "rgba(007d6fff)",
	cachylblue   = "rgba(01ccffff)",
	cachymblue   = "rgba(182545ff)",
	cachydblue   = "rgba(111826ff)",
	cachywhite   = "rgba(ffffffff)",
	cachygrey    = "rgba(dddddd88)",
	cachygray    = "rgba(798bb244)",
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- DEFAULTS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

local terminal     = "yazi"  -- overridden below
local filemanager  = "yazi"
local applauncher  = "lucien"
local shot_region  = "grimblast copy area"
local shot_window  = "grimblast copy active"
local shot_screen  = "grimblast copy output"

terminal = "kitty"

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- MONITORS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

hl.monitor({
	output = "desc:KUY Kuycon P20",
	mode = "preferred",
	position = "auto",
	scale = "1.25",
})

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1.0",
})

-- Lid switch handling
hl.on("hyprland.start", function()
    -- Use spawn to detach the listener from the Lua state
    hl.exec_cmd("bash -c '~/.config/hypr/scripts/lid-listener.sh & disown'")
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ENVIRONMENT VARIABLES
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_CURSOR_SIZE", "24")
hl.env("ILLOGICAL_IMPULSE_VIRTUAL_ENV", os.getenv("HOME") .. "/.local/state/quickshell/.venv")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- AUTOSTART
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

hl.on("hyprland.start", function()
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
	-- hl.exec_cmd("hyprpaper")
	-- hl.exec_cmd("~/.config/hypr/scripts/waybar-launch.sh")
	hl.exec_cmd("fcitx5 -d")
	-- hl.exec_cmd("mako")
	hl.exec_cmd("nm-applet --indicator")
	-- hl.exec_cmd('bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob & disown"')
	-- hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("systemctl --user import-environment")
	hl.exec_cmd("hash dbus-update-activation-environment 2>/dev/null")
	hl.exec_cmd("dbus-update-activation-environment --systemd")
	hl.exec_cmd("hypridle")
	
	-- Start Quickshell
	hl.exec_cmd("quickshell -c ii")
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- CORE CONFIG
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,
		border_size = 1,
		col = {
			active_border = colors.cachygrey,
			inactive_border = colors.cachygray,
		},
		layout = "dwindle",
		snap = {
			enabled = true,
		},
	},

	decoration = {
		active_opacity = 1,
		rounding = 4,
		blur = {
			enabled = true,
			size = 15,
			passes = 2,
			xray = true,
		},
		shadow = {
			enabled = false,
		},
	},

	dwindle = {
		special_scale_factor = 0.8,
		preserve_split = true,
	},

	master = {
		new_status = "master",
		special_scale_factor = 0.8,
	},

	misc = {
		font_family = "Fira Sans",
		splash_font_family = "Fira Sans",
		disable_hyprland_logo = true,
		col = {
			splash = colors.cachylgreen,
		},
		background_color = colors.cachydblue,
		enable_swallow = true,
		swallow_regex = "^(nautilus|nemo|thunar|btrfs-assistant.)$",
		focus_on_activate = true,
		vrr = 2,
	},

	render = {
		direct_scanout = true,
	},

	group = {
		col = {
			border_active = colors.cachydgreen,
			border_inactive = colors.cachylgreen,
			border_locked_active = colors.cachymgreen,
			border_locked_inactive = colors.cachydblue,
		},
		groupbar = {
			font_family = "Fira Sans",
			text_color = colors.cachydblue,
			col = {
				active = colors.cachydgreen,
				inactive = colors.cachylgreen,
				locked_active = colors.cachymgreen,
				locked_inactive = colors.cachydblue,
			},
		},
	},

	input = {
		kb_layout = "us,se",
		-- kb_options = "grp:alt_shift_toggle",
		follow_mouse = 2,
		float_switch_override_focus = 2,
		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
		},
	},

	binds = {
		allow_workspace_cycles = true,
		workspace_back_and_forth = true,
		workspace_center_on = 1,
		movefocus_cycles_fullscreen = true,
		window_direction_monitor_fallback = true,
	},
})

-- Per-device: internal trackpad only (drag-lock / tap-and-drag)
hl.device({
	name = "SYNA8018:00 06CB:CE67 Touchpad",
	drag_lock = true,
	["tap_and_drag"] = true,
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ANIMATIONS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

hl.curve("wind",        { type = "bezier", points = { {0.05, 0.85}, {0.03, 0.97} } })
hl.curve("winIn",       { type = "bezier", points = { {0.07, 0.88}, {0.04, 0.99} } })
hl.curve("winOut",      { type = "bezier", points = { {0.20, -0.15}, {0, 1} } })
hl.curve("liner",       { type = "bezier", points = { {1, 1}, {1, 1} } })
hl.curve("md3_standard",{ type = "bezier", points = { {0.12, 0}, {0, 1} } })
hl.curve("md3_decel",   { type = "bezier", points = { {0.05, 0.80}, {0.10, 0.97} } })
hl.curve("md3_accel",   { type = "bezier", points = { {0.20, 0}, {0.80, 0.08} } })
hl.curve("overshot",    { type = "bezier", points = { {0.05, 0.85}, {0.07, 1.04} } })
hl.curve("crazyshot",   { type = "bezier", points = { {0.1, 1.22}, {0.68, 0.98} } })
hl.curve("hyprnostretch",{ type = "bezier", points = { {0.05, 0.82}, {0.03, 0.94} } })
hl.curve("menu_decel",  { type = "bezier", points = { {0.05, 0.82}, {0, 1} } })
hl.curve("menu_accel",  { type = "bezier", points = { {0.20, 0}, {0.82, 0.10} } })
hl.curve("easeInOutCirc",{ type = "bezier", points = { {0.75, 0}, {0.15, 1} } })
hl.curve("easeOutCirc", { type = "bezier", points = { {0, 0.48}, {0.38, 1} } })
hl.curve("easeOutExpo", { type = "bezier", points = { {0.10, 0.94}, {0.23, 0.98} } })
hl.curve("softAcDecel", { type = "bezier", points = { {0.20, 0.20}, {0.15, 1} } })
hl.curve("md2",         { type = "bezier", points = { {0.30, 0}, {0.15, 1} } })
hl.curve("OutBack",     { type = "bezier", points = { {0.28, 1.40}, {0.58, 1} } })

hl.animation({ leaf = "border",        enabled = true, speed = 1.6, bezier = "liner" })
hl.animation({ leaf = "borderangle",   enabled = true, speed = 82, bezier = "liner", style = "loop" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 3.2, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 2.8, bezier = "easeOutCirc" })
hl.animation({ leaf = "windowsMove",   enabled = true, speed = 3.0, bezier = "wind", style = "slide" })
hl.animation({ leaf = "fade",          enabled = true, speed = 1.8, bezier = "md3_decel" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 1.8, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5, bezier = "menu_accel" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.6, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.8, bezier = "menu_accel" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 4.0, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.3, bezier = "md3_decel", style = "slidefadevert 15%" })

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- GESTURES
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down", action = "close" })
-- hl.gesture({ fingers = 3, direction = "up", action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left", action = "float" })

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- KEYBINDS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

local mainMod = "SUPER"

-- App shortcuts
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal), { description = "Apps: Terminal" })
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(filemanager), { description = "Apps: File Manager" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Window: Close" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd('loginctl terminate-user ""'), { description = "System: Log Out" })
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }), { description = "Window: Toggle Float" })
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(applauncher), { description = "Apps: App Launcher" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }), { description = "Window: Toggle Fullscreen" })
hl.bind(mainMod .. " + Y", hl.dsp.window.pin(), { description = "Window: Pin" })
hl.bind(mainMod .. " + E", hl.dsp.layout("togglesplit"), { description = "Layout: Toggle Split" })

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd(shot_region), { description = "Screenshot: Region" })
hl.bind("CTRL + Print", hl.dsp.exec_cmd(shot_window), { description = "Screenshot: Window" })
hl.bind("ALT + Print", hl.dsp.exec_cmd(shot_screen), { description = "Screenshot: Full Screen" })
hl.bind("ALT + SHIFT + 4", hl.dsp.exec_cmd("qs -p ~/.config/quickshell/ii ipc call region screenshot"), { description = "Screenshot: Quickshell Region" })

-- Grouping
hl.bind(mainMod .. " + Tab", hl.dsp.group.next(), { description = "Group: Next Window" })

-- Switch keyboard layout
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.exec_cmd("hyprctl switchxkblayout current next"), { description = "System: Next Keyboard Layout", locked = true })

-- Toggle gaps
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd('hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"'), { description = "Layout: Restore Gaps" })
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd('hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"'), { description = "Layout: Remove Gaps" })

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { description = "Media: Volume Up", locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), { description = "Media: Volume Down", locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("amixer sset Master toggle"), { description = "Media: Mute", locked = true, repeating = true })

-- Playback
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Media: Play/Pause", locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { description = "Media: Next Track", locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { description = "Media: Previous Track", locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { description = "Hardware: Brightness Up", locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { description = "Hardware: Brightness Down", locked = true, repeating = true })

-- Quickshell reload (replaced Waybar)
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("pkill quickshell; quickshell -c ii & disown"), { description = "Shell: Reload Quickshell" })

-- Quickshell cheatsheet
hl.bind(mainMod .. " + Slash", hl.dsp.global("quickshell:cheatsheetToggle"), { description = "Shell: Toggle Cheatsheet" })

-- Quickshell overview
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("qs -p ~/.config/quickshell/ii ipc call search toggle"), { description = "Shell: Toggle Overview/Workspaces" })

-- Window movement / focus
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "Window: Drag", mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "Window: Resize", mouse = true })
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }), { description = "Window: Move Left" })
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }), { description = "Window: Move Right" })
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }), { description = "Window: Move Up" })
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }), { description = "Window: Move Down" })
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }), { description = "Focus: Move Left" })
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }), { description = "Focus: Move Right" })
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }), { description = "Focus: Move Up" })
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }), { description = "Focus: Move Down" })

-- Display Focus Toggle (Super + Ctrl + 1-0)
for i = 1, 9 do
	hl.bind(mainMod .. " + CTRL + " .. i, hl.dsp.focus({ monitor = i - 1 }))
end
hl.bind(mainMod .. " + CTRL + 0", hl.dsp.focus({ monitor = 9 }))


-- Move window to workspace (silent)
for i = 1, 9 do
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10, follow = false }))

-- Switch workspaces
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, function()
		local ws = tostring(i)
		local current_monitor = hl.get_active_monitor().name
		hl.dispatch(hl.dsp.workspace.move({ workspace = ws, monitor = current_monitor }))
		hl.dispatch(hl.dsp.focus({ workspace = ws }))
	end)
end
hl.bind(mainMod .. " + 0", function()
	local ws = "10"
	local current_monitor = hl.get_active_monitor().name
	hl.dispatch(hl.dsp.workspace.move({ workspace = ws, monitor = current_monitor }))
	hl.dispatch(hl.dsp.focus({ workspace = ws }))
end)

-- Workspace scrolling
-- hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
-- hl.bind(mainMod .. " + slash", hl.dsp.focus({ workspace = "previous" }))

-- Special workspaces
hl.bind(mainMod .. " + minus", hl.dsp.window.move({ workspace = "special" }), { description = "Workspace: Move to Special" })
hl.bind(mainMod .. " + equal", hl.dsp.workspace.toggle_special(), { description = "Workspace: Toggle Special" })
hl.bind(mainMod .. " + F1", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + ALT + SHIFT + F1", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- Resize Submap (Super + R)
hl.bind(mainMod .. " + r", hl.dsp.submap("resize"), { description = "Window: Enter Resize Mode" })
hl.define_submap("resize", "Escape", function()
	local step = 20
	
	-- Exit submap
	hl.bind("Escape", hl.dsp.submap("reset"))
	hl.bind("RETURN", hl.dsp.submap("reset"))
	hl.bind("", hl.dsp.submap("reset"), { catchall = true })
	
	-- HJKL
	hl.bind("h", hl.dsp.window.resize({ x = -step, y = 0, relative = true }), { repeating = true })
	hl.bind("l", hl.dsp.window.resize({ x = step, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -step, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = step, relative = true }), { repeating = true })
	
	-- Arrow keys
	hl.bind("left", hl.dsp.window.resize({ x = -step, y = 0, relative = true }), { repeating = true })
	hl.bind("right", hl.dsp.window.resize({ x = step, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = -step, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = step, relative = true }), { repeating = true })
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- WINDOW RULES
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

-- Float necessary windows
hl.window_rule({
	name = "float-pulseaudio",
	match = { class = "^org.pulseaudio.pavucontrol" },
	float = true,
})
hl.window_rule({
	name = "float-pip",
	match = { class = "^$", title = "^Picture in picture$" },
	float = true,
})
hl.window_rule({
	name = "float-save-file",
	match = { class = "^$", title = "^Save File$" },
	float = true,
})
hl.window_rule({
	name = "float-open-file",
	match = { class = "^$", title = "^Open File$" },
	float = true,
})
hl.window_rule({
	name = "float-librewolf-pip",
	match = { class = "^LibreWolf$", title = "^Picture-in-Picture$" },
	float = true,
})
hl.window_rule({
	name = "float-blueman",
	match = { class = "^blueman-manager$" },
	float = true,
})
hl.window_rule({
	name = "float-portal",
	match = { class = "^xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland(.*)$" },
	float = true,
})
hl.window_rule({
	name = "float-polkit",
	match = { class = "(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.org.kde.polkit-kde-authentication-agent-1)(.*)$" },
	float = true,
})
hl.window_rule({
	name = "float-cachyoshello",
	match = { class = "^CachyOSHello$" },
	float = true,
})
hl.window_rule({
	name = "float-zenity",
	match = { class = "^zenity$" },
	float = true,
})
hl.window_rule({
	name = "float-steam-updater",
	match = { class = "^$", title = "^Steam - Self Updater$" },
	float = true,
})

-- Opacity rules
hl.window_rule({
	name = "opacity-filemanagers",
	match = { class = "^thunar|nemo$" },
	opacity = "0.92",
})
hl.window_rule({
	name = "opacity-discord",
	match = { class = "^discord|armcord|webcord$" },
	opacity = "0.96",
})
hl.window_rule({
	name = "opacity-qq-telegram",
	match = { title = "^QQ|Telegram$" },
	opacity = "0.95",
})
hl.window_rule({
	name = "opacity-netease",
	match = { title = "^NetEase Cloud Music Gtk4$" },
	opacity = "0.95",
})

-- PiP rules
hl.window_rule({
	name = "pip-float",
	match = { title = "^Picture-in-Picture$" },
	float = true,
})
hl.window_rule({
	name = "pip-size",
	match = { title = "^Picture-in-Picture$" },
	size = "960 540",
})
hl.window_rule({
	name = "pip-move",
	match = { title = "^Picture-in-Picture$" },
	move = "25%- 25%-",
})

-- Media app rules
hl.window_rule({
	name = "media-float",
	match = { title = "^imv|mpv|danmufloat|termfloat|nemo|ncmpcpp$" },
	float = true,
})
hl.window_rule({
	name = "media-move",
	match = { title = "^imv|mpv|danmufloat|termfloat|nemo|ncmpcpp$" },
	move = "25%- 25%-",
})
hl.window_rule({
	name = "media-size",
	match = { title = "^imv|mpv|danmufloat|termfloat|nemo|ncmpcpp$" },
	size = "960 540",
})
hl.window_rule({
	name = "danmufloat-pin",
	match = { title = "^danmufloat$" },
	pin = true,
})
hl.window_rule({
	name = "danmufloat-termfloat-rounding",
	match = { title = "^danmufloat|termfloat$" },
	rounding = 5,
})

-- Terminal animation
hl.window_rule({
	name = "terminal-animation",
	match = { class = "^kitty|Alacritty$" },
	animation = "slide right",
})

-- Floating windows on workspaces 1-10
hl.window_rule({
	name = "float-ws-border",
	match = { workspace = "w[fv1-10]", float = true },
	border_size = 1,
})
hl.window_rule({
	name = "float-ws-rounding",
	match = { workspace = "w[fv1-10]", float = true },
	rounding = 8,
})

-- Tiling windows on workspaces 1-10
hl.window_rule({
	name = "tile-ws-border",
	match = { workspace = "f[1-10]", float = false },
	border_size = 1,
})
hl.window_rule({
	name = "tile-ws-rounding",
	match = { workspace = "f[1-10]", float = false },
	rounding = 4,
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- LAYER RULES
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

hl.layer_rule({
	name = "logout-dialog-anim",
	match = { namespace = "^logout_dialog$" },
	animation = "slide top",
})
hl.layer_rule({
	name = "waybar-anim",
	match = { namespace = "^waybar$" },
	animation = "slide down",
})
hl.layer_rule({
	name = "wallpaper-anim",
	match = { namespace = "^wallpaper$" },
	animation = "fade 50%",
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- WORKSPACE RULES
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

local function apply_monitor_gaps(monitor)
	local width = monitor.width
	local gaps_out = 5
	local gaps_in = 3
	local rounding = 4
	if width >= 3600 then
		gaps_out = 20
		gaps_in = 10
		rounding = 14
	elseif width >= 2560 then
		gaps_out = 12
		gaps_in = 6
		rounding = 8
	end
	hl.workspace_rule({ workspace = "m[" .. monitor.name .. "]", gaps_out = gaps_out, gaps_in = gaps_in })
	hl.window_rule({
		name = "rounding_" .. monitor.name,
		match = { workspace = "m[" .. monitor.name .. "]" },
		rounding = rounding
	})
end

for _, monitor in ipairs(hl.get_monitors()) do
	apply_monitor_gaps(monitor)
end

hl.on("monitor.added", function(monitor)
	apply_monitor_gaps(monitor)
end)
