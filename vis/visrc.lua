-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	-- vis:command('set number')
	vis:command('set theme base16-gruvbox-dark-hard')
end)
