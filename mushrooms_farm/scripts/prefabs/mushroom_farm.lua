require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/mushroom_farm.zip"),
    Asset("ANIM", "anim/mushroom_farm_red_build.zip"),
    Asset("ANIM", "anim/mushroom_farm_green_build.zip"),
    Asset("ANIM", "anim/mushroom_farm_blue_build.zip"),
    Asset("ATLAS", "images/inventoryimages/mushroom_farm.xml"),
    Asset("IMAGES", "images/inventoryimages/mushroom_farm.tex"),
}

local prefabs =
{
    "red_cap",
    "green_cap",
    "blue_cap",
    "collapse_small",
}

local levels =
{
    { amount=6, grow="mushroom_4", idle="mushroom_4_idle", hit="hit_mushroom_4" },  -- this can only be reached by starting with spores
    { amount=4, grow="mushroom_3", idle="mushroom_3_idle", hit="hit_mushroom_3" },  -- max for starting with mushrooms
    { amount=2, grow="mushroom_2", idle="mushroom_2_idle", hit="hit_mushroom_2" },
    { amount=1, grow="mushroom_1", idle="mushroom_1_idle", hit="hit_mushroom_1" },
    { amount=0, idle="idle", hit="hit_idle" }
}

local FULLY_REPAIRED_WORKLEFT = 3

local function DoMushroomOverrideSymbol(inst, product)
    inst.AnimState:OverrideSymbol("swap_mushroom", "mushroom_farm_"..(string.split(product, "_")[1]).."_build", "swap_mushroom")
end

local function StartGrowing(inst, product)
    if inst.components.harvestable ~= nil then
        local max_produce = levels[1].amount or levels[2].amount
        local productname = product.prefab

        DoMushroomOverrideSymbol(inst, productname)

        inst.components.harvestable:SetProduct(productname, max_produce)
        inst.components.harvestable:SetGrowTime(TUNING.MUSHROOMFARM_FULL_GROW_TIME / max_produce)
        inst.components.harvestable:Grow()
    end
end

local function setlevel(inst, level, dotransition)
    if not inst:HasTag("burnt") then
        if inst.anims == nil then
            inst.anims = {}
        end
        if inst.anims.idle == level.idle then
            dotransition = false
        end
        
        inst.anims.idle = level.idle
        inst.anims.hit = level.hit

        if inst.remainingharvests == 0 then
            inst.anims.idle = "expired"
            inst.components.trader:Enable()
            inst.components.harvestable:SetGrowTime(nil)
            inst.components.workable:SetWorkLeft(1)
        elseif GetSeasonManager():IsWinter() or GetSeasonManager():IsWetSeason() then
            inst.components.trader:Disable()
        elseif inst.components.harvestable:CanBeHarvested() then
            inst.components.trader:Disable()
        else
            inst.components.trader:Enable()
            inst.components.harvestable:SetGrowTime(nil)
        end

        if dotransition then
			print(level.grow)
            inst.AnimState:PlayAnimation(level.grow)--crash here
            inst.AnimState:PushAnimation(inst.anims.idle, false)
			--les sons n'existent pas
            --inst.SoundEmitter:PlaySound(level ~= levels[1] and "dontstarve/common/together/mushroomfarm/grow" or "dontstarve/common/together/mushroomfarm/spore_grow")
        else
            inst.AnimState:PlayAnimation(inst.anims.idle)
        end
        
    end
end

local function updatelevel(inst, dotransition)
    if not inst:HasTag("burnt") then
        if GetSeasonManager():IsWinter() or GetSeasonManager():IsWetSeason() then
            if inst.components.harvestable:CanBeHarvested() then
                for i= 1,inst.components.harvestable.produce do
                    inst.components.lootdropper:SpawnLootPrefab("spoiled_food")
                end

                inst.components.harvestable.produce = 0
                inst.components.harvestable:StopGrowing()
                inst.remainingharvests = inst.remainingharvests - 1
            end
        end

        for k, v in pairs(levels) do
            if inst.components.harvestable.produce >= v.amount then
                setlevel(inst, v, dotransition)
                break
            end
        end
    end
end

local function onharvest(inst, picker)
    if not inst:HasTag("burnt") then
        inst.remainingharvests = inst.remainingharvests - 1
        updatelevel(inst)
    end
end

local function ongrow(inst, produce)
    updatelevel(inst, true)
end

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end

    inst.components.lootdropper:DropLoot()

    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    
    inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation(inst.anims.hit)
        inst.AnimState:PushAnimation(inst.anims.idle, false)
    end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle", false)
	--le son suivant n'existe pas
    --inst.SoundEmitter:PlaySound("dontstarve/common/together/mushroomfarm/craft")
end

local function getstatus(inst)
    if inst.components.harvestable == nil then
        return nil
    end

    return inst.remainingharvests == 0 and "ROTTEN"
			or (GetSeasonManager():IsWinter() or GetSeasonManager():IsWetSeason()) and "SNOWCOVERED"
            or inst.components.harvestable.produce == levels[1].amount and "LOTS"
            or inst.components.harvestable:CanBeHarvested() and "SOME"
            or "EMPTY"
