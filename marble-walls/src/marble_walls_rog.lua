KnownModIndex = GLOBAL.KnownModIndex

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

PrefabFiles =
{
	"thewall_rog"
}

Assets =
{
    Asset("ANIM", "anim/wall_pomarble.zip"), --This is the animation for your item while it is on the ground
    Asset("ATLAS", "images/inventoryimages/wall_pomarble_item.xml"),
    Asset("IMAGE", "images/inventoryimages/wall_pomarble_item.tex")
}

STRINGS.NAMES.WALL_POMARBLE_ITEM = "Polished Marble Wall."
STRINGS.NAMES.WALL_POMARBLE = "Polished Marble Wall"
STRINGS.RECIPE_DESC.WALL_POMARBLE_ITEM = "A strong and polished Marble Wall."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WALL_POMARBLE = "Nice polished marble wall!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WALL_POMARBLE_ITEM = "Nice polished marble wall!"

local options =
{
	enable_living_walls = GetModConfigData("enable_living_walls"),
	living_walls_regeneration_rate = GetModConfigData("living_walls_regeneration_rate"),
	enable_undeploy = GetModConfigData("enable_undeploy"),
	no_marblesuit_weight = GetModConfigData("cancel_marblesuit_weight")
}

if options.no_marblesuit_weight then
	TUNING.ARMORMARBLE_SLOW = 1
end

local function AddModRecipe(_recName, _ingrList, _tab, _techLevel, _recType, _placer, _spacing, _proxyLock, _amount)
	if GLOBAL.CAPY_DLC and GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC) then
		return GLOBAL.Recipe(_recName, _ingrList , _tab, _techLevel, _recType, _placer, _spacing, _proxyLock, _amount)
	else
		return GLOBAL.Recipe(_recName, _ingrList , _tab, _techLevel, _placer, _spacing, _proxyLock, _amount)
	end
end

-- GLOBAL.Recipe("wall_pomarble_item", {Ingredient("marble", 6)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, 6)
if options.enable_living_walls == false then
	local marblewallrecipe = AddModRecipe("wall_pomarble_item", {Ingredient("marble", 6)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, "common", nil, nil, nil, 6)
	marblewallrecipe.atlas = "images/inventoryimages/wall_pomarble_item.xml"
else
	local marblewallrecipe = AddModRecipe("wall_pomarble_item", {Ingredient("marble", 6), Ingredient("nightmarefuel", 1)}, RECIPETABS.TOWN, TECH.MAGIC, "common", nil, nil, nil, 6)
	marblewallrecipe.atlas = "images/inventoryimages/wall_pomarble_item.xml"
	
	-- Enable regeneration
	local function regen(inst)
		inst:DoPeriodicTask(5, function(inst)
			local wall_health = inst.components.health:GetPercent()
			if wall_health < 1 then
				inst.components.health:DoDelta(options.living_walls_regeneration_rate)
			end
		end)
	end
	AddPrefabPostInit("wall_pomarble", regen)
end

--Enable undeploy
if options.enable_undeploy then
	AddPrefabPostInit("wall_pomarble", function(inst)
		local function turnon(inst)
			inst.on = true
			inst:Remove()
			GLOBAL.SpawnPrefab("wall_pomarble_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
		end
		inst:AddComponent("machine")
		inst.components.machine.turnonfn = turnon
	end)
end