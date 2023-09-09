let g:wiki_filetypes = ['md']
let g:wiki_link_extension = '.md'
let g:wiki_root = '~/wiki'
let g:lists_filetypes = ['md']

let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1

let g:wiki_export = {
			\ 'args' : "--highlight-style=zenburn --table-of-content -V fontsize=10pt -V colorlinks -V toccolor=NavyBlue -V linkcolor=red -V urlcolor=teal -V filecolor=magenta -s",
			\ 'from_format' : 'markdown',
			\ 'ext' : 'pdf',
			\ 'link_ext_replace': v:false,
			\ 'view' : v:false,
			\ 'output': fnamemodify(tempname(), ':h'),
			\}

nnoremap <Leader>WW <Plug>(wiki-index)
