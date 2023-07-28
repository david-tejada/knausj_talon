app: vscode
-
tag(): user.find_and_replace
tag(): user.multiple_cursors
tag(): user.snippets
tag(): user.splits
tag(): user.tabs
tag(): user.emoji

settings():
    user.accessibility_dictation = 1 
    key_hold = 5.0

window reload: user.vscode("workbench.action.reloadWindow")
window close: user.vscode("workbench.action.closeWindow")
close all editors: user.vscode("workbench.action.closeAllGroups")
#multiple_cursor.py support end

please [<user.text>]:
    user.vscode("workbench.action.showCommands")
    insert(user.text or "")

# Sidebar
bar explore: user.vscode("workbench.view.explorer")
bar extensions: user.vscode("workbench.view.extensions")
bar outline: user.vscode("outline.focus")
bar run: user.vscode("workbench.view.debug")
bar search: user.vscode("workbench.view.search")
bar source: user.vscode("workbench.view.scm")
bar test: user.vscode("workbench.view.testing.focus")
bar switch: user.vscode("workbench.action.toggleSidebarVisibility")

# Symbol search
symbol hunt [<user.text>]:
    user.vscode("workbench.action.gotoSymbol")
    sleep(50ms)
    insert(text or "")

symbol hunt all [<user.text>]:
    user.vscode("workbench.action.showAllSymbols")
    sleep(50ms)
    insert(text or "")

# Panels
panel control: user.vscode("workbench.panel.repl.view.focus")
panel output: user.vscode("workbench.panel.output.focus")
panel problems: user.vscode("workbench.panel.markers.view.focus")
panel switch: user.vscode("workbench.action.togglePanel")
panel terminal: user.vscode("workbench.action.terminal.focus")
focus editor: user.vscode("workbench.action.focusActiveEditorGroup")

# Settings
show settings: user.vscode("workbench.action.openGlobalSettings")
show settings json: user.vscode("workbench.action.openSettingsJson")
show settings folder: user.vscode("workbench.action.openFolderSettings")
show settings folder json: user.vscode("workbench.action.openFolderSettingsFile")
show settings workspace: user.vscode("workbench.action.openWorkspaceSettings")
show settings workspace json: user.vscode("workbench.action.openWorkspaceSettingsFile")
show shortcuts: user.vscode("workbench.action.openGlobalKeybindings")
show shortcuts json: user.vscode("workbench.action.openGlobalKeybindingsFile")
show snippets: user.vscode("workbench.action.openSnippets")

# Display
centered switch: user.vscode("workbench.action.toggleCenteredLayout")
fullscreen switch: user.vscode("workbench.action.toggleFullScreen")
theme switch: user.vscode("workbench.action.selectTheme")
wrap switch: user.vscode("editor.action.toggleWordWrap")
zen switch: user.vscode("workbench.action.toggleZenMode")


# File Commands
lisa [<user.text>] [{user.file_extension}] [halt]:
    user.vscode("workbench.action.quickOpen")
    sleep(400ms)
    insert(text or "")
    insert(file_extension or "")
    sleep(300ms)
poppy <user.text> [{user.file_extension}] [halt]:
    user.vscode("workbench.action.quickOpen")
    sleep(400ms)
    insert(text or "")
    insert(file_extension or "")
    sleep(400ms)
    key(enter)
    sleep(150ms)
pop work <user.text>:
    user.vscode("workbench.action.openRecent")
    sleep(400ms)
    insert(text)
    sleep(300ms)
    key(enter)
    sleep(150ms)
list work [<user.text>]:
    user.vscode("workbench.action.openRecent")
    sleep(400ms)
    insert(text or "")
pop work:
    user.vscode("workbench.action.openRecent")
    sleep(400ms)
    key(enter)
poppy: user.vscode("workbench.action.openPreviousRecentlyUsedEditorInGroup")
file copy path: user.vscode("copyFilePath")
file copy local [path]: user.vscode("copyRelativeFilePath")
file create sibling: user.vscode_and_wait("explorer.newFile")
file create: user.vscode("workbench.action.files.newUntitledFile")
file create relative: user.vscode("fileutils.newFile")
file create root: user.vscode("fileutils.newFileAtRoot")
file rename:
    user.vscode("fileutils.renameFile")
    sleep(150ms)
file move:
    user.vscode("fileutils.moveFile")
    sleep(150ms)
file clone:
	  user.vscode("fileutils.duplicateFile")
	  sleep(150ms)
file remove:
    user.vscode("fileutils.removeFile")
    sleep(150ms)
file revert: user.vscode("workbench.action.files.revert")
file open folder: user.vscode("revealFileInOS")
file reveal: user.vscode("workbench.files.action.showActiveFileInExplorer")
save ugly: user.vscode("workbench.action.files.saveWithoutFormatting")
disk all: user.vscode("workbench.action.files.saveFiles")

