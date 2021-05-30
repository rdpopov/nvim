set grepprg=LC_ALL=C\ grep\ -nrsH\ --exclude-dir={node_modules,.git} " External grep command to use
setlocal suffixesadd+=.js,.jsx,.json
setlocal isfname+=@-@
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)


