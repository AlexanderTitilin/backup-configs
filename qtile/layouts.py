from libqtile import layout

layout_config = {
    "border_width": 2,
    "border_focus": '#957FB8',
    "border_normal": '#1F1F28',
    "ratio": 0.57,
}
layouts = [
    layout.MonadTall(**layout_config),
    layout.MonadWide(**layout_config),
    layout.Bsp(border_width=0),
    layout.Max(),
]
floating_layout = layout.Floating(border_width=0)
