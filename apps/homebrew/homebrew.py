from talon import Context, Module, actions, app, imgui, registry, settings

ctx = Context()
mod = Module()
mod.tag("homebrew", desc="Tag for enabling homebrew package manager in terminal")

ctx.matches = r"""
tag: terminal
tag: user.homebrew
"""