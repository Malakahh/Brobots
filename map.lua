local events = require "libs.BetterEvents.BetterEvents"
local vector = require "libs.VectorUtil"

local frame = {}
events.RegisterForEvents(frame)

frame.map = {}

function frame:AddCoordToMap( ... )
	local coord = ...
	local coordStr
	if type(coord) ~= "string" then
		coordStr = vector.ToString(...)
		coord = vector.ToStandardVector(...)
	else
		coordStr = coord
	end

	if self.map[coordStr] == nil then
		self.map[coordStr] = game.players[1].surface.create_entity({name = "aStarMapDebugEntity", position = coord})
		--self.map[coordStr] = true
	end
end

function frame:RemoveCoordFromMap( ... )
	local coord = ...
	local coordStr
	if type(coord) ~= "string" then
		coordStr = vector.ToString(...)
		coord = vector.ToStandardVector(...)
	else
		coordStr = coord
	end

	if self.map[coordStr] ~= nil then
		if type(self.map[coordStr]) ~= "boolean" and self.map[coordStr].destroy then
			self.map[coordStr].destroy()
		end
		--game.print("Added collision at: " .. coordStr)
		self.map[coordStr] = nil
	end
end

function frame:on_chunk_generated(event)
	local atl = event.area.left_top
	local abr = event.area.right_bottom

	for x = atl.x, abr.x do
		for y = atl.y, abr.y do
			local tile = event.surface:get_tile(x, y)
			if not tile.collides_with("player-layer") then
				self:AddCoordToMap(x, y)
			end
		end
	end

	local entities = event.surface.find_entities(event.area)
	for _,v in pairs(entities) do
		if v.valid and v.prototype.type ~= "player" then
			self:UpdateMapEntityCollision(v, false)
		end
	end
end

function frame:UpdateMapEntityCollision(entity, shouldAdd)
	if entity.valid and entity.name ~= "aStarMapDebugEntity" then
		if entity.prototype.collision_mask and entity.prototype.collision_mask["player-layer"] then

			local cbtl = entity.prototype.collision_box.left_top
			local cbrb = entity.prototype.collision_box.right_bottom

			local vecMin = vector.Min(cbtl, cbrb)
			local vecMax = vector.Max(cbtl, cbrb)

			local width = vecMax.x - vecMin.x
			local height = vecMax.y - vecMin.y

			if string.match(entity.name, "cliff") then
				local longestSide = math.max(width, height)
				vecMin.x = vecMin.x * longestSide
				vecMin.y = vecMin.y * longestSide
				vecMax.x = vecMax.x * longestSide
				vecMax.y = vecMax.y * longestSide

				vecMin.x = vecMin.x + 1
				vecMin.y = vecMin.y - 0.5 
				vecMax.x = vecMax.x - 0.5
				vecMax.y = vecMax.y

				vecMin = vector.Floor(vector.Add(vecMin, entity.position))
				vecMax = vector.Ceil(vector.Add(vecMax, entity.position))
			else
				vecMin.x = vecMin.x 
				vecMin.y = vecMin.y 
				vecMax.x = vecMax.x
				vecMax.y = vecMax.y

				vecMin = vector.Floor(vector.Add(vecMin, entity.position))
				vecMax = vector.Floor(vector.Add(vecMax, entity.position))
			end	

			for x = vecMin.x, vecMax.x, 1 do
				for y = vecMin.y, vecMax.y, 1 do
					if shouldAdd then
						self:AddCoordToMap(x, y)
					else
						self:RemoveCoordFromMap(x, y)
					end
				end
			end
		end
	end
end

function frame:on_biter_base_built(event)

	self:UpdateMapEntityCollision(event.entity, false)
end

function frame:on_built_entity(event)
	if event.created_entity.name ~= "brobot" and
		(event.created_entity.prototype and 
		event.created_entity.prototype.type ~= "locomotive" and
		event.created_entity.prototype.type ~= "cargo-wagon" and
		event.created_entity.prototype.type ~= "car") then

		self:UpdateMapEntityCollision(event.created_entity, false)
	end
end

--

function frame:on_entity_died(event)
	self:UpdateMapEntityCollision(event.entity, true)
end

function frame:on_player_built_tile(event)
	for k,v in pairs(event.positions) do
		local tile = game.surfaces[event.surface_index].get_tile(v.x, v.y)
		if tile.collides_with("player-layer") then
			self:RemoveCoordFromMap(v.x, v.y)
		else
			self:AddCoordToMap(v.x, v.y)
		end
	end
end

function frame:on_player_mined_entity(event)
	self:UpdateMapEntityCollision(event.entity, true)
end

function frame:on_robot_built_entity(event)
	self:UpdateMapEntityCollision(event.created_entity, false)
end

function frame:on_robot_mined_entity(event)
	self:UpdateMapEntityCollision(event.entity, true)
end

function frame:on_robot_built_tile(event)
	for k,v in pairs(event.positions) do
		local tile = event.robot.surface.get_tile(v.x, v.y)
		if tile.collides_with("player-layer") then
			self:RemoveCoordFromMap(v.x, v.y)
		else
			self:AddCoordToMap(v.x, v.y)
		end
	end
end

function frame:on_robot_mined_tile(event)
	for k,v in pairs(event.positions) do
		local tile = event.robot.surface.get_tile(v.x, v.y)
		if tile.collides_with("player-layer") then
			self:RemoveCoordFromMap(v.x, v.y)
		else
			self:AddCoordToMap(v.x, v.y)
		end
	end
end

function frame:on_trigger_created_entity(event)
	self:UpdateMapEntityCollision(event.entity, true)
end
