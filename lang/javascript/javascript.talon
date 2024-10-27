code.language: javascript
code.language: typescript
code.language: javascriptreact
code.language: typescriptreact
-
tag(): user.code_imperative
tag(): user.code_object_oriented

tag(): user.code_block_c_like
tag(): user.code_comment_line
tag(): user.code_comment_block_c_like
tag(): user.code_data_bool
tag(): user.code_data_null
tag(): user.code_functions
tag(): user.code_functions_common
tag(): user.code_keywords
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
make dub quest: " ?? "
is instance of: " instanceof "

make const: "const "
const <user.text>:
    "const "
    user.insert_formatted(text,"PRIVATE_CAMEL_CASE")
    " = "

make let: "let "
let <user.text>:
    "let "
    user.insert_formatted(text,"PRIVATE_CAMEL_CASE")
    " = "

dolly var:
    "${}"
    key(left)

make classic for:
    "for(let i = 0; i=array.length; i++) {\n\t\n"
    key(up)

make export: "export "

make async: "async "

make await: "await "

dot {user.code_common_member_function}:
    user.insert_between(".{code_common_member_function}(", ")")

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

console debug:
    "console.debug()"
    key("left")

console error:
    "console.error()"
    key("left")

console trace:
    "console.trace()"

console time:
    "console.time()"

console time end:
    "console.timeEnd()"

make new <user.text>:
    "new "
    user.insert_formatted(text,"PUBLIC_CAMEL_CASE")
    "()"
    key("left")

throw new error: user.insert_between("throw new Error(\"", "\")")

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

make block lambda:
    "() => {}"
    key(left)
    key(enter)
    
from import:
    user.insert_between(' from  "', '"')

type of <user.text> is <user.text>:
    "typeof "
    user.insert_formatted(text_1,"PRIVATE_CAMEL_CASE")
    " === \""
    insert(text_2)
    "\""

make class <user.text>:
    "class "
    user.insert_formatted(text,"PUBLIC_CAMEL_CASE")
    " {}"
    key("left enter")

j s dock:
    "/**"
    sleep(100ms)
    key(tab)


# Cursorless snippets

await <user.text>:
    camel = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    user.cursorless_insert_snippet("await {camel}($arguments)")

export funk <user.camel>:
    user.cursorless_insert_snippet("export function {camel}($params) {{\n\t$body\n}}")

export default component <user.pascal>:
    user.cursorless_insert_snippet("export default function {pascal}($params) {{\n\t$body\n}}")

export async funk <user.camel>:
    user.cursorless_insert_snippet("export async function {camel}($params) {{\n\t$body\n}}")

something <user.formatted_text>:
    user.paste("something {formatted_text}")

export component <user.pascal>:
    user.cursorless_insert_snippet("export function {pascal}($params) {{\n\t$body\n}}")

for <user.camel> of <user.camel>:
    user.cursorless_insert_snippet("for (const {camel_1} of {camel_2}) {{\n\t$body\n}}")

use state <user.text>:
    camel = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    pascal = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    snippet = "const [{camel}, set{pascal}] = useState($initialState)"
    user.cursorless_insert_snippet(snippet)

use effect:
    user.cursorless_insert_snippet("useEffect(() => {{\n\t$1\n}}, [$3]);")


heading comment <user.text>:
    upper = user.formatted_text(text, "ALL_CAPS")
    user.cursorless_insert_snippet("// =============================================================================\n// {upper}\n// =============================================================================")