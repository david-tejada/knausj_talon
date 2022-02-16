tag: user.pip
-
pip install: "python -m pip install "
pip install <user.text>: "python -m pip install {text or ''}"
pip uninstall: "python -m pip uninstall "
pip uninstall <user.text>: "python -m pip uninstall {text or ''}"
pip version: "python -m pip --version\n"