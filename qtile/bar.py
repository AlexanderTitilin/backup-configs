from libqtile import  widget, bar
from libqtile.config import  Screen
import re
import subprocess

colors = {
    "background": "#2b2d37",
    "foreground": "#c6d0f5",
    "primary": "#ef9f76",
    "red": "#b05655",
    "green": "#769972",
    "yellow": "#e1a574",
    "white" : "#FFFFFF",
    "black": "#000000",
    "blue": "#7693ac",
}


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
def get_uptime():
    uptime =  str(subprocess.check_output(["uptime","--pretty"]))
    is_digit = re.compile(r"\d+ \w")
    return ":".join([s.replace(" ","") for s in is_digit.findall(uptime)])
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(
                    ),
                widget.GroupBox(
                    padding=1,
                    font="JetBrains Mono Nerd Font",
                    highlight_method="line",
                    highlight_color = [
                        colors["background"],
                        colors['background']
                        ],
                    this_current_screen_border=colors['yellow'],
                    urgent_border=colors["red"],
                    hide_unused =  True,
                ),
                widget.WindowName(),
                widget.TextBox(fmt=" "),
                widget.Clock(format="%Y-%m-%d %H:%M:%S", foreground=colors["primary"]),
                widget.Spacer(),
                arrow,
                widget.TextBox(
                    fmt = "UPTIME",
                    background = colors["blue"]
                    ),
                widget.GenPollText(
                    background = colors["blue"],
                    func = get_uptime,
                    update_interval = 30
                    ),
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
                # widget.Systray()
            ],
            25,
        ),
    ),
]
