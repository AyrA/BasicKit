--[[
	Stop stealing, stealing is bad!
	No seriously, feel free to look at this,
	if you are interested in making your own mods, you can take code from here if you wish.
	If you are going to just copy and paste code, please give credit in the forum or a readme file.
	Just add a "Code proudly stolen from AyrA" or something similar.
]]--

-- User Settings
local ADD_ORE=   settings.global["basic-kit-add-ore"].value
local ADD_AXE=   settings.global["basic-kit-add-axe"].value
local ADD_BASICS=settings.global["basic-kit-add-basics"].value
local USE_STEAM= settings.global["basic-kit-use-steam"].value
local ADD_ACCU=  settings.global["basic-kit-add-accu"].value

--Stuff we always need
local kit={
	{name="assembling-machine-3",count=1},
	{name="small-electric-pole",count=1}
}

-- Add stuff to inventory depending on the settings
if USE_STEAM then
	table.insert(kit,{name="offshore-pump",count=1})
	table.insert(kit,{name="boiler",count=1})
	table.insert(kit,{name="steam-engine",count=1})
else
	table.insert(kit,{name="solar-panel",count=1})
end

if ADD_ORE then
	table.insert(kit,{name="iron-ore",count=4})
end

if ADD_BASICS then
	table.insert(kit,{name="burner-mining-drill",count=1})
	table.insert(kit,{name="stone-furnace",count=1})
end

if ADD_ACCU then
	table.insert(kit,{name="accumulator",count=1})
end

script.on_event(defines.events.on_player_created,function(param)
	--get the joined player. This makes the code, that follows shorter
	local p=game.players[param.player_index]

	--clear all player inventories
	for i,v in pairs(defines.inventory) do
		--[[
			pcall prevents lua from crashing.
			If you are familiar with other languages,
			pcall is essentially this:

			try
			{
				your_function();
				return true;
			}
			catch
			{
				return false;
			}

			In other words, it returns false, if the call crashed.
			I use it, because there is no way of checking,
			if a player has a certain inventory.
			For example the trash slots are only available,
			if they have been researched.
			If a player joins before this research,
			which is true for the first player at least,
			then get_inventory(...) will crash instead of returning nil.
			I will gladly accept solutions around this problem.

			Reference: http://www.lua.org/manual/5.1/manual.html#pdf-pcall
		]]--
		pcall(function()
			p.get_inventory(v).clear()
		end)
	end
	-- We add our items into the quickbar.
	local inv=p.get_inventory(defines.inventory.player_quickbar)
	-- Danymically add items from the 'kit' table
	for i,v in pairs(kit) do
		inv.insert(v)
	end
	-- If we give the player a pickaxe, we add it into the correct slot.
	if ADD_AXE then
		p.get_inventory(defines.inventory.player_tools).insert({name="iron-axe",count=1})
	end
end)

