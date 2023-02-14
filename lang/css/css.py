from talon import Module, Context, actions
from typing import List, Any

mod = Module()
ctx = Context()

ctx.matches = r"""
os: mac
and tag: user.css
os: mac
and app: firefox
"""


@mod.action_class
class Actions:
    def insert_many_sep(strings: List[str]) -> None:
        """Insert a list of strings separated by a space."""
        for string in strings:
            actions.insert(string)
            actions.insert(" ")
        actions.key("backspace")


@mod.capture(rule="[minus] <number> [point <number>] [{user.css_units}]")
def css_number_unit(m) -> str:
    if "minus" in m:
        result = "-"
    else:
        result = ""
    result = result + ".".join(str(x) for x in m.number_list)
    try:
        result = result + m.css_units
    except AttributeError:
        pass
    
    return result


@mod.capture(rule="<user.number_string> | <self.css_number_unit> | {user.css_values}")
def css_value(m) -> str:
    try:
        return m.number_string
    except AttributeError:
        try:
            return m.css_number_unit
        except AttributeError:
            return m.css_values


@ctx.action_class("user")
class UserActions:
    def code_block():
        actions.insert("{}")
        actions.key("left enter")


mod.list("css_properties", desc="list of CSS properties")
mod.list("css_units", desc="list of CSS units")
mod.list("css_values", desc="list of CSS values")
mod.list("css_pseudo", desc="list of CSS pseudo-classes and pseudo-elements")
mod.list("css_functions", desc="list of CSS functions")

