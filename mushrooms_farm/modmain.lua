Assets      = {}
PrefabFiles = {}

local function AddModRecipe(_recName, _ingrList, _tab, _techLevel, _recType, _placer, _spacing, _proxyLock, _amount)
	if GLOBAL.CAPY_DLC and GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC) then
		return GLOBAL.Recipe(_recName, _ingrList , _tab, _techLevel, _recType, _placer, _spacing, _proxyLock, _amount)
	else
		return GLOBAL.Recipe(_recName, _ingrList , _tab, _techLevel, _placer, _spacing, _proxyLock, _amount)
	end
end

local function AddMap(inst)
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon( inst.prefab .. ".tex" )
end

modimport('src/mushtree_spores.lua')
modimport('src/mushroom_farm.lua')
modimport('src/mushtree.lua')