--require'navigator'.setup{
    --default_mapping = false,
    --lsp = {
    --  format_on_save = false};
--}
local saga = require 'lspsaga'
saga.init_lsp_saga {
    error_sign = 'E:',
    warn_sign = 'W:',
    hint_sign = 'H:',
    infor_sign = 'I:',
    dianostic_header_icon = 'Dign:',
    code_action_icon = 'CA',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_definition_icon = 'Def:',
    finder_reference_icon = 'Refs:',
    max_preview_lines = 30,
    definition_preview_icon = 'Def',
    border_style='none',
    finder_action_keys = {
        open = '<CR>', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>'
    },
}

