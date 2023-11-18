from talon import Context, Module, actions, settings
from typing import List

mod = Module()
ctx = Context()
ctx.matches = r"""
code.language: typescript
code.language: typescriptreact
# Make typescript win over javascript
mode: command
"""

@mod.action_class
class Actions:
    def code_insert_type_annotation_multiple(types: List[str]):
        """Insert multiple types"""

ctx.lists["user.code_type"] = {
    "boolean": "boolean",
    "integer": "int",
    "string": "string",
    "null": "null",
    "undefined": "undefined",
    "number": "number",
    "any": "any",
    "unknown": "unknown",
    "Anchor": "HTMLAnchorElement",
    "Base": "HTMLBaseElement",
    "Body": "HTMLBodyElement",
    "Button": "HTMLButtonElement",
    "Canvas": "HTMLCanvasElement",
    "DataList": "HTMLDataListElement",
    "Details": "HTMLDetailsElement",
    "Dialog": "HTMLDialogElement",
    "Directory": "HTMLDirectoryElement",
    "Div": "HTMLDivElement",
    "dom rect": "DOMRect",
    "Embed": "HTMLEmbedElement",
    "Element": "Element",
    "FieldSet": "HTMLFieldSetElement",
    "Font": "HTMLFontElement",
    "Form": "HTMLFormElement",
    "Frame": "HTMLFrameElement",
    "FrameSet": "HTMLFrameSetElement",
    "HR": "HTMLHRElement",
    "Head": "HTMLHeadElement",
    "Heading": "HTMLHeadingElement",
    "Html": "HTMLHtmlElement",
    "Html Element": "HTMLElement",
    "IFrame": "HTMLIFrameElement",
    "Image": "HTMLImageElement",
    "Input": "HTMLInputElement",
    "List Item": "HTMLLIElement",
    "Label": "HTMLLabelElement",
    "Legend": "HTMLLegendElement",
    "Link": "HTMLLinkElement",
    "Map": "HTMLMapElement",
    "Marquee": "HTMLMarqueeElement",
    "Media": "HTMLMediaElement",
    "Menu": "HTMLMenuElement",
    "Meta": "HTMLMetaElement",
    "Meter": "HTMLMeterElement",
    "Mod": "HTMLModElement",
    "O List": "HTMLOListElement",
    "Object": "HTMLObjectElement",
    "OptGroup": "HTMLOptGroupElement",
    "Option": "HTMLOptionElement",
    "Output": "HTMLOutputElement",
    "Paragraph": "HTMLParagraphElement",
    "Param": "HTMLParamElement",
    "Picture": "HTMLPictureElement",
    "Pre": "HTMLPreElement",
    "Progress": "HTMLProgressElement",
    "Quote": "HTMLQuoteElement",
    "Script": "HTMLScriptElement",
    "Select": "HTMLSelectElement",
    "Slot": "HTMLSlotElement",
    "Source": "HTMLSourceElement",
    "Span": "HTMLSpanElement",
    "Style": "HTMLStyleElement",
    "TableCaption": "HTMLTableCaptionElement",
    "TableCell": "HTMLTableCellElement",
    "TableCol": "HTMLTableColElement",
    "Table": "HTMLTableElement",
    "TableRow": "HTMLTableRowElement",
    "TableSection": "HTMLTableSectionElement",
    "Template": "HTMLTemplateElement",
    "TextArea": "HTMLTextAreaElement",
    "Text": "Text",
    "Time": "HTMLTimeElement",
    "Title": "HTMLTitleElement",
    "Track": "HTMLTrackElement",
    "U List": "HTMLUListElement",
}

@ctx.action_class("user")
class UserActions:
    def code_private_function(text: str):
        """Inserts private function declaration"""
        result = "function {}".format(
            actions.user.formatted_text(
                text, settings.get("user.code_private_function_formatter")
            )
        )

        actions.user.code_insert_function(result, None)

    def code_protected_function(text: str):
        result = "protected function {}".format(
            actions.user.formatted_text(
                text, settings.get("user.code_protected_function_formatter")
            )
        )

        actions.user.code_insert_function(result, None)

    def code_public_function(text: str):
        result = "public function {}".format(
            actions.user.formatted_text(
                text, settings.get("user.code_public_function_formatter")
            )
        )

        actions.user.code_insert_function(result, None)

    def code_insert_type_annotation(type: str):
        actions.insert(f": {type}")

    def code_insert_type_annotation_multiple(types: List[str]):
        actions.insert(": ")
        actions.insert(" | ".join(types))

    def code_insert_return_type(type: str):
        actions.insert(f": {type}")
