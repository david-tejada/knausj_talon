from talon import Context, Module

mod = Module()

inbox_file = '/home/david/Dropbox/Dendron/vault/gtd.inbox.md'

def append_with_new_line(file: str, text: str):
  with open(file, 'r+') as file:
      lines = file.readlines()
      if not lines[-1].endswith('\n'):
        file.write("\n")
      file.write(f"- {text}")

@mod.action_class
class Actions:
  def append_to_inbox(text: str):
    '''Function to append text to my gtd.inbox.md file'''
    append_with_new_line(inbox_file, text)
    
  def remove_last_inbox_item():
    '''Function to clear the last of my gtd.inbox.md line'''
    fd=open(inbox_file,"r")
    d=fd.read()
    fd.close()
    m=d.split("\n")
    s="\n".join(m[:-1])
    fd=open(inbox_file,"w+")
    for i in range(len(s)):
        fd.write(s[i])
    fd.close()