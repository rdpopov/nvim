 
-- 'based'(stolen) from https://elianiva.my.id/post/neovim-lua-statusline

local fn = vim.fn
local api = vim.api

local M = {}

vim.g["ataraxis_on"] = 0
-- possible values are 'arrow' | 'rounded' | 'blank'
-- change them if you want to different separator
LspDiagn  = function(diagn)
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then 
      return #vim.diagnostic.get(0,{severity = vim.diagnostic.severity[diagn]})
  end
      return -1
end
local usr = "/home/"..vim.fn.expand("$USER")


blend_in = false
use_preset = "samurai"

M.separators = {
  arrow = { '', '' },
  rounded = { '', '' },
  blank = { '', '' },
  triangle = {'◣' ,'◢'},
  slice = {'◣' ,'◥'},
  simple_slice = {'\\' ,'\\'},
  ang = {'⧽' ,'⧼'},
  half_box = {'▌' ,'▐'},
}

active_sep = 'arrow'
space  = {" "," "}  -- space for the hints 
status_style = "simple"
inverted_colors = false
clean_status = false
tab_sel = M.separators.arrow
tab_nosel = M.separators.ang

presets = {
    max = { sep = 'arrow', space = {' ',' '}, style = 'fancy', inverted = false, clean = true , tab_sel = M.separators.arrow, tab_nosel = M.separators.ang },
    ball = { sep = 'rounded', space = {' ',' '}, style = 'fancy', inverted = false, clean = true , tab_sel = M.separators.rounded, tab_nosel = M.separators.blank },
    compact = { sep = 'half_box', space = {'',''}, style = 'fancy', inverted = false, clean = false, tab_sel = M.separators.half_box, tab_nosel = M.separators.half_box },
    barebones = { sep = 'blank', space = {' ',' '}, style = 'minimal', inverted = true, clean = false, tab_sel = M.separators.blank, tab_nosel = M.separators.blank },
    airlineish = { sep = 'arrow', space = {' ',' '}, style = 'fancy', inverted = false, clean = false, tab_sel = M.separators.arrow, tab_nosel = M.separators.ang },
    slantlineish = { sep = 'triangle', space = {' ',' '}, style = 'fancy', inverted = false, clean = true, tab_sel = {'◣' ,'◢'}, tab_nosel = M.separators.triangle_slice },
    samurai = { sep = 'slice', space = {' ',' '}, style = 'fancy', inverted = false, clean = true, tab_sel = M.separators.slice, tab_nosel = M.separators.simple_slice},
    budget_samurai = { sep = 'simple_slice', space = {' ',' '}, style = 'fancy', inverted = true, clean = true, tab_sel = M.separators.simple_slice, tab_nosel = M.separators.simple_slice },
    sleek = { sep = 'ang', space = {' ',' '}, style = 'fancy', inverted = true, clean = false, tab_sel = M.separators.ang, tab_nosel = M.separators.ang },
    basic_luxe = { sep = 'blank', space = {' ',' '}, style = 'fancy', inverted = false, clean = false, tab_sel = M.separators.blank, tab_nosel = M.separators.blank },
    alt_max = { sep = 'ang', space = {' ',' '}, style = 'fancy', inverted = true, clean = true, tab_sel = M.separators.ang, tab_nosel = M.separators.ang },
    simple = { sep = 'blank', space = {' ',' '}, style = 'minimal', inverted = false, clean = false, tab_sel = M.separators.blank, tab_nosel = M.separators.blank },
    ghost = { sep = 'blank', space = {'',''}, style = 'minimal', inverted = true, clean = false, tab_sel = M.separators.blank, tab_nosel = M.separators.blank },
}

if use_preset then
    active_sep = presets[use_preset].sep 
    space  = presets[use_preset].space
    status_style = presets[use_preset].style 
    inverted_colors = presets[use_preset].inverted
    clean_status = presets[use_preset].clean
    tab_sel = presets[use_preset].tab_sel
    tab_nosel = presets[use_preset].tab_nosel
end


local tver = vim.env.TMUX_VER or ""

cpal = vim.api.nvim_get_var('colors_name')

if tver < '2.3' and tver ~= "" then 
  cpal = 'badwolf'
end

