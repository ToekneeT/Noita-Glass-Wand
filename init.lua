ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/glass_wand/files/add_glass_wand.lua" )

dofile_once("data/scripts/perks/perk.lua")
local LOAD_KEY = "GlassWands_FIRST_LOAD_DONE"
function OnPlayerSpawned(player_entity)
	-- Run this in order to run the init code only once.
	-- Otherwise, restarting the game gives the player the glass wand
	-- perk over and over.
    if GlobalsGetValue(LOAD_KEY, "0") == "1" then
    	return
    end
    GlobalsSetValue(LOAD_KEY, "1")
	-- Checks if the mod should start with glass wand.
    local start = ModSettingGet("GlassWands.start_with")
    if start == true then
	    -- Simply spawn the entity in world at the player's location
	    local x, y = EntityGetTransform(player_entity)
	    local perk = perk_spawn(x, y, "GLASS_WAND")
	    -- To pick up the perk instantly, you can continue:
	    perk_pickup(perk, player_entity, EntityGetName(perk), false, false)
	end
end