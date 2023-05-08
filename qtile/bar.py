from libqtile import widget, bar
from libqtile.config import Screen
from dataclasses import dataclass
import re
import subprocess


@dataclass(frozen=True, order=False)
class Colors():
    fg1 = '#DCD7BA'
    color2 = '#504945'
    fg2 = '#ddc7a1'
    color3 = '#1F1F28'
    color4 = '#a89984'
    color5 = '#7daea3'
    color6 = '#a9b665'
    color7 = '#d8a657'
    color8 = '#d3869b'
    color9 = '#ea6962'
    oni_violet = '#957FB8'


colors = Colors()

widget_defaults = dict(font="JetBrains Mono ",
                       fontsize=17,
                       padding=3,
                       padding_x=1,
                       background=colors.color3,
                       foreground=colors.fg1)
arrow = widget.TextBox(fmt="", padding=0, fontsize=35)
extension_defaults = widget_defaults.copy()


def get_uptime():
    uptime = str(subprocess.check_output(["uptime", "--pretty"]))
    is_digit = re.compile(r"\d+ \w")
    return ":".join([s.replace(" ", "") for s in is_digit.findall(uptime)])


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(
                    padding=1,
                    font="JetBrains Mono Nerd Font",
                    highlight_method="line",
                    highlight_color=[colors.color3, colors.color3],
                    this_current_screen_border=colors.color7,
                    urgent_border=colors.color9,
                    hide_unused=True,
                ),
                widget.Prompt(),
                widget.Wallpaper(directory="~/Изображения/wallpapers",
                                 label="",
                                 random_selection=True,
                                 option='stretch'),
                widget.WindowName(),
                widget.Clock(format="%Y-%m-%d %H:%M:%S",
                             foreground=colors.color7),
                widget.Spacer(),
                # arrow,
                widget.TextBox(fmt="UPTIME", foreground=colors.oni_violet),
                widget.GenPollText(func=get_uptime, update_interval=30),
                widget.TextBox(
                    fmt="", fontsize=35, foreground=colors.oni_violet),
                widget.OpenWeather(
                    location="Saint Petersburg",
                    format="{main_temp}°{units_temperature} {humidity}% ",
                    padding=5,
                ),
                widget.TextBox(
                    fmt="", fontsize=20, foreground=colors.oni_violet),
                widget.ThermalSensor(foreground_alert=colors.color9),
                widget.TextBox(
                    fmt="", fontsize=20, foreground=colors.oni_violet),
                widget.CPU(format="{load_percent}%", ),
                widget.TextBox(fmt="", foreground=colors.oni_violet),
                widget.Battery(format="{percent:2.0%}", ),
                widget.TextBox(
                    fmt="", fontsize=25, foreground=colors.oni_violet),
                widget.Memory(format="{MemUsed:.0f}{mm} ", ),
                widget.Systray()
            ],
            35,
        ), ),
]
