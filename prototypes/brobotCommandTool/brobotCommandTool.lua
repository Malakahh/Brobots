data:extend({
	{
		type = "selection-tool",
		name = "brobotCommandTool",
		icon = "__Brobots__/graphics/icons/brobotController.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "transport",
		order = "b[personal-transport]-b[car]",
		stack_size = 1,
		selection_color = {r = 0, g = 1, b = 0, a = 1},
		selection_mode = {"any-entity"},
		alt_selection_color = {r = 0, g = 1, b = 0, a = 1},
		alt_selection_mode = {"any-entity"},
		selection_cursor_box_type = "copy",
		alt_selection_cursor_box_type = "copy",
	}
})

data:extend({
	{
		type = "recipe",
		name = "brobotCommandTool",
		enabled = true,
		category = "crafting",
		energy_required = 2,
		ingredients = {
			{"iron-plate",4},
		},
		result = "brobotCommandTool"
	}
})

data:extend({
	{
		type = "custom-input",
		name = "brobotDeselectHotkey",
		key_sequence = "SHIFT + mouse-button-2",
		consuming = "none"
	},
	{
		type = "custom-input",
		name = "brobotMoveCommandHotkey",
		key_sequence = "SHIFT + mouse-button-1",
		consuming = "none"
	}
})