---@meta
---@module 'oxwm'

local modkey = "Mod1"
local terminal = "alacritty"

local colors = {
    fg = "#bbbbbb",
    red = "#f7768e",
    bg = "#1a1b26",
    cyan = "#0db9d7",
    green = "#9ece6a",
    lavender = "#a9b1d6",
    light_blue = "#7aa2f7",
    grey = "#bbbbbb",
    blue = "#6dade3",
    purple = "#ad8ee6",
    sep = "#444b6a",
}


local tags = { "", "", "", "󰙯", "󱇤", "" } -- Example of nerd font icon tags

local bar_font = "JetBrainsMono Nerd Font Propo:style=Bold:size=16"

local blocks = {
    oxwm.bar.block.static({
        text = " │  ",
        interval = 999999999,
        color = colors.sep,
        underline = false,
    }),
    oxwm.bar.block.shell({
        format = " {}",
        command = "uname -r",
        interval = 999999999,
        color = colors.red,
        underline = true,
    }),
    oxwm.bar.block.static({
        text = " │  ",
        interval = 999999999,
        color = colors.sep,
        underline = false,
    }),
    oxwm.bar.block.ram({
        format = "󰍛 Ram: {used}/{total} GB",
        interval = 5,
        color = colors.light_blue,
        underline = true,
    }),
    oxwm.bar.block.static({
        text = " │  ",
        interval = 999999999,
        color = colors.sep,
        underline = false,
    }),
    oxwm.bar.block.datetime({
        format = "󰸘 {}",
        date_format = "%a, %b %d - %-I:%M %P",
        interval = 1,
        color = colors.cyan,
        underline = true,
    }),
    oxwm.bar.block.static({
        text = " │  ",
        interval = 999999999,
        color = colors.sep,
        underline = false,
    }),
    oxwm.bar.block.battery({
        format = "Bat: {}%",
        charging = "⚡ Bat: {}%",
        discharging = "- Bat: {}%",
        full = "✓ Bat: {}%",
        interval = 30,
        color = colors.green,
        underline = true,
    }),
    oxwm.bar.block.static({
        text = " │  ",
        interval = 999999999,
        color = colors.sep,
        underline = false,
    }),
};

oxwm.set_terminal(terminal)
oxwm.set_modkey(modkey)
oxwm.set_tags(tags)

oxwm.set_layout_symbol("tiling", "[T]")
oxwm.set_layout_symbol("normie", "[F]")
oxwm.set_layout_symbol("tabbed", "[=]")

oxwm.border.set_width(2)
oxwm.border.set_focused_color(colors.purple)
oxwm.border.set_unfocused_color(colors.grey)

oxwm.gaps.set_smart(false)
oxwm.gaps.set_inner(10, 10)
oxwm.gaps.set_outer(10, 10)

-- oxwm.rule.add({ class = "firefox", tag = 2 })

oxwm.bar.set_font(bar_font)
oxwm.bar.set_blocks(blocks)
oxwm.bar.set_scheme_normal(colors.fg, colors.bg, "#444444")
oxwm.bar.set_scheme_occupied(colors.cyan, colors.bg, colors.cyan)
oxwm.bar.set_scheme_selected(colors.cyan, colors.bg, colors.purple)

oxwm.key.bind({ modkey }, "T", oxwm.spawn_terminal())
oxwm.key.bind({ modkey }, "Space", oxwm.spawn({ "sh", "-c", "rofi -show drun" }))
oxwm.key.bind({ modkey }, "P", oxwm.spawn({ "sh", "-c", "maim -s | xclip -selection clipboard -t image/png" }))
oxwm.key.bind({ modkey }, "W", oxwm.client.kill())
oxwm.key.bind({ modkey }, "U", oxwm.spawn({ "sh", "-c", "~/.local/bin/random-wallpaper.sh" }))

