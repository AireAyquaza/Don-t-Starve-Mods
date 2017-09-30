-- Slot Machine Reward API
-- Adding reward template

local DependencyScreen = GLOBAL.require "screens/dependencyscreen"

if GLOBAL.KnownModIndex:IsModEnabled("slot-machine-reward-api") then
	
	-- Creating new loots
	local newLoots =
	{
		["slot_yourrewardslot_1"] =
		{
			loot =
			{
				item1 = quantity1, -- replace item by the prefab name in the game and quantity by the amount
				item2 = quantity2, -- replace item by the prefab name in the game and quantity by the amount
			}
		},
		["slot_yourrewardslot_2"] =
		{
			loot =
			{
				item1 = quantity1, -- replace item by the prefab name in the game and quantity by the amount
				item2 = quantity2, -- replace item by the prefab name in the game and quantity by the amount
				item3 = quantity3, -- replace item by the prefab name in the game and quantity by the amount
				item4 = quantity4, -- replace item by the prefab name in the game and quantity by the amount
			}
		}
	}
	
	-- Adding new loots into loot table
	for name, data in pairs(newLoots) do
		AddTreasureLoot(name, data)
	end
	
	-- Adding new reward into the slot machine's rewardmanager
	AddPrefabPostInit("slotmachine", function(inst)
		if inst.components.rewardmanager then
			inst.components.rewardmanager:AddReward("slot_yourrewardslot_1", "ok", 2, {treasure = "slot_yourrewardslot_1"})
			inst.components.rewardmanager:AddReward("slot_yourrewardslot_2", "good", 1, {treasure = "slot_yourrewardslot_2"})
		end
	end)
	
else -- Missing dependency
	-- Showing dependency message screen
	AddSimPostInit(function(inst)
		GLOBAL.TheFrontEnd:PushScreen(
			DependencyScreen("Your mod name", "Missing dependency mod : Slot Machine API.")
		)
	end)
end