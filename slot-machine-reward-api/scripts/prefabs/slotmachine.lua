require "prefabutil"


local prefabs =
{
	"armormarble",
	"armor_sanity",
	"armorsnurtleshell",
	"resurrectionstatue",
	"icestaff",
	"firestaff",
	"telestaff",
	"thulecite",
	"orangestaff",
	"greenstaff",
	"yellowstaff",
	"amulet",
	"blueamulet",
	"purpleamulet",
	"orangeamulet",
	"greenamulet",
	"yellowamulet",
	"redgem",
	"bluegem",
	"orangegem",
	"greengem",
	"purplegem",
	"stafflight",
	"gears",
	"collapse_small",
}

-- weighted_random_choice for bad, ok, good prize lists 
local prizevalues =
{
	bad = 2,
	ok = 3,
	good = 1,
}

local sounds = 
{
	ok = "dontstarve_DLC002/common/slotmachine_mediumresult",
	good = "dontstarve_DLC002/common/slotmachine_goodresult",
	bad = "dontstarve_DLC002/common/slotmachine_badresult",
}

local function SpawnCritter(inst, critter, lootdropper, pt, delay)
	delay = delay or GetRandomWithVariance(1,0.8)
	inst:DoTaskInTime(delay, function() 
		SpawnPrefab("collapse_small").Transform:SetPosition(pt:Get())
		local spawn = lootdropper:SpawnLootPrefab(critter, pt)
		if spawn and spawn.components.combat then
			spawn.components.combat:SetTarget(GetPlayer())
		end
	end)
end

local function SpawnReward(inst, reward, lootdropper, pt, delay)
	delay = delay or GetRandomWithVariance(1,0.8)

	local loots = GetTreasureLootList(reward)
	for k, v in pairs(loots) do
		for i = 1, v, 1 do

			inst:DoTaskInTime(delay, function(inst) 
				local down = TheCamera:GetDownVec()
				local spawnangle = math.atan2(down.z, down.x)
				local angle = math.atan2(down.z, down.x) + (math.random()*90-45)*DEGREES
				local sp = math.random()*3+2
				
				local item = SpawnPrefab(k)
				item:PushEvent("prefabspawn", {prefab = item, prefabtype = k})
				
				if item.components.inventoryitem and not item.components.health then
					local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(2*math.cos(spawnangle), 3, 2*math.sin(spawnangle))
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/slotmachine_reward")
					item.Transform:SetPosition(pt:Get())
					item.Physics:SetVel(sp*math.cos(angle), math.random()*2+9, sp*math.sin(angle))
					item.components.inventoryitem:OnStartFalling()
				else
					local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(2*math.cos(spawnangle), 0, 2*math.sin(spawnangle))
					pt = pt + Vector3(sp*math.cos(angle), 0, sp*math.sin(angle))
					item.Transform:SetPosition(pt:Get())
					SpawnPrefab("collapse_small").Transform:SetPosition(pt:Get())
				end
				
			end)
			delay = delay + 0.25
		end
	end
end



local function PickPrize(inst)

	inst.busy = true
	local prizevalue = weighted_random_choice(prizevalues)
	
	inst.prize = weighted_random_choice(inst.components.rewardmanager:GetRewardTableFromType(prizevalue))
	inst.prizevalue = prizevalue
end

local function DoneSpinning(inst)

	local pos = inst:GetPosition()
	local item = inst.prize
	local doaction = inst.components.rewardmanager:GetAction(item)

	local cnt = (doaction and doaction.cnt) or 1
	local func = (doaction and doaction.callback) or nil
	local radius = (doaction and doaction.radius) or 4
	local treasure = (doaction and doaction.treasure) or nil

	if doaction and doaction.var then
		cnt = GetRandomWithVariance(cnt,doaction.var)
		if cnt < 0 then cnt = 0 end
	end

	if cnt == 0 and func then
		func(inst,item,doaction)
	end

	for i=1,cnt do
		local offset, check_angle, deflected = FindWalkableOffset(pos, math.random()*2*PI, radius , 8, true, false) -- try to avoid walls
		if offset then
			if treasure then
				-- print("Slot machine treasure "..tostring(treasure))
				-- SpawnTreasureLoot(treasure, inst.components.lootdropper, pos+offset)
				-- SpawnPrefab("collapse_small").Transform:SetPosition((pos+offset):Get())
				SpawnReward(inst, treasure)
			elseif func then
				func(inst,item,doaction)
			elseif item == "trinket" then
				SpawnCritter(inst, "trinket_"..tostring(math.random(NUM_TRINKETS)), inst.components.lootdropper, pos+offset)
			elseif item == "nothing" then
				-- do nothing
				-- print("Slot machine says you lose.")
			else
				-- print("Slot machine item "..tostring(item))
				SpawnCritter(inst, item, inst.components.lootdropper, pos+offset)
			end
		end
	end

	-- the slot machine collected more coins
	inst.coins = inst.coins + 1

	--inst.AnimState:PlayAnimation("idle")
	inst.busy = false
	inst.prize = nil
	inst.prizevalue = nil
	
	-- print("Slot machine has "..tostring(inst.coins).." dubloons.")
