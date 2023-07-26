# -1 because we are repeating, so the initial command counts as one
# <user.ordinals>: core.repeat_command(ordinals - 1)
<number_small> times: core.repeat_command(number_small - 1)
(repeat that | twice): core.repeat_command(1)
third: core.repeat_command(2)
key(f14): core.repeat_command(1)
repeat that <number_small> [times]: core.repeat_command(number_small)

# Repeat the whole phrase
again: core.repeat_phrase(1)
repeat all <number_small> [times]: core.repeat_phrase(number_small)