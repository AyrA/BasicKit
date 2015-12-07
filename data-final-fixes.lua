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

-- Add substrings here, that when found, exclude the category from the list.
local exceptions=
{
	"oil-",
	"liquid",
	"smelt",
	"fluid",
	"chemistry",
	"mine-",
	"mining"
}
-- Determines all possible categories
local categories={}

--[[

These functions were used for debugging only,
but are still here if you need to debug.
They are taken from http://lua-users.org/wiki/TableUtils

function table.val_to_str(v)
	if "string"==type(v) then
		v=string.gsub(v,"\n","\\n")
		if string.match(string.gsub(v,"[^'\"]",""),'^"+$') then
			return "'" .. v .. "'"
		end
		return '"' .. string.gsub(v,'"','\\"') .. '"'
	else
		return "table"==type(v) and table.tostring(v) or tostring(v)
	end
end

function table.key_to_str(k)
	if "string"==type(k) and string.match(k,"^[_%a][_%a%d]*$") then
		return k
	else
		return "[" .. table.val_to_str(k) .. "]"
	end
end

function table.tostring(tbl)
	local result,done={},{}
	for k,v in ipairs(tbl) do
		table.insert(result,table.val_to_str(v))
		done[k]=true
	end
	for k,v in pairs(tbl) do
		if not done[k] then
			table.insert(result,table.key_to_str(k) .. "=" .. table.val_to_str(v))
		end
	end
	return "{" .. table.concat(result,",") .. "}"
end
]]--

-- add categories, we want to change
for i,v in pairs(data.raw["recipe-category"]) do
	local add=true
	for j,w in pairs(exceptions) do
		if string.find(i,w) then add=false end
	end
	categories[i]=add
end

for i,v in pairs(data.raw.recipe) do
	-- Enable all items for debugging purposes
	if DEBUG then
		v.enabled=true
	end
	-- check if hand-craftable, and if so, make it machine only
	if v.category==nil or categories[v.category] then
	--if v.category=="crafting" or v.category==nil then
		v.category="advanced-crafting"
	end
end

