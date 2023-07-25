mode: dictation
and mode: user.spanish
-

settings():
  speech.engine = 'webspeech'
  speech.language = 'es_ES'
  

<user.raw_prose>: user.dictation_insert(raw_prose)
(no cap | no-caps): user.dictation_format_no_cap()



quita eso: user.clear_last_phrase()

# Symbols
interrogación: "?"
exclamación: "!"
punto: "."

modo comando:
  mode.disable("sleep")
  mode.disable("dictation")
  mode.disable("user.spanish")
  mode.enable("command")