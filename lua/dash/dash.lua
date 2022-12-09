local vscode = require('dash.vscode')
local kaladin = require('dash.kaladin')
-- local br4 = require("dash.bridge")
local choice = kaladin

local home = os.getenv('HOME')
local db = require('dashboard')
db.custom_header = choice.banner  -- type can be nil,table or function(must be return table in function)
-- db.custom_footer = {"","All hope abandon ye who enter here"}
db.custom_footer = choice.quote
db.custom_center = {
    { desc = 'Recently opened files                 ',
    action =  'Telescope oldfiles',
    shortcut = '<Space>tO' },
    { desc = 'Open Files                            ',
    action =  'Telescope find_files',
    shortcut = '<Space>to' },
    { desc ='File Browser                             ',
    action =  'Lexplore',
    shortcut = 'Ctrl-N' },
    { desc = 'Personal Wiki                         ',
    action = 'WikiIndex',
    shortcut = '<Space>WW' },
    { desc = 'Open Config Root                               ',
    action = 'cd ' .. home ..'/.config/nvim', }
}
