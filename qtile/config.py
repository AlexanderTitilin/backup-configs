import os
import subprocess

from libqtile import hook
from keys import *
from bar import *
from layouts import *


dgroups_key_binder = None
dgroups_app_rules = []  
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