end

local function StartSpinning(inst)

	inst.sg:GoToState("spinning")
end

local function ShouldAcceptItem(inst, item)
	
	if not inst.busy and item.prefab == "dubloon" then
		return true
	else
		return false
	end
end

local function OnGetItemFromPlayer(inst, giver, item)

	-- print("Slot machine takes your dubloon.")
	giver.components.sanity:DoDelta(-TUNING.SANITY_TINY)

	PickPrize(inst)
	StartSpinning(inst)
end

local function OnRefuseItem(inst, item)
	-- print("Slot machine refuses "..tostring(item.prefab))
end

local function OnLoad(inst,data)
	if not data then
		return
	end
	
	inst.coins = data.coins or 0
	inst.prize = data.prize
	inst.prizevalue = data.prizevalue

	if inst.prize ~= nil then
		StartSpinning(inst)
	end
end

local function OnSave(inst,data)
	data.coins = inst.coins
	data.prize = inst.prize
	data.prizevalue = inst.prizevalue
end

local function OnFloodedStart(inst)
	inst.components.payable:Disable()
end

local function OnFloodedEnd(inst)
	inst.components.payable:Enable()
end

local function CalcSanityAura(inst, observer)
	return -(TUNING.SANITYAURA_MED*(1+(inst.coins/100)))
end

local function CreateSlotMachine(name)
	
	local assets = 
	{
		Asset("ANIM", "anim/slot_machine.zip"),
		Asset("MINIMAP_IMAGE", "slot_machine"),
	}


	local function InitFn(Sim)
		local inst = CreateEntity()
		inst.OnSave = OnSave
		inst.OnLoad = OnLoad

		inst.DoneSpinning = DoneSpinning
		inst.busy = false
		inst.sounds = sounds

		local trans = inst.entity:AddTransform()
		local anim = inst.entity:AddAnimState()
		inst.entity:AddSoundEmitter()
		
		local minimap = inst.entity:AddMiniMapEntity()
		minimap:SetPriority( 5 )
		minimap:SetIcon( "slot_machine.png" )
				
		MakeObstaclePhysics(inst, 0.8, 1.2)
		

		anim:SetBank("slot_machine")
		anim:SetBuild("slot_machine")
		anim:PlayAnimation("idle")

		-- keeps track of how many dubloons have been added
		inst.coins = 0
		
		inst:AddComponent("inspectable")
		inst.components.inspectable.getstatus = function(inst)
			return "WORKING"
		end

		inst:AddComponent("lootdropper")

		inst:AddComponent("payable")
		inst.components.payable:SetAcceptTest(ShouldAcceptItem)
		inst.components.payable.onaccept = OnGetItemFromPlayer
		inst.components.payable.onrefuse = OnRefuseItem

		inst:AddComponent("sanityaura")
    	inst.components.sanityaura.aurafn = CalcSanityAura

		inst:AddComponent("floodable")
		inst.components.floodable.onStartFlooded = OnFloodedStart
		inst.components.floodable.onStopFlooded = OnFloodedEnd
		inst.components.floodable.floodEffect = "shock_machines_fx"
		inst.components.floodable.floodSound = "dontstarve_DLC002/creatures/jellyfish/electric_land"
		
		inst:AddComponent("rewardmanager")
		
		inst:SetStateGraph("SGslotmachine")
		
		return inst
	end

	return Prefab( "common/objects/slotmachine", InitFn, assets, prefabs)

end

return CreateSlotMachine(),
       MakePlacer("common/slotmachine_placer", "slot_machine", "slot_machine", "idle" )

