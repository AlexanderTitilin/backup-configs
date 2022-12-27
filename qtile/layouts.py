from libqtile import layout
layout_config = {"border_width" : 0,
        "ratio" : 0.57,
}
layouts = [
    layout.MonadTall(**layout_config,),
    layout.MonadWide(**layout_config),
    layout.Bsp(border_width = 0),
    layout.Max(),
]
floating_layout = layout.Floating(border_width=0)

