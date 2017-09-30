local DependencyScreen = GLOBAL.require "screens/dependencyscreen"

-- Check if the dependency is enabled (Slot Machine Reward API)
if GLOBAL.KnownModIndex:IsModEnabled("slot-machine-reward-api") then
	
	-- Creating new loots
	local addedSlotMachineReward =
	{
		["slot_treasurebottle"] = 
		{
			loot = 
			{
				messagebottle = GetModConfigData("bottle_amount"),
				goldenshovel = 1,
			}
		}
	}
	
	-- Adding new loots into loot table
	for name, data in pairs(addedSlotMachineReward) do
		AddTreasureLoot(name, data)
	end
	
	-- Adding new reward into the slot machine's rewardmanager
	AddPrefabPostInit("slotmachine", function(inst)
		if inst.components.rewardmanager then
			inst.components.rewardmanager:AddReward("slot_treasurebottle", GetModConfigData("reward_type"), GetModConfigData("reward_weight"), {treasure = "slot_treasurebottle"})
		end
	end)

	AddPrefabPostInit("messagebottle", function(inst)
		inst:AddComponent("messagebottlegenerator")
		
		inst:ListenForEvent("prefabspawn", function(inst, data)
			if inst.treasure == nil and inst.treasureguid == nil and inst.components.messagebottlegenerator then
				inst.treasure = inst.components.messagebottlegenerator:GenerateChest()
				inst.treasureguid = inst.treasure.GUID
			end
		end)
	end)

else -- Missing dependency
	-- Showing dependency message screen
	AddSimPostInit(function(inst)
		GLOBAL.TheFrontEnd:PushScreen(
			DependencyScreen("Message in a bottle reward for slot machine", "Missing dependency mod : Slot Machine API.")
		)
	end)
end