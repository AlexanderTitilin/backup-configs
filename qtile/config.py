import os
import subprocess

from libqtile import hook, layout, widget, bar
from libqtile.config import Click, Drag, Group, Key, KeyChord, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()
keys = [
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(),
                                 desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        lazy.layout.grow_main().when(layout = "spiral"),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(),
        lazy.layout.shrink_main().when(layout="spiral"),
        desc="Grow window up"),
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "h", lazy.layout.flip_left()),
    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.prev_layout()),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "d", lazy.spawn('rofi -font "JetBrais Mono 13" -show run')),
    Key(
        [mod], "0", lazy.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu")
    ),
    Key([mod], "s", lazy.spawn("i3-scrot")),
    Key([mod, "control"], "s", lazy.spawn("i3-scrot -s")),
    KeyChord(
        [mod],
        "a",
        [
            Key([], "1", lazy.spawn("neovide")),
            Key([], "2", lazy.spawn("firefox")),
            Key([], "3", lazy.spawn("kotatogram-desktop")),
            Key([], "4", lazy.spawn("alacritty -e vifm")),
        ],
    ),
]
workspases = ["", "", "", "ﬦ"]
groups = [Group(i) for i in workspases]


for j, i in enumerate(groups, 1):
    keys.extend(
        [
            Key(
                [mod],
                str(j),
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                str(j),
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

colors = {
    "background": "#2b2d37",
    "foreground": "#c5cdd9",
    "primary": "#da8548",
    "red": "#b05655",
    "green": "#769972",
    "yellow": "#e1a574",
    "blue": "#7693ac",
    "white" : "#FFFFFF",
    "black": "#000000",
}
layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    layout.Spiral(border_width=0, ratio=0.57, new_client_position="after_current"),
    layout.Stack(border_width = 0),
    layout.Bsp(border_width=0),
    layout.Max(),
    # layout.TreeTab(),
]
floating_layout = layout.Floating(border_width=0)

widget_defaults = dict(
    font="JetBrains Mono ",
    fontsize=15,
    padding=3,
    padding_x=1,
    background=colors["background"],
)
arrow = widget.TextBox(
        fmt="", foreground=colors["blue"], padding=0, fontsize=35)
extension_defaults = widget_defaults.copy()
screens = [
    Screen(
        top=bar.Bar(
            [
                arrow,
                widget.CurrentLayout(
                    background=colors["blue"]
                    ),
                widget.GroupBox(
                    background=colors["blue"],
                    padding=1,
                    font="JetBrains Mono Nerd Font",
                    highlight_method="line",
                    highlight_color = [
                        colors["blue"],
                        colors["blue"]
                        ],
                    this_current_screen_border=colors["white"],
                    urgent_border=colors["red"],
                    hide_unused =  True,
                ),
                widget.WindowName(),
                widget.TextBox(fmt=" "),
                widget.Clock(format="%Y-%m-%d %H:%M:%S", foreground=colors["primary"]),
                widget.Spacer(),
                arrow,
                widget.TextBox(
                    fmt = "",
                    background = colors["blue"],
                    fontsize = 35
                    ),
                widget.OpenWeather(
                    location="Saint Petersburg",
                    format="{main_temp}°{units_temperature} {humidity}% ",
                    background=colors["blue"],
                    padding=5,
                ),
                widget.TextBox(fmt="", background=colors["blue"],
                    fontsize = 20),
                widget.ThermalSensor(background=colors["blue"]),
                widget.TextBox(fmt="", background=colors["blue"],
                    fontsize=20),
                widget.CPU(format="{load_percent}%", background=colors["blue"]),
                widget.TextBox(fmt="", background=colors["blue"]),
                widget.Battery(format="{percent:2.0%}", background=colors["blue"]),
                widget.TextBox(fmt="", background=colors["blue"],
                    fontsize = 25),
                widget.Memory(format="{MemUsed:.0f}{mm} ", background=colors["blue"]),

            ],
            25,
        ),
    ),
]
# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([home])


auto_minimize = True
wl_input_rules = None
wmname = "Qtile"
