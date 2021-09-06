" Contents: Language swithing utility functions for (neo)vim internally
" just for insert mode and searching and stuff using builtin keymap

if !exists("g:lang")
    let g:lang = ['english']
endif

let g:crnt_lang=0
let g:spell_language={'english':'en_us', 'bulgarian-phonetic':'bg' }

function! ToggleLocalSpelling()
	if &spelllang == ""
		call SetSpellingTo([g:lang[g:crnt_lang])
	endif
	execute('setlocal spell!')
endfunction

function! SetSpellingTo()
  execute('setlocal spelllang='.g:spell_language[g:lang[g:crnt_lang]])
endfunction

" Truncate current language to a 3-letter based string (+ 3-letter for every '-'
" in it each '-' separated word is considered a new word)
function! GetLangLabl()
    let l:cut = split(g:lang[g:crnt_lang],'-')
    let l:res = []
    for part in l:cut
        let l:res = l:res + [toupper(part[0:2])]
    endfor
    return join(l:res,'-')
endfunction

let g:langid = GetLangLabl()

" Meant for getting the current language form the list, for lightline and similar
function! GetInputLang()
    return g:langid
endfunction

" Cycles to the next language in the list
function! CycleLanguagesUp()
    let l:len = len(g:lang)
    let g:crnt_lang = (g:crnt_lang + 1 ) % l:len
    call SetKeymapTo(g:lang[g:crnt_lang])
		call SetSpellingTo()
endfunction

" Cycles to the previous language in the list
function! CycleLanguagesDown()
    let l:len = len(g:lang)
    if g:crnt_lang > 0
        let g:crnt_lang = (g:crnt_lang + 1 ) % l:len 
    else
        let g:crnt_lang = s:len - 1
    endif
    call SetKeymapTo(g:lang[g:crnt_lang])
		call SetSpellingTo()
endfunction

" Sets language to argument
" Thing is, that vim has no explicit setting for English
" english is default language but does not have a keymap=something setting 
" so keymap has to be set to the empty sting to reset it 
function! SetKeymapTo(lang)
    let l:lng = a:lang
    if a:lang == 'english'
        let l:lng = ""
    endif
    execute('set keymap='.l:lng)
    let g:langid = GetLangLabl()
endfunction
