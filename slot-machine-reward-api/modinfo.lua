name = "Slot Machine Reward API"
description = "This mod is an API, it allow slot machine to be crafted and destroyed.\nIt allow slot machine to be modded with new rewards.\nSee tutorial on Steam workshop to add your own reward into the slot machine."
author = "Aire Ayquaza"
version = "1.0.3"

forumthread = ""

api_version = 6

icon_atlas = "modicon.xml"
icon = "modicon.tex"

dst_compatible = false
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = true

server_filter_tags = {"Slot machine","api", "reward api", "shipwrecked compatible", "shipwrecked", "craftable", "hammer"}

configuration_options =
{
	{
        name = "allow_craftable",
        label = "Allow crafting the Slot Machine",
        options = 
        {
            {description = "No", data = false},
            {description = "Yes", data = true}
        }, 
        default = false
    },
	{
        name = "recipe_bamboo_amount",
        label = "Recipe - Needed Bamboos",
        options = 
        {
            {description = "10", data = 10},
            {description = "15", data = 15},
            {description = "20 (default)", data = 20},
            {description = "25", data = 25},
            {description = "30", data = 30},
            {description = "35", data = 35},
            {description = "40", data = 40}
        }, 
        default = 20
    },
	{
        name = "recipe_gears_amount",
        label = "Recipe - Needed Gears",
        options = 
        {
            {description = "1", data = 1},
            {description = "2 (default)", data = 2},
            {description = "3", data = 3},
            {description = "4", data = 4},
            {description = "5", data = 5},
            {description = "6", data = 6}
        }, 
        default = 2
    },
	{
        name = "recipe_gold_nuggets_amount",
        label = "Recipe - Needed Gold Nuggets",
        options = 
        {
            {description = "2", data = 2},
            {description = "3 (default)", data = 3},
            {description = "4", data = 4},
            {description = "5", data = 5},
            {description = "6", data = 6}
        }, 
        default = 3
    },
	{
        name = "recipe_nightmarefuel_amount",
        label = "Recipe - Needed Nightmare Fuel",
        options = 
        {
            {description = "2", data = 2},
            {description = "3 (default)", data = 3},
            {description = "4", data = 4},
            {description = "5", data = 5},
            {description = "6", data = 6}
        }, 
        default = 3
    }
}