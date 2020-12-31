--[[
	Stop stealing, stealing is bad!
	No seriously, feel free to look at this,
	if you are interested in making your own mods, you can take code from here if you wish.
	If you are going to just copy and paste code, please give credit in the forum or a readme file.
	Just add a "Code proudly stolen from AyrA" or something similar.
]]--

-- User Settings
local KEEP_INV= settings.global["basic-kit-keep-inventory"].value
local USE_STEAM=settings.global["basic-kit-use-steam"].value
local ADD_ACCU= settings.global["basic-kit-add-accu"].value

--Stuff we always need
local kit={
	{name="assembling-machine-3",count=1},
	{name="small-electric-pole",count=1}
}

local playerInit={}

-- Add stuff to inventory depending on the settings
if USE_STEAM then
	table.insert(kit,{name="offshore-pump",count=1})
	table.insert(kit,{name="boiler",count=1})
	table.insert(kit,{name="steam-engine",count=1})
else
	table.insert(kit,{name="solar-panel",count=1})
end

if ADD_ACCU then
	table.insert(kit,{name="accumulator",count=1})
end

function handlePlayerInventory(id,items)
	
	local p=game.players[id]
	if(p.controller_type~=defines.controllers.character) then
		log("This entity is still not a player. Ignoring")
		return false
	end
	if not KEEP_INV then
		--clear all player inventories
		for i,v in pairs(defines.inventory) do
			--clear only player related inventories
			if string.len(i)>=7 and string.sub(i,1, 7) == "player_" then
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
		end
	end
	-- We add our items into the main inventory.
	local inv=p.get_inventory(defines.inventory.character_main)
	-- Danymically add items from the 'items' table
	for i,v in pairs(items) do
		inv.insert(v)
	end	
end

script.on_event(defines.events.on_cutscene_cancelled,function(param)
	for i,v in pairs(playerInit) do
		handlePlayerInventory(v,kit)
	end
end)
script.on_event(defines.events.on_player_created,function(param)
	--get the joined player. This makes the code, that follows shorter
	local p=game.players[param.player_index]

	if(p.controller_type~=defines.controllers.character) then
		log("This entity is not a player, trying again later")
		table.insert(playerInit,param.player_index)
		return false
	end
	return true
end)
