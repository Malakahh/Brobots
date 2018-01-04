local events = require "libs.BetterEvents.BetterEvents"
local vector = require "libs.VectorUtil"

local frame = {}
events.RegisterForEvents(frame)

frame.map = {}

local DirectionToRad = {
	-- defines.direction.north	
	math.pi * 0.5,

	-- defines.direction.northeast
	math.pi * 0.25,

	-- defines.direction.east	
	math.pi * 0,

	-- defines.direction.southeast	
	math.pi * 1.75,

	-- defines.direction.south
	math.pi * 1.5,

	-- defines.direction.southwest	
	math.pi * 1.25,

	-- defines.direction.west
	math.pi * 1,

	-- defines.direction.northwest
	math.pi * 0.75
}

function frame:ToggleCollisionOnCoord(...)
	local coord = ...
	if type(coord) ~= "string" then
		coord = vector.ToString(...)
	end

	if self.map[coord] ~= nil then
		self.map[coord].destroy()
		self.map[coord] = nil
	end
end

function frame:on_chunk_generated(event)
	local atl = event.area.left_top
	local abr = event.area.right_bottom

	for x = atl.x, abr.x do
		for y = atl.y, abr.y do
			local tile = event.surface:get_tile(x, y)

			if not tile.collides_with("player-layer") then
				self.map[vector.ToString(x, y)] = event.surface.create_entity({name = "aStarMapDebugEntity", position = {x,y}})
			end
		end
	end

	local entities = event.surface.find_entities(event.area)
	for _,v in pairs(entities) do
		if v.valid and v.name ~= "aStarMapDebugEntity" then
			if v.prototype.collision_mask["player-layer"] then

				-- local vec1 = vector.Multiply(v.prototype.collision_box.left_top, 2)
				-- local vec2 = vector.Multiply(v.prototype.collision_box.right_bottom, 2)

				-- local vtl = {
				-- 	x = math.floor(vec1.x + v.position.x),
				-- 	y = math.floor(vec1.y + v.position.y)
				-- }

				-- local vbr = {
				-- 	x = math.floor(vec2.x + v.position.x + 0.5),
				-- 	y = math.floor(vec2.y + v.position.y + 0.5)
				-- }

				-- local vMin = vector.Min(vtl, vbr)
				-- local vMax = vector.Max(vtl, vbr)

				-- for x = vMin.x, vMax.x, 1 do
				-- 	for y = vMin.y, vMax.y, 1 do
				-- 		self:ToggleCollisionOnCoord(x, y)
				-- 	end
				-- end

				local cbtl = v.prototype.collision_box.left_top
				local cbrb = v.prototype.collision_box.right_bottom

				local vecMin = vector.Min(cbtl, cbrb)
				local vecMax = vector.Max(cbtl, cbrb)

				local width = vecMax.x - vecMin.x
				local height = vecMax.y - vecMin.y
				local longestSide = math.max(width, height)

				vecMin.x = vecMin.x * longestSide
				vecMin.y = vecMin.y * longestSide
				vecMax.x = vecMax.x * longestSide
				vecMax.y = vecMax.y * longestSide

				if string.match(v.name, "cliff") then
					vecMin.x = vecMin.x + 1
					vecMin.y = vecMin.y - 0.5 
					vecMax.x = vecMax.x - 0.5
					vecMax.y = vecMax.y
				else
					vecMin.x = vecMin.x
					vecMin.y = vecMin.y
					vecMax.x = vecMax.x
					vecMax.y = vecMax.y
				end

				

				vecMin = vector.Floor(vector.Add(vecMin, v.position))
				vecMax = vector.Ceil(vector.Add(vecMax, v.position))

				for x = vecMin.x, vecMax.x, 1 do
					for y = vecMin.y, vecMax.y, 1 do
						self:ToggleCollisionOnCoord(x, y)
					end
				end
			end
		end
	end
end