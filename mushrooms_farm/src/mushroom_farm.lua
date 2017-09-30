local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS    = GLOBAL.STRINGS
local TECH       = GLOBAL.TECH

-- Tuning
TUNING.MUSHROOMFARM_MAX_HARVESTS = 4
--TUNING.MUSHROOMFARM_FULL_GROW_TIME = TUNING.TOTAL_DAY_TIME * 3.75
TUNING.MUSHROOMFARM_FULL_GROW_TIME = TUNING.TOTAL_DAY_TIME

-- Strings
STRINGS.NAMES.MUSHROOM_FARM = "Mushroom Planter"
STRINGS.RECIPE_DESC.MUSHROOM_FARM = "Grow mushrooms."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MUSHROOM_FARM =
{
    STUFFED = "The forest sprite has returned a glorious bounty!",
    LOTS = "It is growing strong and hearty.",
    SOME = "The forest sprite has taken root.",
    EMPTY = "An empty home for forest sprites.",
    ROTTEN = "A blight has beset this log. Another!",
    BURNT = "Twas consumed by a mighty inferno!",
    SNOWCOVERED = "Not all can withstand the frost giant's touch.",
}
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MUSHROOM_FARM =
{
	STUFFED = "It's so full it's almost obscene.",
	LOTS = "The mushrooms have really taken to the log.",
	SOME = "They seem to be doing well.",
	EMPTY = "Smells... \"piney\".",
	ROTTEN = "Rotten, all the way through. I relate.",
	BURNT = "Only ash and ruin remain here.",
	SNOWCOVERED = "Nothing grows in these frigid wastes.",
}
STRINGS.CHARACTERS.WEBBER.DESCRIBE.MUSHROOM_FARM =
{
	STUFFED = "Wow! So many mushrooms!",
	LOTS = "They look happy.",
	SOME = "Aw, they're so little.",
	EMPTY = "There aren't any mushrooms.",
	ROTTEN = "It's all yucky.",
	BURNT = "Fire's dangerous, I guess.",
	SNOWCOVERED = "You look chilly.",
}
STRINGS.CHARACTERS.WENDY.DESCRIBE.MUSHROOM_FARM =
{
	STUFFED = "Completely teeming with life...",
	LOTS = "It thrives... against all odds...",
	SOME = "The beginnings of life...",
	EMPTY = "Emptiness. The natural state of all things.",
	ROTTEN = "Nothing escapes the pull of decay.",
	BURNT = "It is no more.",
	SNOWCOVERED = "A frigid cold bites at its heart.",
}
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MUSHROOM_FARM =
{
    STUFFED = "We ought to pick them before they outgrow their planter.",
    LOTS = "An excellent fungal yield.",
    SOME = "The fungi are fruiting nicely.",
    EMPTY = "It must first be seeded with a cut specimen or fungal spore.",
    ROTTEN = "The state of decomposition is too advanced to support any specimens.",
    BURNT = "Carbonized by an exothermic chemical reaction.",
    SNOWCOVERED = "Its growth has been halted by the extreme cold.",
}
STRINGS.CHARACTERS.WILLOW.DESCRIBE.MUSHROOM_FARM =
{
	STUFFED = "Geez, who even needs that many mushrooms?",
	LOTS = "Gross, they're taking over!",
	SOME = "There's mushrooms growing in it now.",
	EMPTY = "It's just a dumb log.",
	ROTTEN = "Nasty. Let's burn the rot out.",
	BURNT = "Mold problem's taken care of.",
	SNOWCOVERED = "I'm sure fire would fix that.",
}
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHROOM_FARM =
{
	STUFFED = "That's a lot of mushrooms!",
	LOTS = "The mushrooms have really taken to the log.",
	SOME = "It should keep growing now.",
	EMPTY = "It could use a spore. Or a mushroom transplant.",
	ROTTEN = "The log is dead. We should replace it with a live one.",
	BURNT = "The power of science compelled it.",
	SNOWCOVERED = "I don't think it can grow in this cold.",
}
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MUSHROOM_FARM =
{
	STUFFED = "Is no more room for more mushy-rooms!",
	LOTS = "So many little mushy-rooms!",
	SOME = "Little mushy-rooms is start to grow.",
	EMPTY = "Is nothing.",
	ROTTEN = "Dead log is need to be replaced.",
	BURNT = "Log is not looking mighty!",
    SNOWCOVERED = "Mushy-rooms not mighty enough to fight snow!",
}
STRINGS.CHARACTERS.WOODIE.DESCRIBE.MUSHROOM_FARM =
{
	STUFFED = "Doesn't need us no more.",
	LOTS = "It's doing real well on its own.",
	SOME = "There we go. Everyone needs a bit of help sometimes.",
	EMPTY = "It needs a bit of help getting started.",
	ROTTEN = "That rotten log needs replacing.",
	BURNT = "If a log burns in the forest does it hurt my feelings? Yes. It does.",
	SNOWCOVERED = "Everybody's got hardships, eh?",
}
STRINGS.CHARACTERS.WX78.DESCRIBE.MUSHROOM_FARM =
{
	STUFFED = "TOO MANY GROWTHS. STOP",
	LOTS = "LOTS OF FILTHY GROWTHS",
	SOME = "IT IS STARTING TO GROW THINGS",
	EMPTY = "IT IS FREE FROM ORGANIC GROWTHS",
	ROTTEN = "LOG ERROR",
	BURNT = "THAT'S WHAT IT GETS FOR BEING FLAMMABLE",
	SNOWCOVERED = "INFERIOR PLANT. MY CIRCUITS FUNCTION BETTER WHEN COLD",
}

-- Assets
table.insert(Assets, Asset("ANIM", "anim/mushroom_farm.zip"))
table.insert(Assets, Asset("ANIM", "anim/mushroom_farm_red_build.zip"))
table.insert(Assets, Asset("ANIM", "anim/mushroom_farm_green_build.zip"))
table.insert(Assets, Asset("ANIM", "anim/mushroom_farm_blue_build.zip"))
table.insert(Assets, Asset("ANIM", "anim/mushroom_farm.zip"))

table.insert(Assets, Asset("ATLAS", "images/inventoryimages/mushroom_farm.xml"))

table.insert(Assets, Asset("IMAGE", "images/inventoryimages/mushroom_farm.tex"))

-- Prefabs
table.insert(PrefabFiles, "mushroom_farm")

-- Mod init
local function AddMushroomTag(inst)
	inst:AddTag("mushroom")
end

local function AddTradableComponent(inst)
	inst:AddComponent("tradable")
end

local mushroomfarm = GLOBAL.Recipe("mushroom_farm", {Ingredient("spoiled_food", 8),Ingredient("poop", 5),Ingredient("livinglog", 2)}, RECIPETABS.FARM, TECH.SCIENCE_ONE, "common", "mushroom_farm_placer", 2.5)
mushroomfarm.atlas = "images/inventoryimages/mushroom_farm.xml"

AddPrefabPostInit("mushroom_farm", AddMap)
AddMinimapAtlas("images/inventoryimages/mushroom_farm.xml")

AddPrefabPostInit("red_cap", AddMushroomTag)
AddPrefabPostInit("blue_cap", AddMushroomTag)
AddPrefabPostInit("green_cap", AddMushroomTag)

AddPrefabPostInit("livinglog", AddTradableComponent)