question [mark]: "?"
(downscore | underscore): "_"
double dash: "--"
triple quote: "'''"
(triple grave | triple back tick | gravy):
    insert("```")
(dot dot | dotdot): ".."
ellipses: "..."
(comma and | spamma): ", "
slink:
    key(right)
    ", "
coalgap: ": "
punch:
    edit.line_end()
    ": "
puncher:
    edit.line_end()
    ":\n"
kick:
    edit.line_end()
    ",\n"
plus: "+"
arrow: "->"
dub arrow: "=>"
new liner: "\\n"
carriage return: "\\r"
line feed: "\\r\\n"
empty dubstring:
    '""'
    key(left)
empty escaped (dubstring|dub quotes):
    '\\"\\"'
    key(left)
    key(left)
empty string:
    "''"
    key(left)
empty escaped string:
    "\\'\\'"
    key(left)
    key(left)
inside paren:
	insert("()")
	key(left)
inside brack:
	insert("[]")
	key(left)
inside brace:
	insert("{}")
	key(left)
inside angle:
    insert("<>")
    key(left)
inside percent:
	insert("%%")
	key(left)
inside (quotes | string):
	insert("''")
	key(left)
inside (double quotes | dubquotes):
    insert('""')
	key(left)
inside (graves | back ticks):
	insert("``")
	key(left)
angle it:
    text = edit.selected_text()
    user.paste("<{text}>")
brack it:
    text = edit.selected_text()
    user.paste("[{text}]")
brace it:
    text = edit.selected_text()
    user.paste("{{{text}}}")
paren it:
    text = edit.selected_text()
    user.paste("({text})")
percent it:
    text = edit.selected_text()
    user.paste("%{text}%")
quote it:
    text = edit.selected_text()
    user.paste("'{text}'")
double it:
    text = edit.selected_text()
    user.paste('"{text}"')
(grave | back tick) it:
    text = edit.selected_text()
    user.paste('`{text}`')
