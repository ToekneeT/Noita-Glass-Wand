dofile_once("data/scripts/lib/utilities.lua")

-- Inserts the glass wand perk into the perk list.
table.insert( perk_list,
{
		id = "GLASS_WAND",
		ui_name = "Glass wand",
		ui_description = "Wands do more damage, but has chance to break when hit",
		ui_icon = "data/ui_gfx/perks/glass_wand.png",
		perk_icon = "data/ui_gfx/perks/glass_wand.png",
		stackable = STACKABLE_NO,
		usable_by_enemies = true,
		func = function( entity_perk_item, entity_who_picked, item_name )
			-- Runs the script that manipulates the damage output.
			EntityAddComponent( entity_who_picked, "LuaComponent", 
			{ 
				script_shot = "mods/glass_wand/files/glass_wand.lua",
				execute_every_n_frame = "-1",
			})
			-- Runs the script when the player takes damage, runs a random chance to break
			-- the wand as well.
	        EntityAddComponent( entity_who_picked, "LuaComponent", {
	            script_damage_received = "mods/glass_wand/files/break_wand.lua",
	            -- execute_every_n_frame = "-1",
	        })
		end,
})