vim.cmd "colorscheme azenburn"
vim.o.laststatus = 3
require"string"

local aerial = require('aerial')

function get_git_status()

  local head = vim.b.gitsigns_head
  if stat and string.len(stat) > 0 then
    return " "..stat .. " "
  else
    if head and string.len(head) >0 then
      return " "..head .. " "
    else
      return ""
    end
  end
end

local function aerial_gps()
	local scp = aerial.get_location(true)
	local scp_guess = aerial.get_location(false)
	if #scp > 0 then
	    scp = scp[1].name or ""
    elseif #scp_guess > 0 then
	    scp = scp_guess[1].name or ""
	else
        return ""
	end
    return "%#Function#" .. scp .. "%#LineNr#"
end

local function LspDiagn(diagn)
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
      return #vim.diagnostic.get(0,{severity = vim.diagnostic.severity[diagn]})
  end
      return -1
end

local function lsp_info()
    if LspDiagn("ERROR") == -1 then
        return "no lsp"
    end
    local lsp_err  = "%#DiagnosticSignError#E:" .. LspDiagn("ERROR")   .. "%#LineNr# "
    local lsp_warn = "%#DiagnosticSignWarn#W:"  .. LspDiagn("WARNING") .. "%#LineNr# "
    local lsp_hint = "%#DiagnosticSignHint#H:"  .. LspDiagn("HINT")    .. "%#LineNr#"
    return lsp_err .. lsp_warn ..lsp_hint 
end

local function langlsp()
    local is_spell = ""
    if vim.o.spell then 
        is_spell = ":s"
    end 
    local lang_crnt = "%#Keyword#" ..  string.lower(vim.fn['GetInputLang']()) .. is_spell .. "%#LineNr#"
    return "(" .. lang_crnt..") (" .. lsp_info() .. ")"
end

function My_statusline()
    local set_color_1 = "%#PmenuSel#"
    local branch = get_git_status()
    local set_color_2 = "%#LineNr#"
    local file_name = " %f"
    local modified = "%#String# %m %#LineNr#"
    local crnt_funtion = aerial_gps()
    local align_right = "%="
    local filetype = " %y"
    local lang_and_lsp = langlsp()
    local linecol = " %l:%c"

    return table.concat({
        set_color_1,
        branch,
        set_color_2,
        file_name,
        modified,
        crnt_funtion,
        align_right,
        lang_and_lsp,
        filetype,
        linecol}
    )
end

vim.opt.statusline = "%!v:lua.My_statusline()"

vim.api.nvim_create_autocmd({"WinEnter"}, {
  callback = function ()
      if #vim.api.nvim_tabpage_list_wins(0) == 1 then
          vim.opt.winbar=""
      else
          vim.opt.winbar=" %#LineNr#%=%#String#%m %#LineNr#%f"
      end
  end
})
