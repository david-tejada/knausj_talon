# NOTE: If you want to use i3wm you must enable the tag settings.talon. ex: `tag(): user.i3wm`
os: linux
tag: user.i3wm
-
bay <number_small>: user.system_command("i3-msg workspace number {number_small}")
# (beone|bione): user.system_command("i3-msg workspace number 1")
# basix: user.system_command("i3-msg workspace number 6")
# besev: user.system_command("i3-msg workspace number 7")
# beto: user.system_command("i3-msg workspace number 2")
# be eleven: user.system_command("i3-msg workspace number 11")
(bay flip|flipper): user.system_command("i3-msg workspace back_and_forth")
bay right: user.system_command("i3-msg workspace next")
bay left: user.system_command("i3-msg workspace prev")
bay rename <number_small> (<user.word> | <user.letters>): user.system_command("i3-msg 'rename workspace to \"{number_small}: {word or letters}\"'")

win <user.arrow_keys>: user.system_command("i3-msg focus {user.arrow_keys}")
glide: user.system_command("i3-msg focus right")
^glide <phrase>$: user.focus_container("right", phrase)
slide: user.system_command("i3-msg focus left")
^slide <phrase>$: user.focus_container("left", phrase)
win kill: user.system_command("i3-msg kill")
win stacking: user.system_command("i3-msg layout stacking")
win default: user.system_command("i3-msg layout toggle split")
win tabbed: user.system_command("i3-msg layout tabbed")

reload i three config: user.system_command("i3-msg reload")
restart i three: user.system_command("i3-msg restart")

(full screen|scuba): user.system_command("i3-msg fullscreen")
toggle floating: user.system_command("i3-msg floating toggle")
focus floating: user.system_command("i3-msg focus mode_toggle")
center window: user.system_command("i3-msg move position center")
resize mode: user.system_command('i3-msg mode "resize"')
focus parent: user.system_command("i3-msg focus parent")
focus child: user.system_command("i3-msg focus child")

win grow [<user.arrow_keys>]: user.i3wm_resize_window("grow", arrow_keys or "both")
win shrink [<user.arrow_keys>]: user.i3wm_resize_window("shrink", arrow_keys or "both")

horizontal (shell|terminal):
    user.system_command("i3-msg split h")
    user.system_command("i3-msg exec i3-sensible-terminal")

vertical (shell|terminal):
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

make scratch: user.system_command("i3-msg move scratchpad")
scratch <user.text>: user.system_command('i3-msg [title="(?i){text}"] scratchpad show')
[(show|hide)] scratch: user.system_command("i3-msg scratchpad show")
next scratch:
    user.system_command("i3-msg scratchpad show")
    user.system_command("i3-msg scratchpad show")

window <user.text>: user.system_command('i3-msg [title="(?i){text}"] focus')

# these rely on the user settings for the mod key. see i3wm.py Actions class

launch: user.i3wm_launch()
launch {user.applications}: user.system_command_nb("{applications}")
lock screen: user.i3wm_lock()
^computer reboot$: user.system_command("reboot")
(launch shell|koopa): user.i3wm_shell()

(poppy|scratch (shell|window)):
    user.i3wm_shell()
    sleep(300ms)
    user.system_command("i3-msg mark __scratchpad")
    user.system_command("i3-msg move scratchpad")
    user.system_command("i3-msg [con_mark='__scratchpad'] scratchpad show")
    user.system_command("i3-msg unmark __scratchpad")

system tray: key("super-shift-s")

keyboard spanish: user.system_command("setxkbmap es")
keyboard english: user.system_command("setxkbmap us")