ctx.lists["user.css_properties"] = {
    "additive symbols": "additive-symbols",
    "align content": "align-content",
    "align items": "align-items",
    "align self": "align-self",
    "all": "all",
    "animation delay": "animation-delay",
    "animation direction": "animation-direction",
    "animation duration": "animation-duration",
    "animation fill mode": "animation-fill-mode",
    "animation iteration count": "animation-iteration-count",
    "animation name": "animation-name",
    "animation play state": "animation-play-state",
    "animation timing function": "animation-timing-function",
    "animation": "animation",
    "backface visibility": "backface-visibility",
    "background attachment": "background-attachment",
    "background blend mode": "background-blend-mode",
    "background clip": "background-clip",
    "background color": "background-color",
    "background image": "background-image",
    "background origin": "background-origin",
    "background position": "background-position",
    "background repeat": "background-repeat",
    "background size": "background-size",
    "background": "background",
    "block size": "block-size",
    "border block end color": "border-block-end-color",
    "border block end style": "border-block-end-style",
    "border block end width": "border-block-end-width",
    "border block end": "border-block-end",
    "border block start color": "border-block-start-color",
    "border block start style": "border-block-start-style",
    "border block start width": "border-block-start-width",
    "border block start": "border-block-start",
    "border bottom color": "border-bottom-color",
    "border bottom left radius": "border-bottom-left-radius",
    "border bottom right radius": "border-bottom-right-radius",
    "border bottom style": "border-bottom-style",
    "border bottom width": "border-bottom-width",
    "border bottom": "border-bottom",
    "border collapse": "border-collapse",
    "border color": "border-color",
    "border image outset": "border-image-outset",
    "border image repeat": "border-image-repeat",
    "border image slice": "border-image-slice",
    "border image source": "border-image-source",
    "border image width": "border-image-width",
    "border image": "border-image",
    "border inline end color": "border-inline-end-color",
    "border inline end style": "border-inline-end-style",
    "border inline end width": "border-inline-end-width",
    "border inline end": "border-inline-end",
    "border inline start color": "border-inline-start-color",
    "border inline start style": "border-inline-start-style",
    "border inline start width": "border-inline-start-width",
    "border inline start": "border-inline-start",
    "border left color": "border-left-color",
    "border left style": "border-left-style",
    "border left width": "border-left-width",
    "border left": "border-left",
    "border radius": "border-radius",
    "border right color": "border-right-color",
    "border right style": "border-right-style",
    "border right width": "border-right-width",
    "border right": "border-right",
    "border spacing": "border-spacing",
    "border style": "border-style",
    "border top color": "border-top-color",
    "border top left radius": "border-top-left-radius",
    "border top right radius": "border-top-right-radius",
    "border top style": "border-top-style",
    "border top width": "border-top-width",
    "border top": "border-top",
    "border width": "border-width",
    "border": "border",
    "bottom": "bottom",
    "box decoration break": "box-decoration-break",
    "box shadow": "box-shadow",
    "box sizing": "box-sizing",
    "break after": "break-after",
    "break before": "break-before",
    "break inside": "break-inside",
    "caller": "color",
    "caption side": "caption-side",
    "clear": "clear",
    "clip path": "clip-path",
    "clip": "clip",
    "collar": "color",
    "color": "color",
    "column count": "column-count",
    "column fill": "column-fill",
    "column gap": "column-gap",
    "column rule color": "column-rule-color",
    "column rule style": "column-rule-style",
    "column rule width": "column-rule-width",
    "column rule": "column-rule",
    "column span": "column-span",
    "column width": "column-width",
    "columns": "columns",
    "content": "content",
    "counter increment": "counter-increment",
    "counter reset": "counter-reset",
    "cursor": "cursor",
    "direction": "direction",
    "display": "display",
    "empty cells": "empty-cells",
    "fallback": "fallback",
    "filter": "filter",
    "flex basis": "flex-basis",
    "flex direction": "flex-direction",
    "flex flow": "flex-flow",
    "flex grow": "flex-grow",
    "flex order": "order",
    "flex shrink": "flex-shrink",
    "flex wrap": "flex-wrap",
    "flex": "flex",
    "float": "float",
    "font family": "font-family",
    "font feature settings": "font-feature-settings",
    "font kerning": "font-kerning",
    "font language override": "font-language-override",
    "font size adjust": "font-size-adjust",
    "font size": "font-size",
    "font stretch": "font-stretch",
    "font style": "font-style",
    "font synthesis": "font-synthesis",
    "font variant alternates": "font-variant-alternates",
    "font variant caps": "font-variant-caps",
    "font variant east asian": "font-variant-east-asian",
    "font variant ligatures": "font-variant-ligatures",
    "font variant numeric": "font-variant-numeric",
    "font variant position": "font-variant-position",
    "font variant": "font-variant",
    "font weight": "font-weight",
    "font": "font",
    "gap": "gap",
    "grid area": "grid-area",
    "grid auto columns": "grid-auto-columns",
    "grid auto flow": "grid-auto-flow",
    "grid auto position": "grid-auto-position",
    "grid auto rows": "grid-auto-rows",
    "grid column end": "grid-column-end",
    "grid column start": "grid-column-start",
    "grid column": "grid-column",
    "grid row end": "grid-row-end",
    "grid row start": "grid-row-start",
    "grid row": "grid-row",
    "grid template areas": "grid-template-areas",
    "grid template columns": "grid-template-columns",
    "grid template rows": "grid-template-rows",
    "grid template": "grid-template",
    "grid": "grid",
    "height": "height",
    "hyphens": "hyphens",
    "image orientation": "image-orientation",
    "image rendering": "image-rendering",
    "image resolution": "image-resolution",
    "ime mode": "ime-mode",
    "inline size": "inline-size",
    "inset": "inset",
    "isolation": "isolation",
    "justify content": "justify-content",
    "left": "left",
    "letter spacing": "letter-spacing",
    "line break": "line-break",
    "line height": "line-height",
    "list style image": "list-style-image",
    "list style position": "list-style-position",
    "list style type": "list-style-type",
    "list style": "list-style",
    "margin block end": "margin-block-end",
    "margin block start": "margin-block-start",
    "margin bottom": "margin-bottom",
    "margin inline end": "margin-inline-end",
    "margin inline start": "margin-inline-start",
    "margin left": "margin-left",
    "margin right": "margin-right",
    "margin top": "margin-top",
    "margin": "margin",
    "marks": "marks",
    "mask type": "mask-type",
    "mask": "mask",
    "max block size": "max-block-size",
    "max height": "max-height",
    "max inline size": "max-inline-size",
    "max width": "max-width",
    "max zoom": "max-zoom",
    "min block size": "min-block-size",
    "min height": "min-height",
    "min height": "min-height",
    "min inline size": "min-inline-size",
    "min width": "min-width",
    "min width": "min-width",
    "min zoom": "min-zoom",
    "mix blend mode": "mix-blend-mode",
    "negative": "negative",
    "object fit": "object-fit",
    "object position": "object-position",
    "offset block end": "offset-block-end",
    "offset block start": "offset-block-start",
    "offset inline end": "offset-inline-end",
    "offset inline start": "offset-inline-start",
    "opacity": "opacity",
    "order": "order",
    "orientation": "orientation",
    "orphans": "orphans",
    "outline color": "outline-color",
    "outline offset": "outline-offset",
    "outline style": "outline-style",
    "outline width": "outline-width",
    "outline": "outline",
    "overflow wrap": "overflow-wrap",
    "overflow x": "overflow-x",
    "overflow y": "overflow-y",
    "overflow": "overflow",
    "pad": "pad",
    "padding block end": "padding-block-end",
    "padding block start": "padding-block-start",
    "padding bottom": "padding-bottom",
    "padding inline end": "padding-inline-end",
    "padding inline start": "padding-inline-start",
    "padding left": "padding-left",
    "padding right": "padding-right",
    "padding top": "padding-top",
    "padding": "padding",
    "page break after": "page-break-after",
    "page break before": "page-break-before",
    "page break inside": "page-break-inside",
    "perspective origin": "perspective-origin",
    "perspective": "perspective",
    "place content": "place-content",
    "pointer events": "pointer-events",
    "position": "position",
    "pouting": "padding",
    "prefix": "prefix",
    "quotes": "quotes",
    "range": "range",
    "resize": "resize",
    "right": "right",
    "row gap": "row-gap",
    "ruby align": "ruby-align",
    "ruby merge": "ruby-merge",
    "ruby position": "ruby-position",
    "scholar": "color",
    "scroll behavior": "scroll-behavior",
    "scroll snap coordinate": "scroll-snap-coordinate",
    "scroll snap destination": "scroll-snap-destination",
    "scroll snap points x": "scroll-snap-points-x",
    "scroll snap points y": "scroll-snap-points-y",
    "scroll snap type x": "scroll-snap-type-x",
    "scroll snap type y": "scroll-snap-type-y",
    "scroll snap type": "scroll-snap-type",
    "shape image threshold": "shape-image-threshold",
    "shape margin": "shape-margin",
    "shape outside": "shape-outside",
    "soars": "src",
    "source": "src",
    "speak as": "speak-as",
    "src": "src",
    "suffix": "suffix",
    "symbols": "symbols",
    "system": "system",
    "tab size": "tab-size",
    "table layout": "table-layout",
    "text align last": "text-align-last",
    "text align": "text-align",
    "text combine upright": "text-combine-upright",
    "text decoration color": "text-decoration-color",
    "text decoration line": "text-decoration-line",
    "text decoration style": "text-decoration-style",
    "text decoration": "text-decoration",
    "text indent": "text-indent",
    "text orientation": "text-orientation",
    "text overflow": "text-overflow",
    "text rendering": "text-rendering",
    "text shadow": "text-shadow",
    "text transform": "text-transform",
    "text underline position": "text-underline-position",
    "top": "top",
    "touch action": "touch-action",
    "transform box": "transform-box",
    "transform origin": "transform-origin",
    "transform style": "transform-style",
    "transform": "transform",
    "transition delay": "transition-delay",
    "transition duration": "transition-duration",
    "transition property": "transition-property",
    "transition timing function": "transition-timing-function",
    "transition": "transition",
    "turn": "turn",
    "unicode bidi": "unicode-bidi",
    "unicode range": "unicode-range",
    "user zoom": "user-zoom",
    "vertical align": "vertical-align",
    "visibility": "visibility",
    "white space": "white-space",
    "widows": "widows",
    "width": "width",
    "will change": "will-change",
    "word break": "word-break",
    "word spacing": "word-spacing",
    "word wrap": "word-wrap",
    "writing mode": "writing-mode",
    "z index": "z-index",
    "zoom": "zoom",
}

