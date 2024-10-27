import os
import webbrowser
from urllib.parse import quote_plus

from talon import Module

cwd = os.path.dirname(os.path.realpath(__file__))
user_path = os.path.dirname(cwd)
websites_file = os.path.join(user_path, "settings", "websites.csv")

mod = Module()
mod.list("website", desc="A website.")
mod.list(
    "search_engine",
    desc="A search engine.  Any instance of %s will be replaced by query text",
)


@mod.action_class
class Actions:
    def open_url(url: str):
        """Visit the given URL."""
        webbrowser.open(url)

    def search_with_search_engine(search_template: str, search_text: str):
        """Search a search engine for given text"""
        url = search_template.replace("%s", quote_plus(search_text))
        webbrowser.open(url)

    def save_address_to_csv(text: str):
        """Save the current address to websites.csv"""
        actions.browser.focus_address()
        actions.sleep("50ms")
        selected_text = actions.edit.selected_text()
        with open(websites_file, "a") as file:
            file.write(f"\n{selected_text}, {text}")
        actions.key("escape")
