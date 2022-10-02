tag: user.splits
-
split move right: user.split_window_right()
split move left: user.split_window_left()
split move down: user.split_window_down()
split move up: user.split_window_up()
split right: user.split_focus_right()
split left: user.split_focus_left()
split down: user.split_focus_down()
split up: user.split_focus_up()
split up left:
  user.split_focus_up()
  user.split_focus_left()
split up right:
  user.split_focus_up()
  user.split_focus_right()
split down left:
  user.split_focus_down()
  user.split_focus_left()
split down right:
  user.split_focus_down()
  user.split_focus_right()

split (vertically | vertical): user.split_window_vertically()
split (horizontally | horizontal): user.split_window_horizontally()
split flip: user.split_flip()
split max: user.split_maximize()
split reset: user.split_reset()
split window: user.split_window()
split clear: user.split_clear()
split clear all: user.split_clear_all()
split next: user.split_next()
split last: user.split_last()
go split <number>: user.split_number(number)