ctx.lists["user.css_units"] = {
    "pixel": "px",
    "em": "em",
    "rem": "rem",
    "percent": "%",
    "turn": "turn",
    "character": "ch",
    "degree": "deg",
    "fraction": "fr",
    "view height": "vh",
    "V H": "vh",
    "view width": "vw",
    "V W": "vw",
}

ctx.lists["user.css_values"] = {
    "above": "above",
    "absolute": "absolute",
    "alias": "alias",
    "all petite caps": "all-petite-caps",
    "all scroll": "all-scroll",
    "all small caps": "all-small-caps",
    "alphabetic": "alphabetic",
    "alternate": "alternate",
    "alternate reverse": "alternate-reverse",
    "always": "always",
    "armenian": "armenian",
    "auto": "auto",
    "auto fit": "auto-fit",
    "auto fill": "auto-fill",
    "avoid": "avoid",
    "avoid column": "avoid-column",
    "avoid page": "avoid-page",
    "avoid region": "avoid-region",
    "backwards": "backwards",
    "balance": "balance",
    "baseline": "baseline",
    "below": "below",
    "bidi override": "bidi-override",
    "block": "block",
    "bold": "bold",
    "bolder font": "bolder",
    "border box": "border-box",
    "both": "both",
    "bottom": "bottom",
    "break": "break",
    "break all": "break-all",
    "break word": "break-word",
    "capitalize": "capitalize",
    "cell": "cell",
    "center": "center",
    "circle": "circle",
    "close quote": "close-quote",
    "col resize": "col-resize",
    "collapse": "collapse",
    "color burn": "color-burn",
    "color dodge": "color-dodge",
    "column": "column",
    "column reverse": "column-reverse",
    "condensed": "condensed",
    "contain": "contain",
    "content box": "content-box",
    "context menu": "context-menu",
    "copy": "copy",
    "cover": "cover",
    "crosshair": "crosshair",
    "cursive": "cursive",
    "darken": "darken",
    "dashed": "dashed",
    "decimal": "decimal",
    "decimal leading zero": "decimal-leading-zero",
    "difference": "difference",
    "disc": "disc",
    "dot": "dot",
    "dotted": "dotted",
    "double": "double",
    "double circle": "double-circle",
    "east resize": "e-resize",
    "ease": "ease",
    "ease in": "ease-in",
    "ease in out": "ease-in-out",
    "ease out": "ease-out",
    "edges": "edges",
    "embed": "embed",
    "east west resize": "ew-resize",
    "exclusion": "exclusion",
    "expanded": "expanded",
    "extra condensed": "extra-condensed",
    "extra expanded": "extra-expanded",
    "fantasy": "fantasy",
    "fill": "fill",
    "filled": "filled",
    "fixed": "fixed",
    "flat": "flat",
    "flex": "flex",
    "flex end": "flex-end",
    "flex start": "flex-start",
    "forwards": "forwards",
    "from image": "from-image",
    "full width": "full-width",
    "geometricPrecision": "geometricPrecision",
    "georgian": "georgian",
    "grab": "grab",
    "grabbing": "grabbing",
    "grid": "grid",
    "groove": "groove",
    "hard light": "hard-light",
    "help": "help",
    "hidden": "hidden",
    "hide": "hide",
    "horizontal": "horizontal",
    "hue": "hue",
    "infinite": "infinite",
    "inherit": "inherit",
    "initial": "initial",
    "ink": "ink",
    "inline": "inline",
    "inline block": "inline-block",
    "inline flex": "inline-flex",
    "inline grid": "inline-grid",
    "inline table": "inline-table",
    "inset": "inset",
    "inside": "inside",
    "invert": "invert",
    "italic": "italic",
    "justify": "justify",
    "keep all": "keep-all",
    "lighten": "lighten",
    "lighter": "lighter",
    "line through": "line-through",
    "linear": "linear",
    "list item": "list-item",
    "local": "local",
    "lower alpha": "lower-alpha",
    "lower greek": "lower-greek",
    "lower latin": "lower-latin",
    "lower roman": "lower-roman",
    "lowercase": "lowercase",
    "left": "left",
    "left to right": "ltr",
    "luminosity": "luminosity",
    "manual": "manual",
    "margin box": "margin-box",
    "max content": "max-content",
    "medium": "medium",
    "middle": "middle",
    "min content": "min-content",
    "monospace": "monospace",
    "move": "move",
    "multiply": "multiply",
    "north resize": "n-resize",
    "northeast resize": "ne-resize",
    "northeast southwest resize": "nesw-resize",
    "no close quote": "no-close-quote",
    "no drop": "no-drop",
    "no open quote": "no-open-quote",
    "no repeat": "no-repeat",
    "none": "none",
    "normal": "normal",
    "not allowed": "not-allowed",
    "nowrap": "nowrap",
    "north south resize": "ns-resize",
    "northwest resize": "nw-resize",
    "northwest southeast resize": "nwse-resize",
    "objects": "objects",
    "oblique": "oblique",
    "open": "open",
    "open quote": "open-quote",
    "optimizeLegibility": "optimizeLegibility",
    "optimizeSpeed": "optimizeSpeed",
    "outset": "outset",
    "outside": "outside",
    "outside shape": "outside-shape",
    "overlay": "overlay",
    "overline": "overline",
    "padding box": "padding-box",
    "painted": "painted",
    "paused": "paused",
    "petite caps": "petite-caps",
    "pointer": "pointer",
    "pre": "pre",
    "pre line": "pre-line",
    "pre wrap": "pre-wrap",
    "preserve 3d": "preserve-3d",
    "progress": "progress",
    "region": "region",
    "relative": "relative",
    "repeat x": "repeat-x",
    "repeat horizontal": "repeat-x",
    "repeat y": "repeat-y",
    "repeat vertical": "repeat-y",
    "reverse": "reverse",
    "ridge": "ridge",
    "round": "round",
    "row": "row",
    "row resize": "row-resize",
    "row reverse": "row-reverse",
    "right to left": "rtl",
    "run in": "run-in",
    "running": "running",
    "south resize": "s-resize",
    "sans serif": "sans-serif",
    "saturation": "saturation",
    "scale down": "scale-down",
    "screen": "screen",
    "scroll": "scroll",
    "southeast resize": "se-resize",
    "semi condensed": "semi-condensed",
    "semi expanded": "semi-expanded",
    "separate": "separate",
    "serif": "serif",
    "sesame": "sesame",
    "show": "show",
    "small caps": "small-caps",
    "snap": "snap",
    "soft light": "soft-light",
    "solid": "solid",
    "space": "space",
    "space around": "space-around",
    "space between": "space-between",
    "spaces": "spaces",
    "span": "span",
    "square": "square",
    "static": "static",
    "step end": "step-end",
    "step start": "step-start",
    "sticky": "sticky",
    "stretch": "stretch",
    "stroke": "stroke",
    "style": "style",
    "sub": "sub",
    "super": "super",
    "southwest resize": "sw-resize",
    "table": "table",
    "table caption": "table-caption",
    "table cell": "table-cell",
    "table column": "table-column",
    "table column group": "table-column-group",
    "table footer group": "table-footer-group",
    "table header group": "table-header-group",
    "table row": "table-row",
    "table row group": "table-row-group",
    "text": "text",
    "text bottom": "text-bottom",
    "text top": "text-top",
    "thick": "thick",
    "thin": "thin",
    "titling caps": "titling-caps",
    "top": "top",
    "triangle": "triangle",
    "ultra condensed": "ultra-condensed",
    "ultra expanded": "ultra-expanded",
    "underline": "underline",
    "unicase": "unicase",
    "unset": "unset",
    "upper alpha": "upper-alpha",
    "upper latin": "upper-latin",
    "upper roman": "upper-roman",
    "uppercase": "uppercase",
    "vertical": "vertical",
    "vertical text": "vertical-text",
    "visible": "visible",
    "visibleFill": "visibleFill",
    "visiblePainted": "visiblePainted",
    "visibleStroke": "visibleStroke",
    "west resize": "w-resize",
    "wait": "wait",
    "wavy": "wavy",
    "weight": "weight",
    "wrap": "wrap",
    "wrap reverse": "wrap-reverse",
    "zoom in": "zoom-in",
    "zoom out": "zoom-out",
    # Some basic colors
    "black": "black",
    "fuchsia": "fuchsia",
    "gray": "gray",
    "green": "green",
    "lime": "lime",
    "maroon": "maroon",
    "olive": "olive",
    "purple": "purple",
    "red": "red",
    "silver": "silver",
    "white": "white",
}

