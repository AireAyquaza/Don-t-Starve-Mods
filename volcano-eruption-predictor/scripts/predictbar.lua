local Widget = require "widgets/widget"
local VolcanoWidget = require "widgets/volcanowidget"

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
		local xPos = filter(60.0, 70.0)
		local yPos = filter(-30.0, -70.0)
		
		local container = controls:AddChild(Widget("RPGMonsterInfoContainer"))
		container:SetHAnchor(ANCHOR_LEFT)
		container:SetVAnchor(ANCHOR_TOP)
		container:SetPosition(xPos, yPos, 0.0)
		container:SetClickable(false)
		container:SetScaleMode(SCALEMODE_PROPORTIONAL)
		
		local volcanobar = container:AddChild(VolcanoWidget(userConfig, width, height, container))
		
		local entity = CreateEntity()
		entity:DoPeriodicTask(0.5, function()
			local actualTime = (TUNING.TOTAL_DAY_TIME * (GetClock():GetNormTime() * 100)) / 100
			local actualSeg = math.floor(actualTime / 30)
			local timeInSeg = actualTime - (actualSeg * 30)
			
			local vm = GetWorld().components.volcanomanager
			
			if vm ~= nil then
				local segsUntilEruption = vm:GetNumSegmentsUntilEruption()
			
				local text = filter("??m ??", "No eruption\npredicted!")
				
				if segsUntilEruption ~= nil then
					local timeSegs = math.floor((segsUntilEruption * 30) - timeInSeg)
					local minutes = math.floor(timeSegs / 60)
					local seconds = timeSegs - (minutes * 60)
					
					if timeSegs - userConfig.warningTime == 0 and userConfig.warningTime > 0 then
						GetPlayer().components.talker:Say(GetString(GetPlayer().prefab, "WARN_BEFORE_ERUPTION"))
					end
					
					if minutes == 0 then
						timeSegs = filter(seconds.."s", seconds.." seconds")
					else
						if seconds <= 9 then
							seconds = "0"..seconds
						end
						timeSegs = minutes.."m "..seconds
					end
					
					text = filter(timeSegs, "Eruption in :\n"..timeSegs)
				else
					volcanobar:Hide()
				end
				
				volcanobar:SetLabel(text)
				
				if userConfig.drySeasonOnly and not GetSeasonManager():IsDrySeason() then
					volcanobar:Hide()
				else
					volcanobar:Show()
				end
			else
				volcanobar:Hide()
			end
		end)
	end
}