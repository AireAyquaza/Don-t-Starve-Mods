local ROG_INSTALLED = GLOBAL.IsDLCInstalled(GLOBAL.REIGN_OF_GIANTS)
local ROG_ENABLED = GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS)
local SW_INSTALLED = GLOBAL.rawget(GLOBAL, "CAPY_DLC") and GLOBAL.IsDLCInstalled(GLOBAL.CAPY_DLC)
local SW_ENABLED = GLOBAL.rawget(GLOBAL, "CAPY_DLC") and GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC)

if SW_INSTALLED and SW_ENABLED then
	modimport('src/marble_walls_sw.lua')
end

if not SW_ENABLED then
	modimport('src/marble_walls_rog.lua')
end