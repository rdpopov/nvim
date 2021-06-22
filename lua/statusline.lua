
-- 'based'(stolen) from https://elianiva.my.id/post/neovim-lua-statusline

local fn = vim.fn
local api = vim.api

local M = {}

-- possible values are 'arrow' | 'rounded' | 'blank'
local active_sep = 'triangle'

-- change them if you want to different separator
M.separators = {
  arrow = { '', '' },
  rounded = { '', '' },
  blank = { '', '' },
  triangle = {'' ,''},
}

--==============================================================================
--Highlights for basic stuff
--==============================================================================
-- highlight groups
M.colors = {
  active        = '%#StatusLine#',
  inactive      = '%#StatuslineNC#',
  mode          = '%#Mode#',
  mode_alt      = '%#ModeAlt#',
  git           = '%#Git#',
  git_alt       = '%#GitAlt#',
  filetype      = '%#Filetype#',
  filetype_alt  = '%#FiletypeAlt#',
  line_col      = '%#LineCol#',
  line_col_alt  = '%#LineColAlt#',
  lsp_error		=	'%#LspErr#',
  lsp_warn		=	'%#LspWarn#',
  ins_language	=	'%#InssLang#',
  -- git changes
  -- language
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
  {'StatusLine',    { fg = '#14191F', bg = '#FF7733' }},
  {'StatusLineNC',  { fg = '#FF7733', bg = '#14191F' }},
  {'Mode',          { bg = '#2BBB4F', fg = '#14191F', gui="bold" }},
  {'LineCol',       { bg = '#928374', fg = '#14191F', gui="bold" }},
  {'Git',           { bg = '#E7C547', fg = '#14191F' }},
  {'Filetype',      { bg = '#14191F', fg = '#E7C547' }},
  {'Filename',      { bg = '#14191F', fg = '#EBDBB2' }},
  {'ModeAlt',       { bg = '#14191F', fg = '#2BBB4F' }},
  {'GitAlt',        { bg = '#3C3836', fg = '#504945' }},
  {'LineColAlt',    { bg = '#504945', fg = '#928374' }},
  {'FiletypeAlt',   { bg = '#3C3836', fg = '#504945' }},
  {'LineCol',		{ bg = '#3C3836', fg = '#504945' }},
  {'LineColAlt',	{ bg = '#3C3836', fg = '#504945' }},
  {'LspErr',		{ bg = '#FF3333', fg = '#14191F' }},
  {'LspWarn',       { bg = '#F29718', fg = '#14191F' }},
  {'InssLang',       { bg = '#39BAE6', fg = '#14191F' }},
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
  filename   = 140,
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
  ['cv'] = {'Vim·Ex ', 'V·E'};
  ['ce'] = {'Ex ', 'E'};
  ['r']  = {'Prompt ', 'P'};
  ['rm'] = {'More ', 'M'};
  ['r?'] = {'Confirm ', 'C'};
  ['!']  = {'Shell ', 'S'};
  ['t']  = {'Terminal ', 'T'};
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
  {"NOR" ,{ bg = '#2BBB4F', fg = '#14191F', gui="bold" }},
  {"VIS" ,{ bg = '#FF8F40', fg = '#14191F', gui="bold" }},
  {"VIL" ,{ bg = '#FF8F40', fg = '#14191F', gui="bold" }},
  {"VIB" ,{ bg = '#A37ACC', fg = '#14191F', gui="bold" }},
  {"SEL" ,{ bg = '#E6B450', fg = '#14191F', gui="bold" }},
  {"INS" ,{ bg = '#39BAE6', fg = '#14191F', gui="bold" }},
  {"REP" ,{ bg = '#39BAE6', fg = '#14191F', gui="bold" }},
  {"COM" ,{ bg = '#E6B450', fg = '#14191F', gui="bold" }},
  {"EEX" ,{ bg = '#2BBB4F', fg = '#14191F', gui="bold" }},
  {"UNK" ,{ bg = '#A37ACC', fg = '#14191F', gui="bold" }},
}

