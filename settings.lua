--[[
	Settings
	They are all runtime global because server sync
]]--

data:extend({
    {
		-- Don't clear Inventory
        type = "bool-setting",
        name = "basic-kit-keep-inventory",
		localised_name = "Don't clear Inventory",
		localised_description = "Enable this option to keep all items inserted by other mods and the base game.",
        setting_type = "runtime-global",
        default_value = true,
		order = 1
    },
    {
		-- Steam engine
        type = "bool-setting",
        name = "basic-kit-use-steam",
		localised_name = "Use steam engine",
		localised_description = "Start with a steam engine, boiler and offshore pump instead of a solar panel.",
        setting_type = "runtime-global",
        default_value = false,
		order = 2
    },
    {
		-- Accumulator
        type = "bool-setting",
        name = "basic-kit-add-accu",
		localised_name = "Add accumulator to inventory",
		localised_description = "The accumulator allows the player to run the assembly machine at night if using solar.",
        setting_type = "runtime-global",
        default_value = false,
		order = 3
    }
})
