name = "Message in a bottle reward for slot machine"
description = "Dependency needed : Slot Machine Reward API\n\nAdd a reward for slot machine witch gives you two message in a bottle and a golden shovel.\nNow configurable !\nThe message in a bottle can be false (rare), no chest appear when you dug up the x-marks-the-spot.\n\nMessage in a bottle are renewable with this mod!"
author = "Aire Ayquaza"
version = "1.0.3"

forumthread = ""

api_version = 6

icon_atlas = "modicon.xml"
icon = "modicon.tex"

dst_compatible = false
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = true

server_filter_tags = {"slot machine","slot","treasure", "reward", "x marks the spot", "message in a bottle", "bottle message", "shipwrecked compatible", "shipwrecked"}

configuration_options =
{
	{
        name = "reward_type",
        label = "Slot of the reward",
		hover = "This is the slot type.",
        options = 
        {
            {description = "Gold nuggets (default)", data = "good"},
            {description = "Carrots", data = "ok"},
            {description = "Skulls", data = "bad"}
        }, 
        default = "good"
    },
	{
        name = "reward_weight",
        label = "Weight of the reward",
		hover = "This is the probability to get it, a bigger value make it more probable.",
        options = 
        {
            {description = "1", data = 1},
            {description = "2", data = 2},
            {description = "3 (default)", data = 3},
            {description = "4", data = 4},
            {description = "5", data = 5},
            {description = "6", data = 6},
            {description = "7", data = 7},
            {description = "8", data = 8},
            {description = "9", data = 9},
            {description = "10", data = 10}
        }, 
        default = 3
    },
	{
        name = "bottle_amount",
        label = "Amount of message bottle in one reward.",
        options = 
        {
            {description = "1", data = 1},
            {description = "2 (default)", data = 2},
            {description = "3", data = 3},
            {description = "4", data = 4},
            {description = "5", data = 5},
        }, 
        default = 2
    },
}