# Language Features
suggest show: user.vscode("editor.action.triggerSuggest")
hint show: user.vscode("editor.action.triggerParameterHints")
definition show: user.vscode("editor.action.revealDefinition")
definition peek: user.vscode("editor.action.peekDefinition")
definition side: user.vscode("editor.action.revealDefinitionAside")
references show: user.vscode("editor.action.goToReferences")
hierarchy peek: user.vscode("editor.showCallHierarchy")
references find: user.vscode("references-view.find")
format that: user.vscode("editor.action.formatDocument")
format selection: user.vscode("editor.action.formatSelection")
imports fix: user.vscode("editor.action.organizeImports")
problem next: user.vscode("editor.action.marker.nextInFiles")
problem last: user.vscode("editor.action.marker.prevInFiles")
problem fix: user.vscode("problems.action.showQuickFixes")
rename that: user.vscode("editor.action.rename")
refactor that: user.vscode("editor.action.refactor")
whitespace trim: user.vscode("editor.action.trimTrailingWhitespace")
language switch: user.vscode("workbench.action.editor.changeLanguageMode")
refactor rename: user.vscode("editor.action.rename")
refactor this: user.vscode("editor.action.refactor")

#code navigation
(go declaration | follow): user.vscode("editor.action.revealDefinition")
go back: user.vscode("workbench.action.navigateBack")
go forward: user.vscode("workbench.action.navigateForward")
go implementation: user.vscode("editor.action.goToImplementation")
go type: user.vscode("editor.action.goToTypeDefinition")
go usage: user.vscode("references-view.find")
go recent [<user.text>]:
    user.vscode("workbench.action.openRecent")
    sleep(50ms)
    insert(text or "")
    sleep(250ms)
go edit: user.vscode("workbench.action.navigateToLastEditLocation")

# Bookmarks. Requires Bookmarks plugin
bar marks: user.vscode("workbench.view.extension.bookmarks")
go marks:
    user.deprecate_command("2023-06-06", "go marks", "bar marks")
    user.vscode("workbench.view.extension.bookmarks")
toggle mark: user.vscode("bookmarks.toggle")
go next mark: user.vscode("bookmarks.jumpToNext")
go last mark: user.vscode("bookmarks.jumpToPrevious")

tab close other: user.vscode("workbench.action.closeOtherEditors")
tab close all: user.vscode("workbench.action.closeAllEditors")
tab close [way] right: user.vscode("workbench.action.closeEditorsToTheRight")
tab close [way] left: user.vscode("workbench.action.closeEditorsToTheLeft")

# Folding
fold that: user.vscode("editor.fold")
unfold that: user.vscode("editor.unfold")
fold those: user.vscode("editor.foldAllMarkerRegions")
unfold those: user.vscode("editor.unfoldRecursively")
fold all: user.vscode("editor.foldAll")
unfold all: user.vscode("editor.unfoldAll")
fold comments: user.vscode("editor.foldAllBlockComments")
fold one: user.vscode("editor.foldLevel1")
fold two: user.vscode("editor.foldLevel2")
fold three: user.vscode("editor.foldLevel3")
fold four: user.vscode("editor.foldLevel4")
fold five: user.vscode("editor.foldLevel5")
fold six: user.vscode("editor.foldLevel6")
fold seven: user.vscode("editor.foldLevel7")

# Git / Github (not using verb-noun-adjective pattern, mirroring terminal commands.)
git branch: user.vscode("git.branchFrom")
git branch this: user.vscode("git.branch")
git checkout [<user.text>]:
    user.vscode("git.checkout")
    sleep(50ms)
    insert(text or "")
git commit [<user.text>]:
    user.vscode("git.commitStaged")
    sleep(100ms)
    user.insert_formatted(text or "", "CAPITALIZE_FIRST_WORD")
git commit undo: user.vscode("git.undoCommit")
git commit amend: user.vscode("git.commitStagedAmend")
git diff: user.vscode("git.openChange")
git fetch: user.vscode("git.fetch")
git fetch all: user.vscode("git.fetchAll")
git ignore: user.vscode("git.ignore")
git merge: user.vscode("git.merge")
git output: user.vscode("git.showOutput")
git pull: user.vscode("git.pullRebase")
git push: user.vscode("git.push")
git push focus: user.vscode("git.pushForce")
git rebase abort: user.vscode("git.rebaseAbort")
git reveal: user.vscode("git.revealInExplorer")
git clean: user.vscode("git.clean")
git revert selected: user.vscode("git.revertSelectedRanges")
git stash: user.vscode("git.stash")
git stash pop: user.vscode("git.stashPop")
git status: user.vscode("workbench.scm.focus")
git stage: user.vscode("git.stage")
git stage all: user.vscode("git.stageAll")
git stage selected: user.vscode("git.stageSelectedRanges")
git sync: user.vscode("git.sync")
git unstage: user.vscode("git.unstage")
git unstage all: user.vscode("git.unstageAll")
git unstage selected: user.vscode("git.unstageSelectedRanges")
git open: user.vscode("git.openFile")
pull request: user.vscode("pr.create")
# Use keyboard shortcuts because VSCode relies on when clause contexts to choose the appropriate
# action: https://code.visualstudio.com/api/references/when-clause-contexts
change next: key(alt-f5)
change last: key(shift-alt-f5)

