from talon import Context, actions, Module

# App definition
mod = Module()
mod.apps.gnome_terminal = """
os: linux
and app.name: alacritty
"""

# Context matching
ctx = Context()
ctx.matches = r"""
app: alacritty
"""


# --- Implement actions ---
@ctx.action_class("user")
class user_actions:
    # user.tabs
    def tab_jump(number):
        actions.key(f"alt-{number}")
    def terminal_kill_all():
        actions.key("ctrl-c")


# global (overwrite linux/edit.py)
@ctx.action_class('edit')
class EditActions:
    def paste(): actions.key('ctrl-shift-v')
    def copy(): actions.key('ctrl-shift-c')
    def find(text: str = None):
        actions.key('ctrl-shift-f')
        if text:
            actions.insert(text)
    def delete_line():
        actions.edit.line_start()
        actions.key('ctrl-k')
    # not possible in alacritty?
    def extend_left(): pass
    def extend_right(): pass
    def extend_up(): pass
    def extend_down(): pass
    def extend_word_left(): pass
    def extend_word_right(): pass
