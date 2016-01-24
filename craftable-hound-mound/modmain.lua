local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

PrefabFiles =
{
	"houndmoundsack"
}

Assets =
{
    Asset("ATLAS", "images/inventoryimages/houndmoundsack.xml"),
    Asset("IMAGE", "images/inventoryimages/houndmoundsack.tex")
}

STRINGS.NAMES.HOUNDMOUNDSACK = "Hound Mound."
STRINGS.RECIPE_DESC.HOUNDMOUNDSACK = "Place your own Hound Mound!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HOUNDMOUNDSACK = "I think it's dangerous..."

local recipe

-- Test if world is not RoG or SW
if TUNING.STRAWHAT_PERISHTIME == nil then
    recipe = GLOBAL.Recipe("houndmoundsack", {Ingredient("houndstooth", 10), Ingredient("nightmarefuel", 14)}, RECIPETABS.TOWN, TECH.MAGIC_THREE, nil, nil, nil, 1)
else
	recipe = GLOBAL.Recipe("houndmoundsack", {Ingredient("houndstooth", 6), Ingredient("boneshard", 10), Ingredient("nightmarefuel", 10)}, RECIPETABS.TOWN, TECH.MAGIC_THREE, nil, nil, nil, 1)
end

recipe.atlas = "images/inventoryimages/houndmoundsack.xml"