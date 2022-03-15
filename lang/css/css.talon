tag: user.css
-
tag(): user.code_generic

{user.css_properties} is <user.css_value>+:
    insert(user.css_properties)
    insert(': ')
    user.insert_many_sep(user.css_value_list)
    insert(';')
    key(left)

value {user.css_values}:
    insert(user.css_values)

pseudo {user.css_pseudo}:
    insert(user.css_pseudo)

funky {user.css_functions}:
    insert(user.css_functions)
    insert("()")
    key(left)

variable <user.text>:
    insert("--")
    user.insert_formatted(text, "DASH_SEPARATED")
