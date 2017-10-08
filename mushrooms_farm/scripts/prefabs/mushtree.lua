--[[
    Prefabs for 3 different mushtrees
--]]

local TREESTATES =
{
    BLOOMING = "bloom",
    NORMAL = "normal",
}

local function tree_burnt(inst)
    inst.components.lootdropper:SpawnLootPrefab("ash")
    if math.random() < 0.5 then
        inst.components.lootdropper:SpawnLootPrefab("charcoal")
    end
    SpawnPrefab(inst.prefab..(inst.treestate == TREESTATES.BLOOMING and "_bloom_burntfx" or "_burntfx")).Transform:SetPosition(inst.Transform:GetWorldPosition())
    inst:Remove()
end

local function stump_burnt(inst)
	inst.components.lootdropper:SpawnLootPrefab("ash") 
	inst:Remove() 	
end

local function dig_up_stump(inst)
	inst.components.lootdropper:SpawnLootPrefab("log")
	inst:Remove()
end

local function inspect_tree(inst)
    return (inst:HasTag("burnt") and "BURNT")
		or (inst:HasTag("stump") and "CHOPPED")
        or (inst.treestate == TREESTATES.BLOOMING and "BLOOM")
        or nil
end

local function onspawnfn(inst, spawn)
	inst.AnimState:PlayAnimation("cough")
	inst.AnimState:PushAnimation("idle_loop", true)
	--inst.SoundEmitter:PlaySound("dontstarve/cave/mushtree_tall_spore_fart")
	local pos = inst:GetPosition()
	spawn.components.knownlocations:RememberLocation("home", pos)
	local radius = spawn.Physics ~= nil and spawn.Physics:GetRadius() + inst.Physics:GetRadius() or inst.Physics:GetRadius()
    local offset = FindWalkableOffset(pos, math.random() * 2 * PI, radius, 8)
    if offset ~= nil then
        spawn.Physics:Teleport(pos.x + offset.x, 0, pos.z + offset.z)
    else
        spawn.Transform:SetPosition(pos.x, 0, pos.z)
    end
end

local REMOVABLE =
{
    ["log"] = true,
    ["blue_cap"] = true,
    ["red_cap"] = true,
    ["green_cap"] = true,
    ["charcoal"] = true,
}

local function DoGrowNextStage(inst)
    if not inst:HasTag("stump") then
        inst.components.growable:SetStage(inst.components.growable:GetNextStage())
    end
end

local function DoGrow(inst, tostage, targetscale)
    if tostage == 2 then
        inst.AnimState:PlayAnimation("change")
        inst.SoundEmitter:PlaySound("dontstarve/cave/mushtree_tall_grow_1")
    elseif tostage == 3 then
        inst.AnimState:PlayAnimation("change")
        inst.SoundEmitter:PlaySound("dontstarve/cave/mushtree_tall_grow_2")
    elseif tostage == 1 then
        inst.AnimState:PlayAnimation("shrink")
        inst.SoundEmitter:PlaySound("dontstarve/cave/mushtree_tall_shrink")
    end
    inst.AnimState:PushAnimation("idle_loop", true)
    inst:DoTaskInTime(14 * FRAMES, DoGrowNextStage)
end

local function GrowShort(inst)
    DoGrow(inst, 1, 0.9)
end

local function GrowNormal(inst)
    DoGrow(inst, 2, 1.0)
end

local function GrowTall(inst)
    DoGrow(inst, 3, 1.1)
end

local function SetShort(inst)
    inst.Transform:SetScale(.9, .9, .9)
end

local function SetNormal(inst)
    inst.Transform:SetScale(1, 1, 1)
end

local function SetTall(inst)
    inst.Transform:SetScale(1.1, 1.1, 1.1)
end

local function makestump(inst)
    inst:RemoveComponent("burnable")
    inst:RemoveComponent("propagator")
    inst:RemoveComponent("workable")
	RemovePhysicsColliders(inst) 
	inst:AddTag("stump")
	MakeSmallPropagator(inst)
	MakeSmallBurnable(inst)
	inst.components.burnable:SetOnBurntFn(stump_burnt)	
    
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.DIG)
    inst.components.workable:SetOnFinishCallback(dig_up_stump)
	inst.components.workable:SetWorkLeft(1)
	inst.AnimState:PlayAnimation("idle_stump")
	inst.AnimState:ClearBloomEffectHandle()

	inst.Light:Enable(false)	
end

