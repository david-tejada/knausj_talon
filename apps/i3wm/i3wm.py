import string
from talon import Context, Module, actions, settings, ui, noise
from talon.grammar import Phrase

mod = Module()
ctx = Context()

ctx.matches = r"""
tag: user.i3wm
"""

mod.tag("i3wm", desc="tag for loading i3wm related files")
mod.setting(
    "i3_config_path",
    type=str,
    default="~/.i3/config",
    desc="Where to find the configuration path",
)
mod.setting(
    "i3_mod_key",
    type=str,
    default="super",
    desc="The default key to use for i3wm commands",
)

mod.list("applications", desc="List of applications to launch")


@mod.action_class
class Actions:
    def i3wm_launch():
        """Trigger the i3 launcher: ex rofi"""
        key = settings.get("user.i3_mod_key")
        actions.key(f"{key}-d")

    def i3wm_lock():
        """Trigger the lock screen"""
        key = settings.get("user.i3_mod_key")
        actions.key(f"{key}-shift-x")

    def i3wm_shell():
        """Launch a shell"""
        key = settings.get("user.i3_mod_key")
        actions.key(f"{key}-enter")

    def i3wm_resize_window(mode: str, dir: str):
        """Resize a window"""
        if dir == "both":
            actions.user.system_command(f"i3-msg resize {mode} width 100 px or 10 ppt")
            actions.user.system_command(f"i3-msg resize {mode} height 100 px or 10 ppt")
        else:
            actions.user.system_command(f"i3-msg resize {mode} {dir} 100 px or 10 ppt")
            actions.user.system_command(f"i3-msg move position center")

    # This function is here so I can issue a command after glide or slide that
    # will apply in the next context
    def focus_container(dir: str, phrase: Phrase = None):
        """Focus on the next container"""
        actions.user.system_command(f"i3-msg focus {dir}")
        actions.sleep("200ms")
        actions.user.rephrase(phrase)


ctx.lists["user.applications"] = {
    "alacritty": "alacritty",
    "chrome": "google-chrome",
    "code": "code",
    "dolphin": "dolphin",
    "edge": "microsoft-edge",
    "files": "dolphin",
    "firefox": "firefox",
    "kazam": "kazam",
    "libreoffice": "libreoffice",
    "pavucontrol": "pavucontrol",
    "peek": "peek",
    "spotify": "spotify",
    "transmission": "transmission-gtk",
}
