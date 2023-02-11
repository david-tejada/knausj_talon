from talon import Context, Module, actions

mod = Module()
mod.tag("devtools", desc="Tag for enabling browser devtools commands")

ctx = Context()
ctx.matches = r"""
tag: user.devtools
"""

@mod.action_class
class Actions:
    def devtools_focus_console():
        """Focus the devtools web console"""

    def devtools_focus_debugger():
        """Focus the devtools debugger"""

    def devtools_focus_inspector():
        """Focus the devtools inspector"""
        
    def devtools_execute_javascript(command: str) -> None:
        """Execute javascript in the browser devtools"""

    def devtools_focus_previous_pane():
        """Focus the previous pane on the devtools"""
        actions.key("cmd-[")

    def devtools_focus_next_pane():
        """Focus the next pane on the devtools"""
        actions.key("cmd-]")

@ctx.action_class("user")
class user_actions:
    def devtools_execute_javascript(command: str) -> None:
        actions.user.devtools_focus_console()
        actions.edit.select_all()
        actions.edit.delete()
        actions.user.paste(command)
        actions.key("enter")
    