ctx.lists["user.css_pseudo"] = {
    "active": ":active",
    "after": "::after",
    "backdrop": "::backdrop",
    "before": "::before",
    "checked": ":checked",
    "default": ":default",
    "dir": ":dir(",
    "disabled": ":disabled",
    "empty": ":empty",
    "enabled": ":enabled",
    "first child": ":first-child",
    "first letter": "::first-letter",
    "first line": "::first-line",
    "first of type": ":first-of-type",
    "first": ":first",
    "focus": ":focus",
    "fullscreen": ":fullscreen",
    "hover": ":hover",
    "in range": ":in-range",
    "indeterminate": ":indeterminate",
    "invalid": ":invalid",
    "lang": ":lang(",
    "last child": ":last-child",
    "last of type": ":last-of-type",
    "left": ":left",
    "link": ":link",
    "not": ":not(",
    "nth child": ":nth-child(",
    "nth last child": ":nth-last-child(",
    "nth last of type": ":nth-last-of-type(",
    "nth of type": ":nth-of-type(",
    "only child": ":only-child",
    "only of type": ":only-of-type",
    "optional": ":optional",
    "out of range": ":out-of-range",
    "read only": ":read-only",
    "read write": ":read-write",
    "repeat index": "::repeat-index",
    "repeat item": "::repeat-item",
    "required": ":required",
    "right": ":right",
    "root": ":root",
    "route": ":root",
    "scope": ":scope",
    "selection": "::selection",
    "target": ":target",
    "unresolved": ":unresolved",
    "valid": ":valid",
    "visited": ":visited",
    "volleyed": ":valid",
}

