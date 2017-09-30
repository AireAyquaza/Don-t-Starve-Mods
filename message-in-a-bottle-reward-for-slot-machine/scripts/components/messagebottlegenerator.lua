require "map/treasurehunt"
require "util"

local groundtypes =
{
	GROUND.BEACH,
	GROUND.JUNGLE,
	GROUND.SWAMP,
	GROUND.VOLCANO,
	GROUND.ASH,
	GROUND.MAGMAFIELD,
	GROUND.MEADOW,
	GROUND.TIDALMARSH,
	GROUND.WOODFLOOR,
	GROUND.CARPET,
	GROUND.SNAKESKIN,
}

local function GetRandomTableKey(Table)
	local rnd = math.random(1, GetTableSize(Table))
	local i = 0
	
	for k,_ in pairs(Table) do
		if i == rnd then
			return k
		end
		i = i + 1
	end
end

local MessageBottleGenerator = Class(function(self, inst)
	self.inst = inst
end)

function MessageBottleGenerator:AddGroundType(ground)
	table.insert(groundtypes, ground)
end

function MessageBottleGenerator:GenerateChest()
	local x,y,z = 0,0,0
	local chest = nil
	
	while chest == nil do
		x = math.random(-5000, 5000)
		z = math.random(-5000, 5000)
		
		if table.contains(groundtypes, GetWorld().Map:GetTileAtPoint(x,y,z)) then
			chest = SpawnPrefab("buriedtreasure")
			chest.Transform:SetPosition(x,y,z)
			chest.loot = GetRandomTableKey(GetTreasureDefinitionTable())
			return chest
		end
	end
end

return MessageBottleGenerator