oxwm.key.bind({ modkey, "Shift" }, "Slash", oxwm.show_keybinds())
oxwm.key.bind({ modkey, "Shift" }, "Return", oxwm.client.toggle_fullscreen())
oxwm.key.bind({ modkey, "Shift" }, "F", oxwm.client.toggle_floating())
oxwm.key.bind({ modkey, "Shift" }, "T", oxwm.layout.set("tiling"))
-- oxwm.key.bind({ modkey }, "H", oxwm.set_master_factor(-5))
-- oxwm.key.bind({ modkey }, "L", oxwm.set_master_factor(5))
-- oxwm.key.bind({ modkey }, "I", oxwm.inc_num_master(1))
-- oxwm.key.bind({ modkey }, "O", oxwm.inc_num_master(-1))
-- oxwm.key.bind({ modkey }, "A", oxwm.toggle_gaps())
oxwm.key.bind({ modkey, "Shift" }, "Q", oxwm.quit())
oxwm.key.bind({ modkey, "Shift" }, "R", oxwm.restart())
oxwm.key.bind({ modkey }, "J", oxwm.client.focus_stack(1))
oxwm.key.bind({ modkey }, "K", oxwm.client.focus_stack(-1))
oxwm.key.bind({ modkey, "Shift" }, "J", oxwm.client.move_stack(1))
oxwm.key.bind({ modkey, "Shift" }, "K", oxwm.client.move_stack(-1))
oxwm.key.bind({ modkey }, "Comma", oxwm.monitor.focus(-1))
oxwm.key.bind({ modkey }, "Period", oxwm.monitor.focus(1))
oxwm.key.bind({ modkey, "Shift" }, "Comma", oxwm.monitor.tag(-1))
oxwm.key.bind({ modkey, "Shift" }, "Period", oxwm.monitor.tag(1))

oxwm.key.bind({ modkey }, "1", oxwm.tag.view(0))
oxwm.key.bind({ modkey }, "2", oxwm.tag.view(1))
oxwm.key.bind({ modkey }, "3", oxwm.tag.view(2))
oxwm.key.bind({ modkey }, "4", oxwm.tag.view(3))
oxwm.key.bind({ modkey }, "5", oxwm.tag.view(4))
oxwm.key.bind({ modkey }, "6", oxwm.tag.view(5))
oxwm.key.bind({ modkey }, "7", oxwm.tag.view(6))
oxwm.key.bind({ modkey }, "8", oxwm.tag.view(7))
oxwm.key.bind({ modkey }, "9", oxwm.tag.view(8))

oxwm.key.bind({ modkey, "Shift" }, "1", oxwm.tag.move_to(0))
oxwm.key.bind({ modkey, "Shift" }, "2", oxwm.tag.move_to(1))
oxwm.key.bind({ modkey, "Shift" }, "3", oxwm.tag.move_to(2))
oxwm.key.bind({ modkey, "Shift" }, "4", oxwm.tag.move_to(3))
oxwm.key.bind({ modkey, "Shift" }, "5", oxwm.tag.move_to(4))
oxwm.key.bind({ modkey, "Shift" }, "6", oxwm.tag.move_to(5))
oxwm.key.bind({ modkey, "Shift" }, "7", oxwm.tag.move_to(6))
oxwm.key.bind({ modkey, "Shift" }, "8", oxwm.tag.move_to(7))
oxwm.key.bind({ modkey, "Shift" }, "9", oxwm.tag.move_to(8))

oxwm.key.bind({ modkey, "Control" }, "1", oxwm.tag.toggleview(0))
oxwm.key.bind({ modkey, "Control" }, "2", oxwm.tag.toggleview(1))
oxwm.key.bind({ modkey, "Control" }, "3", oxwm.tag.toggleview(2))
oxwm.key.bind({ modkey, "Control" }, "4", oxwm.tag.toggleview(3))
oxwm.key.bind({ modkey, "Control" }, "5", oxwm.tag.toggleview(4))
oxwm.key.bind({ modkey, "Control" }, "6", oxwm.tag.toggleview(5))
oxwm.key.bind({ modkey, "Control" }, "7", oxwm.tag.toggleview(6))
oxwm.key.bind({ modkey, "Control" }, "8", oxwm.tag.toggleview(7))
oxwm.key.bind({ modkey, "Control" }, "9", oxwm.tag.toggleview(8))

oxwm.key.bind({ modkey, "Control", "Shift" }, "1", oxwm.tag.toggletag(0))
oxwm.key.bind({ modkey, "Control", "Shift" }, "2", oxwm.tag.toggletag(1))
oxwm.key.bind({ modkey, "Control", "Shift" }, "3", oxwm.tag.toggletag(2))
oxwm.key.bind({ modkey, "Control", "Shift" }, "4", oxwm.tag.toggletag(3))
oxwm.key.bind({ modkey, "Control", "Shift" }, "5", oxwm.tag.toggletag(4))
oxwm.key.bind({ modkey, "Control", "Shift" }, "6", oxwm.tag.toggletag(5))
oxwm.key.bind({ modkey, "Control", "Shift" }, "7", oxwm.tag.toggletag(6))
oxwm.key.bind({ modkey, "Control", "Shift" }, "8", oxwm.tag.toggletag(7))
oxwm.key.bind({ modkey, "Control", "Shift" }, "9", oxwm.tag.toggletag(8))
