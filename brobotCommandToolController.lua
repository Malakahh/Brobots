local events = require "libs.BetterEvents.BetterEvents"

local commandToolItemName = "brobotCommandTool"

local frame = {}
frame.SelectionEntities = {}
events.RegisterForEvents(frame)

local function GetCenterOfEntity(entity)
	local topleft = entity.prototype.selection_box.left_top
	local bottomright = entity.prototype.selection_box.right_bottom

	local center = {
		x = (topleft.x + bottomright.x) / 2 + entity.position.x,
		y = (topleft.y + bottomright.y) / 2 + entity.position.y
	}

	return center
end

function frame:CreateBrobotSelectionEntity(entity)
	self.SelectionEntities[entity.unit_number] = {
		SelectionEntity = entity.surface.create_entity({name = "brobotSelection", position = GetCenterOfEntity(entity), force = entity.force}),
		Brobot = entity
	}
end

local mousePos
function frame:on_player_selected_area(event)
	mousePos = event.left_top

	if event.item == commandToolItemName then
		game.players[event.player_index].print("Command tool used!")

		for k,v in pairs(event.entities) do
			if v.name == "brobot" then
				if self.SelectionEntities == nil or self.SelectionEntities[v.unit_number] == nil then
					self:CreateBrobotSelectionEntity(v)
				end
			end
		end
	end
end

function frame:on_tick()
	if self.SelectionEntities ~= nil then
		for _,v in pairs(self.SelectionEntities) do
			v.SelectionEntity.teleport(GetCenterOfEntity(v.Brobot))
		end
	end
end

function frame:Deselect( SelectionEntityPair )
	SelectionEntityPair.SelectionEntity.destroy()
	self.SelectionEntities[SelectionEntityPair.Brobot.unit_number] = nil
end

function frame:on_entity_died( event )
	local pair = self.SelectionEntities[event.entity.unit_number]
	if pair ~= nil then
		self:Deselect(pair)
	end
end

function frame:on_player_mined_entity( event )
	local pair = self.SelectionEntities[event.entity.unit_number]
	if pair ~= nil then
		self:Deselect(pair)
	end
end

local function onBrobotDeselectHotkey(event)
	local player = game.players[event.player_index]

	if player.cursor_stack.valid_for_read and player.cursor_stack.name == commandToolItemName then
		if frame.SelectionEntities ~= nil then
			for _,v in pairs(frame.SelectionEntities) do
				frame:Deselect(v)
			end
		end
	end
end
script.on_event("brobotDeselectHotkey", onBrobotDeselectHotkey)

local function onBrobotMoveCommandHotkey( event )
	local player = game.players[event.player_index]

	if player.cursor_stack.valid_for_read and player.cursor_stack.name == commandToolItemName then
		for _, v in pairs(frame.SelectionEntities) do
			v.Brobot.set_command({
				type = defines.command.go_to_location,
				destination = mousePos
			})
		end
	end
end
script.on_event("brobotMoveCommandHotkey", onBrobotMoveCommandHotkey)