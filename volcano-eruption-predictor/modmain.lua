KnownModIndex = GLOBAL.KnownModIndex
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local config =
{
	fontSize = 17,
	guiSize = GetModConfigData("GUISIZEVOLCANO"),
	warningTime = GetModConfigData("ENABLEWARING"),
	drySeasonOnly = GetModConfigData("ONLYDRY")
}

STRINGS.CHARACTERS.GENERIC.WARN_BEFORE_ERUPTION = "I need to get away from here!"
STRINGS.CHARACTERS.WX78.WARN_BEFORE_ERUPTION = "MY SYSTEM TELLS ME THAT IT'S DANGEROUS TO STAY HERE!"

Assets =
{
	Asset("ATLAS", "images/volcanowidget.xml"),
	Asset("ATLAS", "images/volcanowidgetresized.xml")
}

local PredictBar = require "predictbar"
AddClassPostConstruct("widgets/controls", function(hud)
		PredictBar.init(hud, config)
end)