# Testing
test run: user.vscode("testing.runAtCursor")
test run file: user.vscode("testing.runCurrentFile")
test run all: user.vscode("testing.runAll")
test run failed: user.vscode("testing.reRunFailTests")
test run last: user.vscode("testing.reRunLastRun")

test debug: user.vscode("testing.debugAtCursor")
test debug file: user.vscode("testing.debugCurrentFile")
test debug all: user.vscode("testing.debugAll")
test debug failed: user.vscode("testing.debugFailTests")
test debug last: user.vscode("testing.debugLastRun")

test cancel: user.vscode("testing.cancelRun")

# Debugging
break point: user.vscode("editor.debug.action.toggleBreakpoint")
step over: user.vscode("workbench.action.debug.stepOver")
step into: user.vscode("workbench.action.debug.stepInto")
step out [of]: user.vscode("workbench.action.debug.stepOut")
debug start: user.vscode("workbench.action.debug.start")
debug pause: user.vscode("workbench.action.debug.pause")
debug stopper: user.vscode("workbench.action.debug.stop")
resume: user.vscode("workbench.action.debug.continue")
debug restart: user.vscode("workbench.action.debug.restart")
debug console: user.vscode("workbench.debug.action.toggleRepl")
debug clean: user.vscode("workbench.debug.panel.action.clearReplAction")

# Terminal
terminal external: user.vscode("workbench.action.terminal.openNativeConsole")
terminal new: user.vscode("workbench.action.terminal.new")
terminal next: user.vscode("workbench.action.terminal.focusNext")
terminal last: user.vscode("workbench.action.terminal.focusPrevious")
terminal split: user.vscode("workbench.action.terminal.split")
terminal zoom: user.vscode("workbench.action.toggleMaximizedPanel")
terminal trash: user.vscode("workbench.action.terminal.kill")
terminal toggle: user.vscode_and_wait("workbench.action.terminal.toggleTerminal")
terminal scroll up: user.vscode("workbench.action.terminal.scrollUp")
terminal scroll down: user.vscode("workbench.action.terminal.scrollDown")
terminal <number_small>: user.vscode_terminal(number_small)

#TODO: should this be added to linecommands?
copy line down: user.vscode("editor.action.copyLinesDownAction")
copy line up: user.vscode("editor.action.copyLinesUpAction")

#Expand/Shrink AST Selection
select less: user.vscode("editor.action.smartSelect.shrink")
select (more | this): user.vscode("editor.action.smartSelect.expand")

minimap: user.vscode("editor.action.toggleMinimap")
maximize: user.vscode("workbench.action.minimizeOtherEditors")
restore: user.vscode("workbench.action.evenEditorWidths")

#breadcrumb
select breadcrumb: user.vscode("breadcrumbs.focusAndSelect")
# Use `alt-left` and `alt-right` to navigate the bread crumb

hover show: user.vscode("editor.action.showHover")

join lines: user.vscode("editor.action.joinLines")

full screen: user.vscode("workbench.action.toggleFullScreen")

curse undo: user.vscode("cursorUndo")

select word: user.vscode("editor.action.addSelectionToNextFindMatch")
skip word: user.vscode("editor.action.moveSelectionToNextFindMatch")

# jupyter
cell next: user.vscode("notebook.focusNextEditor")
cell last: user.vscode("notebook.focusPreviousEditor")
cell run above: user.vscode("notebook.cell.executeCellsAbove")
cell run: user.vscode("notebook.cell.execute")

install local: user.vscode("workbench.extensions.action.installVSIX")

# quokka
toggle quokka: user.vscode("quokka.toggle")

# GitLens
lens zen:
    user.vscode("gitlens.switchMode")
    "zen\n"
lens review:
    user.vscode("gitlens.switchMode")
    "review\n"

# Splits
split clear: user.vscode("workbench.action.closeEditorsInGroup")
split clear all: user.vscode("workbench.action.closeAllEditors")

# Live server
go live: user.vscode("extension.liveServer.goOnline")

# Markdown Preview
side preview: user.vscode("markdown.showPreviewToSide")
preview refresh: user.vscode("markdown.preview.refresh")

# Generate Numbers. Needs the extension andreas-talon
generate range [from <number_small>]:
    user.run_rpc_command("andreas.generateRange", number_small or 1)

# cursorless
next: user.vscode_and_wait("jumpToNextSnippetPlaceholder")

source next: key(cmd-0 down space)
source last: key(cmd-0 up space)

# search
switch case: key(cmd-alt-c)
switch word: key(cmd-alt-w)
switch regex: key(cmd-alt-r)