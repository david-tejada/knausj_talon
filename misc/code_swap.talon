app: firefox
app: vscode
-
code swap:
  edit.select_all()
  edit.copy()
  sleep(200ms)
  user.system_command("i3-msg focus right")
  edit.select_all()
  edit.paste()