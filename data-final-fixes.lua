--[[
	See control.lua about stealing my code.

	What you see here is a simple file that disables player crafting.
]]--
local category="ayras-no-crafting-challenge"

data:extend(
  {
    {
      type = "recipe-category",
      name = category
    }
  }
)

data.raw.player.player.crafting_categories = {category}
