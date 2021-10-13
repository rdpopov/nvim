
-- 'based'(stolen) from https://elianiva.my.id/post/neovim-lua-statusline

local fn = vim.fn
local api = vim.api

local M = {}

-- possible values are 'arrow' | 'rounded' | 'blank'
-- change them if you want to different separator
M.separators = {
  arrow = { '', '' },
  rounded = { '', '' },
  blank = { '', '' },
  triangle = {'' ,''},
  slice = {'' ,''},
}

local LspDiagn  = function(diagn)
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then 
      return vim.lsp.diagnostic.get_count(0, diagn)
  end
      return -1
end
local usr = "/home/"..vim.fn.expand("$USER")

local active_sep = 'arrow'
local space  = {" "," "}  -- space for the hints 
status_style = "fancy"
cpal = 'aurora'
local tver = vim.env.TMUX_VER or ""

if tver < '2.3' then 
  -- this is because aurora looks fucked on older tmux windows
  cpal = 'badwolf'
end
vim.cmd('colorscheme ' .. cpal)

ColorPalette = {
    ['ayu'] = 
    setmetatable({
      ['Blue']  = '#39BAE6',
      ['Red']  = '#FF3333',
      ['Yellow']  = '#E7C547',
      ['Orange']  = '#FF7733',
      ['Green']  = '#2BBB4F',
      ['Violet']  = '#A37ACC',
      ['Gray']  = '#14191F',
      ['Black']  = '#14191F',
      ['Name']  = '#0087af',
      ['Background']  = '#14191F',
      ['Warning'] = '#F29718',
      ['Error'] = '#FF3333',
      ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
   ['PaperColor'] = setmetatable({
      ['Blue']  = '#5fafd7',
      ['Red']  = '#df0000',
      ['Yellow']  = '#ffff00',
      ['Orange']  = '#FF7733',
      ['Green']  = '#2BBB4F',
      ['Violet']  = '#af87d7',
      ['Gray']  = '#14191F',
      ['Black']  = '#14191F',
      ['Background']  = '#1f1f1f',
      ['Name']  = '#00afaf',
      ['Warning'] = '#d75f00',
      ['Error'] = '#d70000',
      ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
   ['aurora'] = setmetatable({
      ['Blue']  = '#65b2ff',
      ['Red']  = '#F02E6E',
      ['Yellow']  = '#ffe6b3',
      ['Orange']  = '#FF7733',
      ['Green']  = '#62d196',
      ['Violet']  = '#d4bfff',
      ['Gray']  = '#14191F',
      ['Black']  = '#14191F',
      ['Background']  = '#1e1c31',
      ['Name']  = '#87DFEB',
      ['Warning'] = '#F2B482',
      ['Error'] = '#F02E6E',
      ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
   ['codedark'] = setmetatable({
      ['Blue']  = '#0A7ACA',
      ['Red']  = '#F44747',
      ['Yellow']  = '#FFAF00',
      ['Orange']  = '#CE9178',
      ['Green']  = '#4EC9B0',
      ['Violet']  = '#d4bfff',
      ['Gray']  = '#14191F',
      ['Black']  = '#14191F',
      ['Background']  = '#262626',
      ['Name']  = '#5CB6F8',
      ['Warning'] = '#FFAF00',
      ['Error'] = '#FB0101',
      ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
    ['moonlight'] = 
    setmetatable({
      ['Blue']  = '#04d1f9',
      ['Red']  = '#ff757f',
      ['Yellow']  = '#ffc777',
      ['Orange']  = '#f67f81',
      ['Green']  = '#2df4c0',
      ['Violet']  = '#b4a4f4',
      ['Gray']  = '#a1abe0',
      ['Black']  = '#14191F',
      ['Name']  = '#2df4c0',
      ['Background']  = '#414863',
      ['Warning'] = '#ffc777',
      ['Error'] = '#ff757f',
      ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
    ['gruvbox'] = 
    setmetatable({
      ['Blue']  = '#83a598',
      ['Red']  = '#ff757f',
      ['Yellow']  = '#fabd2f',
      ['Orange']  = '#fe8019',
      ['Green']  = '#b8bb26',
      ['Violet']  = '#d3869b',
      ['Gray']  = '#665c54',
      ['Black']  = '#14191F',
      ['Name']  = '#fbf1c7',
      ['Background']  = '#3c3836',
      ['Warning'] = '#fe8019',
      ['Error'] = '#fb4934',
      ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
    ['embark'] = 
    setmetatable({
      ['Blue']  = '#91ddff',
      ['Red']  = '#F02E6E',
      ['Yellow']  = '#ffe6b3',
      ['Orange']  = '#F2B482',
      ['Green']  = '#62d196',
      ['Violet']  = '#d4bfff',
      ['Gray']  = '#F48FB1',
      ['Black']  = '#14191F',
      ['Name']  = '#65b2ff',
      ['Background']  = '#2D2B40',
      ['Warning'] = '#F2B482',
      ['Error'] = '#F02E6E',
      ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
    ['badwolf'] = 
    setmetatable({
      ['Blue']  = '#0a9dff',
      ['Red']  = '#ff2c4b',
      ['Yellow']  = '#f4cf86',
      ['Orange']  = '#ffa724',
      ['Green']  = '#8cffba',
      ['Violet']  = '#ff9eb8',
      ['Gray']  = '#14191F',
      ['Black']  = '#14191F',
      ['Name']  = '#0a9dff',
      ['Background']  = '#35322d',
      ['Warning'] = '#ffa724',
      ['Error'] = '#ff2c4b',
      ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
}

--==============================================================================
--Highlights for basic stuff
--==============================================================================
-- highlight groups
M.colors = {
  active        = '%#StatusLineNC#',
  inactive      = '%#StatusLine#',
  simple_error  = '%#StatusLineSimpleError#',
  simple_warn   = '%#StatusLineSimpleWarning#',
  simple_hint   = '%#StatusLineSimpleHint#',
  mode          = '%#Mode#',
  mode_alt      = '%#ModeAlt#',
  git           = '%#Git#',
  git_alt       = '%#GitAlt#',
  filetype      = '%#Filetype#',
  filetype_alt  = '%#FiletypeAlt#',
  line_col      = '%#LineCol#',
  line_col_alt  = '%#LineColAlt#',
  lsp_error    =  '%#LspErr#',
  lsp_hint    =  '%#LspHint#',
  lsp_warn    =  '%#LspWarn#',
  ins_language  =  '%#InssLang#',
}

local set_hl = function(group, options)
  local bg = options.bg == nil and '' or 'guibg=' .. options.bg
  local fg = options.fg == nil and '' or 'guifg=' .. options.fg
  local gui = options.gui == nil and '' or 'gui=' .. options.gui

  vim.cmd(string.format('hi %s %s %s %s', group, bg, fg, gui))
end

-- you can of course pick whatever colour you want, I picked these colours
-- because I use Gruvbox and I like them
local highlights = {
  {'StatusLine',               { fg = ColorPalette[cpal].Background, bg = ColorPalette[cpal].Name }},
  {'StatusLineNC',             { fg = ColorPalette[cpal].Name, bg = ColorPalette[cpal].Background }},
  {'StatusLineSimpleError',    { fg = ColorPalette[cpal].Error, bg = ColorPalette[cpal].Background }},
  {'StatusLineSimpleWarning',  { fg = ColorPalette[cpal].Warning, bg = ColorPalette[cpal].Background }},
  {'StatusLineSimpleHint',     { fg = ColorPalette[cpal].Hint, bg = ColorPalette[cpal].Background }},
  {'Mode',                     { bg = ColorPalette[cpal].Green, fg = ColorPalette[cpal].Background, gui="bold" }},
  {'LineCol',                  { bg = '#928374', fg = ColorPalette[cpal].Background, gui="bold" }},
  {'Git',                      { bg = ColorPalette[cpal].Yellow, fg = ColorPalette[cpal].Background }},
  {'Filetype',                 { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Name }},
  {'Filename',                 { bg = ColorPalette[cpal].Background, fg = '#EBDBB2' }},
  {'ModeAlt',                  { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green }},
  {'GitAlt',                   { bg = '#3C3836', fg = '#504945' }},
  {'LineColAlt',               { bg = '#504945', fg = '#928374' }},
  {'FiletypeAlt',              { bg = '#3C3836', fg = '#504945' }},
  {'LineCol',                  { bg = '#3C3836', fg = '#504945' }},
  {'LineColAlt',               { bg = '#3C3836', fg = '#504945' }},
  {'LspErr',                   { bg = ColorPalette[cpal].Error, fg = ColorPalette[cpal].Background }},
  {'LspWarn',                  { bg = ColorPalette[cpal].Warning, fg = ColorPalette[cpal].Background }},
  {'LspHint',                  { bg = ColorPalette[cpal].Hint, fg = ColorPalette[cpal].Background }},
  {'InssLang',                 { bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Background }},
}

local set_hl_inv = function (group,options)
  local bg = options.bg == nil and '' or 'guibg=' .. options.bg
  local fg = options.fg == nil and '' or 'guifg=' .. options.fg
  local gui = options.gui == nil and '' or 'gui=' .. options.gui

  vim.cmd(string.format('hi %s %s %s %s', group, bg, fg, gui))
end
-- ============================================================================

for _, highlight in ipairs(highlights) do
  set_hl(highlight[1], highlight[2])
end

M.trunc_width = setmetatable({
  mode       = 80,
  git_status = 90,
  filename   = 60,
  explorer   = 15,
  line_col   = 60,
}, {
  __index = function()
      return 80
  end
})

M.is_truncated = function(_, width)
  local current_width = api.nvim_win_get_width(0)
  return current_width < width
end

-- Code table for modes

M.modes = setmetatable({
  ['n']  = {'Normal', 'N'};
  ['no'] = {'N·Pending', 'N·P'} ;
  ['v']  = {'Visual', 'V' };
  ['V']  = {'V·Line', 'V·L' };
  [''] = {'V·Block', 'V·B'}; -- this is not ^V, but it's , they're different
  ['s']  = {'Select', 'S'};
  ['S']  = {'S·Line', 'S·L'};
  [''] = {'S·Block', 'S·B'}; -- same with this one, it's not ^S but it's 
  ['i']  = {'Insert', 'I'};
  ['ic'] = {'Insert', 'I'};
  ['R']  = {'Replace', 'R'};
  ['Rv'] = {'V·Replace', 'V·R'};
  ['c']  = {'Command', 'C'};
  ['cv'] = {'Vim·Ex', 'V·E'};
  ['ce'] = {'Ex', 'E'};
  ['r']  = {'Prompt', 'P'};
  ['rm'] = {'More', 'M'};
  ['r?'] = {'Confirm', 'C'};
  ['!']  = {'Shell', 'S'};
  ['t']  = {'Terminal', 'T'};
}, {
  __index = function()
      return {'Unknown', 'U'} -- handle edge cases
  end
})

local mode_color_group = setmetatable({
  ['n']  = "NOR";
  ['no'] = "NOR";
  ['v']  = "VIS";
  ['V']  = "VIL";
  [''] = "VIB";
  ['s']  = "SEL";
  ['S']  = "SEL";
  [''] = "SEL"; 
  ['i']  = "INS";
  ['ic'] = "INS";
  ['R']  = "REP";
  ['Rv'] = "REP";
  ['c']  = "COM";
  ['cv'] = "EEX";
  ['ce'] = "EEX";
  ['r']  = "EEX";
  ['rm'] = "EEX";
  ['r?'] = "EEX";
  ['!']  = "COM";
  ['t']  = "COM";
}, {
  __index = function()
      return "UNK" 
  end
})

local to_hl_group = function(str)
    return  "%#".. str.. "#";
end

local color_table = {
  {"NOR" ,{ bg = ColorPalette[cpal].Green, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"VIS" ,{ bg = ColorPalette[cpal].Orange, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"VIL" ,{ bg = ColorPalette[cpal].Orange, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"VIB" ,{ bg = ColorPalette[cpal].Yellow, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"SEL" ,{ bg = ColorPalette[cpal].Yellow, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"INS" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"REP" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"COM" ,{ bg = ColorPalette[cpal].Yellow, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"EEX" ,{ bg = ColorPalette[cpal].Green, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"UNK" ,{ bg = ColorPalette[cpal].Yellow, fg = ColorPalette[cpal].Background, gui="bold" }},
}

local overlap = {
  -- mode - language overlap
  {"NORLang" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Green, gui="bold" }},
  {"VISLang" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Orange, gui="bold" }},
  {"VILLang" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Orange, gui="bold" }},
  {"VIBLang" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Yellow, gui="bold" }},
  {"SELLang" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Yellow, gui="bold" }},
  {"INSLang" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Blue, gui="bold" }},
  {"REPLang" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Blue, gui="bold" }},
  {"COMLang" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Yellow, gui="bold" }},
  {"EEXLang" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Green, gui="bold" }},
  {"UNKLang" ,{ bg = ColorPalette[cpal].Blue, fg = ColorPalette[cpal].Yellow, gui="bold" }},
  -- git - lang
  {"LangGit" ,{ bg = ColorPalette[cpal].Yellow, fg = ColorPalette[cpal].Blue, gui="bold" }},
  -- git - center
  {"GitCenter" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
  -- lang - center
  {"LangCenter" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
  -- for truncated use
  {"NORName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
  {"VISName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Orange, gui="bold" }},
  {"VILName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Orange, gui="bold" }},
  {"VIBName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
  {"SELName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
  {"INSName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
  {"REPName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
  {"COMName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
  {"EEXName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
  {"UNKName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},

  {"NORFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
  {"VISFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Orange, gui="bold" }},
  {"VILFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Orange, gui="bold" }},
  {"VIBFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
  {"SELFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
  {"INSFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
  {"REPFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
  {"COMFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
  {"EEXFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
  {"UNKFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},

  {"WarningFormat", { bg = ColorPalette[cpal].Warning, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"ErrorFormat"  , { bg = ColorPalette[cpal].Error, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"ErrorWarning" , { bg = ColorPalette[cpal].Warning, fg = ColorPalette[cpal].Error, gui="bold" }},
  {"HintFormat"   , { bg = ColorPalette[cpal].Hint, fg = ColorPalette[cpal].Background, gui="bold" }},
  {"ErrorHint"		, { bg = ColorPalette[cpal].Error, fg = ColorPalette[cpal].Hint, gui="bold" }},
  {"CenterWrning" , { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Warning, gui="bold" }},
  {"CenterError"  , { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Error, gui="bold" }},
}

for _, highlight in ipairs(color_table) do
  set_hl_inv(highlight[1], highlight[2])
end
for _, highlight in ipairs(overlap) do
  set_hl(highlight[1], highlight[2])
end

M.get_current_mode = function(self)
  local current_mode = api.nvim_get_mode().mode

  if self:is_truncated(self.trunc_width.mode) then
    return string.format(' %s ', self.modes[current_mode][2]):upper()
  end
  return string.format(' %s ', self.modes[current_mode][1]):upper()
end

M.get_git_status = function(self)
  local stat = vim.b.gitsigns_status
  local head = vim.b.gitsigns_head
  if stat and string.len(stat) > 0 then
    return " "..stat
  else
    if head and string.len(head) >0 then
      return " ".. head
    else
      return ""
    end
  end
end

local is_explorer = function()
  return vim.bo.filetype == 'netrw' or vim.bo.filetype == 'nerdtree' or vim.bo.filetype == 'nvimtree'
end

local win_fname_and_dir = function()
  local win__nr = vim.fn.winbufnr(vim.fn.winnr())
  return {vim.fn.getcwd(vim.fn.bufwinnr(win__nr)), vim.fn.bufname(win__nr)}
end

M.get_filename = function(self)
  local win_inf = win_fname_and_dir()
  local dir = string.gsub(win_inf[1],usr,"~")
  if win_inf[2] == "NetrwTreeListing" then 
    if string.len(dir) > self.trunc_width.explorer then 
      return " %<" .. vim.fn.pathshorten(dir)
    else
      return " %<" .. dir
    end
  end
  if self:is_truncated(self.trunc_width.filename) then 
    return " %<"..vim.fn.pathshorten(win_inf[2]) .. '%{&modified?" [+]":""}' 
  else
    return ' %< %f%{&modified?" [+]":""}'
  end
end

M.get_filetype = function()
  local file_name, file_ext = fn.expand("%:t"), fn.expand("%:e")
  local filetype = vim.bo.filetype

  if filetype == '' or is_explorer() then return '' end
  return string.format('%s', filetype):lower()
end

M.get_line_col = function(self)
  if self:is_truncated(self.trunc_width.line_col) then return ' %l:%c ' end
  return ' %l:%c '
end
M.get_Input_language = function()
  return " "..fn['GetInputLang']()
end


M.get_lang_git_name = function(self)
  local git = self:get_git_status()
  local colors = self.colors
  if self:is_truncated(self.trunc_width.mode) then
    return to_hl_group(mode_color_group[api.nvim_get_mode().mode]..'Name') .. self.separators[active_sep][1] .. colors.filetype .. self:get_filename()
  end 
  local lang = to_hl_group(mode_color_group[api.nvim_get_mode().mode]..'Lang').. self.separators[active_sep][1] .. colors.ins_language .. self:get_Input_language() .. space[1]
  if git == '' then
    return  lang ..  to_hl_group('LangCenter') .. self.separators[active_sep][1] .. colors.filetype .. self:get_filename()
  end
    return  lang ..  to_hl_group('LangGit') .. self.separators[active_sep][1] .. colors.git .. git.. space[1] .. to_hl_group('GitCenter') .. self.separators[active_sep][1].. colors.filetype.." ".. self:get_filename()
end

M.get_format_lsp_diagn = function(self,nof)
  local errs = LspDiagn([[Error]])
  local warn = LspDiagn([[Warning]])
  local hint = LspDiagn([[Hint]])
  local colors = self.colors
  local ft = self:get_filetype()
  ft = self:get_filetype()

  if self:is_truncated(self.trunc_width.mode)then 
    return colors.filetype .. ft 
  end 

  if errs == -1 and  warn == -1 then
    return colors.filetype .. space[1] .. ft .. space[2]
  end

	return	to_hl_group('CenterWrning') .. self.separators[active_sep][2] ..
					colors.lsp_warn .. space[1] .. "W:" ..  warn .. space [2]..
					to_hl_group('ErrorWarning').. self.separators[active_sep][2] ..
					colors.lsp_error .. space[1] .. "E:" .. errs .. space[2]..
					to_hl_group('ErrorHint')..  self.separators[active_sep][2] ..
					colors.lsp_hint .. space[1] .."H:" .. hint .. space[2] ..
					to_hl_group('HintFormat')..  self.separators[active_sep][2] ..
					colors.filetype .. space[1].. ft .. space[2]
end

M.simple_lsp = function(self)
  local errs = LspDiagn([[Error]])
  local warn = LspDiagn([[Warning]])
  local hint = LspDiagn([[Hint]])
  local colors = self.colors

  if errs == -1 and  warn == -1 then
    return ""
  else
    return colors.simple_error.." E:" .. errs .. colors.simple_warn .. " W:"..warn .. colors.simple_hint .. " H:"..hint .." " --.. colors.filename
  end
end

M.fancy_line = function(self )
  local colors = self.colors
  --mode
  local mode = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) .. '['..self:get_current_mode()..']'
  --filename 
  local filename = colors.filetype .. self:get_filename()
  local filetype_alt = colors.filetype_alt .. self.separators[active_sep][1]
  --filename 
  local filetype = colors.filetype .. self:get_filetype()
  local line_col = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) .. self:get_line_col()
  local line_col_alt = to_hl_group(mode_color_group[api.nvim_get_mode().mode]..'FFormat') .. self.separators[active_sep][2]
  local res = ""

  if is_explorer()then
    return table.concat({
    		colors.active,
        "%=",
        filename,
        "%=",
      })
  else
    return table.concat({
        colors.active, 
        mode,
        self:get_lang_git_name(), 
        "%=",
        self:get_format_lsp_diagn(),
        line_col_alt,
        line_col
      })
  end
end

M.simple_line  = function(self)
  local colors = self.colors
  --mode
  local mode = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) .. '['..self:get_current_mode()..']'
  --filename 
  local filename = colors.filetype .. self:get_filename()
  local filetype_alt = colors.filetype_alt .. self.separators[active_sep][1]
  --filename 
  local filetype = colors.filetype .. self:get_filetype()
  local line_col = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) .. self:get_line_col()
  local line_col_alt = to_hl_group(mode_color_group[api.nvim_get_mode().mode]..'FFormat') .. self.separators[active_sep][2]
  local ft = ""
  if not is_explorer()  then
    ft = '%y '
  end
  if is_explorer()then
    return table.concat({
    		colors.active,
        "%=",
        filename,
        "%=",
      })
  else
    return table.concat({
        colors.active,
        mode,
        colors.filetype,
        "%=",
        filename,
        self:simple_lsp(),
        "%=",
        colors.active,
        ft,
        line_col,
      })
  end
end

local style_callback  = setmetatable({
    ['minimal'] = M.simple_line,
    ['fancy'] = M.fancy_line,
  },{ __index = M.simple_line})

M.set_active = function(self)
  return style_callback[status_style](self)
end

M.set_inactive = function(self)
  return self.colors.inactive .. '%= %{expand("%:p:h")[:len("/home/".$USER)] == "/home/".$USER."/" ? "~"..expand("%:p:h")[len("/home/".$USER):]:expand("%:p:h")}%{&ft!="netrw"?"/".expand("%:t"):""} %{&modified? "[+]":""}'.. ' %='
end

M.set_explorer = function(self)
  local title = self.colors.mode .. '   '
  local title_alt = self.colors.mode_alt .. self.separators[active_sep][2]

  return table.concat({ self.colors.active, title, title_alt })
end

Statusline = setmetatable(M, {
  __call = function(statusline, mode)
    if mode == "active" then return statusline:set_active() end
    if mode == "inactive" then return statusline:set_inactive() end
    if mode == "explorer" then return statusline:set_explorer() end
  end
})

-- set statusline
-- TODO: replace this once we can define autocmd using lua
api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
  augroup END
]], false)

--Special_Highlights
local custom_highlight = function(group_name,syntax_regex,color )
  vim.cmd(string.format('highlight %s gui=bold term=bold cterm=bold guifg=%s cterm=bold', group_name, color))
  vim.cmd(string.format('syntax match %s  %s', group_name, syntax_regex))
end
custom_highlight("cTodo",'\'\\(TODO \\|Todo \\)\'',ColorPalette[cpal].Green)
custom_highlight("cFix",'\'\\(FIX \\|Fix \\)\'',ColorPalette[cpal].Yellow)
custom_highlight("cBug",'\'\\(BUG \\|Bug \\)\'',ColorPalette[cpal].Red)
custom_highlight("cHack",'\'\\(HACK \\|Hack \\)\'',ColorPalette[cpal].Violet)
custom_highlight("cWarn",'\'\\(WARN \\|Warn \\)\'',ColorPalette[cpal].Orange)
custom_highlight("cNote",'\'\\(NOTE \\|Note \\)\'',ColorPalette[cpal].Blue)
require("todo-comments").setup{
  signs = false,
  keywords = {
    FIX = { icon = " ",  color = ColorPalette[cpal].Red, alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },},
    TODO = { icon = " ", color = ColorPalette[cpal].Orange },
    HACK = { icon = " ", color = ColorPalette[cpal].Violet },
    WARN = { icon = " ", color = ColorPalette[cpal].Yellow, alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", color = ColorPalette[cpal].Blue, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = ColorPalette[cpal].Green, alt = { "INFO" } },
  },
}


