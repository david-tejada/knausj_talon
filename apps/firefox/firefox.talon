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

# devtools
tool inspect: key(ctrl-shift-c)
tool console: key(ctrl-shift-k)
tool debug: key(ctrl-shift-z)