ctx.lists["user.css_functions"] = {
    "annotation": "annotation",
    "attr": "attr",
    "blur": "blur",
    "brightness": "brightness",
    "calc": "calc",
    "character variant": "character-variant",
    "circle": "circle",
    "contrast": "contrast",
    "cubic bezier": "cubic-bezier",
    "drop shadow": "drop-shadow",
    "element": "element",
    "ellipse": "ellipse",
    "grayscale": "grayscale",
    "hsl": "hsl",
    "hsla": "hsla",
    "hue rotate": "hue-rotate",
    "image": "image",
    "inset": "inset",
    "invert": "invert",
    "lang": "lang",
    "linear gradient": "linear-gradient",
    "matrix": "matrix",
    "matrix3d": "matrix3d",
    "minmax": "minmax",
    "opacity": "opacity",
    "ornaments": "ornaments",
    "perspective": "perspective",
    "polygon": "polygon",
    "radial-gradient": "radial-gradient",
    "rect": "rect",
    "repeat": "repeat",
    "repeating linear gradient": "repeating-linear-gradient",
    "repeating radial gradient": "repeating-radial-gradient",
    "rgb": "rgb",
    "rgba": "rgba",
    "rotate": "rotate",
    "rotatex": "rotatex",
    "rotatey": "rotatey",
    "rotatez": "rotatez",
    "rotate3d": "rotate3d",
    "saturate": "saturate",
    "scale": "scale",
    "scalex": "scalex",
    "scaley": "scaley",
    "scalez": "scalez",
    "scale3d": "scale3d",
    "sepia": "sepia",
    "skew": "skew",
    "skewx": "skewx",
    "skewy": "skewy",
    "steps": "steps",
    "styleset": "styleset",
    "stylistic": "stylistic",
    "swash": "swash",
    "symbols": "symbols",
    "translate": "translate",
    "translatex": "translatex",
    "translatey": "translatey",
    "translatez": "translatez",
    "translate3d": "translate3d",
    "url": "url",
    "var": "var",
}
