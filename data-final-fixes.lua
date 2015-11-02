--[[
	See control.lua about stealing my code.

	What you see here is a simple file,
	that will loop through all recipes and make them assembler crafting only.
	This is done by simply setting the category to 'advanced-crafting'.

	Only set the new category if it either
	A) is 'crafting'
	B) has no category (which is equal to 'crafting')
]]--

-- Setting this to 'true' enables all items from the start,
-- without enabling the research.
local DEBUG=false


for i,v in pairs(data.raw.recipe) do
	-- Enable all items for debugging purposes
	if DEBUG then
		v.enabled=true
	end
	-- check if hand-craftable, and if so, make it machine only
	if v.category=="crafting" or v.category==nil then
		v.category="advanced-crafting"
	end
end
