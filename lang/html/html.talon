tag: user.html
-
tag(): user.code_comment_line

block tag {user.code_tag}:
    user.insert_snippet("<{code_tag}>\n\t$0\n</{code_tag}>")
block tag <user.text>:
    user.insert_snippet("<{text}>\n\t$0\n</{text}>")
blank tag:
    user.insert_snippet("<>\n\t$0\n</>")

make tag {user.code_tag}:
    "<{code_tag}>"
    user.code_push_tag_name(code_tag)
make tag <user.text>:
    "<{text}>"
    user.code_push_tag_name(text)

closed tag {user.code_tag}:       "<{code_tag}/>"
close tag <user.text>:   "<{text}/>"
close tag: user.code_close_tag()

attr <user.text>:
    user.insert_snippet(" {text}=$0")

make doctype: "<!DOCTYPE html>\n"
make blank: "&nbsp;"