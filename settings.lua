dofile("data/scripts/lib/mod_settings.lua")

function mod_setting_change_callback( mod_id, gui, in_main_menu, setting, old_value, new_value  )
	print( tostring(new_value) )
end

local mod_id = "GlassWands"
mod_settings_version = 1
mod_settings = 
{
  
  {
    id = "intact_chance",
    ui_name = "Break Chance",
    ui_description = "Chance the wand breaks when getting hit. 1 / n where n's default is 8.\n Meaning, lower number = higher chance of breaking.",
    value_default = "8",
  	text_max_length = 2,
  	allowed_characters = "0123456789",
    scope = MOD_SETTING_SCOPE_NEW_GAME,
  },

  {
    id = "start_with",
    ui_name = "Start With Glass Wand",
    ui_description = "Start the run with Glass Wand.",
    value_default = false,
    scope = MOD_SETTING_SCOPE_NEW_GAME,
  },
 
}

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id )
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end
