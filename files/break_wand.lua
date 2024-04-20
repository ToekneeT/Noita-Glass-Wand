dofile_once("data/scripts/gun/procedural/gun_action_utils.lua")
dofile_once("data/scripts/lib/coroutines.lua")
dofile("data/scripts/lib/utilities.lua")

-- Gets the player so that we can check which wands they're currently holding.
function get_player()
  local players = get_players()
  if players then
    return players[1]
  end

  -- Player is dead
  return nil
end

local player = get_player()
local break_chance = ModSettingGet("GlassWands.intact_chance")

function damage_received( damage, message, entity_thats_responsible, is_fatal  )
	-- Currently held wand of the player.
	local wand = find_the_wand_held(player)
	-- Player can sometimes not be holding a wand, such as a potion.
	-- find_the_wand_held is only greater than 0 if it's a wand.
	if wand ~= 0 then
		-- break_chance is configurable in the mod settings.
		-- Default is 8, meaning a 1/8 chance the wand breaks when hit.
		-- Configurable to two digits, so the lowest chance the that can be
		-- set is 1/99.
		if (Random(1,break_chance) == 1) then
			local x, y = EntityGetTransform( player );
			GamePlaySound( "data/audio/Desktop/materials.bank", "collision/lantern/destroy", x, y )
			EntityKill(wand)
		end
	end
end