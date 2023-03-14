app: firefox
-
tag(): browser
tag(): user.tabs
tag(): user.devtools

tab search:
    browser.focus_address()
    insert("% ")
tab search <user.text>$:
    browser.focus_address()
    insert("% {text}")
    key(down)

profiler run: key(ctrl-shift-1)
profiler stop: key(ctrl-shift-2)

(sidebar | panel) bookmarks: user.firefox_bookmarks_sidebar()
(sidebar | panel) history: user.firefox_history_sidebar()
