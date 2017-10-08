local ROG_INSTALLED = GLOBAL.IsDLCInstalled(GLOBAL.REIGN_OF_GIANTS)
local ROG_ENABLED = GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS)
local SW_INSTALLED = GLOBAL.rawget(GLOBAL, "CAPY_DLC") and GLOBAL.IsDLCInstalled(GLOBAL.CAPY_DLC)
local SW_ENABLED = GLOBAL.rawget(GLOBAL, "CAPY_DLC") and GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)

PrefabsFiles =
{
	"slotmachine"
}


if GetModConfigData("allow_craftable") then
	local Ingredient = GLOBAL.Ingredient
	local RECIPETABS = GLOBAL.RECIPETABS
	local STRINGS = GLOBAL.STRINGS
	local TECH = GLOBAL.TECH
	
	Assets =
	{
		Asset("ATLAS", "images/inventoryimages/slotmachine.xml"),
		Asset("IMAGE", "images/inventoryimages/slotmachine.tex")
	}
	
	STRINGS.RECIPE_DESC.SLOTMACHINE = "Playable Slot Machine"

	local function AddModRecipe(_recName, _ingrList, _tab, _techLevel, _recType, _placer, _spacing, _proxyLock, _amount)
		if GLOBAL.CAPY_DLC and GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC) then
			return GLOBAL.Recipe(_recName, _ingrList , _tab, _techLevel, _recType, _placer, _spacing, _proxyLock, _amount)
		else
			return GLOBAL.Recipe(_recName, _ingrList , _tab, _techLevel, _placer, _spacing, _proxyLock, _amount)
		end
	end

	local ingredients =
	{
		Ingredient("bamboo", GetModConfigData("recipe_bamboo_amount")),
		Ingredient("gears", GetModConfigData("recipe_gears_amount")),
		Ingredient("goldnugget", GetModConfigData("recipe_gold_nuggets_amount")),
		Ingredient("nightmarefuel", GetModConfigData("recipe_nightmarefuel_amount"))
	}

	local slotmachinerecipe = AddModRecipe("slotmachine", ingredients, RECIPETABS.TOWN, TECH.SCIENCE_TWO, "shipwrecked", "slotmachine_placer", 4)
	slotmachinerecipe.atlas = "images/inventoryimages/slotmachine.xml"
	
	AddPrefabPostInit('slotmachine', function(inst)
		inst:AddComponent("lootdropper")
		inst:AddComponent("workable")
		inst.components.workable:SetWorkAction(GLOBAL.ACTIONS.HAMMER)
		inst.components.workable:SetWorkLeft(4)
		inst.components.workable:SetOnFinishCallback(function(inst, worker)
			if inst:HasTag("fire") and inst.components.burnable then
				inst.components.burnable:Extinguish()
			end
			inst.components.lootdropper:DropLoot()
			GLOBAL.SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
			inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
			inst:Remove()
		end)
		inst.components.workable:SetOnWorkCallback(function(inst, worker)
			if not inst:HasTag("burnt") then
				inst.AnimState:PlayAnimation("hit")
				inst.AnimState:PushAnimation("idle", true)
			end
		end)
	end)
end