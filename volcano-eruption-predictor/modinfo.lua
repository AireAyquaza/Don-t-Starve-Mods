name = "Volcano eruption predictor" 

description = "Predict volcano's eruption with a displayed timer in a widget.\n\nThe widget is on top left of the screen only for Dry season, there is a timer on the widget indicate how many time left before the next eruption."
author = "Aire Ayquaza"
version = "1.0.8"

api_version = 6
priority = 0

dont_starve_compatible = false
dst_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = true
server_filter_tags = {"volcano eruption predictor", "volcano", "eruption", "predictor", "shipwrecked compatible", "shipwrecked", "dry season"}

icon_atlas = "modicon.xml"
icon = "modicon.tex"

forumthread = ""

configuration_options = {
	{
		name = "GUISIZEVOLCANO",
		label = "Widget size",
		options = {
			{description = "Default", data = "default"},
			{description = "Smaller", data = "smaller"}
		},
		default = "default"
	},
	{
		name = "ENABLEWARING",
		label = "Warning before eruption",
		hover = "The character will talk for warn from the eruption.",
		options = {
			{description = "Don't warn me", data = 0},
			{description = "15sec before", data = 15},
			{description = "30sec before", data = 30},
			{description = "1min before", data = 60},
			{description = "2min before", data = 120}
		},
		default = 0
	},
	{
		name = "DRYONLY",
		label = "Only see on Dry season",
		hover = "Display widget only on dry season or not.",
		options = {
			{description = "Yes", data = true},
			{description = "No", data = false}
		},
		default = true
	}
}