name = "More durability [Boats|Sails|Lenterns]"
description = "Allow you to apply a multiplicator on boats/boats lamps/sails durabilities"
author = "Aire Ayquaza"
version = "1.0.4"

forumthread = ""

api_version = 6

icon_atlas = "modicon.xml"
icon = "modicon.tex"

all_clients_require_mod = false
client_only_mod = false
dst_compatible = false
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = true

server_filter_tags = {"more durability", "durability", "reign of giants", "shipwrecked", "boats", "sails", "lanterns"}

configuration_options =
{
	{
        name = "ROWBOAT_PERISHTIME",
        label = "Row Boat durability multiplicator",
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
        name = "RAFT_PERISHTIME",
        label = "Raft durability multiplicator",
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
        name = "LOGRAFT_PERISHTIME",
        label = "Long Raft durability multiplicator",
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
        name = "CARGOBOAT_PERISHTIME",
        label = "Cargo Boat durability multiplicator",
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
        name = "ARMOUREDBOAT_PERISHTIME",
        label = "Armoured Boat durability multiplicator",
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
        name = "BOAT_TORCH_LIGHTTIME",
        label = "Boat Torch durability multiplicator",
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
        name = "BOAT_LANTERN_LIGHTTIME",
        label = "Boat Lantern durability multiplicator",
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
        name = "BOTTLE_LANTERN_LIGHTTIME",
        label = "Boat Bottle Lantern durability multiplicator",
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
        name = "SAIL_PERISH_TIME",
        label = "Sail durability multiplicator",
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
        name = "CLOTH_SAIL_PERISH_TIME",
        label = "Cloth Sail durability multiplicator",
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
        name = "SNAKESKIN_SAIL_PERISH_TIME",
        label = "Snakeskin Sail durability multiplicator",
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
        name = "FEATHER_SAIL_PERISH_TIME",
        label = "Feather Sail durability multiplicator",
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
        name = "IRON_WIND_PERISH_TIME",
        label = "Iron Wind durability multiplicator",
        options = 
        {
            {description = "x1 (default)", data = 1},
            {description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5}
        }, 
        default = 1,
    }
}