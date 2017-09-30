local Screen = require "widgets/screen"
local Menu = require "widgets/menu"
local Image = require "widgets/image"
local Text = require "widgets/text"
local Widget = require "widgets/widget"

local DependencyScreen = Class(Screen, function(self, title, str)
	Screen._ctor(self, "DependencyScreen")
	
	self.active = true
	
	self.black = self:AddChild(Image("images/global.xml", "square.tex"))
    self.black:SetVRegPoint(ANCHOR_MIDDLE)
    self.black:SetHRegPoint(ANCHOR_MIDDLE)
    self.black:SetVAnchor(ANCHOR_MIDDLE)
    self.black:SetHAnchor(ANCHOR_MIDDLE)
    self.black:SetScaleMode(SCALEMODE_FILLSCREEN)
	self.black:SetTint(0,0,0,.75)	

	self.proot = self:AddChild(Widget("ROOT"))
    self.proot:SetVAnchor(ANCHOR_MIDDLE)
    self.proot:SetHAnchor(ANCHOR_MIDDLE)
    self.proot:SetPosition(0,0,0)
    self.proot:SetScaleMode(SCALEMODE_PROPORTIONAL)
	
	self.bg = self.proot:AddChild(Image("images/globalpanels.xml", "small_dialog.tex"))
    self.bg:SetVRegPoint(ANCHOR_MIDDLE)
    self.bg:SetHRegPoint(ANCHOR_MIDDLE)
	self.bg:SetScale(1.5,1.2,1.2)
	
	self.title = self.proot:AddChild(Text(TITLEFONT, 50))
    self.title:SetPosition(0, 50, 0)
    self.title:SetString(title)
	
	self.desc = self.proot:AddChild(Text(TITLEFONT, 35))
	self.desc:SetPosition(0, 0, 0)
	self.desc:SetString(str)
	
	local button_w = 160
	
	local buttons = {}
	table.insert(buttons, {text="Ignore", cb=function() TheFrontEnd:PopScreen(self) end})
	table.insert(buttons, {text="Visit URL", cb=function() VisitURL("https://steamcommunity.com/sharedfiles/filedetails/?id=") end})
	
	self.menu = self.proot:AddChild(Menu(buttons, button_w, true))
	self.menu:SetPosition(-(button_w*(#buttons-1))/2, -65, 0)
	
	TheInputProxy:SetCursorVisible(true)
	self.default_focus = self.menu
end)

function DependencyScreen:OnBecomeActive()
	DependencyScreen._base.OnBecomeActive(self)
	-- Hide the topfade, it'll obscure the pause menu if paused during fade. Fade-out will re-enable it
	TheFrontEnd:HideTopFade()
end

return DependencyScreen