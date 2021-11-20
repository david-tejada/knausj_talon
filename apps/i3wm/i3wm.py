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
        
    def i3wm_resize_window(mode: str, dir: str):
        """Resize a window"""
        if dir == "both":
            actions.user.system_command(f"i3-msg resize {mode} width 100 px or 10 ppt")
            actions.user.system_command(f"i3-msg resize {mode} height 100 px or 10 ppt")
        else:
            actions.user.system_command(f"i3-msg resize {mode} {dir} 100 px or 10 ppt")
        actions.user.system_command(f"i3-msg move position center")

ctx.lists["user.applications"] = {
    "firefox": "firefox",
    "thunar": "thunar",
    "spotify": "spotify",
    "code": "code",
    "transmission": "transmission-gtk",
    "alacritty": "alacritty",
    "pavucontrol": "pavucontrol"
}