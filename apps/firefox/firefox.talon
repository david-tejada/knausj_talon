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
blink: key(ctrl-alt-f)
blink new: key(ctrl-alt-F)
ceil: key(ctrl-alt-u)
floor: key(ctrl-alt-j)