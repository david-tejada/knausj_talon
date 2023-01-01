question [mark]: "?"
(downscore | underscore): "_"
dash: "-"
double dash: "--"
triple quote: "'''"
(triple grave | triple back tick | gravy): insert("```")
(dot dot | dotdot): ".."
ellipses: "..."
(comma and | spam): ", "
punch: ": "
puncher:
    edit.line_end()
    ":\n"
sprint:
    key(right)
    ", "
sprinter:
    edit.line_end()
    ",\n"
plus: "+"
arrow: "->"
dub arrow: "=>"
new liner: "\\n"
carriage return: "\\r"
line feed: "\\r\\n"
empty dub string: user.insert_between('"', '"')
empty escaped (dub string | dub quotes): user.insert_between('\\"', '\\"')
empty string: user.insert_between("'", "'")
empty escaped string: user.insert_between("\\'", "\\'")
(inside parens | args): user.insert_between("(", ")")
inside (squares | square brackets | list): user.insert_between("[", "]")
inside (bracket | braces): user.insert_between("{", "}")
inside percent: user.insert_between("%", "%")
inside (quotes | string): user.insert_between("'", "'")
inside (double quotes | dub quotes): user.insert_between('"', '"')
inside (graves | back ticks): user.insert_between("`", "`")
angle that:
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
(double quote | dub quote) that:
    text = edit.selected_text()
    user.paste('"{text}"')
(grave | back tick) it:
    text = edit.selected_text()
    user.paste("`{text}`")
