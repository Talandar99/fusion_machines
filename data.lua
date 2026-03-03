if settings.startup["fusion-assembling-machine"].value then
	require("fusion-assembling-machine")
	data:extend({
		{
			type = "technology",
			name = "fusion-automation",
			icon = "__fusion_machines__/graphics/nuclear-automation.png",
			icon_size = 256,
			effects = {
				{ type = "unlock-recipe", recipe = "fusion-assembling-machine" },
			},
			prerequisites = {
				"fusion-reactor-equipment",
			},
			unit = {
				count = 3000,
				ingredients = {
					{ "automation-science-pack", 1 },
					{ "logistic-science-pack", 1 },
					{ "chemical-science-pack", 1 },
					{ "space-science-pack", 1 },
					{ "production-science-pack", 1 },
					{ "nuclear-science-pack", 1 },
				},
				time = 60,
			},
		},
	})
end
if settings.startup["fusion-lab"].value then
	require("fusion-lab")

	data:extend({
		{
			type = "technology",
			name = "fusion-lab",
			icon = "__fusion_machines__/graphics/fusion_lab/fusion-lab-technology.png",
			icon_size = 390,
			effects = {
				{ type = "unlock-recipe", recipe = "fusion-lab" },
			},
			prerequisites = {
				"fusion-reactor-equipment",
			},
			unit = {
				count = 5000,
				ingredients = {
					{ "automation-science-pack", 1 },
					{ "logistic-science-pack", 1 },
					{ "chemical-science-pack", 1 },
					{ "space-science-pack", 1 },
					{ "production-science-pack", 1 },
					{ "nuclear-science-pack", 1 },
				},
				time = 60,
			},
		},
	})
end
if settings.startup["refillable-fusion-reactor-equipment"].value then
	data.raw["generator-equipment"]["fusion-reactor-equipment"].burner = {
		type = "burner",
		fuel_categories = { "fusion" },
		fuel_inventory_size = 1,
		burnt_inventory_size = 1,
	}
	data.raw["generator-equipment"]["fusion-reactor-equipment"].power = "5MW"
end

if settings.startup["fusion-reactor-and-generator-buff"].value then
	data.raw["fusion-generator"]["fusion-generator"].energy_source.output_flow_limit = "100MW"
	data.raw["fusion-generator"]["fusion-generator"].max_fluid_usage = 4 / second -- at normal quality
	data.raw["fusion-reactor"]["fusion-reactor"].max_fluid_usage = 8 / second -- at normal quality
end
if settings.startup["fusion-fuel-cell-buff"].value then
	for _, item in pairs(data.raw.item) do
		if item.fuel_category ~= nil then
			if item.fuel_category == "fusion" then
				local fuel_value = (util.parse_energy(item.fuel_value) * 2) / 1000000
				item.fuel_value = (tostring(fuel_value) .. "MJ")
			end
		end
	end
end
