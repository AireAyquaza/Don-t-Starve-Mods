name = "More durability [Misc]"
description = "Allow you to modify items durabilities"
author = "Aire Ayquaza"
version = "1.0.4"

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

server_filter_tags = {"more durability", "durability", "reign of giants", "shipwrecked", "items", "misc"}

configuration_options =
{
	{
        name = "PANFLUTE_USES",
        label = "Pan Flute uses",
        options = 
        {
            {description = "10 (default)", data = 10},
            {description = "20", data = 20},
			{description = "30", data = 30},
			{description = "40", data = 40},
			{description = "50", data = 50}
        }, 
        default = 10,
    },
	{
        name = "HORN_USES",
        label = "Beefalo's horn uses",
        options = 
        {
            {description = "10 (default)", data = 10},
            {description = "20", data = 20},
			{description = "30", data = 30},
			{description = "40", data = 40},
			{description = "50", data = 50}
        }, 
        default = 10,
    },
	{
        name = "TRAP_TEETH_USES",
        label = "Tooth Trap uses",
        options = 
        {
            {description = "10 (default)", data = 10},
            {description = "20", data = 20},
			{description = "30", data = 30},
			{description = "40", data = 40},
			{description = "50", data = 50}
        }, 
        default = 10,
    },
	{
        name = "TRAP_USES",
        label = "Rabbits trap uses",
        options = 
        {
            {description = "8 (default)", data = 8},
            {description = "16", data = 16},
			{description = "24", data = 24},
			{description = "32", data = 32},
			{description = "40", data = 40}
        }, 
        default = 8,
    },
	{
        name = "TENT_USES",
        label = "Tent uses",
        options = 
        {
			{description = "6 (default)", data = 6},
            {description = "10", data = 10},
            {description = "20", data = 20},
            {description = "30", data = 30},
			{description = "45", data = 40},
            {description = "50", data = 50},
			{description = "60", data = 60},
            {description = "70", data = 70},
			{description = "80", data = 80},
            {description = "90", data = 90},
			{description = "100", data = 100},
			{description = "Infinite", data = 10000000}
        }, 
        default = 6,
    },
	{
        name = "UMBRELLA_USES",
        label = "Umbrella uses",
        options = 
        {
            {description = "20 (default)", data = 20},
            {description = "40", data = 40},
			{description = "60", data = 60},
			{description = "80", data = 80},
			{description = "100", data = 100}
        }, 
        default = 20,
    },
	{
        name = "SEWINGKIT_USES",
        label = "Sewing Kit uses",
        options = 
        {
            {description = "5 (default)", data = 5},
            {description = "10", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25}
        }, 
        default = 5,
    },
	{
        name = "TORCH_FUEL",
        label = "Torch durability",
        options = 
        {
            {description = "1min 15sec (default)", 1},
            {description = "2min 30sec", data = 2},
			{description = "3min 45", data = 3},
			{description = "5min", data = 4},
			{description = "6min 15sec", data = 5}
        }, 
        default = 1,
    },
	{
        name = "SIESTA_CANOPY_USES",
        label = "Siesta Lean-to uses",
        options = 
        {
			{description = "6 (default)", data = 6},
            {description = "10", data = 10},
            {description = "20", data = 20},
            {description = "30", data = 30},
			{description = "45", data = 40},
            {description = "50", data = 50},
			{description = "60", data = 60},
            {description = "70", data = 70},
			{description = "80", data = 80},
            {description = "90", data = 90},
			{description = "100", data = 100},
			{description = "Infinite", data = 10000000}
        }, 
        default = 6,
    },
	{
        name = "FERTILIZER_USES",
        label = "Bucket-o-poop uses",
        options = 
        {
            {description = "10 (default)", 10},
            {description = "20", data = 20},
			{description = "30", data = 30},
			{description = "40", data = 40},
			{description = "50", data = 50}
        }, 
        default = 10,
    },
	{
        name = "GLOMMERBELL_USES",
        label = "Old Bell uses",
        options = 
        {
            {description = "3 (default)", 3},
            {description = "6", data = 6},
			{description = "9", data = 9},
			{description = "12", data = 12},
			{description = "15", data = 15}
        }, 
        default = 3,
    },
	{
        name = "FEATHER_FAN_USES",
        label = "Luxury Fan uses",
        options = 
        {
            {description = "15 (default)", 15},
            {description = "30", data = 30},
			{description = "45", data = 45},
			{description = "60", data = 60},
			{description = "75", data = 75}
        }, 
        default = 15,
    },
	{
        name = "MONKEYBALL_USES",
        label = "Silly Monkey Ball uses",
        options = 
        {
            {description = "10 (default)", 10},
            {description = "20", data = 20},
			{description = "30", data = 30},
			{description = "40", data = 40},
			{description = "50", data = 50}
        }, 
        default = 10,
    },
	{
        name = "TELESCOPE_USES",
        label = "Spyglass uses",
        options = 
        {
            {description = "5 (default)", 5},
            {description = "10", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25}
        }, 
        default = 5,
    },
	{
        name = "BOAT_REPAIR_KIT_USES",
        label = "Boat repair kit uses",
        options = 
        {
            {description = "3 (default)", 3},
            {description = "6", data = 6},
			{description = "9", data = 9},
			{description = "12", data = 12},
			{description = "15", data = 15}
        }, 
        default = 3,
    }
}