from talon import Context, Module, actions

ctx = Context()
mod = Module()
apps = mod.apps
apps.firefox = "app.name: Arc"
apps.firefox = """
os: mac
and app.bundle: company.thebrowser.Browser
"""

ctx.matches = r"""
app: arc
"""

@ctx.action_class("user")
class user_actions:
    def tab_close_wrapper():
        actions.sleep("300ms")
        actions.app.tab_close()

@ctx.action_class("app")
class AppActions:
    def tab_open():
        actions.key("cmd-t")
        actions.sleep("200ms")

@ctx.action_class('browser')
class BrowserActions:
    # TODO
    # action(browser.address):
    # action(browser.title):
    def go(url: str):
        actions.browser.focus_address()
        actions.sleep("50ms")
        actions.insert(url)
        actions.key("enter")

    def focus_search():
        actions.browser.focus_address()

    def submit_form():
        actions.key("enter")
