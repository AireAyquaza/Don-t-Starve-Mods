local Widget = require "widgets/widget"
local HoundsWidget = require "widgets/houndswidget"

return {
	init = function(controls, userConfig)
		
		local function filter(iftrue, iffalse)
			if userConfig.guiSize ~= "default" then
				return iftrue
			else
				return iffalse
			end
		end
		
		local width = filter(75, 80)
		local height = filter(30, 80)
		local xPos = 0.0
		local yPos = 0.0
		
		if userConfig.volcanoPredicterEnabled == true then
			if userConfig.volcanoGuiSize ~= "default" then
				xPos = filter(60.0, 180.0)
				yPos = filter(-75.0, -70.0)
			else
				xPos = filter(60.0, 200.0)
				yPos = filter(-150.0, -70.0)
			end
		else
			xPos = filter(60.0, 70.0)
			yPos = filter(-30.0, -70.0)
		end
		
		local container = controls:AddChild(Widget("RPGMonsterInfoContainer"))
		container:SetHAnchor(ANCHOR_LEFT)
		container:SetVAnchor(ANCHOR_TOP)
		container:SetPosition(xPos, yPos, 0.0)
		container:SetClickable(false)
		container:SetScaleMode(SCALEMODE_PROPORTIONAL)
		
		local houndbar = container:AddChild(HoundsWidget(userConfig, width, height, container))
		
		houndbar:Show()
		
		local entity = CreateEntity()
		entity:DoPeriodicTask(0.5, function()
			local hounded = GetWorld().components.hounded or GetWorld().components.periodicthreat.threats.WORM
			
			if hounded ~= nil then
				local secondsToAttack = hounded.timetoattack or GetWorld().components.periodicthreat.threats.WORM.timer
				
				local text = filter("??m ??", "No attack\npredicted!")
				
				if secondsToAttack ~= nil then
					if secondsToAttack < 0 then
						houndbar:SetLabel("Attack!")
					else
						local ttAttack = math.floor(secondsToAttack)
						local minutes = math.floor(ttAttack / 60)
						local seconds = ttAttack - (minutes * 60)
						
						if minutes == 0 then
							ttAttack = filter(seconds.."s", seconds.." seconds")
						else
							if seconds <= 9 then
								seconds = "0"..seconds
							end
							ttAttack = minutes.."m "..seconds
						end
						
						text = filter(ttAttack, "Attack in :\n"..ttAttack)
					end
				else
					houndbar:Hide()
				end
				
				houndbar:SetLabel(text)
			end
		end)
	end
}