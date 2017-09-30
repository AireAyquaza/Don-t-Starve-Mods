name = "Marble Walls [DS Version]"
description = "Add marble walls into the game."
author = "Aire Ayquaza(Coder) & FranS'(Graphic Designer)"
version = "1.0.3"
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
        name = "enable_living_walls",
        label = "Enable living Walls",
		hover = "Add the Living Marble Walls witch can regenerate themselves.",
        options = 
        {
            {description = "Yes", data = true},
            {description = "No", data = false},
        }, 
        default = true,
    },
	{
        name = "living_walls_regeneration_rate",
        label = "Living Walls regeneration rate",
		hover = "Change the regeneration rate.",
        options = 
        {
            {description = "1 every 5sec", data = 1},
            {description = "2 every 5sec", data = 2},
            {description = "3 every 5sec", data = 3},
            {description = "4 every 5sec", data = 4},
            {description = "5 every 5sec", data = 5}
        }, 
        default = 1,
    },
	{
        name = "enable_undeploy",
        label = "Enable undeploy",
		hover = "Allow you to undeploy a marble wall.",
        options = 
        {
            {description = "Yes", data = true},
            {description = "No", data = false},
        }, 
        default = true,
    },
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
    }
}