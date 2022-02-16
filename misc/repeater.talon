# -1 because we are repeating, so the initial command counts as one
# <user.ordinals>: core.repeat_command(ordinals-1)
<number_small> times: core.repeat_command(number_small-1)
(repeat that|twice): core.repeat_command(1)
trip: core.repeat_command(2)
fourth: core.repeat_command(3)
fifth: core.repeat_command(4)
repeat that <number_small> [times]: core.repeat_command(number_small)
