tag: terminal
and tag: user.git
-
git {user.git_command} [<user.git_arguments>]:
    args = git_arguments or ""
    "git {git_command}{args} "
git commit [<user.git_arguments>] message [<user.prose>]:
    args = git_arguments or ""
    message = prose or ""
    user.insert_between("git commit{args} --message '{message}", "'")
git stash [push] [<user.git_arguments>] message [<user.prose>]:
    args = git_arguments or ""
    message = prose or ""
    user.insert_between("git stash push{args} --message '{message}", "'")

# Optimistic execution for frequently used commands that are harmless (don't
# change repository or index state).
git status$: "git status\n"
git add patch$: "git add --patch\n"
git show head$: "git show HEAD\n"
git diff$: "git diff\n"
git diff (cached | cashed)$: "git diff --cached\n"
git graph: "git log --graph --oneline --all\n"

# Convenience
git clone clipboard:
    insert("git clone ")
    edit.paste()
    key(enter)
git diff highlighted:
    edit.copy()
    insert("git diff ")
    edit.paste()
    key(enter)
git diff clipboard:
    insert("git diff ")
    edit.paste()
    key(enter)
git add highlighted:
    edit.copy()
    insert("git add ")
    edit.paste()
    key(enter)
git add clipboard:
    insert("git add ")
    edit.paste()
    key(enter)
git commit highlighted:
    edit.copy()
    insert("git add ")
    edit.paste()
    insert("\ngit commit\n")

# Commands to manage my dotfiles
# https://www.atlassian.com/git/tutorials/dotfiles
config add: "config add "
config add modified: "config add -u\n"
config commit message <user.text>: "config commit -m '{text}'"
config commit:
    "config commit -m ''"
    key(left)
config diff (colour|color) words: "config diff --color-words "
config diff: "config diff "
config diff cached: "config diff --cached\n"
config log all: "config log\n"
config log all changes: "config log -c\n"
config log: "config log "
config log changes: "config log -c "
config pull: "config pull\n"
config push: "config push\n"
config status: "config status\n"
config list: "config log --pretty=format: --name-only --diff-filter=A | sort - | sed '/^$/d'\n"