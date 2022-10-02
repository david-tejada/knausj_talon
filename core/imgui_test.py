from talon import imgui, Module

mod = Module()

@imgui.open(y=0)
def test(gui: imgui.GUI):
    global formatters_words
    gui.text("test")
    gui.line()

    gui.spacer()
    gui.text("Line number one")
    gui.text("Line number two")
    gui.text("Line number three")
    gui.spacer()
    if gui.button("Help close"):
        test.hide()

@mod.action_class
class Actions:
  def open_test():
    """Is is a Test"""
    test.show()

  def close_test():
    """Is is a Test"""
    test.hide()