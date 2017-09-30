require "util"

local disabledRewards =
{
	goodspawns = {},
	okspawns = {},
	badspawns = {}
}
local rewards =
{
	goodspawns = 
	{
		slot_goldy = 1,
		slot_10dubloons = 1,
		slot_honeypot = 1,
		slot_warrior1 = 1,
		slot_warrior2 = 1,
		slot_warrior3 = 1,
		slot_warrior4 = 1,
		slot_scientist = 1,
		slot_walker = 1,
		slot_gemmy = 1,
		slot_bestgem = 1,
		slot_lifegiver = 1,
		slot_chilledamulet = 1,
		slot_icestaff = 1,
		slot_firestaff = 1,
		slot_coolasice = 1,
		slot_gunpowder = 1,
		slot_firedart = 1,
		slot_sleepdart = 1,
		slot_blowdart = 1,
		slot_speargun = 1,
		slot_coconades = 1,
		slot_obsidian = 1,
		slot_thuleciteclub = 1,
		slot_ultimatewarrior = 1,
		slot_goldenaxe = 1,
		staydry = 1,
		cooloff = 1,
		birders = 1,
		gears =1,
		slot_seafoodsurprise = 1,
		slot_fisherman = 1,
		slot_camper = 1,
		slot_spiderboon = 1,
		slot_dapper = 1,
		slot_speed = 1,
		slot_tailor = 5,
	},
	okspawns =
	{
		slot_anotherspin = 5,
		firestarter = 5,
		geologist = 5,
		cutgrassbunch = 5,
		logbunch = 5,
		twigsbunch = 5,
		slot_torched = 5,
		slot_jelly = 5,
		slot_handyman = 5,
		slot_poop = 5,
		slot_berry = 5,
		slot_limpets = 5,
		slot_bushy = 5,
		slot_bamboozled = 5,
		slot_grassy = 5,
		slot_prettyflowers = 5,
		slot_witchcraft = 5,
		slot_bugexpert = 5,
		slot_flinty = 5,
		slot_fibre = 5,
		slot_drumstick = 5,
		slot_ropey = 5,
		slot_jerky = 5,
		slot_coconutty = 5,
		slot_bonesharded = 5,
	},
	badspawns =
	{
		slot_spiderattack = 1,
		slot_mosquitoattack = 1,
		slot_snakeattack = 1,
		slot_monkeysurprise = 1,
		slot_poisonsnakes = 1,
		slot_hounds = 1,
	}
}
local actions =
{
	firestarter = { treasure = "firestarter", },
	geologist = { treasure = "geologist", },
	cutgrassbunch = { treasure = "3cutgrass", },
	logbunch = { treasure = "3logs", },
	twigsbunch = { treasure = "3twigs", },
	slot_torched = { treasure = "slot_torched", },
	slot_jelly = { treasure = "slot_jelly", },
	slot_handyman = { treasure = "slot_handyman", },
	slot_poop = { treasure = "slot_poop", },
	slot_berry = { treasure = "slot_berry", },
	slot_limpets = { treasure = "slot_limpets", },
	slot_seafoodsurprise = { treasure = "slot_seafoodsurprise", },
	slot_bushy = { treasure = "slot_bushy", },
	slot_bamboozled = { treasure = "slot_bamboozled", },
	slot_grassy = { treasure = "slot_grassy", },
	slot_prettyflowers = { treasure = "slot_prettyflowers", },
	slot_witchcraft = { treasure = "slot_witchcraft", },
	slot_bugexpert = { treasure = "slot_bugexpert", },
	slot_flinty = { treasure = "slot_flinty", },
	slot_fibre = { treasure = "slot_fibre", },
	slot_drumstick = { treasure = "slot_drumstick", },
	slot_fisherman = { treasure = "slot_fisherman", },
	slot_dapper = { treasure = "slot_dapper", },
	slot_speed = { treasure = "slot_speed", },
	
	slot_anotherspin = { treasure = "slot_anotherspin", },
	slot_goldy = { treasure = "slot_goldy", },
	slot_honeypot = { treasure = "slot_honeypot", },
	slot_warrior1 = { treasure = "slot_warrior1", },
	slot_warrior2 = { treasure = "slot_warrior2", },
	slot_warrior3 = { treasure = "slot_warrior3", },
	slot_warrior4 = { treasure = "slot_warrior4", },
	slot_scientist = { treasure = "slot_scientist", },
	slot_walker = { treasure = "slot_walker", },
	slot_gemmy = { treasure = "slot_gemmy", },
	slot_bestgem = { treasure = "slot_bestgem", },
	slot_lifegiver = { treasure = "slot_lifegiver", },
	slot_chilledamulet = { treasure = "slot_chilledamulet", },
	slot_icestaff = { treasure = "slot_icestaff", },
	slot_firestaff = { treasure = "slot_firestaff", },
	slot_coolasice = { treasure = "slot_coolasice", },
	slot_gunpowder = { treasure = "slot_gunpowder", },
	slot_firedart = { treasure = "slot_firedart", },
	slot_sleepdart = { treasure = "slot_sleepdart", },
	slot_blowdart = { treasure = "slot_blowdart", },
	slot_speargun = { treasure = "slot_speargun", },
	slot_coconades = { treasure = "slot_coconades", },
	slot_obsidian = { treasure = "slot_obsidian", },
	slot_thuleciteclub = { treasure = "slot_thuleciteclub", },
	slot_ultimatewarrior = { treasure = "slot_ultimatewarrior", },
	slot_goldenaxe = { treasure = "slot_goldenaxe", },
	staydry = { treasure = "staydry", },
	cooloff = { treasure = "cooloff", },
	birders = { treasure = "birders", },
	slot_monkeyball = { treasure = "slot_monkeyball", },
	
	slot_bonesharded = { treasure = "slot_bonesharded", },
	slot_jerky = { treasure = "slot_jerky", },
	slot_coconutty = { treasure = "slot_coconutty", },
	slot_camper = { treasure = "slot_camper", },
	slot_ropey = { treasure = "slot_ropey", },
	slot_tailor = { treasure = "slot_tailor", },
	slot_spiderboon = { treasure = "slot_spiderboon", },
	slot_3dubloons = { treasure = "3dubloons", },
	slot_10dubloons = { treasure = "10dubloons", },
	
	slot_spiderattack = { treasure = "slot_spiderattack", },
	slot_mosquitoattack = { treasure = "slot_mosquitoattack", },
	slot_snakeattack = { treasure = "slot_snakeattack", },
	slot_monkeysurprise = { treasure = "slot_monkeysurprise", },
	slot_poisonsnakes = { treasure = "slot_poisonsnakes", },
	slot_hounds = { treasure = "slot_hounds", },
	slot_snakeattack = { treasure = "slot_snakeattack", },
	slot_snakeattack = { treasure = "slot_snakeattack", },
	slot_snakeattack = { treasure = "slot_snakeattack", },
}

