from talon import Context, actions, ui, Module, app, clip
from datetime import datetime

ctx = Context()
mod = Module()

ctx.matches = r"""
app: vscode
win.title: /Dendron/
"""

# def generate_frontmatter(title: str) -> str:


@mod.action_class
class Actions:
    def convert_to_dendron_note(text: str):
        """Function for creating dendron notes with the text from the existing note"""
        dash_separated = "-".join(text.split())
        now = datetime.now()
        note_name = "daily.journal.{}.{:02d}.{:02d}.{}".format(
            now.year, now.month, now.day, dash_separated
        )
        actions.edit.select_all()
        actions.edit.copy()
        actions.edit.delete()
        actions.user.vscode("workbench.action.closeActiveEditor")
        actions.user.vscode("dendron.lookupNote")
        actions.sleep("300ms")
        actions.user.paste("placeholder")
        actions.sleep("300ms")
        actions.key("enter")
        actions.sleep("300ms")
        actions.edit.file_end()
        actions.edit.paste()
        actions.user.vscode("dendron.renameNote")
        actions.sleep("300ms")
        actions.user.paste(note_name)
