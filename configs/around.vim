let s:pairs = { "(" : {"o": "(", "c":")"},
	           \"["  : {"o": "[", "c":"]"},
	           \"{"  : {"o": "{", "c":"}"},
	           \"\"" : {"o": "\"", "c":"\""},
	           \"\'" : {"o": "\'", "c":"\'"},
	           \"<"  : {"o": "<", "c":">"},
	           \"/"  : {"o": "/", "c":"/"}}


function Around(str) "only for normal mode, will have another for visua
	exe ":norm ciw" . s:pairs[a:str]["o"] . "\<Esc>gpa" . s:pairs[a:str]["c"] ."\<Esc>"
endfunction


