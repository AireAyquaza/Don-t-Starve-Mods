local Sharpening = Class(function(self, inst)
    self.inst = inst
    self.repair_value = 35
end)


function Sharpening:DoSharpening(target, doer)
	
    if target.components.finiteuses and target.components.finiteuses:GetPercent() < 1 then	
		local delta = target.components.finiteuses.current + ((target.components.finiteuses.total * self.repair_value) / 100)
		
		if delta > target.components.finiteuses.total then
			delta = target.components.finiteuses.total
		end
		
		target.components.finiteuses:SetUses(delta)
		
		if self.inst.components.finiteuses then
			self.inst.components.finiteuses:Use(1)
		end
		
		if self.onsharpens then
			self.onsharpens(self.inst, target, doer)
		end
		
		return true
	end
	
end

function Sharpening:CollectUseActions(doer, target, actions, right)
    if target:HasTag("sharpens") and target.components.finiteuses and target.components.finiteuses:GetPercent() < 1 then
        table.insert(actions, ACTIONS.SHARPENS)
    end
end

return Sharpening
