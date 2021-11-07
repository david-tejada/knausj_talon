# NOTE: If you want to use i3wm you must enable the tag settings.talon. ex: `tag(): user.i3wm`
os: linux
tag: user.i3wm
-
port <number_small>: user.system_command("i3-msg workspace {number_small}")
(port flip|flipper): user.system_command("i3-msg workspace back_and_forth")
port right: user.system_command("i3-msg workspace next")
port left: user.system_command("i3-msg workspace prev")

(win|window) left: user.system_command("i3-msg focus left")
(win|window) right: user.system_command("i3-msg focus right")
(win|window) up: user.system_command("i3-msg focus up")
(win|window) down: user.system_command("i3-msg focus down")
((win|window) kill|murder): user.system_command("i3-msg kill")
(win|window) stacking: user.system_command("i3-msg layout stacking")
(win|window) default: user.system_command("i3-msg layout toggle split")
(win|window) tabbed: user.system_command("i3-msg layout tabbed")

reload i three config: user.system_command("i3-msg reload")
restart i three: user.system_command("i3-msg restart")

(full screen|scuba): user.system_command("i3-msg fullscreen")
window float: user.system_command("i3-msg floating toggle")
focus floating: user.system_command("i3-msg focus mode_toggle")
window center: user.system_command("i3-msg move position center")
window resize: user.system_command('i3-msg mode "resize"')
focus parent: user.system_command("i3-msg focus parent")
focus child: user.system_command("i3-msg focus child")

# resize helpers
(win|window) grow: user.i3wm_resize_window("grow", "both")
(win|window) shrink: user.i3wm_resize_window("shrink", "both")
(win|window) wider: user.i3wm_resize_window("grow", "width")
(win|window) slimmer: user.i3wm_resize_window("shrink", "width")
(win|window) taller: user.i3wm_resize_window("grow", "height")
(win|window) shorter: user.i3wm_resize_window("shrink", "height")

horizontal (shell|terminal):
    user.system_command("i3-msg split h")
    user.i3wm_shell()

vertical (shell|terminal):
    user.system_command("i3-msg split v")
    user.i3wm_shell()

# XXX - just replace with shuffle eventually?
# XXX - like also need to match the generic talon commands
(shuffle|move (win|window) [to] port) <number_small>:  user.system_command("i3-msg move container to workspace {number_small}")
(shuffle|move (win|window) [to] port ten): user.system_command("i3-msg move container to workspace 10")
(shuffle|move (win|window) [to] last port): user.system_command("i3-msg move container to workspace back_and_forth")
(shuffle|move (win|window) left): user.system_command("i3-msg move left")
(shuffle|move (win|window) right): user.system_command("i3-msg move right")
(shuffle|move (win|window) up): user.system_command("i3-msg move up")
(shuffle|move (win|window) down): user.system_command("i3-msg move down")

(win|window) horizontal: user.system_command("i3-msg split h")
(win|window) vertical: user.system_command("i3-msg split v")

make scratch: user.system_command("i3-msg move scratchpad")
[(show|hide)] scratch: user.system_command("i3-msg scratchpad show")
scratch next:
    user.system_command("i3-msg scratchpad show")
    user.system_command("i3-msg scratchpad show")

# these rely on the user settings for the mod key. see i3wm.py Actions class
launch: user.i3wm_launch()
launch <user.text>:
        user.i3wm_launch()
        sleep(100ms)
        insert("{text}")
lock screen: user.i3wm_launch()

(launch shell|koopa): user.i3wm_shell()

new scratch (shell|window):
    user.i3wm_shell()
    sleep(200ms)
    user.system_command("i3-msg move scratchpad")
    user.system_command("i3-msg scratchpad show")

# Custom
scratch fox: user.system_command('i3-msg [title="Firefox"] scratchpad show')
scratch brain: user.system_command('i3-msg [title="Brain"] scratchpad show')
