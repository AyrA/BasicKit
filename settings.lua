--[[
	Settings
	They are all runtime global because server sync
]]--

data:extend({
    {
		-- Iron ore
        type = "bool-setting",
        name = "basic-kit-add-ore",
		localised_name = "Add 4 iron ore to inventory",
		localised_description = "Adds 4 raw iron ore so the player doesn't needs to mine them.",
        setting_type = "runtime-global",
        default_value = false,
		order = 1
    },
    {
		-- Pickaxe
        type = "bool-setting",
        name = "basic-kit-add-axe",
		localised_name = "Add pickaxe to inventory",
		localised_description = "Start the game with a pickaxe. Has no effect if 'Don't clear Inventory' is enabled.",
        setting_type = "runtime-global",
        default_value = false,
		order = 2
    },
    {
		-- Don't clear Inventory
        type = "bool-setting",
        name = "basic-kit-keep-inventory",
		localised_name = "Don't clear Inventory",
		localised_description = "Enable this option to keep all items inserted by other mods and the base game.",
        setting_type = "runtime-global",
        default_value = false,
		order = 3
    },
    {
		-- Steam engine
        type = "bool-setting",
        name = "basic-kit-use-steam",
		localised_name = "Use steam engine",
		localised_description = "Start with a steam engine, boiler and offshore pump instead of a solar panel.",
        setting_type = "runtime-global",
        default_value = false,
		order = 4
    },
    {
		-- Accumulator
        type = "bool-setting",
        name = "basic-kit-add-accu",
		localised_name = "Add accumulator to inventory",
		localised_description = "The accumulator allows the player to run the assembly machine at night if using solar.",
        setting_type = "runtime-global",
        default_value = false,
		order = 5
    }
})
