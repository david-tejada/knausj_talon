tag: browser
-
tag(): user.devtools

use this [<user.word>]:
    user.devtools_execute_javascript("{word or 'target'} = $0")
    user.paste("{word or 'target'}")
use output [<user.word>]:
    user.devtools_execute_javascript("{word or 'output'} = $_")
    user.paste("{word or 'output'}")
get saved <user.word>:
    user.devtools_execute_javascript("inspect({word})")

get computed {user.css_properties}: user.devtools_execute_javascript("getComputedStyle($0)[\"{css_properties}\"]")
get rect: user.devtools_execute_javascript("$0.getBoundingClientRect()") 
get elements from point:
    user.devtools_execute_javascript("({{x, y, width, height}} = $0.getBoundingClientRect());document.elementsFromPoint(x + width/2, y + height/2)")
copy class: user.devtools_execute_javascript("copy($0.className)")
copy id: user.devtools_execute_javascript("copy($0.id)")
copy tag name: user.devtools_execute_javascript("copy($0.tagName)")
copy ref: user.devtools_execute_javascript("copy($0.href)")

freeze in five: user.devtools_execute_javascript("setTimeout(()=>{{debugger}},5000)\n")

get id <user.text>:
    id = user.formatted_text(text, "DASH_SEPARATED")
    user.devtools_execute_javascript("inspect(document.querySelector('#{id}'))")
get class <user.text>:
    class = user.formatted_text(text, "DASH_SEPARATED")
    user.devtools_execute_javascript("inspect(document.querySelector('.{class}'))")
get [<user.ordinals>] parent: 
    user.devtools_execute_javascript("current = $0;for(let i=0;i<{ordinals or 1};i++){{current=current.parentNode||current.host}};inspect(current)")
get [<user.ordinals>] child:
    ordinal = ordinals or 1
    n = ordinal - 1
    user.devtools_execute_javascript("inspect($0.shadowRoot?$0.shadowRoot.children[{n}]:$0.children[{n}])")
get next sibling:
    user.devtools_execute_javascript("inspect($0.nextSibling)")
get closest {user.code_tag}:
    user.devtools_execute_javascript("inspect($0.parentNode.closest('{code_tag}'))")
get next {user.code_tag}:
    user.devtools_execute_javascript("""
    elements = [...document.querySelectorAll("{code_tag}")];
    index = elements.findIndex(element => {{
      const comparison = $0.compareDocumentPosition(element);
      return comparison === 4 || comparison === 16 || comparison === 20;
      }});
    inspect(elements[index]);
    """)
get last {user.code_tag}:
    user.devtools_execute_javascript("""
    elements = [...document.querySelectorAll("{code_tag}")];
    index = elements.findIndex(element => {{
      const comparison = $0.compareDocumentPosition(element);
      return comparison === 4 || comparison === 16 || comparison === 20;
      }});
    offset = $0.matches("{code_tag}") ? 2 : 1;
    inspect(elements[index - offset]);
    """)
get offset parent:
    user.devtools_execute_javascript("inspect($0.offsetParent)")
get clip parent:
    user.devtools_execute_javascript("""
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
    user.devtools_execute_javascript("$0.__proto__")
walk <number>:
    user.devtools_execute_javascript("walker=document.createTreeWalker($0, NodeFilter.SHOW_ELEMENT);current=walker.nextNode();for(i=1;i<{number};i++){{current=walker.nextNode()}};inspect(current)")

# devtools rango
get <user.letters>: 
    user.devtools_execute_javascript("""
    function deepGetElements(root) {{ const elements = root.shadowRoot ? root.shadowRoot.querySelectorAll("*") : root.querySelectorAll("*"); const result = []; for (const element of elements) {{ if (element.shadowRoot && element.className !== "rango-hint") {{ result.push(...deepGetElements(element)); }} else {{ result.push(element); }} }} return result; }}
    inspect(deepGetElements(document.body).find(element => element.matches("[data-hint='{letters}']:not(.rango-hint)")))
    """) 
get hint <user.letters>: 
    user.devtools_execute_javascript("""
    function deepGetElements(root) {{ const elements = root.shadowRoot ? root.shadowRoot.querySelectorAll("*") : root.querySelectorAll("*"); const result = []; for (const element of elements) {{ if (element.shadowRoot && element.className !== "rango-hint") {{ result.push(...deepGetElements(element)); }} else {{ result.push(element); }} }} return result; }}
    inspect(deepGetElements(document.body).find(element => element.matches(".rango-hint[data-hint='{letters}'")))
    """)
log wrapper:
    user.devtools_execute_javascript("logWrapper($0)")
log wrapper <user.letters>:
    user.devtools_execute_javascript("logWrapper('{letters}')")
log wrappers:
    user.devtools_execute_javascript("logWrappers()")
log [wrappers] hinted:
    user.devtools_execute_javascript("logWrappers(true)")
log hints cache:
    user.devtools_execute_javascript("logHintsCache()")
log hints stack:
    user.devtools_execute_javascript("logHintsStack()")


tool (inspect | elements): user.devtools_inspector_pane()
tool console: user.devtools_console_pane()
go console: user.devtools_focus_console()
tool (debug | sources): user.devtools_debugger_pane()
pane left: user.devtools_focus_previous_pane()
pane right: user.devtools_focus_next_pane()

step over: user.devtools_debugger_step_over()
step into: user.devtools_debugger_step_into()
step out: user.devtools_debugger_step_out()
resume: user.devtools_debugger_resume()

poppy <user.text>:
    user.devtools_search_file(text)
    sleep(100ms)
    key(enter)


lisa <user.text>: user.devtools_search_file(text)
 
go line <number>:
    user.devtools_go_to_line(number)

breakpoint:
    key(cmd-b)

breakpoint <number>:
    user.devtools_go_to_line(number)
    key(cmd-b)

con breakpoint <number>:
    user.devtools_go_to_line(number)
    user.devtools_conditional_breakpoint()

log point <number>:
    user.devtools_go_to_line(number)
    # This doesn't work at the moment because of this bug:
    # https://bugzilla.mozilla.org/show_bug.cgi?id=1840390
    key(cmd-shift-b)

watch expression [<user.text>]:
    user.devtools_add_watch_expression(text or "")