app: firefox
-
tag(): browser
tag(): user.tabs
tab search:
    browser.focus_address()
    insert("% ")
tab search <user.text>$:
    browser.focus_address()
    insert("% {text}")
    key(down)

# Vimium
hint: key(ctrl-alt-f)
hint new: key(ctrl-alt-F)
upper: key(ctrl-alt-u)
downer: key(ctrl-alt-j)
parrot(mfff):
    user.append_to_logfile("MFFF")
    key(ctrl-alt-j)
parrot(tchak):
    user.append_to_logfile("TCHAK")
    key(ctrl-alt-f)

# devtools
tool inspect: key(ctrl-shift-c)
tool console: key(ctrl-shift-k)
tool debug: key(ctrl-shift-z)