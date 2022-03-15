from talon import Context, Module, actions, app, imgui, registry, settings

ctx = Context()
mod = Module()
mod.tag("yarn", desc="Tag for enabling yarn nodejs package manager in terminal")

ctx.matches = r"""
tag: terminal
tag: user.yarn
"""