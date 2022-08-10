from libqtile import layout
layouts = [
    layout.MonadTall(border_width=0,ratio=0.57),
    layout.Bsp(border_width=0,),
    layout.Max(),
]
floating_layout = layout.Floating(border_width=0)
