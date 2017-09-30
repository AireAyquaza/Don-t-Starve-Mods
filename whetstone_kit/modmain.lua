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
	"whetstone_kit"
}

Assets =
{
	Asset("ANIM", "anim/whetstone_kit.zip"), --This is the animation for your item while it is on the ground
    Asset("ATLAS", "images/inventoryimages/whetstone_kit.xml"),
    Asset("IMAGE", "images/inventoryimages/whetstone_kit.tex")
}

TUNING.WHETSTONE_KIT_USES = GetModConfigData("whetstone_kit_uses")
TUNING.WHETSTONE_KIT_REPAIR_VALUE = GetModConfigData("whetstone_kit_repair_value")

STRINGS.NAMES.WHETSTONE_KIT = "Whetstone Kit"
STRINGS.RECIPE_DESC.WHETSTONE_KIT = "Kit for sharpening tools."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WHETSTONE_KIT = "A whetstone for sharpening my tools!"

local function AddModRecipe(_recName, _ingrList, _tab, _techLevel, _recType, _placer, _spacing, _proxyLock, _amount)
	if GLOBAL.CAPY_DLC and GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC) then
		return GLOBAL.Recipe(_recName, _ingrList , _tab, _techLevel, _recType, _placer, _spacing, _proxyLock, _amount)
	else
		return GLOBAL.Recipe(_recName, _ingrList , _tab, _techLevel, _placer, _spacing, _proxyLock, _amount)
	end
end

if GetModConfigData("use_marble") then
	ingredients = {Ingredient("cutstone", 4), Ingredient("flint", 10), Ingredient("marble", 4)}
else
	ingredients = {Ingredient("cutstone", 4), Ingredient("flint", 10)}
end

local whetstonerecipe = AddModRecipe("whetstone_kit", ingredients, RECIPETABS.TOOLS, TECH.SCIENCE_TWO, "common", nil, nil, nil, 1)
whetstonerecipe.atlas = "images/inventoryimages/whetstone_kit.xml"

local SHARPENS = Action(3)
SHARPENS.str = "Sharpens"
SHARPENS.id = "SHARPENS"
SHARPENS.fn = function(act)
	if act.target and act.target:HasTag("sharpens") and act.target.components.finiteuses and act.invobject and act.invobject.components.sharpening then
		return act.invobject.components.sharpening:DoSharpening(act.target, act.doer)
	end
end

AddAction(SHARPENS)
AddStategraphActionHandler("wilson", ActionHandler(SHARPENS, "dolongaction"))

local function allowSharpens(inst)
	inst:AddTag("sharpens")
end

Tools =
{
	"axe","pickaxe","shovel","hammer","pitchfork","razor","goldenaxe","goldenpickaxe","goldenshovel","multitool_axe_pickaxe","spear","trap_teeth","ruins_bat"
}
if GetModConfigData("allow_tentaclespike") then
	table.insert(Tools, "tentaclespike")
end

if ROG_ENABLED then
	table.insert(Tools, "spear_wathgrithr")
end

if SW_ENABLED then
	table.insert(Tools, "machete")
	table.insert(Tools, "goldenmachete")
	table.insert(Tools, "obsidianmachete")
	table.insert(Tools, "obsidianaxe")
	
	table.insert(Tools, "spear_poison")
	table.insert(Tools, "spear_obsidian")
	table.insert(Tools, "cutlass")
	
	if GetModConfigData("allow_trident") then
		table.insert(Tools, "trident")
	end
end

for k,v in pairs(Tools) do
	AddPrefabPostInit(v, allowSharpens)
end