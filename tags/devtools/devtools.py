from talon import Context, Module, actions
from talon.experimental.locate import locate

mod = Module()
mod.tag("devtools", desc="Tag for enabling browser devtools commands")

ctx = Context()
ctx.matches = r"""
tag: browser
tag: user.devtools
"""


@mod.action_class
class Actions:
    def devtools_focus_pane_by_name(name: str) -> None:
        """Focuses a devtools pane by its name"""
        actions.key("cmd-shift-p")
        actions.user.paste(name)
        actions.sleep("50ms")
        actions.key("enter")

    def devtools_console_pane():
        """Focus the devtools console pane"""
        actions.user.devtools_focus_pane_by_name("console")

    def devtools_focus_console():
        """Focus the devtools web console"""
        actions.key("ctrl-`")

    def devtools_debugger_pane():
        """Focus the devtools debugger pane"""
        actions.user.devtools_focus_pane_by_name("sources")

    def devtools_inspector_pane():
        """Focus the devtools inspector pane"""
        actions.user.devtools_focus_pane_by_name("elements")

    def devtools_execute_javascript(command: str) -> None:
        """Execute javascript in the browser devtools"""

    def devtools_focus_previous_pane():
        """Focus the previous pane on the devtools"""
        actions.key("cmd-[")

    def devtools_focus_next_pane():
        """Focus the next pane on the devtools"""
        actions.key("cmd-]")

    def devtools_search_file(name: str) -> None:
        """Search and open a file in the devtools debugger"""
        no_spaces = actions.user.formatted_text(name, "NO_SPACES")
        actions.key("cmd-p")
        actions.sleep("200ms")
        actions.user.paste(no_spaces)

    def devtools_go_to_line(number: int) -> None:
        """Places the cursor in a given line of a file in the sources panel"""
        actions.user.devtools_click_file_area()
        actions.key("ctrl-g")
        actions.insert(number)
        actions.key("enter")

    def devtools_conditional_breakpoint():
        """Toggles a conditional breakpoint in the debugger panel"""
        actions.key("cmd-alt-b")

    def devtools_click_file_area() -> None:
        """Places the cursor in a given line of a file in the sources panel"""
        path = f"{actions.path.talon_user()}/images/debugger-button-open.png"
        matches = locate(path, threshold=0.85)

        if len(matches) == 0:
            path = f"{actions.path.talon_user()}/images/debugger-button-closed.png"
            matches = locate(path, threshold=0.85)

        if len(matches) == 0:
            actions.user.devtools_debugger_pane()
            actions.sleep("200ms")
            raise Exception(
                "Debugger button not found. Make sure you are in the debugger panel."
            )

        match = matches[0]

        actions.mouse_move(match.x - 50, match.y + 50)
        actions.mouse_click(0)

    def devtools_add_watch_expression(name: str) -> None:
        """Add watch expression in the devtools debugger panel"""

    def devtools_debugger_step_over():
        """Debugger: step over"""
        actions.key("f10")

    def devtools_debugger_step_into():
        """Debugger: step into"""
        actions.key("f11")

    def devtools_debugger_step_out():
        """Debugger: step out"""
        actions.key("shift-f11")

    def devtools_debugger_resume():
        """Debugger: resume"""
        actions.key("f8")


@ctx.action_class("user")
class user_actions:
    def devtools_execute_javascript(command: str) -> None:
        actions.user.devtools_console_pane()
        actions.edit.select_all()
        actions.edit.delete()
        actions.user.paste(command)
        actions.key("enter")
