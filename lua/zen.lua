local true_zen = require("true-zen")

true_zen.before_mode_ataraxis_on = function ()
    vim.g["ataraxis_on"] = 1;
end

true_zen.after_mode_ataraxis_on = function ()
    require("statusline").set_statusline()
end

true_zen.after_mode_ataraxis_off = function ()
    vim.g["ataraxis_on"] = 0
end


true_zen.setup({
    ui = {
        bottom = {
            laststatus = 2,
            ruler = false,
            showmode = false,
            showcmd = false,
            cmdheight = 1,
        },
        top = {
            showtabline = 0,
        },
        left = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
        },
    },
    modes = {
        ataraxis = {
            left_padding = 32,
            right_padding = 32,
            top_padding = 1,
            bottom_padding = 1,
            ideal_writing_area_width = {120,80},
            auto_padding = true,
            keep_default_fold_fillchars = true,
            custom_bg = {"none", ""},
            bg_configuration = true,
            quit = "untoggle",
            ignore_floating_windows = true,
            affected_higroups = {
                NonText = true,
                FoldColumn = true,
                ColorColumn = true,
                VertSplit = true,
                StatusLine = false,
                StatusLineNC = false,
                SignColumn = true,
            },
        },
        focus = {
            margin_of_error = 5,
            focus_method = "experimental"
        },
    },
    integrations = {
        vim_gitgutter = false,
        galaxyline = false,
        tmux = false,
        gitsigns = false,
        nvim_bufferline = false,
        limelight = false,
        twilight = true,
        vim_airline = false,
        vim_powerline = false,
        vim_signify = false,
        express_line = false,
        lualine = false,
        lightline = false,
        feline = false
    },
    misc = {
        on_off_commands = false,
        ui_elements_commands = false,
        cursor_by_mode = false,
    }
})


