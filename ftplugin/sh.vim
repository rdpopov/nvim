set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set colorcolumn=80

call apathy#Prepend('path', apathy#EnvSplit($PATH))
setlocal include=^\\s*\\%(\\.\\\|source\\)\\s
setlocal define=\\<\\%(\\i\\+\\s*()\\)\\@=

call apathy#Undo()
