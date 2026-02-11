if settings.startup["fusion-assembling-machine"].value then
	local base_categories = data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories
	data.raw["assembling-machine"]["fusion-assembling-machine"].crafting_categories = base_categories

	data.raw["technology"]["fusion-automation"].unit.ingredients =
		data.raw["technology"]["fusion-reactor-equipment"].unit.ingredients

	if mods["skewer_planet_vesta"] then
		table.insert(data.raw["technology"]["fusion-automation"].prerequisites, "dt-fuel")
		data.raw["technology"]["fusion-automation"].unit.ingredients =
			data.raw["technology"]["dt-fuel"].unit.ingredients

		data:extend({
			{
				type = "recipe",
				name = "fusion-assembling-machine",
				category = "crafting",
				enabled = false,
				energy_required = 10,
				ingredients = {
					{ type = "item", name = "fusion-reactor-equipment", amount = 1 },
					{ type = "item", name = "iridium-plate", amount = 20 },
					{ type = "item", name = "superconductor", amount = 25 },
					{ type = "item", name = "quantum-processor", amount = 15 },
					{ type = "item", name = "refined-concrete", amount = 50 },
				},
				results = { { type = "item", name = "fusion-assembling-machine", amount = 1 } },
			},
		})
	end
end

if settings.startup["fusion-lab"].value then
	data.raw["technology"]["fusion-lab"].unit.ingredients =
		data.raw["technology"]["fusion-reactor-equipment"].unit.ingredients

	if settings.startup["fusion-assembling-machine"].value then
		table.insert(data.raw["technology"]["fusion-lab"].prerequisites, "fusion-automation")
	end

	if mods["skewer_planet_vesta"] then
		table.insert(data.raw["technology"]["fusion-lab"].prerequisites, "dt-fuel")
		data.raw["technology"]["fusion-lab"].unit.ingredients = data.raw["technology"]["dt-fuel"].unit.ingredients
		data:extend({
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
					{ type = "item", name = "iridium-plate", amount = 500 },
					{ type = "item", name = "superconductor", amount = 250 },
					{ type = "item", name = "quantum-processor", amount = 200 },
					{ type = "item", name = "refined-concrete", amount = 1000 },
				},
				results = { { type = "item", name = "fusion-lab", amount = 1 } },
			},
		})
	end
end
