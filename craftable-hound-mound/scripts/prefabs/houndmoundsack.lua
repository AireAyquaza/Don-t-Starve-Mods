require "prefabutil"
local assets =
{
	Asset("ANIM", "anim/hound_base.zip"),
    Asset("SOUND", "sound/hound.fsb"),
}

local function test_ground(inst, pt)
    local basetile = GROUND.DIRT
    if GetWorld():HasTag("shipwrecked") then
        basetile = GROUND.BEACH
    end
    local tile = inst:GetCurrentTileType(pt.x, pt.y, pt.z)

    local ground = GetWorld()
    local onWater = ground.Map:IsWater(tile)
    return not onWater
end

local function ondeploy(inst, pt) 
	inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/mound_LP")
    local tree = SpawnPrefab("houndmound") 
    if tree then 
        tree.Transform:SetPosition(pt.x, pt.y, pt.z) 
        inst.components.stackable:Get():Remove()
    end 
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()

    inst.AnimState:SetBank("hound_base")
    inst.AnimState:SetBuild("hound_base")
    inst.AnimState:PlayAnimation("idle")
    
    MakeInventoryPhysics(inst)
    
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "houndmoundsack"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/houndmoundsack.xml"

    inst:AddTag("structure")
    inst:AddTag("houndmound")
    inst:AddComponent("tradable")
    
    inst.components.inventoryitem:SetOnPickupFn(function() inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/mound_LP") end)
    
    inst:AddComponent("deployable")
    inst.components.deployable.test = test_ground
    inst.components.deployable.ondeploy = ondeploy
    

    return inst
end

return Prefab( "common/inventory/houndmoundsack", fn, assets),
	   MakePlacer( "common/houndmoundsack_placer", "hound_base", "hound_base", "houndmound" ) 

