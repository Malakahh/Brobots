data:extend({
	{
		type = "simple-entity",
		name = "aStarMapDebugEntity",
		flags = {"not-blueprintable", "not-deconstructable", "not-on-map"},
		icon = "__Brobots__/graphics/icons/circle.png",
		icon_size = 32,
		collision_mask = {"water-tile"},
		pictures = {
			{
				filename = "__Brobots__/graphics/icons/circle.png",
				priority = "extra-high",
				x = 0,
				y = 0,
				width = 32,
				height = 32,
				scale = 0.5,
				shift = {0.5, 0.5}
			}
		}
	}
})