ColorPalette = {
    ['ayu'] = setmetatable({
        ['Blue']  = '#39BAE6',
        ['Red']  = '#FF3333',
        ['Yellow']  = '#E7C547',
        ['Orange']  = '#FF7733',
        ['Green']  = '#2BBB4F',
        ['Violet']  = '#A37ACC',
        ['Gray']  = '#3E4B59',
        ['Black']  = '#0F1419',
        ['Name']  = '#0087af',
        ['Background']  = '#14191F',
        ['Warning'] = '#F29718',
        ['Error'] = '#FF3333',
        ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
    ['cat'] = setmetatable({
        ['Blue']  = '#96CDFB',
        ['Red']  = '#F28FAD',
        ['Yellow']  = '#FAE3B0',
        ['Orange']  = '#F8BD96',
        ['Green']  = '#ABE9B3',
        ['Violet']  = '#C9CBFF',
        ['Gray']  = '#575268',
        ['Black']  = '#1E1E2E',
        ['Name']  = '#96CDFB',
        ['Background']  = '#302D41',
        ['Warning'] = '#F8BD96',
        ['Error'] = '#F28FAD',
        ['Hint'] = '#D9E0EE',
    }, { __index = function() return '#FFFFFF' end }),
    ['aurora'] = setmetatable({
        ['Blue']  = '#65b2ff',
        ['Red']  = '#F02E6E',
        ['Yellow']  = '#ffe6b3',
        ['Orange']  = '#FF7733',
        ['Green']  = '#62d196',
        ['Violet']  = '#d4bfff',
        ['Gray']  = '#3a3a47',
        ['Black']  = '#1b1b24',
        ['Background']  = '#1e1c31',
        ['Name']  = '#87DFEB',
        ['Warning'] = '#ffe6b3',
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
        ['Gray']  = '#444444',
        ['Black']  = '#1E1E1E',
        ['Background']  = '#262626',
        ['Name']  = '#5CB6F8',
        ['Warning'] = '#FFAF00',
        ['Error'] = '#FB0101',
        ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
    ['uwu'] = setmetatable({
        ['Blue']		= '#6CBAD1',
        ['Red']			= '#ff6565',
        ['Yellow']  = '#e59e67',
        ['Orange']  = '#c26f6f',
        ['Green']		= '#8dc776',
        ['Violet']  = '#bb8fe5',
        ['Gray']		= '#444444',
        ['Black']		= '#131A1C',
        ['Background']  = '#2f3638',
        ['Name']		= '#6CBAD1',
        ['Warning']	= '#e59e67',
        ['Error']		= '#ff6565',
        ['Hint']		= '#CCCCCC',
    }, { __index = function() return '#FFFFFF' end }),
    ['base16-gruvbox-dark-hard'] = setmetatable({
        ['Blue']  = '#83a598',
        ['Red']  = '#ff757f',
        ['Yellow']  = '#fabd2f',
        ['Orange']  = '#fe8019',
        ['Green']  = '#b8bb26',
        ['Violet']  = '#d3869b',
        ['Gray']  = '#504945',
        ['Black']  = '#1d2021',
        ['Name']  = '#fbf1c7',
        ['Background']  = '#3c3836',
        ['Warning'] = '#fe8019',
        ['Error'] = '#fb4934',
        ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
    ['embark'] = setmetatable({
        ['Blue']  = '#91ddff',
        ['Red']  = '#F02E6E',
        ['Yellow']  = '#ffe6b3',
        ['Orange']  = '#F2B482',
        ['Green']  = '#62d196',
        ['Violet']  = '#d4bfff',
        ['Gray']  = '#3E3859',
        ['Black']  = '#1e1c31',
        ['Name']  = '#65b2ff',
        ['Background']  = '#2D2B40',
        ['Warning'] = '#F2B482',
        ['Error'] = '#F02E6E',
        ['Hint'] = '#FFFFFF',
    }, { __index = function() return '#FFFFFF' end }),
    ['nightfox'] = setmetatable({
        ['Blue']  = '#84cee4',
        ['Red']  = '#d6616b',
        ['Yellow']  = '#ffe37e',
        ['Orange']  = '#f4a261',
        ['Green']  = '#58cd8b',
        ['Violet']  = '#b8a1e3',
        ['Gray']  = '#3b4261',
        ['Black']  = '#192330',
        ['Name']  = '#63cdcf',
        ['Background']  = '#333047',
        ['Warning'] = '#f6a878',
        ['Error'] = '#c94f6d',
        ['Hint'] = '#dfdfe0',
    }, { __index = function() return '#FFFFFF' end }),
    ['duskfox'] = setmetatable({
        ['Blue']  = '#5FABC7',
        ['Red']  = '#EF7C9D',
        ['Yellow']  = '#F8C886',
        ['Orange']  = '#EDA19E',
        ['Green']  = '#AECB93',
        ['Violet']  = '#C8AEEB',
        ['Gray']  = '#555169',
        ['Black']  = '#232136',
        ['Name']  = '#A3D6DF',
        ['Background']  = '#393552',
        ['Warning'] = '#EDA19E',
        ['Error'] = '#EF7C9D',
        ['Hint'] = '#E1DFF6',
    }, { __index = function() return '#FFFFFF' end }),
    ['dayfox'] = setmetatable({
        ['Blue']  = '#2D81A3',
        ['Red']  = '#C26D85',
        ['Yellow']  = '#EEA846',
        ['Orange']  = '#DE8C88',
        ['Green']  = '#618774',
        ['Violet']  = '#5F5695',
        ['Gray']  = '#1D344F',
        ['Black']  = '#EAEAEA',
        ['Name']  = '#5CA7B4',
        ['Background']  = '#CFD6DD',
        ['Warning'] = '#DE8C88',
        ['Error'] = '#C26D85',
        ['Hint'] = '#9A80B9',
    }, { __index = function() return '#FFFFFF' end }),
    ['dark'] = setmetatable({
        ['Blue']  = 'SlateBlue',
        ['Red']  = 'Red',
        ['Yellow']  = 'Yellow',
        ['Orange']  = 'Orange',
        ['Green']  = 'LightGreen',
        ['Violet']  = 'LightMagenta',
        ['Gray']  = 'DarkGrey',
        ['Black']  = 'Black',
        ['Name']  = 'LightBlue',
        ['Background']  = 'Black',
        ['Warning'] = 'Orange',
        ['Error'] = 'Red',
        ['Hint'] = 'LightYellow',
    }, { __index = function() return '#FFFFFF' end }),
    ['srcery'] = setmetatable({
        ['Blue']  = '#68A8E4',
        ['Red']  = '#F75341',
        ['Yellow']  = '#FED06E',
        ['Orange']  = '#FF8700',
        ['Green']  = '#98BC37',
        ['Violet']  = '#FF5C8F',
        ['Gray']  = '#3A3A3A',
        ['Black']  = '#1C1B19',
        ['Name']  = '#68A8E4',
        ['Background']  = '#303030',
        ['Warning'] = '#FED06E',
        ['Error'] = '#F75341',
        ['Hint'] = '#FCE8C3',
    }, { __index = function() return '#FFFFFF' end }),
}

old_background = nil
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
  scope         = '%#Scope#',
  git_alt       = '%#GitAlt#',
  filetype      = '%#Filetype#',
  filetype_alt  = '%#FiletypeAlt#',
  line_col      = '%#LineCol#',
  line_col_alt  = '%#LineColAlt#',
  lsp_error     = '%#LspErr#',
  lsp_hint      = '%#LspHint#',
  lsp_warn      = '%#LspWarn#',
  ins_language  = '%#InssLang#',
  tab_bg        = '%#TabLineFill#',
  tab_selected  = '%#TabLineSel#',
  tab_selected_inv  = '%#TabLineSelInv#',
  tab_noselect  = '%#TabLine#',
}


-- you can of course pick whatever colour you want, I picked these colours
-- because I use Gruvbox and I like them
local gen_highlights = function()
    if inverted_colors then
        return  {
            {'StatusLine',               { fg = ColorPalette[cpal].Name, bg = ColorPalette[cpal].Background }},
            {'StatusLineNC',             { fg = ColorPalette[cpal].Background, bg = ColorPalette[cpal].Background }},
            {'StatusLineSimpleError',    { fg = ColorPalette[cpal].Error, bg = ColorPalette[cpal].Background }},
            {'StatusLineSimpleWarning',  { fg = ColorPalette[cpal].Warning, bg = ColorPalette[cpal].Background }},
            {'StatusLineSimpleHint',     { fg = ColorPalette[cpal].Hint, bg = ColorPalette[cpal].Background }},
            {'Mode',                     { bg = ColorPalette[cpal].Green, fg = ColorPalette[cpal].Background, gui="bold" }},
            {'LineCol',                  { bg = '#928374', fg = ColorPalette[cpal].Background, gui="bold" }},
            {'Git',                      { bg = ColorPalette[cpal].Background ,fg = ColorPalette[cpal].Yellow }},
            {'Scope',                    { bg = ColorPalette[cpal].Background ,fg = ColorPalette[cpal].Red }},
            {'Filetype',                 { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Name }},
            {'Filename',                 { bg = ColorPalette[cpal].Background, fg = '#EBDBB2' }},
            {'ModeAlt',                  { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green }},
            {'GitAlt',                   { bg = '#3C3836', fg = '#504945' }},
            {'LineColAlt',               { bg = '#504945', fg = '#928374' }},
            {'FiletypeAlt',              { bg = '#3C3836', fg = '#504945' }},
            {'LineCol',                  { bg = '#3C3836', fg = '#504945' }},
            {'LineColAlt',               { bg = '#3C3836', fg = '#504945' }},
            {'LspErr',                   { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Error   }},
            {'LspWarn',                  { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Warning }},
            {'LspHint',                  { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Hint    }},
            {'InssLang',                 { bg = ColorPalette[cpal].Background,fg = ColorPalette[cpal].Violet, }},

            {'TabLineFill',              { bg = ColorPalette[cpal].Black,fg = ColorPalette[cpal].Black, }},
            {'TabLineSel',               { bg = ColorPalette[cpal].Black,fg = ColorPalette[cpal].Name, }},
            {'TabLineSelInv',               { bg = ColorPalette[cpal].Black,fg = ColorPalette[cpal].Name, }},
            {'Tabline',                  { bg = ColorPalette[cpal].Black,fg = ColorPalette[cpal].Gray, }},
        }
    else
        return  {
            {'StatusLine',               { fg = ColorPalette[cpal].Name, bg = ColorPalette[cpal].Background }},
            {'StatusLineNC',             { fg = ColorPalette[cpal].Background, bg = ColorPalette[cpal].Background }},
            {'StatusLineSimpleError',    { fg = ColorPalette[cpal].Error, bg = ColorPalette[cpal].Background }},
            {'StatusLineSimpleWarning',  { fg = ColorPalette[cpal].Warning, bg = ColorPalette[cpal].Background }},
            {'StatusLineSimpleHint',     { fg = ColorPalette[cpal].Hint, bg = ColorPalette[cpal].Background }},
            {'Mode',                     { bg = ColorPalette[cpal].Green, fg = ColorPalette[cpal].Background, gui="bold" }},
            {'LineCol',                  { bg = '#928374', fg = ColorPalette[cpal].Background, gui="bold" }},
            {'Git',                      { bg = ColorPalette[cpal].Yellow, fg = ColorPalette[cpal].Background }},
            {'Scope',                    { bg = ColorPalette[cpal].Red, fg = ColorPalette[cpal].Background }},
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
            {'InssLang',                 { bg = ColorPalette[cpal].Violet, fg = ColorPalette[cpal].Background }},

            {'TabLineFill',              { bg = ColorPalette[cpal].Black,fg = ColorPalette[cpal].Black, }},
            {'TabLineSelInv',            { bg = ColorPalette[cpal].Black,fg = ColorPalette[cpal].Name, }},
            {'TabLineSel',               { bg = ColorPalette[cpal].Name,fg = ColorPalette[cpal].Black, }},
            {'Tabline',                  { bg = ColorPalette[cpal].Black,fg = ColorPalette[cpal].Gray, }},
        }
    end
end

local highlights = gen_highlights()

local set_hl = function(group, options)
  local bg = options.bg == nil and '' or 'guibg=' .. options.bg
  local fg = options.fg == nil and '' or 'guifg=' .. options.fg
  local gui = options.gui == nil and '' or 'gui=' .. options.gui
  vim.cmd(string.format('hi %s %s %s %s', group, bg, fg, gui))
end

local set_hl_inv = function (group,options)
  local bg = options.bg == nil and '' or 'guifg=' .. options.bg
  local fg = options.fg == nil and '' or 'guibg=' .. options.fg
  local gui = options.gui == nil and '' or 'gui=' .. options.gui
  vim.cmd(string.format('hi %s %s %s %s', group, bg, fg, gui))
end
-- ============================================================================

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
  ['t']  = {'Term', 'T'};
  ['nt']  = {'N-Term', 'N-T'};
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
  ['nt'] = "NOR";
}, {
  __index = function()
      return "UNK" 
  end
})

local to_hl_group = function(str)
    return  "%#".. str.. "#";
end
local gen_color_table = function()
    return {
        {"NOR" ,{ bg = ColorPalette[cpal].Green  , fg = ColorPalette[cpal].Background, gui="bold" }},
        {"VIS" ,{ bg = ColorPalette[cpal].Red    , fg = ColorPalette[cpal].Background, gui="bold" }},
        {"VIL" ,{ bg = ColorPalette[cpal].Orange , fg = ColorPalette[cpal].Background, gui="bold" }},
        {"VIB" ,{ bg = ColorPalette[cpal].Yellow , fg = ColorPalette[cpal].Background, gui="bold" }},
        {"SEL" ,{ bg = ColorPalette[cpal].Yellow , fg = ColorPalette[cpal].Background, gui="bold" }},
        {"INS" ,{ bg = ColorPalette[cpal].Blue   , fg = ColorPalette[cpal].Background, gui="bold" }},
        {"REP" ,{ bg = ColorPalette[cpal].Blue   , fg = ColorPalette[cpal].Background, gui="bold" }},
        {"COM" ,{ bg = ColorPalette[cpal].Yellow , fg = ColorPalette[cpal].Background, gui="bold" }},
        {"EEX" ,{ bg = ColorPalette[cpal].Green  , fg = ColorPalette[cpal].Background, gui="bold" }},
        {"UNK" ,{ bg = ColorPalette[cpal].Yellow , fg = ColorPalette[cpal].Background, gui="bold" }},
    }
end

local gen_overlap =function()
    if inverted_colors then 
        return {
            -- mode - language overlap
            {"NORLang" ,{ bg =ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green , gui="bold" }},
            {"VISLang" ,{ bg =ColorPalette[cpal].Background, fg = ColorPalette[cpal].Red, gui="bold" }},
            {"VILLang" ,{ bg =ColorPalette[cpal].Background, fg = ColorPalette[cpal].Orange, gui="bold" }},
            {"VIBLang" ,{ bg =ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"SELLang" ,{ bg =ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"INSLang" ,{ bg =ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue  , gui="bold" }},
            {"REPLang" ,{ bg =ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue  , gui="bold" }},
            {"COMLang" ,{ bg =ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"EEXLang" ,{ bg =ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green , gui="bold" }},
            {"UNKLang" ,{ bg =ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            -- git - lang
            {"LangGit" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Violet, gui="bold" }},
            -- git - center
            {"GitCenter" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            -- lang - center
            {"LangCenter" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Violet, gui="bold" }},
            {"GitScope" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},

            {"LangScope" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Violet, gui="bold" }},
            {"ScopeCenter" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Red, gui="bold" }},
            -- for truncated use
            {"NORName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
            {"VISName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Red, gui="bold" }},
            {"VILName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Orange, gui="bold" }},
            {"VIBName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"SELName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"INSName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
            {"REPName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
            {"COMName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"EEXName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
            {"UNKName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},

            {"NORFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
            {"VISFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Red, gui="bold" }},
            {"VILFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Orange, gui="bold" }},
            {"VIBFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"SELFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"INSFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
            {"REPFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
            {"COMFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"EEXFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
            {"UNKFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},

            {"WarningError" , { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Error, gui="bold" }},
            {"HintWarning"	, { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Hint, gui="bold" }},
            {"ErrorHint"	, { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Hint, gui="bold" }},

            {"CenterWarning" , { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Warning, gui="bold" }},
            {"CenterError"  , { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Error, gui="bold" }},
            {"CenterHint"  , { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Hint, gui="bold" }},

            {"WarningFormat", { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Name, gui="bold" }},
            {"ErrorFormat"  , { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Name, gui="bold" }},
            {"HintFormat"   , { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Name, gui="bold" }},
        }
    else 
        return {
            -- mode - language overlap
            {"NORLang" ,{ bg = ColorPalette[cpal].Violet, fg = ColorPalette[cpal].Green, gui="bold" }},
            {"VISLang" ,{ bg = ColorPalette[cpal].Violet, fg = ColorPalette[cpal].Red, gui="bold" }},
            {"VILLang" ,{ bg = ColorPalette[cpal].Violet, fg = ColorPalette[cpal].Orange, gui="bold" }},
            {"VIBLang" ,{ bg = ColorPalette[cpal].Violet, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"SELLang" ,{ bg = ColorPalette[cpal].Violet, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"INSLang" ,{ bg = ColorPalette[cpal].Violet, fg = ColorPalette[cpal].Blue, gui="bold" }},
            {"REPLang" ,{ bg = ColorPalette[cpal].Violet, fg = ColorPalette[cpal].Blue, gui="bold" }},
            {"COMLang" ,{ bg = ColorPalette[cpal].Violet, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"EEXLang" ,{ bg = ColorPalette[cpal].Violet, fg = ColorPalette[cpal].Green, gui="bold" }},
            {"UNKLang" ,{ bg = ColorPalette[cpal].Violet, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            -- git - lang
            {"LangGit" ,{ bg = ColorPalette[cpal].Yellow, fg = ColorPalette[cpal].Violet, gui="bold" }},
            -- git - center
            {"GitCenter" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            -- lang - center
            {"LangCenter" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Violet, gui="bold" }},

            {"GitScope" ,{ bg = ColorPalette[cpal].Red, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"LangScope" ,{ bg = ColorPalette[cpal].Red, fg = ColorPalette[cpal].Violet, gui="bold" }},
            {"ScopeCenter" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Red, gui="bold" }},
            -- for truncated use
            {"NORName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
            {"VISName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Red, gui="bold" }},
            {"VILName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Orange, gui="bold" }},
            {"VIBName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"SELName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"INSName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
            {"REPName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
            {"COMName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"EEXName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
            {"UNKName" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},

            {"NORFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
            {"VISFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Red, gui="bold" }},
            {"VILFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Orange, gui="bold" }},
            {"VIBFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"SELFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"INSFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
            {"REPFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Blue, gui="bold" }},
            {"COMFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},
            {"EEXFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Green, gui="bold" }},
            {"UNKFFormat" ,{ bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Yellow, gui="bold" }},

            {"WarningError" , { bg = ColorPalette[cpal].Warning, fg = ColorPalette[cpal].Error, gui="bold" }},
            {"HintWarning"  , { bg = ColorPalette[cpal].Hint, fg = ColorPalette[cpal].Warning, gui="bold" }},
            {"ErrorHint"    , { bg = ColorPalette[cpal].Error, fg = ColorPalette[cpal].Hint, gui="bold" }},

            {"WarningFormat", { bg = ColorPalette[cpal].Warning, fg = ColorPalette[cpal].Background, gui="bold" }},
            {"ErrorFormat"  , { bg = ColorPalette[cpal].Error, fg = ColorPalette[cpal].Background, gui="bold" }},
            {"HintFormat"   , { bg = ColorPalette[cpal].Hint, fg = ColorPalette[cpal].Background, gui="bold" }},

            {"CenterWarning", { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Warning, gui="bold" }},
            {"CenterError"  , { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Error, gui="bold" }},
            {"CenterHint"   , { bg = ColorPalette[cpal].Background, fg = ColorPalette[cpal].Hint, gui="bold" }},
        }
    end
end

local color_table = gen_color_table()
local overlap = gen_overlap()

define_highlights = function()
    cpal = vim.api.nvim_get_var('colors_name')
    if ColorPalette[cpal] == nil then 
        cpal = 'dark'
    end
    if blend_in then
        ColorPalette[cpal].Background = "NONE"
    end
    highlights = gen_highlights()
	for _, highlight in ipairs(highlights) do
		set_hl(highlight[1], highlight[2])
	end
    color_table = gen_color_table()
    if inverted_colors then
        for _, highlight in ipairs(color_table) do
            set_hl_inv(highlight[1], highlight[2])
        end
    else
        for _, highlight in ipairs(color_table) do
            set_hl(highlight[1], highlight[2])
        end
    end
    overlap = gen_overlap()
	for _, highlight in ipairs(overlap) do
		set_hl(highlight[1], highlight[2])
	end
end
define_highlights()

M.get_current_mode = function(self)
  local current_mode = api.nvim_get_mode().mode

  if self:is_truncated(self.trunc_width.mode) then
    return string.format(' %s', self.modes[current_mode][2]):upper()
  end
  return string.format(' %s', self.modes[current_mode][1]):upper()
end

M.get_git_status = function(self)
  local stat = vim.b.gitsigns_status
  local head = vim.b.gitsigns_head
  if stat and string.len(stat) > 0 then
    return stat
  else
    if head and string.len(head) >0 then
      return head
    else
      return ""
    end
  end
end

local is_explorer = function()
  return vim.bo.filetype == 'netrw' or vim.bo.filetype == 'nerdtree' or string.lower(vim.bo.filetype) == 'nvimtree'
end

is_term = function()
  return string.find(vim.api.nvim_buf_get_name(0),"term://",0)
end

term_root_val = function()
    local seps = {'~','/home/','/'}
    local tmp = vim.b.term_title
    for _,sep in ipairs(seps) do
      local ind ,_ = string.find(tmp,sep,0)
      if ind then
          return string.sub(tmp,ind)
      end
    end
    return ""
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
      return "%<" .. vim.fn.pathshorten(dir)
    else
      return "%<" .. dir
    end
  end
  local name = vim.fn.expand("%p:t")
  if #name > 20 then
    return "%< "..vim.fn.pathshorten(name) .. '%{&modified?"[+]":""}' 
  else
    return '%< '.. name ..'%{&modified?"[+]":""}' 
  end
end

M.get_filetype = function()
  local file_name, file_ext = fn.expand("%:t"), fn.expand("%:e")
  local filetype = vim.bo.filetype

  if filetype == '' or is_explorer() then return '' end
  return string.format('%s', filetype):lower()
end

M.get_line_col = function(self)
  if self:is_truncated(self.trunc_width.line_col) then return space[2] ..'%l:%c ' end
  return space[2] .. '%l:%c '
end
M.get_Input_language = function()
  return fn['GetInputLang']()
end


M.get_lang_git_name = function(self)
  local colors = self.colors
  local spc = " " 
  local has_lang = true
  if clean_status  then 
  	spc = ""
	end
	
	local git = self:get_git_status()
	local crnt_item = ""
	local next_item = ""
	local tmp_item  = ""

  if self:is_truncated(self.trunc_width.mode) then
  	crnt_item = mode_color_group[api.nvim_get_mode().mode]
  	next_item = 'Name'
    return to_hl_group(crnt_item .. next_item) .. self.separators[active_sep][1] .. colors.filetype .. self:get_filename() .. colors.active
  end 

	-- Mode
  crnt_item = mode_color_group[api.nvim_get_mode().mode]
  next_item = 'Lang'
	
	
  -- Lang
  local Lang = ""

	-- if clean_status then 
	-- 	Lang = to_hl_group(crnt_item..next_item) .. self.separators[active_sep][1] .. colors.ins_language
	-- end
	Lang = to_hl_group(crnt_item..next_item) .. self.separators[active_sep][1] .. colors.ins_language .. space[1] .. self:get_Input_language() .. space[2]

	tmp_item = 'Lang'
	crnt_item = tmp_item
	next_item = 'Git'
	
	-- Git
  local Git_st = ""
  if clean_status then 
		Git_st = to_hl_group(crnt_item..next_item) .. self.separators[active_sep][1] .. colors.git
		tmp_item = 'Git'
	end
	if git ~= "" then 
		Git_st = to_hl_group(crnt_item..next_item).. self.separators[active_sep][1] .. colors.git .. space[1] .. git .. space[2]
		tmp_item = 'Git'
	end

	crnt_item = tmp_item
	next_item = 'Scope'

	-- Scope
	local Scope = ""
	local scp = fn["Scope"]() or ""
  if clean_status then 
		Scope = to_hl_group(crnt_item..next_item) .. self.separators[active_sep][1] .. colors.scope
		tmp_item = 'Scope'
	end
	if scp ~= "" then 
		Scope = to_hl_group(crnt_item..next_item).. self.separators[active_sep][1] .. colors.scope .. space [1] .. scp .. space [2] 
		tmp_item = 'Scope'
	end

	crnt_item = tmp_item
	next_item = 'Center'

	return  Lang .. Git_st .. Scope .. to_hl_group(crnt_item..next_item) ..  self.separators[active_sep][1] .. colors.filetype .. self:get_filename().. colors.active
end

M.get_format_lsp_diagn = function(self,nof)
    local errs = LspDiagn("ERROR")
    local warn = LspDiagn("WARNING")
    local hint = LspDiagn("HINT")
    local ft = self:get_filetype()
    local colors = self.colors
    local ft = self:get_filetype()
    local crnt_item = "Center"
    local next_item = "Warning"
    local tmp_item = "Center"
    local sep_offset = space[1]

    if errs == -1 and  warn == -1 then
        if ft == "" or inverted_colors==false then
            return colors.filetype .. " " .. ft .. " "
        else 
            return colors.filetype .. self.separators[active_sep][2] .. space [2] .. ft .. space [1]
        end
    end

    local Warn = ""
    if clean_status then 
        Warn = to_hl_group(crnt_item..next_item).. self.separators[active_sep][2] .. colors.lsp_warn
        tmp_item = 'Warning'
    end
    if warn ~= 0 then 
        Warn = to_hl_group(crnt_item..next_item).. self.separators[active_sep][2] .. colors.lsp_warn .. space[2] .."W:".. warn  .. space[1]
        tmp_item = 'Warning'
    end
    crnt_item = tmp_item
    next_item = 'Error'

    local Error = ""
    if clean_status then 
        Error = to_hl_group(crnt_item..next_item).. self.separators[active_sep][2] .. colors.lsp_error
        tmp_item = 'Error'
    end
    if errs ~= 0 then 
        Error = to_hl_group(crnt_item..next_item).. self.separators[active_sep][2] .. colors.lsp_error .. space[2] .. "E:" .. errs .. space[1]
        tmp_item = 'Error'
    end
    crnt_item = tmp_item
    next_item = 'Hint'

    local Hint = ""
    if clean_status then 
        Hint = to_hl_group(crnt_item..next_item).. self.separators[active_sep][2] .. colors.lsp_hint
        tmp_item = 'Hint'

    end
    if hint ~= 0 then 
        Hint = to_hl_group(crnt_item..next_item).. self.separators[active_sep][2] .. colors.lsp_hint .. space[2] .. "H:".. hint .. space[1]

        tmp_item = 'Hint'
    end
    crnt_item = tmp_item
    next_item = 'Format'
    -- HintFormat

    local Format = to_hl_group(crnt_item..next_item).. self.separators[active_sep][2] ..  colors.filetype .. space[2] .. ft .. space[1]
    if crnt_item == 'Center' then 
        Format =  colors.filetype .. space[2]  .. ft .. space[1]
    end
    return " ".. Warn .. Error ..  Hint .. Format
end

M.simple_lsp = function(self)
  local errs = LspDiagn("ERROR")
  local warn = LspDiagn("WARNING")
  local hint = LspDiagn("HINT")
  local colors = self.colors
  local res = ""

   if errs > 0 then
     res = res .. colors.simple_error.." E:" .. errs
   end

   if warn > 0 then
     res = res .. colors.simple_warn .." W:" .. warn
   end

   if hint > 0 then
     res = res .. colors.simple_hint .." H:" .. hint
   end

   return res
end

M.fancy_line = function(self )
  local colors = self.colors
  --mode
  local mode = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) ..self:get_current_mode() .. space[1]
  --filename 
  local filename = colors.filetype .. self:get_filename()
  local filetype_alt = colors.filetype_alt .. self.separators[active_sep][1]
  --filename 
  local filetype = colors.filetype .. self:get_filetype()
  local line_col = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) .. self:get_line_col()
  local line_col_alt = to_hl_group(mode_color_group[api.nvim_get_mode().mode]..'FFormat') .. self.separators[active_sep][2]
  local res = ""

  if is_explorer() then
    return table.concat({
        colors.active,
        "%=",
        filename,
        colors.active
      })
  end
  if is_term() then
    local pid = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) .. ' ' .. vim.b.terminal_job_pid .. ' '
    return table.concat({
        colors.active,
        mode,
        to_hl_group(mode_color_group[api.nvim_get_mode().mode]..'FFormat'),
        self.separators[active_sep][1],
        colors.filetype,
        "%=",
        term_root_val(),
        "%=",
        colors.active,
        line_col_alt,
        pid
      })
  end
  return table.concat({
      colors.active,
      mode,
      self:get_lang_git_name(), 
      "%=",
      colors.active,
      self:get_format_lsp_diagn(),
      line_col_alt,
      line_col
    })
end

M.simple_line  = function(self)
  local colors = self.colors
  --mode
  local mode = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) ..self:get_current_mode().. space[2]
  --filename 
  local filename = colors.filetype .. self:get_filename()
  local filetype_alt = colors.filetype_alt .. self.separators[active_sep][1]
  --filename 
  local filetype = colors.filetype .. self:get_filetype()
  local line_col = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) .. self:get_line_col()
  local line_col_alt = to_hl_group(mode_color_group[api.nvim_get_mode().mode]..'FFormat') .. self.separators[active_sep][2]
  local ft = ""
  local colll = colors.active

  if inverted_colors then 
      colll = colors.inactive
  end

  if not is_explorer() then
    ft = '%y '
  end

  if is_explorer() then
    return table.concat({
        colors.active,
        "%=",
        filename,
        "%=",
        colors.active
      })
  end

  if is_term() then
    return table.concat({
        colors.active,
        mode,
        "%#NOR#",
        "%=",
        term_root_val(),
        "%=",
        colors.active,
        line_col_alt,
        vim.b.terminal_job_pid
      })
  end
  ft = self:get_filetype() .. " "
  return table.concat({
      colors.active,
      mode,
      colors.filetype,
      "%=",
      filename,
      self:simple_lsp(),
      "%=",
      colors.active,
      colll,
      ft,
      line_col,
    })
end

local style_callback  = setmetatable({
    ['minimal'] = M.simple_line,
    ['fancy'] = M.fancy_line,
  },{ __index = M.simple_line})

M.set_active = function(self)
  return style_callback[status_style](self)
end

M.set_inactive = function(self)
    if vim.g["ataraxis_on"] == 1 then 
        return to_hl_group('Normal')
    end

    local inct_name = '%{expand("%:h:t")[:len("/home/".$USER)] == "/home/".$USER."/" ? "~"..expand("%:h:t")[len("/home/".$USER):]:expand("%:h:t")}%{&ft!="netrw"?"/".expand("%:t"):""} %{&modified? "[+]":""}'
    if inverted_colors then
        return self.colors.filetype .. inct_name .. self.colors.active
    else
        -- local before = self.colors.filetype .. ' %=' .. to_hl_group('INSName') .. self.separators[active_sep][2] .. to_hl_group('INS').. ' '
        -- local after = to_hl_group('INSName') .. self.separators[active_sep][1] .. '%=' .. self.colors.active

        local before =  to_hl_group('INSName') ..  self.separators[active_sep][1] .. self.colors.filetype .. "%="
        local after =   '%=' ..to_hl_group('INSName')..  self.separators[active_sep][2]

        return before .. inct_name .. after 
    end
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



M.fancy_tab_line = function(self )
  local colors = self.colors
  --mode
  local mode = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) ..self:get_current_mode() .. space[1]
  --filename
  local filename = colors.filetype .. self:get_filename()
  local filetype_alt = colors.filetype_alt .. self.separators[active_sep][1]
  --filename
  local filetype = colors.filetype .. self:get_filetype()
  local line_col = to_hl_group(mode_color_group[api.nvim_get_mode().mode]) .. self:get_line_col()
  local line_col_alt = to_hl_group(mode_color_group[api.nvim_get_mode().mode]..'FFormat') .. self.separators[active_sep][2]
  local res = ""
  local s = ""
  local add_sep = false
  for index = 1, fn.tabpagenr('$') do
      local winnr = fn.tabpagewinnr(index)
      local buflist = fn.tabpagebuflist(index)
      local bufnr = buflist[winnr]
      local bufname = fn.bufname(bufnr)
      local bufmodified = fn.getbufvar(bufnr, '&mod')

      s = s .. '%' .. index .. 'T'
      if index == fn.tabpagenr() then
          add_sep = false
          if index ~= 1 then
              if inverted_colors then
                  s =  s.. colors.tab_selected  .. tab_sel[1]
              else
                  s = s .. colors.tab_selected .. tab_sel[1]
              end
          end
          s = s .. '%#TabLineSel#'
      else
          if inverted_colors then
              if add_sep then
                  s = s .. colors.tab_selected .. tab_nosel[1]
                  add_sep = false
              end
          else 
              if add_sep then
                  s = s .. colors.tab_selected_inv .. tab_nosel[1]
                  add_sep = false
              end
          end
          s = s .. '%#TabLine#'
      end
      -- tab index
      s = s .. ' '

      if bufname ~= '' then
          s = s .. fn.fnamemodify(bufname, ':t').. ' '
      else
          s = s  .. '[No Name]'.. ' '
      end
      -- modify indicator
      if bufmodified == 1 then
          s = s .. '+' .. ' '
      end

      if index == fn.tabpagenr() then
          if inverted_colors == false then
              s = s .. colors.tab_selected_inv ..tab_sel[1]
          else
              s = s .. colors.tab_selected ..tab_sel[1]
          end
      else 
          add_sep = true
      end
  end

  if inverted_colors then
      if add_sep then
          s = s .. colors.tab_selected .. tab_nosel[1]
          add_sep = false
      end
  else 
      if add_sep then
          s = s .. colors.tab_selected_inv .. tab_nosel[1]
          add_sep = false
      end
  end

    s = s .. '%#TabLineFill#'
    return s
end

Tabline = function()
    return M:fancy_tab_line()
end

function set_statusline()
api.nvim_exec([[
  augroup Statusline
  au!
  au ColorScheme * lua if define_highlights then define_highlights() end
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
  au TermEnter * setlocal filetype=terminal
  au VimEnter  * setlocal tabline=%!v:lua.Tabline('fancy')
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
  augroup END
  setlocal statusline=%!v:lua.Statusline('active')
]], false)
end


return {
    set_statusline = set_statusline;
}
