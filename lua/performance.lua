local ok, _ = pcall(require, 'impatient')

if not ok then
	print('restart neovim after plugs are installed')
end
