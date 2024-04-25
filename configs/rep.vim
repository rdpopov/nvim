let g:current_completion = ""
au CompleteChanged * let current_completion = complete_info()['mode']
let to_feed = {
    "" : "<C-N>",
    "keyword" : "<C-X><C-N>",
    "ctrl_x" : "",
    "scroll" : "<C-X><C-s>",
    "whole_line" : "<C-X><C-L>",
    "files" : "<C-X><C-F>",
    "tags" : "<C-X><C-]>",
    "path_defines" : "<C-X><C-D>",,
    "path_patterns" : "<C-X><C-D>",,,
    "dictionary" : "<C-N>",
    "thesaurus" : "<C-N>",
    "cmdline" : "<C-N>",
    "function" : "<C-N>",
    "omni" : "<C-N>",
    "spell" : "<C-N>",
    "eval" : "<C-N>",
    "unknown" : "<C-N>",
    }
