let g:current_completion = ""
au CompleteChanged * let g:current_completion = complete_info()['mode']

let g:to_feed = { '' : '\<C-N>',
            \  'keyword' : '\<C-X>\<C-N>',
            \ 'ctrl_x' : '',
            \  'scroll' : '\<C-X>\<C-s>',
            \ 'whole_line' : '\<C-X>\<C-L>',
            \ 'files' : '\<C-X>\<C-F>',
            \ 'tags' : '\<C-X>\<C-]>',
            \ 'path_defines' : '\<C-X>\<C-D>',
            \ 'path_patterns' : '\<C-X>\<C-D>',
            \ 'dictionary' : '\<C-X>\<C-K>',
            \ 'thesaurus' : '\<C-X>\<C-K>',
            \ 'cmdline' : '\<C-X>\<C-V>',
            \ 'function' : '\<C-X>\<C-U>',
            \ 'omni' : '\<C-X>\<C-O>',
            \ 'spell' : '\<C-X>s',
            \ 'eval' : '\<C-N>',
            \ 'unknown' : '\<C-N>' }

function s:get_trigger_command(crnt)
    try
        return to_feed[a:crnt]
    catch
        return ''
    endtry
endfunction

function s:special_tab_complete(crnt)
    if pumvisible()
        feedkeys( '\<C-N>' )
    else
        feedkeys(get_trigger_command(crnt))
    endif
endfunction
