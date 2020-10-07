let s:nimlspexecutable = "nimlsp"
if executable(s:nimlspexecutable)
    au User lsp_setup call lsp#register_server({
                \ 'name': 'nimlsp',
                \ 'cmd': {server_info->[s:nimlspexecutable]},
                \ 'whitelist': ['nim'],
                \ })
endif
autocmd BufEnter *.nim nmap <buffer> yd :call nim#suggest#def#GoTo('b')<lf>
autocmd BufEnter *.nim nmap <buffer> yt :call nim#suggest#outline#OpenLocList()<lf>
autocmd BufEnter *.nim nmap <buffer> yi :call nim#suggest#def#GoTo('v')<lf>
autocmd BufEnter *.nim nmap <buffer> yr :call nim#suggest#use#ShowReferences()<lf>
