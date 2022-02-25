floor: user.mouse_scroll_down(0.75)
floor here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_down(0.75)
wheel downer: user.mouse_scroll_down_continuous()
wheel downer here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_down_continuous()
ceil: user.mouse_scroll_up(0.75)
ceil here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_up(0.75)
wheel upper: user.mouse_scroll_up_continuous()
wheel upper here:
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
