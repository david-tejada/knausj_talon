tag: user.javascript
-
tag(): user.code_imperative
tag(): user.code_object_oriented

tag(): user.code_comment_line
tag(): user.code_comment_block_c_like
tag(): user.code_data_bool
tag(): user.code_data_null
tag(): user.code_functions
tag(): user.code_functions_gui
tag(): user.code_libraries
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_lambda
tag(): user.code_operators_math

settings():
    user.code_private_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_protected_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_public_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_private_variable_formatter = "PRIVATE_CAMEL_CASE"
    user.code_protected_variable_formatter = "PRIVATE_CAMEL_CASE"
    user.code_public_variable_formatter = "PRIVATE_CAMEL_CASE"

is strict equal: " === "
is strict not equal: " !== "

make const: "const "
const <user.text>:
    "const "
    user.insert_formatted(text,"PRIVATE_CAMEL_CASE")

make let: "let "
let <user.text>:
    "let "
    user.insert_formatted(text,"PRIVATE_CAMEL_CASE")
    
make var: "var "
var <user.text>:
    "var "
    user.insert_formatted(text,"PRIVATE_CAMEL_CASE")

make export: "export "

make async: "async "

make await: "await "

make map:
    insert(".map()")
    key(left)

make filter:
    insert(".filter()")
    key(left)

make reduce:
    insert(".reduce()")
    key(left)

make spread: "..."

import <user.text> from <user.text>:
    "import "
    user.insert_formatted(text_1,"PUBLIC_CAMEL_CASE")
    " from \""
    user.insert_formatted(text_2,"DASH_SEPARATED")
    "\""

console log:
    "console.log()"
    key("left")

new <user.text>:
    "new "
    user.insert_formatted(text,"PUBLIC_CAMEL_CASE")
    "()"
    key("left")

require <user.text>:
    "const "
    user.insert_formatted(text,"PRIVATE_CAMEL_CASE")
    " = require(\""
    user.insert_formatted(text,"DASH_SEPARATED")
    "\")"
    key("left")

blocker:
    edit.line_end()
    " "
    user.code_block()

construct <user.text>:
    "function "
    user.insert_formatted(text,"PUBLIC_CAMEL_CASE")
    "()"
    key("left")

fun <user.text>:
    user.insert_formatted(text,"PRIVATE_CAMEL_CASE")
    "()"
    key("left")

bind <user.text>:
    "this."
    user.insert_formatted(text,"PRIVATE_CAMEL_CASE")
    " = this."
    user.insert_formatted(text,"PRIVATE_CAMEL_CASE")
    ".bind(this)"

chain {user.code_chain_function}:
    insert(".{code_chain_function}()")
    key(left)

make block lambda:
    "() => {}"
    key(left)
    key(enter)

export default function <user.text>:
    "export default function "
    user.insert_formatted(text,"PRIVATE_CAMEL_CASE")
    "() {}"
    key(left enter)

export function <user.text>:
    "export function "
    user.insert_formatted(text,"PRIVATE_CAMEL_CASE")
    "() {}"
    key(left enter)

for <user.text> of <user.text>:
    "for (const "
    user.insert_formatted(text_1,"PRIVATE_CAMEL_CASE")
    " of "
    user.insert_formatted(text_2,"PRIVATE_CAMEL_CASE")
    ") {}"
    key(left enter)