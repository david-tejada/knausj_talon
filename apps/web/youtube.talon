tag: browser
browser.host: /youtube/
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

cinema:
    key(f k)
    speech.disable()

cinema stop:
    key(f k)
    speech.enable()

full video: key(f)
start video: key(k)