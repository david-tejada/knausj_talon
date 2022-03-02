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

@ctx.action_class("user")
class UserActions:
    def file_manager_open_parent():
        actions.insert("cd ..")
        actions.key("enter")

    def file_manager_show_properties():
        """Shows the properties for the file"""

    def file_manager_open_directory(path: str):
        """opens the directory that's already visible in the view"""
        actions.insert("cd ")
        path = '"{}"'.format(path)
        actions.insert(path)
        actions.key("enter")

    def file_manager_select_directory(path: str):
        """selects the directory"""
        actions.insert(path)

    def file_manager_go_back():
        """file_manager_go_back_directory"""
        actions.insert("cd -\n")

    def file_manager_new_folder(name: str):
        """Creates a new folder in a gui filemanager or inserts the command to do so for terminals"""
        name = '"{}"'.format(name)

        actions.insert("mkdir " + name)

    def file_manager_open_file(path: str):
        """opens the file"""
        actions.insert(path)
        actions.key("enter")

    def file_manager_select_file(path: str):
        """selects the file"""
        actions.insert(path)

    def file_manager_open_volume(volume: str):
        """file_manager_open_volume"""
        actions.user.file_manager_open_directory(volume)

    def terminal_list_directories():
        actions.insert("ls")
        actions.key("enter")

    def terminal_list_all_directories():
        actions.insert("ls -a")
        actions.key("enter")

    def terminal_change_directory(path: str):
        actions.insert("cd {}".format(path))
        if path:
            actions.key("enter")

    def terminal_change_directory_root():
        """Root of current drive"""
        actions.insert("cd /")
        actions.key("enter")

    def terminal_clear_screen():
        """Clear screen"""
        actions.key("ctrl-l")

    def terminal_run_last():
        actions.key("up enter")

    def terminal_kill_all():
        actions.key("ctrl-c")
        actions.insert("y")
        actions.key("enter")