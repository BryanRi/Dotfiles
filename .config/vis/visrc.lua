-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	vis:command('set theme gruvbox')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	vis:command('set number on')
	vis:command('set relativenumber on')

	vis:command('set autoindent on')
	vis:command('set tabwidth 4')
	vis:command('set expandtab on')


end)
