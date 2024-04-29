let g:rep_current_completion = "keyword"
au CompleteDonePre * :call s:special_tab_complete()


let s:rep_to_feed = { "" : "\<C-n>",
            \  "keyword" : "\<C-x>\<C-n>",
            \ "ctrl_x" : "\<C-n>",
            \  "scroll" : "\<C-x>\<C-s>",
            \ "whole_line" : "\<C-x>\<C-l>",
            \ "files" : "\<C-x>\<C-f>",
            \ "tags" : "\<C-x>\<C-]>",
            \ "path_defines" : "\<C-x>\<C-d>",
            \ "path_patterns" : "\<C-x>\<C-i>",
            \ "dictionary" : "\<C-x>\<C-k>",
            \ "thesaurus" : "\<C-x>\<C-k>",
            \ "cmdline" : "\<C-x>\<C-v>",
            \ "function" : "\<C-x>\<C-u>",
            \ "omni" : "\<C-x>\<C-o>",
            \ "spell" : "\<C-x>s",
            \ "eval" : "\<C-n>",
            \ "unknown" : "\<C-n>" }

let g:rep_complete_command = s:rep_to_feed[g:rep_current_completion]

function s:special_tab_complete()
    let g:rep_current_completion = complete_info()['mode'] 
    let g:rep_complete_command = s:rep_to_feed[g:rep_current_completion]
endfunction

inoremap <expr> <Tab> pumvisible() ? "\<C-n>"  :  g:rep_complete_command
inoremap <expr> <C-Tab> pumvisible() ? "\<C-p>"  :  g:rep_complete_command
