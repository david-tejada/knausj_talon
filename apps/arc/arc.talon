app: arc
-
tag(): browser
tag(): user.tabs

please [<user.text>]:
    key(cmd-t)
    sleep(150ms)
    insert(user.text or "")

bar switch:
    key(cmd-s)

# devtools
tool inspect: key(ctrl-shift-c)
tool console: key(ctrl-shift-k)
tool debug: key(ctrl-shift-z)