local growth_stages =
{
    { name = "short", time = function(inst) return GetRandomWithVariance(TUNING.EVERGREEN_GROW_TIME[1].base, TUNING.EVERGREEN_GROW_TIME[1].random) end, fn = SetShort,  growfn = GrowShort },
    { name = "normal", time = function(inst) return GetRandomWithVariance(TUNING.EVERGREEN_GROW_TIME[2].base, TUNING.EVERGREEN_GROW_TIME[2].random) end, fn = SetNormal, growfn = GrowNormal },
    { name = "tall", time = function(inst) return GetRandomWithVariance(TUNING.EVERGREEN_GROW_TIME[3].base, TUNING.EVERGREEN_GROW_TIME[3].random) end, fn = SetTall, growfn = GrowTall },
}

local data =
{
    small =
    { --Green
        bank = "mod_mushroom_tree_small",
        build = "mod_mushroom_tree_small",
        season = SEASONS.SPRING,
        bloom_build = "mushroom_tree_small_bloom",
        spore = "spore_small",
        icon = "mushroom_tree_small.png",
        loot = { "log", "green_cap" },
        work = TUNING.MUSHTREE_CHOPS_SMALL,
        lightradius = 1,
        lightcolour = { 146/255, 225/255, 146/255 },
    },
    medium =
    { --Red
        bank = "mod_mushroom_tree_med",
        build = "mod_mushroom_tree_med",
        season = SEASONS.SUMMER,
        bloom_build = "mushroom_tree_med_bloom",
        spore = "spore_medium",
        icon = "mushroom_tree_med.png",
        loot = { "log", "red_cap" },
        work = TUNING.MUSHTREE_CHOPS_MEDIUM,
        lightradius = 1.25,
        lightcolour = { 197/255, 126/255, 126/255 },
    },
    tall =
    { --Blue
        bank = "mod_mushroom_tree",
        build = "mod_mushroom_tree_tall",
        season = SEASONS.WINTER,
        bloom_build = "mushroom_tree_tall_bloom",
        spore = "spore_tall",
        icon = "mushroom_tree.png",
        loot = { "log", "log", "blue_cap" },
        work = TUNING.MUSHTREE_CHOPS_TALL,
        lightradius = 1.5,
        lightcolour = { 111/255, 111/255, 227/255 },
        webbable = true,
    },
}

local function onsave(inst, data)
    data.burnt = inst.components.burnable ~= nil and inst.components.burnable:IsBurning() or nil
    data.stump = inst:HasTag("stump") or nil
    data.treestate = inst.treestate
end

--V2C: Not using an fx proxy because this was originally meant to be an
--     animated death state of the original entity so it would probably
--     look more consistent this way.
--     BTW this was done so that the burnt state can immediately remove
--     the original entity rather than creating edge case bugs while it
--     was still interactable during the crumbling animation.
local function makeburntfx(name, data, bloom)
    return function()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()

        inst.AnimState:SetBuild(bloom and data.bloom_build or data.build)
        inst.AnimState:SetBank(data.bank)
        inst.AnimState:PlayAnimation("chop_burnt")

        inst.SoundEmitter:PlaySound("dontstarve/forest/treeCrumble")

        inst:AddTag("FX")

        inst.persists = false
        inst:ListenForEvent("animover", inst.Remove)
        -- In case we're off screen and animation is asleep
        inst:DoTaskInTime(10 + FRAMES, inst.Remove)

        return inst
    end
end

local function StartSpores(inst)
    if inst._sporetime == nil then
        inst._sporetime = -1
        if not inst:IsAsleep() then
            inst.components.periodicspawner:Start()
        end
    end
end

local function StopSpores(inst)
    inst._sporetime = nil
    inst.components.periodicspawner:Stop()
end

local function onentitysleep(inst)
    if inst._sporetime ~= nil then
        inst._sporetime = inst.components.periodicspawner.target_time or -1
    end
    inst.components.periodicspawner:Stop()
end

local function onentitywake(inst)
    if inst._sporetime ~= nil then
        inst.components.periodicspawner:Start()
        if inst._sporetime < 0 then
            inst.components.periodicspawner:LongUpdate(math.random() * (inst.components.periodicspawner.target_time - GetTime()))
        else
            local target_time = inst.components.periodicspawner.target_time
            if inst._sporetime < target_time then
                if inst._sporetime <= GetTime() then
                    inst.components.periodicspawner:ForceNextSpawn(inst.components.periodicspawner)
                else
                    inst.components.periodicspawner:LongUpdate(target_time - inst._sporetime)
                end
            end
            inst._sporetime = -1
        end
    end
end

local function swapbuild(inst, treestate, build)
    inst._changetask = nil
    if not inst:HasTag("stump") then
        inst.AnimState:SetBuild(build)
        inst.treestate = treestate
        if treestate == TREESTATES.BLOOMING then
            StartSpores(inst)
        else
            StopSpores(inst)
        end
    end
