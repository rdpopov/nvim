let g:ale_disable_lsp = 0
let g:ale_hover_to_preview =1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
            \   'nim': ['nimlsp', 'nimcheck'],
            \   'python': ['pyls'],
            \   'c':['ccls'],
            \   'go':['gopls']
            \}
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = '✖✖'
let g:ale_sign_warning = '⚠⚠'

highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yellow

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
                \   '%dW %dE',
                \   all_non_errors,
                \   all_errors
                \)
endfunction
set statusline=%{LinterStatus()}