end

local function lootsetfn(lootdropper)
    local inst = lootdropper.inst

    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) or (not inst.components.harvestable:CanBeHarvested()) then
        return
    end

    local loot = {}
    for i= 1,inst.components.harvestable.produce do
        table.insert(loot, inst.components.harvestable.product)
    end
    lootdropper:SetLoot(loot)
end

local function onburnt(inst)
    DefaultBurntStructureFn(inst)
    if inst.components.trader ~= nil then
        inst:RemoveComponent("trader")
    end
end

local function onignite(inst)
    DefaultBurnFn(inst)
    if inst.components.harvestable ~= nil then
        if inst.components.harvestable:CanBeHarvested() then
            for i= 1,inst.components.harvestable.produce do
                inst.components.lootdropper:SpawnLootPrefab("ash")
            end
        end

        inst.components.harvestable.produce = 0
        inst.components.harvestable:StopGrowing()
        updatelevel(inst)
    end

    if inst.components.trader ~= nil then
        inst.components.trader:Disable()
    end
end

local function onextinguish(inst)
    DefaultExtinguishFn(inst)
    updatelevel(inst)
end

local function accepttest(inst, item)
    if item == nil then
        return false
    elseif inst.remainingharvests == 0 then
		print(item.prefab)
        if item.prefab == "livinglog" then -- only livinglog for now because that is the recipe
            return true
        end
		print("MUSHROOMFARM_NEEDSLOG")
        return false, "MUSHROOMFARM_NEEDSLOG"
    elseif not item:HasTag("mushroom") then
		print("MUSHROOMFARM_NEEDSSHROOM")
        return false, "MUSHROOMFARM_NEEDSSHROOM"
    end
    return true
end

local function onacceptitem(inst, giver, item)
    if inst.remainingharvests == 0 then
        inst.remainingharvests = TUNING.MUSHROOMFARM_MAX_HARVESTS
        inst.components.workable:SetWorkLeft(FULLY_REPAIRED_WORKLEFT)
        updatelevel(inst)
    else
        StartGrowing(inst, item)
    end
end

local function onsnowcoveredchagned(inst, covered)
    if inst.components.harvestable ~= nil then
        updatelevel(inst)
    end
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    elseif inst.components.harvestable ~= nil then
        data.growtime = inst.components.harvestable.growtime
        data.product = inst.components.harvestable.product
        data.maxproduce = inst.components.harvestable.maxproduce
        data.remainingharvests = inst.remainingharvests
    end
end


local function onload(inst, data)
    if data ~= nil then
        if data.burnt then
            inst.components.burnable.onburnt(inst)
        else
            inst.components.harvestable.growtime = data.growtime
            inst.components.harvestable.product = data.product
            inst.components.harvestable.maxproduce = data.maxproduce

            inst.remainingharvests = data.remainingharvests or 0

            if inst.components.harvestable.product ~= nil then
                DoMushroomOverrideSymbol(inst, inst.components.harvestable.product)
            end

            updatelevel(inst)
        end
    end
end

local function fn(Sim)
    local inst = CreateEntity()
	
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddLightWatcher()
	
    MakeObstaclePhysics(inst, .5)
	
    inst.AnimState:SetBank("mushroom_farm")
    inst.AnimState:SetBuild("mushroom_farm")
    inst.AnimState:PlayAnimation("idle")
	
    inst:AddTag("structure")
    inst:AddTag("playerowned")
    inst:AddTag("mushroom_farm")
	
    --trader, alltrader (from trader component) added to pristine state for optimization
    inst:AddTag("trader")
    inst:AddTag("alltrader")

    MakeSnowCovered(inst, .01)
	
    ---------------------  
    inst:AddComponent("harvestable")
    inst.components.harvestable:SetOnGrowFn(ongrow)
    inst.components.harvestable:SetOnHarvestFn(onharvest)
    -------------------
	
    inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(accepttest)
    inst.components.trader.onaccept = onacceptitem
    inst.components.trader.acceptnontradable = true
	
    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus
	
    inst:AddComponent("lootdropper")
	--if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) or (not inst.components.harvestable:CanBeHarvested()) then
    --    return
    --end
	
    local loot = {}
    for i= 1,inst.components.harvestable.produce do
        table.insert(loot, inst.components.harvestable.product)
    end
    inst.components.lootdropper:SetLoot(loot)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(FULLY_REPAIRED_WORKLEFT)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)
	
    inst:ListenForEvent("onbuilt", onbuilt)

    MakeMediumBurnable(inst, nil, nil, true)
    MakeLargePropagator(inst)
    inst.components.burnable:SetOnBurntFn(onburnt)
    inst.components.burnable:SetOnIgniteFn(onignite)
    inst.components.burnable:SetOnExtinguishFn(onextinguish)

    inst.remainingharvests = TUNING.MUSHROOMFARM_MAX_HARVESTS

    inst.OnSave = onsave
    inst.OnLoad = onload

    updatelevel(inst)

    return inst
end

return Prefab("mushroom_farm", fn, assets, prefabs),
    MakePlacer("mushroom_farm_placer", "mushroom_farm", "mushroom_farm", "idle")
