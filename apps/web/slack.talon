tag: browser
browser.host: /slack/
-
edit last:
  key(up)
  sleep(200ms)
  key(e)

edit <user.rango_hint>:
  user.rango_command_with_target("hoverElement", rango_hint)
  user.rango_run_action_on_reference("clickElement", "more")
  key(e)
  