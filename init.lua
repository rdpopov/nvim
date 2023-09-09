local ok, _ = pcall(require, 'impatient')
if not ok then
	print('restart neovim after plugs are installed')
end
require("plugins")
require("editor-settings")
require("viml-scripts")
require("remaps")
require("own-function-remps")
