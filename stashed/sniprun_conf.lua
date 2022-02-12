require'sniprun'.setup({
  selected_interpreters = {},     --# use those instead of the default for the current filetype
  repl_enable = {},               --# enable REPL-like behavior for the given interpreters
  repl_disable = {},              --# disable REPL-like behavior for the given interpreters
  display = {
      "Terminal",                --# display results in a vertical split
      "TerminalWithCode",        --# display results and code history in a vertical split
  },
  display_options = {
    terminal_width = 50,       --# change the terminal display option width
    notification_timeout = 5   --# timeout for nvim_notify output
  },
  show_no_output = {
    "Classic",
  },
  snipruncolors = {
    SniprunVirtualTextOk   =  {bg="#66eeff",fg="#000000",ctermbg="Cyan",cterfg="Black"},
    SniprunFloatingWinOk   =  {fg="#66eeff",ctermfg="Cyan"},
    SniprunVirtualTextErr  =  {bg="#881515",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
    SniprunFloatingWinErr  =  {fg="#881515",ctermfg="DarkRed"},
  },
  inline_messages = 0,             --# inline_message (0/1) is a one-line way to display messages
  borders = 'single'               --# display borders around floating windows
})
