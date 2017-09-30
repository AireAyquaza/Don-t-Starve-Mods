name = "More durability [Armour]"
description = "Allow you to apply a multiplicator on armour durabilities"
author = "Aire Ayquaza"
version = "1.1.0"

forumthread = ""

api_version = 6

icon_atlas = "modicon.xml"
icon = "modicon.tex"

all_clients_require_mod = false
client_only_mod = false
dst_compatible = false
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true

server_filter_tags = {"more durability", "durability", "reign of giants", "shipwrecked", "armour"}

configuration_options =
{
	{
        name = "ARMORGRASS",
        label = "Grass suit durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMORWOOD",
        label = "Log suit durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMORMARBLE",
        label = "Marble suit durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMORMARBLE_SLOW",
        label = "Marble suit speed deacrease",
        options = 
        {
            {description = "-30% (default)", data = 0.7},
            {description = "-20%", data = 0.8},
			{description = "-10%", data = 0.9},
			{description = "No restriction", data = 1},
        }, 
        default = 0.7,
    },
	{
        name = "ARMORSNURTLESHELL",
        label = "Snurtle Shell armour durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMORRUINS",
        label = "Thulecite suit durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMORDRAGONFLY",
        label = "Scalemail durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMORABSIDIAN",
        label = "Obsidian suit durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMORLIMESTONE",
        label = "Limstone Suit durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMORSEASHELL",
        label = "Sea Shell Armor durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMOR_SANITY",
        label = "Night armour durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMOR_FOOTBALLHAT",
        label = "Football Helmet durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMOR_RUINSHAT",
        label = "Thulecite Crown durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMOR_SLURTLEHAT",
        label = "Shelmet durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMOR_BEEHAT",
        label = "Beekeeper Hat durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
        name = "ARMOR_WATHGRITHRHAT",
        label = "Battle Heml durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    },
	{
		name = "ARMORCACTUS",
		label = "Cactus suit durability multiplicator",
		options =
		{
			{description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
		},
		default = 1
	},
	{
		name = "ARMOR_OXHAT",
		label = "Horned helmet durability multiplicator",
		options =
		{
			{description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
		},
		default = 1
	}
}