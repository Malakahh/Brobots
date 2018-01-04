data:extend({
	{
		type = "player",
		name = "brobot",
		icon = "__base__/graphics/icons/player.png",
		icon_size = 32,
		flags = {"pushable", "placeable-neutral", "player-creation", "placeable-off-grid"},
		collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
		selection_box = {{-0.4, -1.4}, {0.4, 0.2}},
		--collision_mask = {"ground-tile", "object-layer"},

		animations =
	    {
	      {
	        idle =
	        {
	          layers =
	          {
	            playeranimations.level1.idle,
	            playeranimations.level1.idle_mask,
	            playeranimations.level1.idle_shadow,
	          }
	        },
	        idle_with_gun =
	        {
	          layers =
	          {
	            playeranimations.level1.idle_gun,
	            playeranimations.level1.idle_gun_mask,
	            playeranimations.level1.idle_gun_shadow,
	          }
	        },
	        mining_with_hands =
	        {
	          layers =
	          {
	            playeranimations.level1.mining_hands,
	            playeranimations.level1.mining_hands_mask,
	            playeranimations.level1.mining_hands_shadow,
	          }
	        },
	        mining_with_tool =
	        {
	          layers =
	          {
	            playeranimations.level1.mining_tool,
	            playeranimations.level1.mining_tool_mask,
	            playeranimations.level1.mining_tool_shadow,
	          }
	        },
	        running_with_gun =
	        {
	          layers =
	          {
	            playeranimations.level1.running_gun,
	            playeranimations.level1.running_gun_mask,
	            playeranimations.level1.running_gun_shadow,
	          }
	        },
	        running =
	        {
	          layers =
	          {
	            playeranimations.level1.running,
	            playeranimations.level1.running_mask,
	            playeranimations.level1.running_shadow,
	          }
	        }
	      },
	      {
	        -- heavy-armor is not in the demo
	        armors = data.is_demo and {"light-armor"} or {"light-armor", "heavy-armor"},
	        idle =
	        {
	          layers =
	          {
	            playeranimations.level1.idle,
	            playeranimations.level1.idle_mask,
	            playeranimations.level2addon.idle,
	            playeranimations.level2addon.idle_mask,
	            playeranimations.level1.idle_shadow,
	          }
	        },
	        idle_with_gun =
	        {
	          layers =
	          {
	            playeranimations.level1.idle_gun,
	            playeranimations.level1.idle_gun_mask,
	            playeranimations.level2addon.idle_gun,
	            playeranimations.level2addon.idle_gun_mask,
	            playeranimations.level1.idle_gun_shadow,
	          }
	        },
	        mining_with_hands =
	        {
	          layers =
	          {
	            playeranimations.level1.mining_hands,
	            playeranimations.level1.mining_hands_mask,
	            playeranimations.level2addon.mining_hands,
	            playeranimations.level2addon.mining_hands_mask,
	            playeranimations.level1.mining_hands_shadow,
	          }
	        },
	        mining_with_tool =
	        {
	          layers =
	          {
	            playeranimations.level1.mining_tool,
	            playeranimations.level1.mining_tool_mask,
	            playeranimations.level2addon.mining_tool,
	            playeranimations.level2addon.mining_tool_mask,
	            playeranimations.level1.mining_tool_shadow,
	          }
	        },
	        running_with_gun =
	        {
	          layers =
	          {
	            playeranimations.level1.running_gun,
	            playeranimations.level1.running_gun_mask,
	            playeranimations.level2addon.running_gun,
	            playeranimations.level2addon.running_gun_mask,
	            playeranimations.level1.running_gun_shadow,
	          }
	        },
	        running =
	        {
	          layers =
	          {
	            playeranimations.level1.running,
	            playeranimations.level1.running_mask,
	            playeranimations.level2addon.running,
	            playeranimations.level2addon.running_mask,
	            playeranimations.level1.running_shadow,
	          }
	        }
	      },
	      {
	        -- modular armors are not in the demo
	        armors = data.is_demo and {} or {"modular-armor", "power-armor", "power-armor-mk2"},
	        idle =
	        {
	          layers =
	          {
	            playeranimations.level1.idle,
	            playeranimations.level1.idle_mask,
	            playeranimations.level3addon.idle,
	            playeranimations.level3addon.idle_mask,
	            playeranimations.level1.idle_shadow,
	          }
	        },
	        idle_with_gun =
	        {
	          layers =
	          {
	            playeranimations.level1.idle_gun,
	            playeranimations.level1.idle_gun_mask,
	            playeranimations.level3addon.idle_gun,
	            playeranimations.level3addon.idle_gun_mask,
	            playeranimations.level1.idle_gun_shadow,
	          }
	        },
	        mining_with_hands =
	        {
	          layers =
	          {
	            playeranimations.level1.mining_hands,
	            playeranimations.level1.mining_hands_mask,
	            playeranimations.level3addon.mining_hands,
	            playeranimations.level3addon.mining_hands_mask,
	            playeranimations.level1.mining_hands_shadow,
	          }
	        },
	        mining_with_tool =
	        {
	          layers =
	          {
	            playeranimations.level1.mining_tool,
	            playeranimations.level1.mining_tool_mask,
	            playeranimations.level3addon.mining_tool,
	            playeranimations.level3addon.mining_tool_mask,
	            playeranimations.level1.mining_tool_shadow,
	          }
	        },
	        running_with_gun =
	        {
	          layers =
	          {
	            playeranimations.level1.running_gun,
	            playeranimations.level1.running_gun_mask,
	            playeranimations.level3addon.running_gun,
	            playeranimations.level3addon.running_gun_mask,
	            playeranimations.level1.running_gun_shadow,
	          }
	        },
	        running =
	        {
	          layers =
	          {
	            playeranimations.level1.running,
	            playeranimations.level1.running_mask,
	            playeranimations.level3addon.running,
	            playeranimations.level3addon.running_mask,
	            playeranimations.level1.running_shadow,
	          }
	        }
	      }
	    },

	    light =
	    {
	      {
	        type = "oriented",
	        minimum_darkness = 0.3,
	        picture =
	        {
	          filename = "__core__/graphics/light-cone.png",
	          priority = "extra-high",
	          flags = { "light" },
	          scale = 2,
	          width = 200,
	          height = 200
	        },
	        shift = {0, -13},
	        size = 2,
	        intensity = 0.6,
	        color = {r=0.0, g=1.0, b=0.0}
	      },
	    },

	    burner =
		{
			effectivity = 0.65,
			fuel_inventory_size = 4,
			smoke =
			{
				{
					name = "tank-smoke",
					deviation = {0.55, 0.55},
					frequency = 20,
					position = {0, 0.2},
					starting_frame = 0,
					starting_frame_deviation = 60
				}
			}
		},

	    order = "b[personal-transport]-b[car]",

	    --gameplay stats
		max_health = 100,
		energy_per_hit_point = 0.5,
		inventory_size = 40,

		--physics
		weight = 2500,
		braking_power = "200kW",
		friction = 0.002,
		effectivity = 0.5,
		consumption = "600kW",
		rotation_speed = 0.013,

		mining_speed = 0.01,
		running_speed = 0.15,
		distance_per_frame = 0.13,
		maximum_corner_sliding_distance = 0.7,
		heartbeat =
	    {
	      {
	        filename = "__base__/sound/heartbeat.ogg"
	      }
	    },
	    eat =
	    {
	      {
	        filename = "__base__/sound/eat.ogg",
	        volume = 1
	      }
	    },
	    build_distance = 6,
	    drop_item_distance = 6,
	    reach_distance = 6,
	    reach_resource_distance = 2.7,
	    item_pickup_distance = 1,
    	loot_pickup_distance = 2,
    	ticks_to_keep_gun = 600,
    	ticks_to_keep_aiming_direction = 100,
    	--ticks you need to wait after firing a weapon or taking damate to get out of combat and get healed
    	ticks_to_stay_in_combat = 600,
    	damage_hit_tint = {r = 1, g = 0, b = 0, a = 0},
    	mining_with_hands_particles_animation_positions = {29, 63},
    	mining_with_tool_particles_animation_positions = {28},
    	running_sound_animation_positions = {5, 16},
    	minable = {minable = true, mining_time = 1, result = "brobot"},
	},
})

data:extend({
	{
		type = "item",
		name = "brobot",
		icon = "__base__/graphics/icons/player.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "transport",
		order = "b[personal-transport]-b[car]",
		place_result = "brobot",
		stack_size = 1
	}
})

data:extend({
	{
		type = "recipe",
		name = "brobot",
		enabled = true,
		category = "crafting",
		energy_required = 2,
		ingredients = {
			{"iron-plate",4},
		},
		result = "brobot"
	}
})