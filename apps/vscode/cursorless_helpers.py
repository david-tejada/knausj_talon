from talon import Context, Module, actions

mod = Module()
ctx = Context()

ctx.matches = r"""
app: vscode
"""


@mod.capture(rule="<user.text>")
def camel(m) -> str:
    camel = actions.user.formatted_text(m.text, "PRIVATE_CAMEL_CASE")
    return f"${{{camel}:{camel}}}"


@mod.capture(rule="<user.text>")
def pascal(m) -> str:
    pascal = actions.user.formatted_text(m.text, "PUBLIC_CAMEL_CASE")
    return f"${{{pascal}:{pascal}}}"


@mod.capture(rule="<user.formatters> <user.text>")
def formatted_text(m) -> str:
    return actions.user.formatted_text(m.text, m.formatters)
