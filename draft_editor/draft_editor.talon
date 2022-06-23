user.draft_editor_running: True
not tag: user.draft_editor_app_focused
-

write pull:
	user.draft_editor_open()

write pull all:
	edit.select_all()
	user.draft_editor_open()

write pull line:
	edit.select_line()
	user.draft_editor_open()

draft top:
  edit.extend_file_start()
  user.draft_editor_open()

draft bottom:
  edit.extend_file_end()
  user.draft_editor_open()

draft submit:
  user.draft_editor_paste_last()
