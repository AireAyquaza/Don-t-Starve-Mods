local Image = require "widgets/image"
local Text = require "widgets/text"
local Widget = require "widgets/widget"

Assets =
{
	Asset("ATLAS", "images/volcanowidget.xml"),
	Asset("ATLAS", "images/volcanowidgetresized.xml"),
}

local VolcanoWidget = Class(Widget, function(self, userConfig, width, height, owner)
	Widget._ctor(self, "VolcanoWidget")
	
	self.owner = owner
	self.width = width
	self.height = height
	
	self:SetClickable(false)
	self:SetScale(1, 1, 1)
	
	self.bgimage = self:AddChild(Image())
	if userConfig.guiSize ~= "default" then
		self.bgimage:SetTexture("images/volcanowidgetresized.xml", "volcanowidgetresized.tex")
	else
		self.bgimage:SetTexture("images/volcanowidget.xml", "volcanowidget.tex")
	end
    self.bgimage:ScaleToSize(self.width, self.height)
    self.bgimage:SetTint(1.0, 1.0, 1.0, 1.0)
    self.bgimage:SetBlendMode(1)
	
	if userConfig.guiSize ~= "default" then
		self.label = self:AddChild(Text("stint-ucr", userConfig.fontSize - 3, "??m ??"))
		self.label:SetPosition(12.0, 0.0, 0.0)
	else
		self.label = self:AddChild(Text("stint-ucr", userConfig.fontSize, "No eruption\npredicted!"))
		self.label:SetPosition(3.0, -5.0, 0.0)
	end
	self.label:SetHAlign(ANCHOR_MIDDLE)
end)

function VolcanoWidget:SetLabel(text)
	self.label:SetString(text)
end

return VolcanoWidget