end

local function forcespore(inst)
    if inst._sporetime ~= nil and inst.treestate == TREESTATES.BLOOMING and not (inst:IsAsleep() or inst:HasTag("burnt")) then
        inst.components.periodicspawner:ForceNextSpawn(inst.components.periodicspawner)
    end
end

local function startchange(inst, treestate, build, soundname)
    if inst:HasTag("stump") then
        inst._changetask = nil
    else
        inst.AnimState:PlayAnimation("change")
        inst.AnimState:PushAnimation("idle_loop", true)
        inst.SoundEmitter:PlaySound(soundname)
        inst._changetask = inst:DoTaskInTime(14 * FRAMES, swapbuild, treestate, build)
        if treestate == TREESTATES.BLOOMING then
            inst:DoTaskInTime(2, forcespore)
        end
    end
end

local function maketree(name, data, state)
    local function bloom_tree(inst, instant)
        if inst._changetask ~= nil then
            inst._changetask:Cancel()
        end
        if instant then
            swapbuild(inst, TREESTATES.BLOOMING, data.bloom_build)
        else
            inst._changetask = inst:DoTaskInTime(math.random() * 3 * TUNING.SEG_TIME, startchange, TREESTATES.BLOOMING, data.bloom_build, "dontstarve/cave/mushtree_tall_grow_3")
        end
		print('bloom '..data.spore)
    end

    local function normal_tree(inst, instant)
        if inst._changetask ~= nil then
            inst._changetask:Cancel()
        end
        if instant then
            swapbuild(inst, TREESTATES.NORMAL, data.build)
        else
            inst._changetask = inst:DoTaskInTime(math.random() * 3 * TUNING.SEG_TIME, startchange, TREESTATES.NORMAL, data.build, "dontstarve/cave/mushtree_tall_shrink")
        end
		print('normal '..data.spore)
    end

    local function onisinseason(inst, isinseason, instant)
        if isinseason then
            if inst.treestate ~= TREESTATES.BLOOMING then
                bloom_tree(inst, instant ~= nil and instant or true)
            elseif inst._changetask ~= nil then
                inst._changetask:Cancel()
                inst._changetask = nil
            end
        elseif inst.treestate ~= TREESTATES.NORMAL then
            normal_tree(inst, instant ~= nil and instant or true)
        elseif inst._changetask ~= nil then
            inst._changetask:Cancel()
            inst._changetask = nil
        end
    end

    local function makestump(inst)
        if inst:HasTag("stump") then
            return
        end

        if inst._changetask ~= nil then
            inst._changetask:Cancel()
            inst._changetask = nil
        end

        RemovePhysicsColliders(inst)
        inst:AddTag("stump")
        inst:RemoveTag("shelter")
        inst:RemoveComponent("propagator")
        inst:RemoveComponent("burnable")
        MakeSmallPropagator(inst)
        MakeSmallBurnable(inst)
        inst.components.burnable:SetOnBurntFn(stump_burnt)
        inst.components.growable:StopGrowing()
        StopSpores(inst)

        inst.components.workable:SetWorkAction(ACTIONS.DIG)
        inst.components.workable:SetOnWorkCallback(nil)
        inst.components.workable:SetOnFinishCallback(dig_up_stump)
        inst.components.workable:SetWorkLeft(1)
        inst.AnimState:PlayAnimation("idle_stump")

        inst.MiniMapEntity:SetIcon("mushroom_tree_stump.png")

        inst.Light:Enable(false)

        --inst.StopWatchingWorldState("is"..data.season, onisinseason)
    end

    local function workcallback(inst, worker, workleft)
        if not (worker ~= nil and worker:HasTag("playerghost")) then
            inst.SoundEmitter:PlaySound("dontstarve/wilson/use_axe_mushroom")
        end
        if workleft <= 0 then
            inst.SoundEmitter:PlaySound("dontstarve/forest/treefall")
            makestump(inst)

            inst.AnimState:PlayAnimation("fall")

            inst.components.lootdropper:DropLoot(inst:GetPosition())
            inst.AnimState:PushAnimation("idle_stump")
        else
            inst.AnimState:PlayAnimation("chop")
            inst.AnimState:PushAnimation("idle_loop", true)
        end
    end

    local function onload(inst, loaddata)
        if loaddata ~= nil then
            if loaddata.burnt then
                if loaddata.stump then
                    stump_burnt(inst)
                else
                    tree_burnt(inst)
                end
            elseif loaddata.stump then
                makestump(inst)
            elseif loaddata.treestate == TREESTATES.NORMAL then
                inst.onseasonchange(inst, GetSeasonManager().current_season == data.season, false)
            elseif loaddata.treestate == TREESTATES.BLOOMING then
                inst.onseasonchange(inst, GetSeasonManager().current_season == data.season, false)
            end
        end
    end

    return function()
        local inst = CreateEntity()
		
		inst.season = data.season
		inst.onseasonchange = onisinseason
		
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddMiniMapEntity()
        inst.entity:AddLight()

        MakeObstaclePhysics(inst, .25)

        inst.AnimState:SetBuild(data.build)
        inst.AnimState:SetBank(data.bank)
        inst.AnimState:PlayAnimation("idle_loop", true)

        inst.MiniMapEntity:SetIcon(data.icon)

        inst.Light:SetFalloff(.5)
        inst.Light:SetIntensity(.8)
        inst.Light:SetRadius(data.lightradius)
        inst.Light:SetColour(unpack(data.lightcolour))

        inst:AddTag("shelter")
        inst:AddTag("mushtree")
        inst:AddTag("cavedweller")
        inst:AddTag("tree")

        if data.webbable then
            inst:AddTag("webbable")
        end

        inst:SetPrefabName(name)

        local color = .5 + math.random() * .5
        inst.AnimState:SetMultColour(color, color, color, 1)
        inst.AnimState:SetTime(math.random() * 2)

       -- MakeMediumPropagator(inst)
        MakeLargeBurnable(inst)
        inst.components.burnable:SetFXLevel(5)
        inst.components.burnable:SetOnBurntFn(tree_burnt)

        inst:AddComponent("lootdropper")
        inst.components.lootdropper:SetLoot(data.loot)

        inst:AddComponent("inspectable")
        inst.components.inspectable.getstatus = inspect_tree

        inst:AddComponent("workable")
        inst.components.workable:SetWorkAction(ACTIONS.CHOP)
        inst.components.workable:SetWorkLeft(data.work)
        inst.components.workable:SetOnWorkCallback(workcallback)

        inst:AddComponent("periodicspawner")
        inst.components.periodicspawner:SetPrefab(data.spore)
        inst.components.periodicspawner:SetOnSpawnFn(onspawnfn)
        inst.components.periodicspawner:SetDensityInRange(TUNING.MUSHSPORE_MAX_DENSITY_RAD, TUNING.MUSHSPORE_MAX_DENSITY)
        StopSpores(inst)

        inst:AddComponent("growable")
        inst.components.growable.stages = growth_stages
        inst.components.growable:SetStage(math.random(3))
        inst.components.growable.loopstages = true
        inst.components.growable.growonly = true
        inst.components.growable:StartGrowing()

        inst.treestate = TREESTATES.NORMAL

        inst.OnEntitySleep = onentitysleep
        inst.OnEntityWake = onentitywake
        inst.OnSave = onsave
        inst.OnLoad = onload

        if state == "stump" then
            makestump(inst)
        else
            --inst.WatchWorldState("is"..data.season, onisinseason)
			inst.onseasonchange(inst, GetSeasonManager().current_season == data.season)
        end

        return inst
    end
