name = "Hounds attack predictor" 

description = "Predict hounds attacks with a displayed timer in a widget.\n\nThe widget is on top left of the screen, there is a timer on the widget indicate how many time left before the next attack.\n\nCompatible with Volcano eruption predictor."
author = "Aire Ayquaza"
version = "1.0.1"

api_version = 6
priority = 0

dont_starve_compatible = true
dst_compatible = false
reign_of_giants_compatible = true
shipwrecked_compatible = true
server_filter_tags = {"hounds attack predictor", "hounds", "hound", "attack", "predictor", "shipwrecked compatible", "shipwrecked"}

icon_atlas = "modicon.xml"
icon = "modicon.tex"

forumthread = ""

configuration_options = {
	{
		name = "GUISIZEHOUNDS",
		label = "Widget size",
		options = {
			{description = "Default", data = "default"},
			{description = "Smaller", data = "smaller"}
		},
		default = "default"
	}
}