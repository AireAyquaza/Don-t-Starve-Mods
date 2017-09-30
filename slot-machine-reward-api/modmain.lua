PrefabsFiles =
{
	"slotmachine"
}

AddPrefabPostInit("slotmachine", function(inst)
	if inst.components.rewardmanager then
		for k,_ in pairs(inst.components.rewardmanager:GetRewardTableFromType("good")) do
			if not(k == "slot_treasurebottle") then
				print("Disabling reward : "..k)
				inst.components.rewardmanager:DisableReward("good", k)
			end
		end
	end
end)