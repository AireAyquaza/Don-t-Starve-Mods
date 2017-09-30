name = "More durability [Weapons|Tools]"
description = "Allow you to modify weapons and tools durabilities"
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

server_filter_tags = {"more durability", "durability", "reign of giants", "shipwrecked", "tools", "weapons"}
--MACHETE_USES
configuration_options =
{
    {
        name = "HAMMER_LOOT_PERCENT",
        label = "Hammer drop rate",
        options = 
        {
            {description = "50% (default)", data = 0.5},
            {description = "75%", data = 0.75},
			{description = "90%", data = 0.9},
			{description = "100", data = 1}
        }, 
        default = 0.5,
    },
	{
        name = "AXE_USES",
        label = "Axe uses",
        options = 
        {
            {description = "100 (default)", data = 100},
            {description = "200", data = 200},
			{description = "300", data = 300},
			{description = "400", data = 400},
			{description = "500", data = 500}
        }, 
        default = 100,
    },
	{
        name = "HAMMER_USES",
        label = "Hammer uses",
        options = 
        {
            {description = "75 (default)", data = 75},
            {description = "150", data = 150},
			{description = "275", data = 275},
			{description = "300", data = 300},
			{description = "375", data = 375}
        }, 
        default = 75,
    },
	{
        name = "SHOVEL_USES",
        label = "Shovel uses",
        options = 
        {
            {description = "25 (default)", data = 25},
            {description = "50", data = 50},
			{description = "75", data = 75},
			{description = "100", data = 100},
			{description = "125", data = 125}
        }, 
        default = 25,
    },
	{
        name = "PITCHFORK_USES",
        label = "Pitchfork uses",
        options = 
        {
            {description = "25 (default)", data = 25},
            {description = "50", data = 50},
			{description = "75", data = 75},
			{description = "100", data = 100},
			{description = "125", data = 125}
        }, 
        default = 25,
    },
	{
        name = "PICKAXE_USES",
        label = "Pickaxe uses",
        options = 
        {
            {description = "33 (default)", data = 33},
            {description = "66", data = 66},
			{description = "100", data = 100},
			{description = "133", data = 133},
			{description = "166", data = 166}
        }, 
        default = 33,
    },
	{
        name = "BUGNET_USES",
        label = "Bug Net uses",
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
        name = "FISHINGROD_USES",
        label = "Fishong Rod uses",
        options = 
        {
            {description = "9 (default)", data = 9},
            {description = "18", data = 18},
			{description = "27", data = 27},
			{description = "36", data = 36},
			{description = "45", data = 45}
        }, 
        default = 9,
    },
	{
        name = "MULTITOOL_AXE_PICKAXE_USES",
        label = "Pick/Axe uses",
        options = 
        {
            {description = "400 (default)", data = 400},
            {description = "800", data = 800},
			{description = "1200", data = 1200},
			{description = "1600", data = 1600},
			{description = "2000", data = 2000}
        }, 
        default = 400,
    },
	{
        name = "MACHETE_USES",
        label = "Machete uses",
        options = 
        {
            {description = "100 (default)", data = 100},
            {description = "200", data = 200},
			{description = "300", data = 300},
			{description = "400", data = 400},
			{description = "500", data = 500}
        }, 
        default = 100,
    },
	{
        name = "SPEAR_USES",
        label = "Spear uses",
        options = 
        {
            {description = "150 (default)", data = 150},
            {description = "300", data = 300},
			{description = "450", data = 450},
			{description = "600", data = 600},
			{description = "750", data = 750}
        }, 
        default = 150,
    },
	{
        name = "WATHGRITHR_SPEAR_USES",
        label = "Battle Spear uses",
        options = 
        {
            {description = "200 (default)", data = 200},
            {description = "400", data = 400},
			{description = "600", data = 600},
			{description = "800", data = 800},
			{description = "1000", data = 1000}
        }, 
        default = 200,
    },
	{
        name = "SPIKE_USES",
        label = "Tentacle spike uses",
        options = 
        {
            {description = "100 (default)", data = 100},
            {description = "200", data = 200},
			{description = "300", data = 300},
			{description = "400", data = 400},
			{description = "500", data = 500}
        }, 
        default = 100,
    },
	{
        name = "BOOMERANG_USES",
        label = "Boomrang uses",
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
        name = "NIGHTSWORD_USES",
        label = "Dark sword uses",
        options = 
        {
            {description = "100 (default)", data = 100},
            {description = "200", data = 200},
			{description = "300", data = 300},
			{description = "400", data = 400},
			{description = "500", data = 500}
        }, 
        default = 100,
    },
	{
        name = "HAMBAT_USES",
        label = "Ham Bat uses",
        options = 
        {
            {description = "100 (default)", data = 100},
            {description = "200", data = 200},
			{description = "300", data = 300},
			{description = "400", data = 400},
			{description = "500", data = 500}
        }, 
        default = 100,
    },
	{
        name = "BATBAT_USES",
        label = "Bat Bat uses",
        options = 
        {
            {description = "75 (default)", data = 75},
            {description = "150", data = 150},
			{description = "225", data = 225},
			{description = "300", data = 300},
			{description = "375", data = 375}
        }, 
        default = 75,
    },
	{
        name = "RUINS_BAT_USES",
        label = "Thulecite Club uses",
        options = 
        {
            {description = "150 (default)", data = 150},
            {description = "300", data = 300},
			{description = "450", data = 450},
			{description = "600", data = 600},
			{description = "750", data = 750}
        }, 
        default = 150,
    },
	{
        name = "AXTINGUISHER_USES",
        label = "Axtinguisher uses",
        options = 
        {
            {description = "250 (default)", data = 250},
            {description = "500", data = 500},
			{description = "750", data = 750},
			{description = "1000", data = 1000},
			{description = "1250", data = 1250}
        }, 
        default = 250,
    },
	{
        name = "FLAREGUN_USES",
        label = "Flaregun uses",
        options = 
        {
            {description = "30 (default)", data = 30},
            {description = "60", data = 60},
			{description = "90", data = 90},
			{description = "120", data = 120},
			{description = "150", data = 150}
        }, 
        default = 250,
    },
	{
        name = "CUTLASS_USES",
        label = "Cutlass Supreme uses",
        options = 
        {
            {description = "150 (default)", data = 150},
            {description = "300", data = 300},
			{description = "450", data = 450},
			{description = "600", data = 600},
			{description = "750", data = 750}
        }, 
        default = 250,
    },
	{
        name = "PEG_LEG_USES",
        label = "Peg Leg uses",
        options = 
        {
            {description = "150 (default)", data = 150},
            {description = "300", data = 300},
			{description = "450", data = 450},
			{description = "600", data = 600},
			{description = "750", data = 750}
        }, 
        default = 250,
    },
	{
        name = "HARPOON_USES",
        label = "Harpoon uses",
        options = 
        {
            {description = "150 (default)", data = 150},
            {description = "300", data = 300},
			{description = "450", data = 450},
			{description = "600", data = 600},
			{description = "750", data = 750}
        }, 
        default = 250,
    },
	{
		name = "SPEAR_LAUNCHER_USES",
		label = "Speargun uses",
		options =
		{
			{description = "8 (default)", data = 8},
            {description = "12", data = 12},
			{description = "16", data = 16},
			{description = "20", data = 20},
			{description = "24", data = 24},
			{description = "28", data = 28},
			{description = "32", data = 32}
		},
		default = 8
	}
}