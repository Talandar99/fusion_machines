data:extend({
	{
		type = "bool-setting",
		name = "refillable-fusion-reactor-equipment",
		setting_type = "startup",
		default_value = true,
		order = "fusion_machines-a",
	},
	{
		type = "bool-setting",
		name = "fusion-assembling-machine",
		setting_type = "startup",
		default_value = true,
		order = "fusion_machines-b",
	},
	{
		type = "bool-setting",
		name = "fusion-lab",
		setting_type = "startup",
		default_value = true,
		order = "fusion_machines-c",
	},
})

if mods["skewer_planet_vesta"] then
	local function force_setting(setting_type, setting_name, value)
		local setting = data.raw[setting_type .. "-setting"][setting_name]
		if setting then
			if setting_type == "bool" then
				setting.forced_value = value
			else
				setting.allowed_values = { value }
			end
			setting.default_value = value
			setting.hidden = true
		end
	end
	force_setting("bool", "ske_vesta_legacy_recipes", true)
end
