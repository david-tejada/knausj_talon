not tag: user.file_manager
not tag: terminal
-
finder <user.system_path>: 
    user.switcher_launch("/System/Library/CoreServices/Finder.app")
    sleep(100ms)
    user.file_manager_open_directory(system_path)