local overlap = {
  -- mode - language overlap
  {"NORLang" ,{ bg = '#39BAE6', fg = '#2BBB4F', gui="bold" }},
  {"VISLang" ,{ bg = '#39BAE6', fg = '#FF8F40', gui="bold" }},
  {"VILLang" ,{ bg = '#39BAE6', fg = '#FF8F40', gui="bold" }},
  {"VIBLang" ,{ bg = '#39BAE6', fg = '#A37ACC', gui="bold" }},
  {"SELLang" ,{ bg = '#39BAE6', fg = '#E6B450', gui="bold" }},
  {"INSLang" ,{ bg = '#39BAE6', fg = '#39BAE6', gui="bold" }},
  {"REPLang" ,{ bg = '#39BAE6', fg = '#39BAE6', gui="bold" }},
  {"COMLang" ,{ bg = '#39BAE6', fg = '#E6B450', gui="bold" }},
  {"EEXLang" ,{ bg = '#39BAE6', fg = '#2BBB4F', gui="bold" }},
  {"UNKLang" ,{ bg = '#39BAE6', fg = '#A37ACC', gui="bold" }},
  -- git - lang
  {"LangGit" ,{ bg = '#E7C547', fg = '#39BAE6', gui="bold" }},
  -- git - center
  {"GitCenter" ,{ bg = '#14191F', fg = '#E7C547', gui="bold" }},
  -- lang - center
  {"LangCenter" ,{ bg = '#14191F', fg = '#39BAE6', gui="bold" }},
  -- for truncated use
  {"NORName" ,{ bg = '#E7C547', fg = '#2BBB4F', gui="bold" }},
  {"VISName" ,{ bg = '#E7C547', fg = '#FF8F40', gui="bold" }},
  {"VILName" ,{ bg = '#E7C547', fg = '#FF8F40', gui="bold" }},
  {"VIBName" ,{ bg = '#E7C547', fg = '#A37ACC', gui="bold" }},
  {"SELName" ,{ bg = '#E7C547', fg = '#E6B450', gui="bold" }},
  {"INSName" ,{ bg = '#E7C547', fg = '#39BAE6', gui="bold" }},
  {"REPName" ,{ bg = '#E7C547', fg = '#39BAE6', gui="bold" }},
  {"COMName" ,{ bg = '#E7C547', fg = '#E6B450', gui="bold" }},
  {"EEXName" ,{ bg = '#E7C547', fg = '#2BBB4F', gui="bold" }},
  {"UNKName" ,{ bg = '#E7C547', fg = '#A37ACC', gui="bold" }},

  {"NORFFormat" ,{ bg = '#14191F', fg = '#2BBB4F', gui="bold" }},
  {"VISFFormat" ,{ bg = '#14191F', fg = '#FF8F40', gui="bold" }},
  {"VILFFormat" ,{ bg = '#14191F', fg = '#FF8F40', gui="bold" }},
  {"VIBFFormat" ,{ bg = '#14191F', fg = '#A37ACC', gui="bold" }},
  {"SELFFormat" ,{ bg = '#14191F', fg = '#E6B450', gui="bold" }},
  {"INSFFormat" ,{ bg = '#14191F', fg = '#39BAE6', gui="bold" }},
  {"REPFFormat" ,{ bg = '#14191F', fg = '#39BAE6', gui="bold" }},
  {"COMFFormat" ,{ bg = '#14191F', fg = '#E6B450', gui="bold" }},
  {"EEXFFormat" ,{ bg = '#14191F', fg = '#2BBB4F', gui="bold" }},
  {"UNKFFormat" ,{ bg = '#14191F', fg = '#A37ACC', gui="bold" }},

  {"WarningFormat", { bg = '#F29718', fg = '#14191F', gui="bold" }},
  {"ErrorFormat"  , { bg = '#FF3333', fg = '#14191F', gui="bold" }},
  {"ErrorWarning" , { bg = '#F29718', fg = '#FF3333', gui="bold" }},
  {"CenterWrning" , { bg = '#14191F', fg = '#F29718', gui="bold" }},
  {"CenterError"  , { bg = '#14191F', fg = '#FF3333', gui="bold" }},
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
  return " "..fn['GitStatus']().." "
end

M.get_filename = function(self)
  if self:is_truncated(self.trunc_width.filename) then return " %<%f " .. fn['Modified']() end
  return " %<%F " .. fn['Modified']()
end

M.get_filetype = function()
  local file_name, file_ext = fn.expand("%:t"), fn.expand("%:e")
  local filetype = vim.bo.filetype

  if filetype == '' then return '' end
  return string.format('  %s ', filetype):lower()
end

M.get_line_col = function(self)
  if self:is_truncated(self.trunc_width.line_col) then return ' %l:%c ' end
  return ' Ln:%l Co:%c '
end
M.get_Input_language = function()
  return " "..fn['GetInputLang']().." "
end


M.get_lang_git_name = function(self)
  local git = self:get_git_status()
  local colors = self.colors
  if self:is_truncated(self.trunc_width.mode)then 

    return to_hl_group(mode_color_group[api.nvim_get_mode().mode]..'Name') .. self.separators[active_sep][1].. colors.filetype .. self:get_filename()
  end 
  local lang = to_hl_group(mode_color_group[api.nvim_get_mode().mode]..'Lang').. self.separators[active_sep][1] .. colors.ins_language .. self:get_Input_language()
  if git == '' then
    return  lang ..  to_hl_group('LangCenter') .. self.separators[active_sep][1] .. colors.filetype .. self:get_filename()
  end
    return  lang ..  to_hl_group('LangGit') .. self.separators[active_sep][1] .. colors.git .. git .. to_hl_group('GitCenter') .. self.separators[active_sep][1].. colors.filetype.." ".. self:get_filename()
end

M.get_format_lsp_diagn = function(self)
   local errs = fn['LspError']()
   local warn = fn['LspWarn']()
  local git = self:get_git_status()
  local colors = self.colors

  if self:is_truncated(self.trunc_width.mode)then 
    return colors.filetype .. self:get_filetype() 
  end 

  if errs == '' and  warn == '' then 
    return colors.filetype .. self:get_filetype() 
  end

  if errs  and  warn == '' then 
    return to_hl_group('CenterError') .. self.separators[active_sep][2] .. colors.lsp_error .. " E: ".. errs.. to_hl_group('ErrorFormat').. self.separators[active_sep][2] ..  colors.filetype .. self:get_filetype() 
  end

  if errs == '' and  warn  then 
    return to_hl_group('WarningFormat') .. self.separators[active_sep][2] .. colors.lsp_warn  .. " W: "..  warn .. to_hl_group('ErrorFormat').. self.separators[active_sep][2] ..  colors.filetype .. self:get_filetype() 
  end

  if errs  and  warn then 
    return to_hl_group('CenterWrning') .. self.separators[active_sep][2] ..
            colors.lsp_warn  .. " W:" ..  warn ..
            to_hl_group('ErrorWarning').. self.separators[active_sep][2] ..
            colors.lsp_error .. " E:" .. errs ..
            to_hl_group('ErrorFormat')..  self.separators[active_sep][2] ..
            colors.filetype .. self:get_filetype()
  end
  return "err"
end

M.set_active = function(self)
  local colors = self.colors
  --mode
  local mode = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) .. self:get_current_mode()
  --filename 
  local filename = colors.inactive .. self:get_filename()
  local filetype_alt = colors.filetype_alt .. self.separators[active_sep][1]
  --filename 
  local filetype = colors.filetype .. self:get_filetype()
  local line_col = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) .. self:get_line_col()
  local line_col_alt = to_hl_group(mode_color_group[api.nvim_get_mode().mode]..'FFormat') .. self.separators[active_sep][2]
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

M.set_inactive = function(self)
  return self.colors.inactive .. '%= %F ' .. fn['Modified']().. ' %='
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
  au WinEnter,BufEnter FileType netrw setlocal statusline=%!v:lua.Statusline('explorer')
  augroup END
]], false)
