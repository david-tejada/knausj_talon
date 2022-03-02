from talon import Context, actions, ui, Module, app

# from user.knausj_talon.code.snippet_watcher import snippet_watcher
import os

ctx = Context()
ctx.matches = r"""
app: vscode
tag: user.javascriptreact
"""
# short name -> ide clip name
ctx.lists["user.snippets"] = {
    "react class": "reactclass",
}