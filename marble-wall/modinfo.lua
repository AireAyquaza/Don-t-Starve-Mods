name = "Marble Walls [DS Version]"
description = "Add marble walls into the game. Compatible with Wall Health Regen Mod."
author = "Aire Ayquaza(Coder) & FranS'(Graphic Designer)"
version = "1.0.1"
-- Thanks to Arkathorn from Klei mod forum for contrubitions.

forumthread = ""

api_version = 6

icon_atlas = "modicon.xml"
icon = "modicon.tex"

dst_compatible = false
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true

server_filter_tags = {"Marble Walls","wall","marble"}

configuration_options =
{
	{
        name = "cancel_marblesuit_weight",
        label = "No Marble Suit weight",
		hover = "Cancels the weight of the marble armor for the player can run with this normal run speed.",
        options = 
        {
            {description = "Yes", data = true},
            {description = "No", data = false},
        }, 
        default = false,
    },
}