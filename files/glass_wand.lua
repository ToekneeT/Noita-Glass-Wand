dofile_once("data/scripts/lib/utilities.lua")

function shot( entity_id )
	local comps = EntityGetComponent( entity_id, "ProjectileComponent" )
	if( comps ~= nil ) then
		-- Changes how much damage the wand does. Currently 4x as much damage than normal.
		for i,comp in ipairs(comps) do
			local damage = ComponentGetValue2( comp, "damage" )
			damage = damage * 4.0
			ComponentSetValue2( comp, "damage", damage )

			-- Changes how much explosion radius the spell does, currently at 2x explosion radius.
			local dtypes = { "projectile", "explosion", "melee", "ice", "slice", "electricity", "radioactive", "drill", "fire" }
			for a,b in ipairs(dtypes) do
				local v = tonumber(ComponentObjectGetValue( comp, "damage_by_type", b ))
				v = v * 2
				ComponentObjectSetValue( comp, "damage_by_type", b, tostring(v) )
			end
		end
	end
end