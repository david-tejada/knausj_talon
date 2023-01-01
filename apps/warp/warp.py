from talon import Context, actions, ui, Module, app, clip

mod = Module()

mod.apps.warp = """
app.name: warp
"""

mod.apps.warp = """
os: mac
and app.bundle: dev.warp.Warp-Stable
"""

ctx = Context()
ctx.matches = r"""
app: warp
"""


def ckey():
    return "cmd" if app.platform == "mac" else f"{ckey()}"


def on_mac():
    return app.platform == "mac"


@ctx.action_class("user")
class user_actions:
    def tab_jump(number: int):
        if number < 0 or number > 9:
            raise RuntimeError(f"number should be in range 1-9")
        actions.key(f"{ckey()}-{number}")

    def tab_final():
        if app.platform == "mac":
            actions.key("cmd-9")
        else:
            actions.key("ctrl-9")


@ctx.action_class("app")
class user_actions:
    def tab_next():
        actions.key(f"{ckey()}-shift-" "}")

    def tab_previous():
        actions.key(f"{ckey()}-shift-" "{")
