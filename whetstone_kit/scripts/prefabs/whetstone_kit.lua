local assets =
{
	Asset("ANIM", "anim/whetstone_kit.zip")
}

local function onfinished(inst)
	inst:Remove()
end

local function onsharpens(inst, target, doer)
	if doer.SoundEmitter then
		doer.SoundEmitter:PlaySound("dontstarve/HUD/repair_clothing")
	end
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	
	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("whetstone_kit")
	inst.AnimState:SetBuild("whetstone_kit")
	inst.AnimState:PlayAnimation("idle")
	
	inst:AddComponent("finiteuses")
	inst.components.finiteuses:SetMaxUses(TUNING.WHETSTONE_KIT_USES)
    inst.components.finiteuses:SetUses(TUNING.WHETSTONE_KIT_USES)
    inst.components.finiteuses:SetOnFinished(onfinished)
	
    inst:AddComponent("sharpening")
    inst.components.sharpening.repair_value = TUNING.WHETSTONE_KIT_REPAIR_VALUE
    inst.components.sharpening.onsharpens = onsharpens
    ---------------------       
    
    
	
    inst:AddComponent("inspectable")
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "whetstone_kit"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/whetstone_kit.xml"
	
    return inst
end

return Prefab("common/inventory/whetstone_kit", fn, assets) 
	