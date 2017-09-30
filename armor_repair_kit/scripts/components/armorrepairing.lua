local ArmorRepairing = Class(function(self, inst)
    self.inst = inst
    self.repair_value = 35
end)


function ArmorRepairing:DoReparation(target, doer)
	
    if target.components.armor and target.components.armor:GetPercent() < 1 then	
		local delta = target.components.armor.condition + ((target.components.armor.maxcondition * self.repair_value) / 100)
		
		if delta > target.components.armor.maxcondition then
			delta = target.components.armor.maxcondition
		end
		target.components.armor:SetCondition(delta)
		
		if self.inst.components.finiteuses then
			self.inst.components.finiteuses:Use(1)
		end
		
		if self.onarmorrepairs then
			self.onarmorrepairs(self.inst, target, doer)
		end
		
		return true
	end
	
end

function ArmorRepairing:CollectUseActions(doer, target, actions, right)
    if target:HasTag("armorrepairable") and target.components.armor and target.components.armor:GetPercent() < 1 then
        table.insert(actions, ACTIONS.ARMORREPAIRS)
    end
end

return ArmorRepairing
