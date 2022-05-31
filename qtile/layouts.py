from libqtile import layout
layouts = [
    layout.Spiral(border_width=0, ratio=0.57, new_client_position="after_current"),
    layout.Stack(border_width = 0),
    layout.Bsp(border_width=0),
    layout.Max(),
]
floating_layout = layout.Floating(border_width=0)