end

local treeprefabs = {}
function treeset(name, data, build, bloombuild)
    local buildasset = Asset("ANIM", build)
    local bloombuildasset = Asset("ANIM", bloombuild)
    local assets =
    {
        buildasset,
        bloombuildasset,
        Asset("MINIMAP_IMAGE", data.icon),
        Asset("MINIMAP_IMAGE", "mushroom_tree_stump"),
    }

    local prefabs =
    {
        "log",
        "blue_cap",
        "green_cap",
        "red_cap",
        "charcoal",
        "ash",
        data.spore,
        name.."_stump",
        name.."_burntfx",
        name.."_bloom_burntfx",
    }

    table.insert(treeprefabs, Prefab(name, maketree(name, data), assets, prefabs))
    table.insert(treeprefabs, Prefab(name.."_stump", maketree(name, data, "stump"), assets, prefabs))
    table.insert(treeprefabs, Prefab(name.."_burntfx", makeburntfx(name, data, false), { buildasset }))
    table.insert(treeprefabs, Prefab(name.."_bloom_burntfx", makeburntfx(name, data, true), { bloombuildasset }))
end

treeset("mushtree_tall", data.tall, "anim/mod_mushroom_tree_tall.zip", "anim/mushroom_tree_tall_bloom.zip")
treeset("mushtree_medium", data.medium, "anim/mod_mushroom_tree_med.zip", "anim/mushroom_tree_med_bloom.zip")
treeset("mushtree_small", data.small, "anim/mod_mushroom_tree_small.zip", "anim/mushroom_tree_small_bloom.zip")

return unpack(treeprefabs)