local ROG_INSTALLED = GLOBAL.IsDLCInstalled(GLOBAL.REIGN_OF_GIANTS)
local ROG_ENABLED = GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS)
local SW_INSTALLED = GLOBAL.rawget(GLOBAL, "CAPY_DLC") and GLOBAL.IsDLCInstalled(GLOBAL.CAPY_DLC)
local SW_ENABLED = GLOBAL.rawget(GLOBAL, "CAPY_DLC") and GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH
local Action = GLOBAL.Action
local ActionHandler = GLOBAL.ActionHandler

PrefabFiles =
{
	"armor_repair_kit"
}

Assets =
{
	Asset("ANIM", "anim/armor_repair_kit.zip"), --This is the animation for your item while it is on the ground
    Asset("ATLAS", "images/inventoryimages/armor_repair_kit.xml"),
    Asset("IMAGE", "images/inventoryimages/armor_repair_kit.tex")
}

TUNING.ARMOR_REPAIR_KIT_USES = GetModConfigData("armor_repair_kit_uses")
TUNING.ARMOR_REPAIR_KIT_REPAIR_VALUE = GetModConfigData("armor_repair_kit_repair_value")

STRINGS.NAMES.ARMOR_REPAIR_KIT = "Armor Repair Kit"
STRINGS.RECIPE_DESC.ARMOR_REPAIR_KIT = "Kit for repairing armor parts."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ARMOR_REPAIR_KIT = "Armors are more durable now."

local function AddModRecipe(_recName, _ingrList, _tab, _techLevel, _recType, _placer, _spacing, _proxyLock, _amount)
	if GLOBAL.CAPY_DLC and GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC) then
		return GLOBAL.Recipe(_recName, _ingrList , _tab, _techLevel, _recType, _placer, _spacing, _proxyLock, _amount)
	else
		return GLOBAL.Recipe(_recName, _ingrList , _tab, _techLevel, _placer, _spacing, _proxyLock, _amount)
	end
end

local ingredients =
{
	Ingredient("hammer", 1),
	Ingredient("cutstone", GetModConfigData("recipe_custone_amount")),
	Ingredient("boards", GetModConfigData("recipe_boards_amount")),
	Ingredient("rope", GetModConfigData("recipe_rope_amount"))
}

local repairkitrecipe = AddModRecipe("armor_repair_kit", ingredients, RECIPETABS.TOOLS, TECH.SCIENCE_TWO, "common", nil, nil, nil, 1)
repairkitrecipe.atlas = "images/inventoryimages/armor_repair_kit.xml"

local ARMORREPAIRS = Action(3)
ARMORREPAIRS.str = "Repair"
ARMORREPAIRS.id = "ARMORREPAIRS"
ARMORREPAIRS.fn = function(act)
	if act.target and act.target:HasTag("armorrepairable") and act.target.components.armor and act.invobject and act.invobject.components.armorrepairing then
		return act.invobject.components.armorrepairing:DoReparation(act.target, act.doer)
	end
end

AddAction(ARMORREPAIRS)
AddStategraphActionHandler("wilson", ActionHandler(ARMORREPAIRS, "dolongaction"))

local function allowRepair(inst)
	inst:AddTag("armorrepairable")
end

Armors =
{
	"armorgrass",
	"armorwood",
	"armormarble",
	"armorsnurtleshell",
	"armorruins",
	"footballhat",
	"beehat",
	"slurtlehat",
	"ruinshat"
}

if GetModConfigData("armor_repair_kit_allow_night_armor") then
	table.insert(Armors, "armor_sanity")
end

if ROG_ENABLED then
	table.insert(Armors, "armordragonfly")
	table.insert(Armors, "wathgrithrhat")
end

if SW_ENABLED then
	table.insert(Armors, "armorseashell")
	table.insert(Armors, "armorlimestone")
	table.insert(Armors, "armorobsidian")
	table.insert(Armors, "armorcactus")
	table.insert(Armors, "oxhat")
end

for k,v in pairs(Armors) do
	AddPrefabPostInit(v, allowRepair)
end