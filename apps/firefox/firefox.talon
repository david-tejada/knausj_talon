app: firefox
-
tag(): browser
tag(): user.tabs
tab search:
    browser.focus_address()
    insert("% ")
tab search <user.text>$:
    browser.focus_address()
    insert("% {text}")
    key(down)

# devtools
tool inspect: key(cmd-shift-c)
tool console: key(cmd-alt-k)
tool debug: key(cmd-alt-z)

highlight: 
    key(cmd-shift-c)
    sleep(300ms)
    key(down up)

get id <user.text>:
    id = user.formatted_text(text, "DASH_SEPARATED")
    user.run_devtools_command("inspect(document.querySelector('#{id}'))")
get class <user.text>:
    class = user.formatted_text(text, "DASH_SEPARATED")
    user.run_devtools_command("inspect(document.querySelector('.{class}'))")
get [<user.ordinals>] parent: 
    user.run_devtools_command("current = $0;for(let i=0;i<{ordinals or 1};i++){{current=current.parentNode||current.host}};inspect(current)")
get [<user.ordinals>] child:
    ordinal = ordinals or 1
    n = ordinal - 1
    user.run_devtools_command("inspect($0.children[{n}])")
get next sibling:
    user.run_devtools_command("inspect($0.nextSibling)")
get closest {user.code_tag}:
    user.run_devtools_command("inspect($0.parentNode.closest('{code_tag}'))")
get next {user.code_tag}:
    user.run_devtools_command("""
    elements = [...document.querySelectorAll("{code_tag}")];
    index = elements.findIndex(element => {{
      const comparison = $0.compareDocumentPosition(element);
      return comparison === 4 || comparison === 16 || comparison === 20;
      }});
    inspect(elements[index]);
    """)
get last {user.code_tag}:
    user.run_devtools_command("""
    elements = [...document.querySelectorAll("{code_tag}")];
    index = elements.findIndex(element => {{
      const comparison = $0.compareDocumentPosition(element);
      return comparison === 4 || comparison === 16 || comparison === 20;
      }});
    offset = $0.matches("{code_tag}") ? 2 : 1;
    inspect(elements[index - offset]);
    """)
get offset parent:
    user.run_devtools_command("inspect($0.offsetParent)")
get clip parent:
    user.run_devtools_command("""
    current = $0.parentNode;
    while (current) {
    const s = getComputedStyle(current)
        if (
                current === document.body ||
                s.overflow !== "visible" ||
                /paint|content|strict/.test(s.contain) ||
                s.clipPath !== "none" ||
                s.position === "fixed" ||
                s.position === "sticky"
            ) {
        inspect(current)
    break;
            }
    current = current.parentNode;
    } """)
get proto:
    user.run_devtools_command("$0.__proto__")
walk <number>:
    user.run_devtools_command("walker=document.createTreeWalker($0, NodeFilter.SHOW_ELEMENT);current=walker.nextNode();for(i=1;i<{number};i++){{current=walker.nextNode()}};inspect(current)")

use this [<user.word>]:
    user.run_devtools_command("{word or 'target'} = $0")
    user.paste("{word or 'target'}")
use output [<user.word>]:
    user.run_devtools_command("{word or 'output'} = $_")
    user.paste("{word or 'output'}")
get saved <user.word>:
    user.run_devtools_command("inspect({word})")

get computed {user.css_properties}: user.run_devtools_command("getComputedStyle($0)[\"{css_properties}\"]")
get rect: user.run_devtools_command("$0.getBoundingClientRect()") 
get elements from point:
    user.run_devtools_command("({{x, y, width, height}} = $0.getBoundingClientRect());document.elementsFromPoint(x + width/2, y + height/2)")
copy class: user.run_devtools_command("copy($0.className)")
copy id: user.run_devtools_command("copy($0.id)")
copy tag name: user.run_devtools_command("copy($0.tagName)")

freeze in five: user.run_devtools_command("setTimeout(()=>{{debugger}},5000)\n")


pop dock <user.text>:
    key(cmd-p)
    sleep(200ms)
    user.paste(text)
    sleep(200ms)
    key(enter)

list dock <user.text>:
    key(cmd-p)
    sleep(200ms)
    user.paste(text)
    sleep(200ms)

profiler run: key(ctrl-shift-1)
profiler stop: key(ctrl-shift-2)

# devtools rango
get <user.letters>: 
    user.run_devtools_command("inspect(document.querySelector(\"[data-hint='{letters}']:not(.rango-hint, .rango-hint-wrapper)\"))") 
get hint <user.letters>: 
    user.run_devtools_command("inspect(document.querySelector(\".rango-hint[data-hint='{letters}']\"))") 