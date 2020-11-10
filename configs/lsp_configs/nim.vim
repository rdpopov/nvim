let s:nimlspexecutable = "nimlsp"
if executable(s:nimlspexecutable)
    au User lsp_setup call lsp#register_server({
                \ 'name': 'nimlsp',
                \ 'cmd': {server_info->[s:nimlspexecutable]},
                \ 'whitelist': ['nim'],
                \ })
endif
autocmd BufEnter *.nim nmap <buffer> yd :call nim#suggest#def#GoTo('b')<lf>          ;Go to definition (open buffer) <Nim>
autocmd BufEnter *.nim nmap <buffer> yt :call nim#suggest#outline#OpenLocList()<lf>  ;Open outline of file <Nim>
autocmd BufEnter *.nim nmap <buffer> yi :call nim#suggest#def#GoTo('v')<lf>          ;Go to definition (open vsplit) <Nim>
autocmd BufEnter *.nim nmap <buffer> yr :call nim#suggest#use#ShowReferences()<lf>   ;Show refferences to symbol <Nim>
