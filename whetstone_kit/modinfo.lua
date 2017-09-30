name = "Whetstone Kit"
description = "Add whetstone kit to sharpens tools."
author = "Aire Ayquaza"
version = "1.0.5"

forumthread = ""

api_version = 6

icon_atlas = "modicon.xml"
icon = "modicon.tex"

dst_compatible = false
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true

server_filter_tags = {"whetstone","tool","sharpens"}

configuration_options =
{
	{
        name = "whetstone_kit_uses",
        label = "Whetstone Kit uses",
        options = 
        {
            {description = "3", data = 3},
            {description = "4", data = 4},
            {description = "5", data = 5},
            {description = "6", data = 6},
            {description = "7", data = 7},
            {description = "8", data = 8},
            {description = "9", data = 9},
            {description = "10", data = 10},
            {description = "11", data = 11},
            {description = "12", data = 12},
            {description = "13", data = 13},
            {description = "14", data = 14},
            {description = "15", data = 15},
            {description = "16", data = 16},
            {description = "17", data = 17},
            {description = "18", data = 18},
            {description = "19", data = 19},
            {description = "20", data = 20}
        }, 
        default = 5
    },
	{
        name = "whetstone_kit_repair_value",
        label = "Whetstone Kit repair value",
		hover = "This is the amount of durability the tool/weapon will recover.",
        options = 
        {
            {description = "5 percent", data = 5},
            {description = "10 percent", data = 10},
            {description = "15 percent", data = 15},
            {description = "20 percent", data = 20},
            {description = "25 percent", data = 25},
            {description = "30 percent", data = 30},
            {description = "35 percent", data = 35},
            {description = "40 percent", data = 40},
            {description = "45 percent", data = 45},
            {description = "50 percent", data = 50},
            {description = "55 percent", data = 55},
            {description = "60 percent", data = 60},
            {description = "65 percent", data = 65},
            {description = "70 percent", data = 70},
			{description = "75 percent", data = 75},
			{description = "80 percent", data = 80},
			{description = "85 percent", data = 85},
			{description = "90 percent", data = 90},
			{description = "95 percent", data = 95},
			{description = "100 percent", data = 100}
        }, 
        default = 35
    },
	{
        name = "use_marble",
        label = "Recipe difficulty",
		hover = "Normal: 5 cutstones and 10 flints | Hard: 5 cutstones, 10 flints and 4 marbles",
        options = 
        {
            {description = "Normal", data = false},
            {description = "Hard", data = true}
        }, 
        default = true
    },
	{
		name = "allow_tentaclespike",
		label = "Allow Tentacle Spike",
		hover = "Allow Tentacle Spike to be shaprened",
		options =
		{
			{description = "Yes", data = true},
			{description = "No", data = false}
		},
		default = false
	},
	{
		name = "allow_trident",
		label = "Allow Trident Spike",
		hover = "Allow Trident to be shaprened",
		options =
		{
			{description = "Yes", data = true},
			{description = "No", data = false}
		},
		default = false
	}
}