local function refuel(inst)
	inst:DoPeriodicTask(2.0, function(inst)
		inst.components.fueled:SetPercent(100)
	end)
end

if TUNING.ARMORSEASHELL ~= nil then
	AddPrefabPostInit("bottlelantern", refuel)
else
	AddPrefabPostInit("lantern", refuel)
end