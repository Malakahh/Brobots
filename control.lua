require "brobotCommandToolController"
require "map"
local events = require "libs.BetterEvents.BetterEvents"

local frame = {}
events.RegisterForEvents(frame)

function frame:on_built_entity( event )
	if event.created_entity.name == "brobot" then
		--event.created_entity.walking_state = {walking = true, direction = defines.direction.north}
		--event.created_entity.enable_flashlight()
	end
end

function frame:on_player_created( event )
	game.players[event.player_index].insert({name = "brobot", count = 5})
	game.players[event.player_index].insert({name = "brobotCommandTool", count = 1})
	
end

