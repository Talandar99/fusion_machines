require("__base__.prototypes.entity.pipecovers")
local item_sounds = require("__base__.prototypes.item_sounds")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
data:extend({
	{
		type = "item",
		name = "fusion-lab",
		order = "z[zz-fusion-lab]",
		subgroup = "production-machine",
		pick_sound = item_sounds.reactor_inventory_pickup,
		drop_sound = item_sounds.reactor_inventory_move,
		icon = "__fusion_machines__/graphics/fusion_lab/fusion-lab.png",
		icon_size = 64,
		stack_size = 1,
		default_import_location = "aquilo",
		weight = 1000000000,
		place_result = "fusion-lab",
	},
	{
		type = "recipe",
		name = "fusion-lab",
		category = "crafting",
		enabled = false,
		energy_required = 50,
		surface_conditions = {
			{
				property = "pressure",
				min = 0,
				max = 0,
			},
		},
		ingredients = {
			{ type = "item", name = "fusion-reactor-equipment", amount = 5 },
			{ type = "item", name = "tungsten-plate", amount = 500 },
			{ type = "item", name = "superconductor", amount = 250 },
			{ type = "item", name = "quantum-processor", amount = 200 },
			{ type = "item", name = "refined-concrete", amount = 1000 },
		},
		results = { { type = "item", name = "fusion-lab", amount = 1 } },
	},
	{
		name = "fusion-lab",
		type = "lab",
		icon = "__fusion_machines__/graphics/fusion_lab/fusion-lab.png",
		icon_size = 64,
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = {
			mining_time = 0.5,
			results = { { type = "item", name = "fusion-lab", amount = 1 } },
		},
		max_health = 500,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
		circuit_connector = circuit_connector_definitions["fusion-lab"],
		--collision_box = { { -2.1, -2.1 }, { 2.1, 2.1 } },
		collision_box = { { -4.7, -4.7 }, { 4.7, 4.7 } },
		--selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
		selection_box = { { -5.1, -5.1 }, { 5.1, 5.1 } },
		surface_conditions = {
			{
				property = "pressure",
				min = 0,
				max = 0,
			},
		},
		energy_source = {
			type = "burner",
			fuel_categories = { "fusion" },
			effectivity = 1,
			fuel_inventory_size = 1,
			burnt_inventory_size = 1,
			light_flicker = {
				color = { 0, 0, 0 },
				minimum_intensity = 0.7,
				maximum_intensity = 0.95,
			},
		},
		impact_category = "metal",
		open_sound = sounds.metal_large_open,
		close_sound = sounds.metal_large_close,
		energy_usage = "150MW",
		heating_energy = "500kW",
		module_slots = 8,
		science_pack_drain_rate_percent = 25,
		researching_speed = 3,
		inputs = {
			"automation-science-pack",
		},
		source_inventory_size = 1,
		on_animation = {
			layers = {
				{
					priority = "high",
					width = 330,
					height = 390,
					frame_count = 80,
					lines_per_file = 8,
					animation_speed = 0.35,
					--scale = 0.5,
					scale = 1.08,
					--shift = util.by_pixel(0, -16),
					shift = util.by_pixel(2, -40),
					stripes = {
						{
							filename = "__fusion_machines__/graphics/fusion_lab/fusion-lab-hr-animation-1.png",
							width_in_frames = 8,
							height_in_frames = 8,
						},
						{
							filename = "__fusion_machines__/graphics/fusion_lab/fusion-lab-hr-animation-2.png",
							width_in_frames = 8,
							height_in_frames = 2,
						},
					},
				},
				{
					priority = "high",
					draw_as_glow = true,
					blend_mode = "additive",
					width = 330,
					height = 390,
					frame_count = 80,
					lines_per_file = 8,
					animation_speed = 0.35,
					--scale = 0.5,
					scale = 1.08,
					--shift = util.by_pixel(0, -16),
					shift = util.by_pixel(2, -40),
					stripes = {
						{
							filename = "__fusion_machines__/graphics/fusion_lab/fusion-lab-hr-emission-1.png",
							width_in_frames = 8,
							height_in_frames = 8,
						},
						{
							filename = "__fusion_machines__/graphics/fusion_lab/fusion-lab-hr-emission-2.png",
							width_in_frames = 8,
							height_in_frames = 2,
						},
					},
				},
				{
					filename = "__fusion_machines__/graphics/fusion_lab/fusion-lab-hr-shadow.png",
					priority = "high",
					width = 1200,
					height = 700,
					frame_count = 1,
					line_length = 1,
					repeat_count = 80,
					animation_speed = 0.35,
					draw_as_shadow = true,
					--scale = 0.5,
					scale = 1.08,
					--shift = util.by_pixel(0, -16),
					shift = util.by_pixel(2, -40),
				},
			},
		},
		off_animation = {
			layers = {
				{
					filename = "__fusion_machines__/graphics/fusion_lab/fusion-lab-hr-shadow.png",
					priority = "high",
					width = 1200,
					height = 700,
					frame_count = 1,
					line_length = 1,
					repeat_count = 80,
					animation_speed = 0.35,
					draw_as_shadow = true,
					--scale = 0.5,
					scale = 1.08,
					--shift = util.by_pixel(0, -16),
					shift = util.by_pixel(2, -40),
				},
				{
					priority = "high",
					width = 330,
					height = 390,
					frame_count = 80,
					lines_per_file = 8,
					animation_speed = 0.35,
					--scale = 0.5,
					scale = 1.08,
					--shift = util.by_pixel(0, -16),
					shift = util.by_pixel(2, -40),
					stripes = {
						{
							filename = "__fusion_machines__/graphics/fusion_lab/fusion-lab-hr-animation-1.png",
							width_in_frames = 8,
							height_in_frames = 8,
						},
						{
							filename = "__fusion_machines__/graphics/fusion_lab/fusion-lab-hr-animation-2.png",
							width_in_frames = 8,
							height_in_frames = 2,
						},
					},
				},
			},
		},

		alert_icon_shift = util.by_pixel(0, -12),
		icon_draw_specification = { shift = { 0, -0.3 } },

		icons_positioning = {
			{ inventory_index = defines.inventory.lab_modules, shift = { 0, -0.6 } },
			{
				inventory_index = defines.inventory.lab_input,
				shift = { 0, 0.4 },
				max_icons_per_row = 10,
				separation_multiplier = 1 / 1.1,
			},
		},

		working_sound = {
			sound = {
				filename = "__space-age__/sound/entity/fusion/fusion-generator.ogg",
				volume = 0.4,
				advanced_volume_control = { attenuation = "exponential" },
			},
			sound_accents = {
				--{
				--	sound = {
				--		variations = sound_variations(
				--			"__space-age__/sound/entity/spawner/spawner-respirator-push",
				--			3,
				--			0.3
				--		),
				--		audible_distance_modifier = 0.6,
				--	},
				--	frame = 1,
				--},
				{
					sound = {
						variations = sound_variations("__space-age__/sound/entity/biolab/biolab-beaker", 7, 0.8),
						audible_distance_modifier = 0.4,
					},
					frame = 1,
				},
				--{
				--	sound = {
				--		variations = sound_variations("__space-age__/sound/entity/biolab/biolab-centrifuge", 4, 0.7),
				--		audible_distance_modifier = 0.3,
				--	},
				--	frame = 14,
				--},
				--{

				--	sound = {
				--		filename = "__space-age__/sound/entity/fusion/fusion-generator.ogg",
				--		volume = 0.15,
				--		speed_smoothing_window_size = 60,
				--		advanced_volume_control = { attenuation = "exponential" },
				--		audible_distance_modifier = 0.8,
				--	},
				--},
				--{
				--	sound = {
				--		variations = sound_variations(
				--			"__space-age__/sound/entity/spawner/spawner-respirator-pull",
				--			3,
				--			0.3
				--		),
				--		audible_distance_modifier = 0.6,
				--	},
				--	frame = 17,
				--},
			},
			max_sounds_per_prototype = 2,
		},
		--working_sound = {
		--	sound = {
		--		filename = "__space-age__/sound/entity/fusion/fusion-generator.ogg",
		--		volume = 0.15,
		--		speed_smoothing_window_size = 60,
		--		advanced_volume_control = { attenuation = "exponential" },
		--		audible_distance_modifier = 0.8,
		--	},
		--	use_doppler_shift = false,
		--	match_speed_to_activity = true,
		--	activity_to_speed_modifiers = { multiplier = 1.2 },
		--	match_volume_to_activity = true,
		--	max_sounds_per_prototype = 2,
		--	fade_in_ticks = 4,
		--	fade_out_ticks = 20,
		--},
	},
})
