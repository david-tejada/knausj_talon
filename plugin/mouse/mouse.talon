touch:
    mouse_click(0)
    # close the mouse grid if open
    user.grid_close()
    # End any open drags
    # Touch automatically ends left drags so this is for right drags specifically
    user.mouse_drag_end()

righty:
    mouse_click(1)
    # close the mouse grid if open
    user.grid_close()
# In mac with natural scrolling unchecked these work the other way around
tiny wheel up: user.mouse_scroll_down(0.75)
wheel up: user.mouse_scroll_down(5)
key(f15): user.mouse_scroll_down(5)
wheel up here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_down(0.75)
wheel upper: user.mouse_scroll_down_continuous()
wheel upper here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_down_continuous()
tiny wheel down: user.mouse_scroll_up(0.75)
wheel down: user.mouse_scroll_up(5)
key(f17): user.mouse_scroll_up(5)
wheel down here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_up(0.75)
wheel downer: user.mouse_scroll_up_continuous()
wheel downer here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_up_continuous()
wheel stop: user.mouse_scroll_stop()
wheel stop here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_stop()
#wheel left: user.mouse_scroll_left()
# wheel left here:
#     user.mouse_move_center_active_window()
#     user.mouse_scroll_left()
# wheel tiny left: user.mouse_scroll_left(0.75)
# wheel tiny left here:
#     user.mouse_move_center_active_window()
#     user.mouse_scroll_left(0.75)
# wheel right: user.mouse_scroll_right()
# wheel right here:
#     user.mouse_move_center_active_window()
#     user.mouse_scroll_right()
# wheel tiny right: user.mouse_scroll_right(0.75)
# wheel tiny right here:
#     user.mouse_move_center_active_window()
#     user.mouse_scroll_right(0.75)
copy mouse position: user.copy_mouse_position()
curse no:
    # Command added 2021-12-13, can remove after 2022-06-01
    app.notify("Please activate the user.mouse_cursor_commands_enable tag to enable this command")
