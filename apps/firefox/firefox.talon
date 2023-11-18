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

background page:
    app.tab_open()
    browser.go("about:debugging#/runtime/this-firefox")
    sleep(500ms)
    key(tab:7 enter)

responsive mode: key(cmd-alt-m)