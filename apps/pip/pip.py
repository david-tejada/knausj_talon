from talon import Context, Module, actions, app, imgui, registry, settings

ctx = Context()
mod = Module()
mod.tag("pip", desc="Tag for enabling pip package manager in terminal")

ctx.matches = r"""
tag: terminal
tag: user.pip
"""