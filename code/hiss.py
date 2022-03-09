# from talon import noise, actions
# from time import time
# import tempfile

# LOGFILE = str(tempfile.gettempdir()) + "/talon-history.log"

# t_old = 0
# HISS_MIN_TIME = 0.2

# def on_hiss(active):
#     global t_old
#     t_delta = time() - t_old
#     if not active and t_delta > HISS_MIN_TIME:
#         actions.key("down")
#         with open(LOGFILE, "a") as file_object:
#             file_object.write("HISS\n")
#     t_old = time()

# noise.register("hiss",on_hiss)