name = "More durability [Dress]"
description = "Allow you to apply a multiplicator on dress durabilities"
author = "Aire Ayquaza"
version = "1.0.9"

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

server_filter_tags = {"more durability", "durability", "reign of giants", "shipwrecked", "dress"}

configuration_options =
{
    {
        name = "MINERHAT_LIGHTTIME",
        label = "Miner's Hat durability multiplicator",
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
        name = "LANTERN_LIGHTTIME",
        label = "Lantern durability multiplicator",
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
        name = "SPIDERHAT_PERISHTIME",
        label = "Spider Hat durability multiplicator",
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
        name = "ONEMANBAND_PERISHTIME",
        label = "One-man Band durability multiplicator",
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
        name = "GRASS_UMBRELLA_PERISHTIME",
        label = "Pretty Parasol durability multiplicator",
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
        name = "UMBRELLA_PERISHTIME",
        label = "Umbrella durability multiplicator",
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
		name = "DOUBLE_UMBRELLA_PERISHTIME",
		label = "Dumbrella durability multiplicator",
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
        name = "EYEBRELLA_PERISHTIME",
        label = "Eyebrella durability multiplicator",
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
        name = "STRAWHAT_PERISHTIME",
        label = "Straw Hat durability multiplicator",
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
        name = "EARMUFF_PERISHTIME",
        label = "Rabbit Earmuffs durability multiplicator",
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
        name = "WINTERHAT_PERISHTIME",
        label = "Winter Hat durability multiplicator",
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
        name = "BEEFALOHAT_PERISHTIME",
        label = "Beefalo Hat durability multiplicator",
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
        name = "TRUNKVEST_PERISHTIME",
        label = "Breezy Vest & Puffy Vest durability multiplicator",
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
        name = "REFLECTIVEVEST_PERISHTIME",
        label = "Summer Vest durability multiplicator",
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
        name = "HAWAIIANSHIRT_PERISHTIME",
        label = "Floral Shirt durability multiplicator",
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
        name = "SWEATERVEST_PERISHTIME",
        label = "Dapper Vest durability multiplicator",
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
        name = "HUNGERBELT_PERISHTIME",
        label = "Belt of Hunger durability multiplicator",
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
        name = "BEARGERVEST_PERISHTIME",
        label = "Hibearnation Vest durability multiplicator",
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
        name = "RAINCOAT_PERISHTIME",
        label = "Rain Coat durability multiplicator",
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
        name = "WALRUSHAT_PERISHTIME",
        label = "Tam o' Shanter durability multiplicator",
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
        name = "FEATHERHAT_PERISHTIME",
        label = "Feather Hat durability multiplicator",
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
        name = "TOPHAT_PERISHTIME",
        label = "Top Hat durability multiplicator",
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
        name = "MOLEHAT_PERISHTIME",
        label = "Moggles durability multiplicator",
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
        name = "ICEHAT_PERISHTIME",
        label = "Ice Cube durability multiplicator",
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
        name = "RAINHAT_PERISHTIME",
        label = "Rain Hat durability multiplicator",
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
        name = "CATCOONHAT_PERISHTIME",
        label = "Cat Cap durability multiplicator",
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
        name = "BLUBBERSUIT_PERISHTIME",
        label = "Blubber Suit durability multiplicator",
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
        name = "WINDBREAKER_PERISHTIME",
        label = "Windbreaker durability multiplicator",
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
        name = "AERODYNAMICHAT_PERISHTIME",
        label = "Sleek Hat durability multiplicator (RoG)",
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
        name = "CAPTAINHAT_PERISHTIME",
        label = "Capitain Hat durability multiplicator",
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
        name = "PIRATEHAT_PERISHTIME",
        label = "Pirate Hat durability multiplicator",
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
        name = "GASHAT_PERISHTIME",
        label = "Gas Mask durability multiplicator",
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
        name = "SHARK_HAT_PERISHTIME",
        label = "Sleek Hat durability multiplicator (SW)",
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
        name = "ARMOR_SNAKESKIN_PERISHTIME",
        label = "Snakeskin Jacket durability multiplicator",
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
        name = "SNAKESKINHAT_PERISHTIME",
        label = "Snakeskin Hat durability multiplicator",
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
		name = "SHARK_HAT_PERISHTIME",
		label = "Shark Tooth Crown durability multiplicator",
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
		name = "TARSUIT_PERISHTIME",
		label = "Tar suit durability multiplicator",
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
		name = "WOODLEGSHAT_PERISHTIME",
		label = "Woodlegs Hat durability multiplicator",
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