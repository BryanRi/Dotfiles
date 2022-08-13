-- load standard vis module, providing parts of the Lua API
require('vis')
require('plugins/filetype')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	vis:command('set theme gruvbox')
--    --Global configuration--
    
--    vis:command('set change-256colors off') --see vis#613
--    vis:command('set theme base16-tomorrow-night')
--
--    --keyboard shortcuts--
--    vis:command('map insert <C-s> <Escape>:w<Enter>')
--    vis:command('map normal <C-s> :w<Enter>')
--    vis:command('map! insert <M-C-h> <Escape>dbi')

end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	vis:command('set number on')
	vis:command('set relativenumber on')

	vis:command('set autoindent on')
	vis:command('set tabwidth 4')
	vis:command('set expandtab on')

end)