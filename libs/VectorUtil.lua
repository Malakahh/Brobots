local function ToStandardVector(arg1, arg2)
	if arg1 == nil then return end

	local v = {}

	if arg2 == nil then
		if arg1.x == nil then
			v.x = arg1[1]
		end

		if arg1.y == nil then
			v.y = arg1[2]
		end

		if v.x == nil then
			v = arg1
		end

	else
		v.x = arg1
		v.y = arg2
	end

	return v
end

local function ToString(arg1, arg2)
	v = ToStandardVector(arg1, arg2)

	if v == nil then return "" end

	return "(" .. v.x .. ", " .. v.y .. ")"
end

local function Add(v1, v2)
	return {
		x = v1.x + v2.x,
		y = v1.y + v2.y	
	}
end

local function Subtract(v1, v2)
	return {
		x = v1.x - v2.x,
		y = v1.y - v2.y
	}
end

local function Multiply(v, s)
	return {
		x = v.x * s,
		y = v.y * s
	}
end

local function Min(v1, v2)
	return {
		x = math.min(v1.x, v2.x),
		y = math.min(v1.y, v2.y)
	}
end

local function Max(v1, v2)
	return {
		x = math.max(v1.x, v2.x),
		y = math.max(v1.y, v2.y)
	}
end

local function Rotate(v, angleInRad)
	return {
		x = v.x * math.cos(angleInRad) - v.y * math.sin(angleInRad),
		y = v.x * math.sin(angleInRad) + v.y * math.cos(angleInRad)
	}
end

local function Floor(v)
	return {
		x = math.floor(v.x),
		y = math.floor(v.y)
	}
end

local function Ceil(v)
	return {
		x = math.ceil(v.x),
		y = math.ceil(v.y)
	}
end

return {
	ToStandardVector = ToStandardVector,
	ToString = ToString,
	Add = Add,
	Subtract = Subtract,
	Multiply = Multiply,
	Min = Min,
	Max = Max,
	Rotate = Rotate,
	Floor = Floor,
	Ceil = Ceil
}