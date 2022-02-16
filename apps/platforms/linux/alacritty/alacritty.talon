app: alacritty
-
# Set tags
tag(): terminal
tag(): user.generic_unix_shell
tag(): user.git
tag(): user.npm
tag(): user.apt
tag(): user.pip

cleft: key('alt-backspace')
crimp: key('ctrl-delete')

# Fix weird scrolling behavior in alacritty
lower:
    user.mouse_move_center_active_window()
    user.mouse_scroll_down(0.75)
higher:
    user.mouse_move_center_active_window()
    user.mouse_scroll_up(0.75)

soxi that:
    "soxi \""
    edit.paste()
    "\"\n"