from talon import Module, actions, app

mod = Module()


@mod.action_class
class Actions:
    def cancel_in_flight_phrase():
        """Cancels phrase currently being spoken"""
        active_microphone = actions.sound.active_microphone()
        actions.sound.set_microphone("None")
        actions.sound.set_microphone(active_microphone)
