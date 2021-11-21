os: linux
tag: terminal
-
apt update: "sudo apt update\n"
apt upgrade: "sudo apt upgrade\n"
apt install [<user.text>]: "sudo apt install {text or ''}"
apt remove [<user.text>]: "sudo apt remove {text or ''}"
apt purge [<user.text>]: "sudo apt purge {text or ''}"
apt list: "sudo apt list\n"
apt list upgradable: "sudo apt list --upgradeable\n"