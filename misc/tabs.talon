tag: user.tabs
-
tab (open | new): app.tab_open()
(tab (last | left)|heave): app.tab_previous()
(tab (next | right)|push): app.tab_next()
tab close: user.tab_close_wrapper()
tab (reopen|restore): app.tab_reopen()
go tab <number>: user.tab_jump(number)
go tab final: user.tab_final()
