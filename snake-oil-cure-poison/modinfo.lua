name = "Snake Oil cure poison"
description = "Allow you to use snake oil as an anti venom. \nSnake oil is a very rare item droped by snakes when killed by player, it's an unlimited item."
author = "Aire_Ayquaza"
version = "1.0.3"

forumthread = ""

api_version = 6

all_clients_require_mod = true
client_only_mod = true
dst_compatible = false
dont_starve_compatible = true
reign_of_giants_compatible = false
shipwrecked_compatible = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {"snake oil", "snake", "oil", "anti venom", "anti poison", "inifnite use", "venom", "poison"}

configuration_options =
{
    {
        name = "POISON_IMMUNE_DURATION",
        label = "Poison immune duration after cure",
        options = 
        {
            {description = "1/16 day (default)", data = 0.0625},
            {description = "1/8 day ", data = 0.125},
            {description = "1/4 day", data = 0.25},
            {description = "1/2 day", data = 0.5},
			{description = "1 day", data = 1}
        }, 
        default = 0.0625,
    }
}