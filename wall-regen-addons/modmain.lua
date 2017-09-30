KnownModIndex = GLOBAL.KnownModIndex

-- workshop-196994731 = wall gates
-- workshop-521704888 = wall regen

-- Check if Wall Regen is enabled
if (KnownModIndex:IsModEnabled("workshop-521704888")) then
	local HEALTH_REGEN = GLOBAL.GetModConfigData("health_regen", "workshop-521704888")
	local REGEN_DELTA = GLOBAL.GetModConfigData("regen_value", "workshop-521704888")
	local WALL_UNDEPLOYABLE = GLOBAL.GetModConfigData("wall_undeployable", "workshop-521704888")
	
	function regen( inst )
		inst:DoPeriodicTask(5, function( inst )
			local wall_health = inst.components.health:GetPercent()
			if wall_health < 1 then
				inst.components.health:DoDelta(REGEN_DELTA)
			end
		end)
	end
	
	-- SW Walls
	if not TUNING.SNAKESKINHAT_PERISHTIME == nil then
		AddPrefabPostInit("wall_limestone", regen)
		AddPrefabPostInit("sandbagsmall", regen)
	end
	
	if (KnownModIndex:IsModEnabled("workshop-196994731")) then
		
		if HEALTH_REGEN == 1 then
			AddPrefabPostInit("mech_hay", regen)
			AddPrefabPostInit("mech_stone", regen)
			AddPrefabPostInit("mech_wood", regen)
			AddPrefabPostInit("mech_ruins", regen)
			AddPrefabPostInit("mech_moonrock", regen)
			
			AddPrefabPostInit("locked_mech_moonrock", regen)
			AddPrefabPostInit("locked_mech_stone", regen)
			AddPrefabPostInit("locked_mech_ruins", regen)
		end
		
		if WALL_UNDEPLOYABLE == 1 then
			
			local function fn(inst, itemName)
				local function turnon(inst)
					inst.on = true
					inst:Remove()
					GLOBAL.SpawnPrefab(itemName).Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
				inst:AddComponent("machine")
				inst.components.machine.turnonfn = turnon
			end
			
			AddPrefabPostInit("mech_hay", fn(inst, "mech_hay_item"))
			AddPrefabPostInit("mech_wood", fn(inst, "mech_wood_item"))
			AddPrefabPostInit("mech_stone", fn(inst, "mech_stone_item"))
			AddPrefabPostInit("mech_ruins", fn(inst, "mech_ruins_item"))
			AddPrefabPostInit("mech_moonrock", fn(inst, "mech_moonrock_item"))
			
			AddPrefabPostInit("locked_mech_moonrock", fn(inst, "locked_mech_moonrock_item"))
			AddPrefabPostInit("locked_mech_stone", fn(inst, "locked_mech_stone_item"))
			AddPrefabPostInit("locked_mech_ruins", fn(inst, "locked_mech_ruins_item"))
		end
	end
end