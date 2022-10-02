app: warp
-
# makes the commands in generic_terminal available
tag(): terminal

# activates the implementation of the commands/functions in generic_terminal
tag(): user.generic_unix_shell

# makes commands for certain applications available
# you can deactivate them if you do not use the application
tag(): user.git
tag(): user.npm
tag(): user.homebrew

# TODO: explain
tag(): user.tabs
tag(): user.file_manager

suspend:
    key(ctrl-z)
resume:
    insert("fg")
    key(enter)

hunt all [<user.text>]:
    key(ctrl-r)
    insert(text or "")

please [<user.text>]:
    key(cmd-p)
    insert(user.text or "")

block up:
    key(cmd-up)

block down:
    key(cmd-down)

copy command:
    key(cmd-shift-c)

copy output:
    key(cmd-alt-shift-c)