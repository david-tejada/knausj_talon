from talon import Context, Module, actions, app, imgui, registry, settings

ctx = Context()
mod = Module()
mod.tag("apt", desc="Tag for enabling apt package manager in terminal")

ctx.matches = r"""
tag: terminal
tag: user.apt
"""