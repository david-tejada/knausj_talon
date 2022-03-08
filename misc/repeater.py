# from talon import actions, noise
# import tempfile

# LOGFILE = str(tempfile.gettempdir()) + "/talon-history.log"

# def on_pop(active):
#     actions.core.repeat_command(1)
#     with open(LOGFILE, "a") as file_object:
#             file_object.write("POP\n")

# noise.register("pop", on_pop)