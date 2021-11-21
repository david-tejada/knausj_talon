# NOTE: If you want to use i3wm you must enable the tag settings.talon. ex: `tag(): user.i3wm`
os: linux
tag: user.i3wm
-
portal <number_small>: user.system_command("i3-msg workspace {number_small}")
(portal flip|flipper): user.system_command("i3-msg workspace back_and_forth")
portal right: user.system_command("i3-msg workspace next")
portal left: user.system_command("i3-msg workspace prev")


win <user.arrow_keys>: user.system_command("i3-msg focus {user.arrow_keys}")
glide: user.system_command("i3-msg focus right")
slide: user.system_command("i3-msg focus left")
(win kill|destroy): user.system_command("i3-msg kill")
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

grow win [<user.arrow_keys>]: user.i3wm_resize_window("grow", arrow_keys or "both")
shrink win [<user.arrow_keys>]: user.i3wm_resize_window("shrink", arrow_keys or "both")

horizontal (shell|terminal):
    user.system_command("i3-msg split h")
    user.system_command("i3-msg exec i3-sensible-terminal")

vertical (shell|terminal):
    user.system_command("i3-msg split v")
    user.system_command("i3-msg exec i3-sensible-terminal")

# XXX - just replace with shuffle eventually?
# XXX - like also need to match the generic talon commands
shuffle <number_small>:  user.system_command("i3-msg move container to workspace {number_small}")
shuffle: user.system_command("i3-msg move container to workspace back_and_forth")
shuffle <user.arrow_keys>: user.system_command("i3-msg move {user.arrow_keys}")

win horizontal: user.system_command("i3-msg split h")
win vertical: user.system_command("i3-msg split v")

make scratch: user.system_command("i3-msg move scratchpad")
scratch <user.text>: user.system_command('i3-msg [title="(?i){text}"] scratchpad show')
[(show|hide)] scratch: user.system_command("i3-msg scratchpad show")
next scratch:
    user.system_command("i3-msg scratchpad show")
    user.system_command("i3-msg scratchpad show")

# these rely on the user settings for the mod key. see i3wm.py Actions class
launch: user.i3wm_launch()
launch {user.applications}: user.system_command_nb("{applications}")
launch <user.text>:
    user.i3wm_launch()
    sleep(100ms)
    insert("{text}")
lock screen: user.i3wm_lock()

(launch shell|koopa): user.system_command_nb("i3-sensible-terminal")    

(poppy|scratch (shell|window)):
    user.system_command_nb("i3-sensible-terminal")
    sleep(300ms)
    user.system_command("i3-msg mark __scratchpad")
    user.system_command("i3-msg move scratchpad")
    user.system_command("i3-msg [con_mark='__scratchpad'] scratchpad show")
    user.system_command("i3-msg unmark __scratchpad")

system tray: key("super-shift-s")
