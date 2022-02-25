tag: user.pip
-
pip install: "python3 -m pip install "
pip install <user.text>: "python3 -m pip install {text or ''}"
pip uninstall: "python3 -m pip uninstall "
pip uninstall <user.text>: "python3 -m pip uninstall {text or ''}"
pip version: "python3 -m pip --version\n"