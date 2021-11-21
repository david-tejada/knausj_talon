app: alacritty
-
# Set tags
tag(): terminal
tag(): user.generic_unix_shell
tag(): user.git

cleft: key('alt-backspace')
cright: key('ctrl-delete')

# Fix weird scrolling behavior in alacritty
low:
    user.mouse_move_center_active_window()
    user.mouse_scroll_down(0.75)
high:
    user.mouse_move_center_active_window()
    user.mouse_scroll_up(0.75)