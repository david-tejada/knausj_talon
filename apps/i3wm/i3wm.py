from talon import Context, Module, actions, settings, ui

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
        
    def i3wm_resize_window(mode: str, dir: str):
        """Resize a window/container"""
        if dir == "width" or dir == "both":
            actions.user.system_command(f"i3-msg resize {mode} width 100 px or 10 ppt")
        if dir == "height" or dir == "both":
            actions.user.system_command(f"i3-msg resize {mode} height 100 px or 10 ppt")
        actions.user.system_command("i3-msg move position center")
        