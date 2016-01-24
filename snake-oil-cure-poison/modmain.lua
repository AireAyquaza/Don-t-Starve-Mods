AddPrefabPostInit("snakeoil",function(inst)
	if not inst.components.poisonhealer then
		inst:AddComponent("poisonhealer")
	end
	inst.components.poisonhealer.enabled = true
end)

POISON_IMMUNE_DURATION = 30*16 * GetModConfigData("POISON_IMMUNE_DURATION")