local RewardManager = Class(function(self, inst)
	self.inst = inst
end)

-- Get the reward table type from the string type
-- @param t : [String] The type (good|ok|bad)
-- @return [Table] The reward table or nil if the given type is invalid
function RewardManager:GetRewardTableFromType(t)
	return rewards[t.."spawns"]
end

-- Get the action to do from the reward name
-- @param key : [String] An existing key of a reward table
-- @return [Table] The action to do or nil if the given key not exists
function RewardManager:GetAction(key)
	if actions[key] then
		return actions[key]
	end
	
	return nil
end

-- Add a reward to the  reward manager
-- @param key        : [String]  The reward name, used as a key in reward table
-- @param rewardtype : [String]  The reward type (good|ok|bad)
-- @param weight     : [Integer] The probability to be picked, bigger value mean more probable
-- @param action     : [Table]   The action to do when picked
function RewardManager:AddReward(key, rewardtype, weight, action)
	self:GetRewardTableFromType(rewardtype)[key] = weight
	actions[key] = action
end

-- Disable a reward
-- @param rewardtype : [String] The reward type (good|ok|bad)
-- @param key        : [String] An existing key of a reward table
function RewardManager:DisableReward(rewardtype, key)
	if self:GetRewardTableFromType(rewardtype)[key] and disabledRewards[rewardtype.."spawns"] then
		table.setfield(disabledRewards[rewardtype.."spawns"], key, self:GetRewardTableFromType(rewardtype)[key])
		self:GetRewardTableFromType(rewardtype)[key] = nil
	end
end

-- Enable a reward
-- @param rewardtype : [String] The reward type (good|ok|bad)
-- @param key        : [String] An existing key of the disabled rewards table
function RewardManager:EnableReward(rewardtype, key)
	if disabledRewards[rewardtype.."spawns"] and disabledRewards[rewardtype.."spawns"][key] then
		table.setfield(self:GetRewardTableFromType(rewardtype), key, disabledRewards[rewardtype.."spawns"][key])
		disabledRewards[rewardtype.."spawns"][key] = nil
	end
end

-- Check if a reward is enabled
-- @param rewardtype : [String] The reward type (good|ok|bad)
-- @param key        : [String] An existing key of the disabled rewards table
-- @return [Boolean] true|false
function RewardManager:isEnabled(rewardtype, key)
	return disabledRewards[rewardtype.."spawns"][key] == nil and not(self:GetRewardTableFromType(rewardtype)[key] == nil)
end

return RewardManager