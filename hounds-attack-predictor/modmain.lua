KnownModIndex = GLOBAL.KnownModIndex
local require = GLOBAL.require

local config =
{
	fontSize = 17,
	guiSize = GetModConfigData("GUISIZEHOUNDS"),
	
	volcanoPredicterEnabled = KnownModIndex:IsModEnabled("workshop-622499881"),
	volcanoGuiSize = GLOBAL.GetModConfigData("GUISIZEVOLCANO", "workshop-622499881")
}
Assets =
{
	Asset("ATLAS", "images/houndswidget.xml"),
	Asset("ATLAS", "images/houndswidgetresized.xml"),
	Asset("ATLAS", "images/depthwormswidget.xml"),
	Asset("ATLAS", "images/depthwormswidgetresized.xml")
}

local HoundsPredictBar = require "houndspredictbar"
AddClassPostConstruct("widgets/controls", function(hud)
	HoundsPredictBar.init(hud, config)
end)