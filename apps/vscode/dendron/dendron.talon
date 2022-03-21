app: vscode
win.title: /dendron \(Workspace\)/
-
settings():
    # This is here to fix a weird issue were names get cut off
    key_wait = 2

preview: user.vscode("dendron.showPreview")
paste link: user.vscode("dendron.pasteLink")
make note [<user.text>]: user.convert_to_dendron_note("{text or ''}")
lookup [<user.text>]$:
    user.vscode("dendron.lookupNote")
    sleep(400ms)
    insert(text or "")
lookup:
    user.vscode("dendron.lookupNote")