KnownModIndex = GLOBAL.KnownModIndex

-- workshop-196994731 = wall gates
-- workshop-521704888 = wall regen

-- Check if Wall Regen is enabled
if (KnownModIndex:IsModEnabled("workshop-521704888")) then
	local HEALTH_REGEN = GLOBAL.GetModConfigData("health_regen", "workshop-521704888")
	local REGEN_DELTA = GLOBAL.GetModConfigData("regen_value", "workshop-521704888")
	local WALL_UNDEPLOYABLE = GLOBAL.GetModConfigData("wall_undeployable", "workshop-521704888")
	
	if (KnownModIndex:IsModEnabled("workshop-196994731")) then
		
		if HEALTH_REGEN == 1 then
			local function regen( inst )
				inst:DoPeriodicTask(5, function( inst )
					local wall_health = inst.components.health:GetPercent()
					if wall_health < 1 then
						inst.components.health:DoDelta(REGEN_DELTA)
					end
				end)
			end
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
			--for mech_hay
			AddPrefabPostInit("mech_hay", function(inst)
				local function turnon(inst)
					inst.on = true
					inst:Remove()
					GLOBAL.SpawnPrefab("mech_hay_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
				inst:AddComponent("machine")
				inst.components.machine.turnonfn = turnon
			end)
			--for mech_wood
			AddPrefabPostInit("mech_wood", function(inst)
				local function turnon(inst)
					inst.on = true
					inst:Remove()
					GLOBAL.SpawnPrefab("mech_wood_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
				inst:AddComponent("machine")
				inst.components.machine.turnonfn = turnon
			end)
			--for mech_stone
			AddPrefabPostInit("mech_stone", function(inst)
				local function turnon(inst)
					inst.on = true
					inst:Remove()
					GLOBAL.SpawnPrefab("mech_stone_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
				inst:AddComponent("machine")
				inst.components.machine.turnonfn = turnon
			end)
			-- for mech_ruins
			AddPrefabPostInit("mech_ruins", function(inst)
				local function turnon(inst)
					inst.on = true
					inst:Remove()
					GLOBAL.SpawnPrefab("mech_ruins_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
				inst:AddComponent("machine")
				inst.components.machine.turnonfn = turnon
			end)
			--for mech_moonrock
			AddPrefabPostInit("mech_moonrock", function(inst)
				local function turnon(inst)
					inst.on = true
					inst:Remove()
					GLOBAL.SpawnPrefab("mech_moonrock_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
				inst:AddComponent("machine")
				inst.components.machine.turnonfn = turnon
			end)
			
			--for locked_mech_moonrock
			AddPrefabPostInit("locked_mech_moonrock", function(inst)
				local function turnon(inst)
					inst.on = true
					inst:Remove()
					GLOBAL.SpawnPrefab("locked_mech_moonrock_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
				inst:AddComponent("machine")
				inst.components.machine.turnonfn = turnon
			end)
			--for locked_mech_stone
			AddPrefabPostInit("locked_mech_stone", function(inst)
				local function turnon(inst)
					inst.on = true
					inst:Remove()
					GLOBAL.SpawnPrefab("locked_mech_stone_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
				inst:AddComponent("machine")
				inst.components.machine.turnonfn = turnon
			end)
			--for locked_mech_ruins
			AddPrefabPostInit("locked_mech_ruins", function(inst)
				local function turnon(inst)
					inst.on = true
					inst:Remove()
					GLOBAL.SpawnPrefab("locked_mech_ruins_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
				inst:AddComponent("machine")
				inst.components.machine.turnonfn = turnon
			end)
		end
	end
end