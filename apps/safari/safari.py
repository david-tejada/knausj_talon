from talon import Context, Module, actions, ui
from talon.mac import applescript

ctx = Context()
mod = Module()
apps = mod.apps
mod.apps.safari = """
os: mac
and app.bundle: com.apple.Safari
"""

ctx.matches = r"""
app: safari
"""


def safari_app():
    return ui.apps(bundle="com.apple.Safari")[0]


@mod.action_class
class Actions:
    def safari_open_background_page():
        """Open the extension background page in Safari"""
        success = actions.user.menu_select(
            "Develop|Web Extension Background Pages|Rango — Background Page"
        )
        if not success:
            actions.user.menu_select(
                "Develop|Web Extension Background Pages|Rango (not loaded)"
            )


@ctx.action_class("user")
class UserActions:
    def browser_open_address_in_new_tab():
        actions.key("cmd-enter")


@ctx.action_class("browser")
class BrowserActions:
    def address() -> str:
        try:
            window = safari_app().windows()[0]
        except IndexError:
            return ""
        try:
            toolbar = window.children.find_one(AXRole="AXToolbar", max_depth=0)
            address_field = toolbar.children.find_one(
                AXRole="AXTextField",
                AXIdentifier="WEB_BROWSER_ADDRESS_AND_SEARCH_FIELD",
            )
            address = address_field.AXValue
        except (ui.UIErr, AttributeError):
            address = applescript.run(
                """
                tell application id "com.apple.Safari"
                    with timeout of 0.1 seconds
                        if not (exists (window 1)) then return ""
                        return window 1's current tab's URL
                    end timeout
                end tell
            """
            )
        return address

    def bookmark_tabs():
        raise NotImplementedError(
            "Safari doesn't have a default shortcut for this functionality but it can be configured"
        )

    def show_clear_cache():
        raise NotImplementedError("Safari doesn't support this functionality")

    def reload_hard():
        actions.key("cmd-alt-r")

    def show_downloads():
        actions.key("cmd-alt-l")

    def show_extensions():
        actions.key("cmd-, tab:8 space")
