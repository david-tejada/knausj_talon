tag: browser
title: /- YouTube/
# Homepage
# title: YouTube/
-
speed up: key("shift-.")
(speed | slow) down: key("shift-,")
(max | full) speed:
    # Will hit the max regardless
    key(">:7")
normal speed:
    # Go to min, then max
    key("shift-,:7")
    key(">:3")