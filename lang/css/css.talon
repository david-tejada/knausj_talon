tag: user.css
-
tag(): user.code_generic

{user.css_properties} is <user.css_value>+:
    insert(user.css_properties)
    insert(': ')
    user.insert_many_sep(user.css_value_list)
    insert(';')
    key(left)

{user.css_properties} is:
    insert(user.css_properties)
    insert(': ')
    insert(';')
    key(left)

value <user.css_value>+:
    user.insert_many_sep(user.css_value_list)

number <user.css_number_unit>:
    insert(css_number_unit)

pseudo {user.css_pseudo}:
    insert(user.css_pseudo)

funky {user.css_functions}:
    insert(user.css_functions)
    insert("()")
    key(left)

variable <user.text>:
    insert("--")
    user.insert_formatted(text, "DASH_SEPARATED")

blocker:
    edit.line_end()
    " "
    user.code_block()