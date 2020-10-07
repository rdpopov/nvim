let g:ccls_close_on_jump = v:true
let g:ccls_levels = 1
let g:ccls_float_width = 50
let g:ccls_float_height = 20

if executable('ccls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'ccls',
                \ 'cmd': {server_info->['ccls']},
                \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
                \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                \ })
endif

autocmd BufEnter *.c,*.cpp,*.h,*.cc nmap<leader> yd :CclsDerived<CR>
autocmd BufEnter *.c,*.cpp,*.h,*.cc nmap<leader> yh :CclsDerivedHierarchy<CR>
autocmd BufEnter *.c,*.cpp,*.h,*.cc nmap<leader> yr :CclsCallers<CR>
autocmd BufEnter *.c,*.cpp,*.h,*.cc nmap<leader> yt :CclsCallHierarchy<CR>

