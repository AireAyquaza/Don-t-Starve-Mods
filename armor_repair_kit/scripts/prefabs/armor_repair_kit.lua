local assets =
{
	Asset("ANIM", "anim/armor_repair_kit.zip")
}

local function onfinished(inst)
	inst:Remove()
end

local function onarmorrepairs(inst, target, doer)
	if doer.SoundEmitter then
		doer.SoundEmitter:PlaySound("dontstarve/HUD/repair_clothing")
	end
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	
	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("armor_repair_kit")
	inst.AnimState:SetBuild("armor_repair_kit")
	inst.AnimState:PlayAnimation("idle")
	
	inst:AddComponent("finiteuses")
	inst.components.finiteuses:SetMaxUses(TUNING.ARMOR_REPAIR_KIT_USES)
    inst.components.finiteuses:SetUses(TUNING.ARMOR_REPAIR_KIT_USES)
    inst.components.finiteuses:SetOnFinished(onfinished)
	
    inst:AddComponent("armorrepairing")
    inst.components.armorrepairing.repair_value = TUNING.ARMOR_REPAIR_KIT_REPAIR_VALUE
    inst.components.armorrepairing.onarmorrepairs = onarmorrepairs
    ---------------------       
    
    
	
    inst:AddComponent("inspectable")
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "armor_repair_kit"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/armor_repair_kit.xml"
	
    return inst
end

return Prefab("common/inventory/armor_repair_kit", fn, assets) 
	