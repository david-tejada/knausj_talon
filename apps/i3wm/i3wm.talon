# NOTE: If you want to use i3wm you must enable the tag settings.talon. ex: `tag(): user.i3wm`
os: linux
tag: user.i3wm
-
lane <number_small>: user.system_command("i3-msg workspace number {number_small}")
(lane flip|flip): user.system_command("i3-msg workspace back_and_forth")
lane right: user.system_command("i3-msg workspace next")
lane left: user.system_command("i3-msg workspace prev")
lane rename <number_small> (<user.text> | <user.letters>): user.system_command("i3-msg 'rename workspace to \"{number_small}: {text or letters}\"'")

win <user.arrow_keys>: user.system_command("i3-msg focus {user.arrow_keys}")
glide: user.system_command("i3-msg focus right")
^glide <phrase>$: user.focus_container("right", phrase)
slide: user.system_command("i3-msg focus left")
^slide <phrase>$: user.focus_container("left", phrase)
win close: user.system_command("i3-msg kill")
win stacking: user.system_command("i3-msg layout stacking")
win default: user.system_command("i3-msg layout toggle split")
win tabbed: user.system_command("i3-msg layout tabbed")

reload i three config: user.system_command("i3-msg reload")
restart i three: user.system_command("i3-msg restart")

(full screen | scuba): user.system_command("i3-msg fullscreen")
toggle floating: user.system_command("i3-msg floating toggle")
focus floating: user.system_command("i3-msg focus mode_toggle")
center window: user.system_command("i3-msg move position center")
resize mode: user.system_command('i3-msg mode "resize"')
focus parent: user.system_command("i3-msg focus parent")
focus child: user.system_command("i3-msg focus child")

win grow [<user.arrow_keys>]: user.i3wm_resize_window("grow", arrow_keys or "both")
win shrink [<user.arrow_keys>]: user.i3wm_resize_window("shrink", arrow_keys or "both")
win tall: user.system_command("i3-msg resize grow height 100 px or 10 ppt")
win short: user.system_command("i3-msg resize shrink height 100 px or 10 ppt")
win fat: user.system_command("i3-msg resize grow width 100 px or 10 ppt")
win slim: user.system_command("i3-msg resize shrink width 100 px or 10 ppt")

horizontal (shell | terminal):
    user.system_command("i3-msg split h")
    user.system_command("i3-msg exec i3-sensible-terminal")

vertical (shell | terminal):
    user.system_command("i3-msg split v")
    user.system_command("i3-msg exec i3-sensible-terminal")

# XXX - just replace with shuffle eventually?
# XXX - like also need to match the generic talon commands
shuffle <number_small>:  user.system_command("i3-msg move container to workspace number {number_small}")
shuffle: user.system_command("i3-msg move container to workspace back_and_forth")
shuffle <user.arrow_keys>: user.system_command("i3-msg move {user.arrow_keys}")
report <number_small>:
    user.system_command("i3-msg move container to workspace number {number_small}")
    user.system_command("i3-msg workspace number {number_small}")
detach:
    key(ctrl-alt-n)
detach <number_small>:
    key(ctrl-alt-n)
    sleep(300ms)
    user.system_command("i3-msg move container to workspace number {number_small}")
    user.system_command("i3-msg workspace number {number_small}")

win horizontal: user.system_command("i3-msg split h")
win vertical: user.system_command("i3-msg split v")

above left:
    user.system_command("i3-msg split v")
    user.system_command("i3-msg focus left")
    user.system_command("i3-msg move right")
    user.system_command("i3-msg focus up")

above right:
    user.system_command("i3-msg split v")
    user.system_command("i3-msg focus right")
    user.system_command("i3-msg move left")
    user.system_command("i3-msg focus up")

below left:
    user.system_command("i3-msg focus left")
    user.system_command("i3-msg split v")
    user.system_command("i3-msg focus right")
    user.system_command("i3-msg move left")

below right:
    user.system_command("i3-msg focus right")
    user.system_command("i3-msg split v")
    user.system_command("i3-msg focus left")
    user.system_command("i3-msg move right")

make scratch: user.system_command("i3-msg move scratchpad")
scratch <user.text>: user.system_command('i3-msg [title="(?i){text}"] scratchpad show')
[(show|hide)] scratch: user.system_command("i3-msg scratchpad show")
next scratch:
    user.system_command("i3-msg scratchpad show")
    user.system_command("i3-msg scratchpad show")

window <user.text>: user.system_command('i3-msg [title="(?i){text}"] focus')

# these rely on the user settings for the mod key. see i3wm.py Actions class

launch: user.i3wm_launch()
launch {user.applications}:
    user.i3wm_launch()
    sleep(100ms)
    insert(applications)
    sleep(100ms)
    key(enter)
lock screen: user.i3wm_lock()
^computer reboot$: user.system_command("reboot")
(launch shell|Shelley): user.i3wm_shell()

system tray: key("super-shift-s")

keyboard spanish: user.system_command("setxkbmap es")
keyboard english: user.system_command("setxkbmap us")

snooze break:
    mouse_move(1912, 1111)
    mouse_click(0)
