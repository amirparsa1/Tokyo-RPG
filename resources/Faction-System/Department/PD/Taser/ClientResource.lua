--[[
	##########################################################################
	##                                                                      ##
	## Project: 'Taser' - resource for MTA: San Andreas                     ##
	##                                                                      ##
	##########################################################################
	[C] Copyright 2013-2014, Falke
]]

local cFunc = {}
local cSetting = {}


-- FUNCTIONS --



cFunc["import_func"] = function()

	engineImportTXD (engineLoadTXD("Department/PD/Taser/data/taser.txd"), 347)
	engineReplaceModel(engineLoadDFF("Department/PD/Taser/data/taser.dff", 347), 347)
	
end


-- EVENT HANDLER --

addEventHandler("onClientResourceStart", getResourceRootElement(), cFunc["import_func"])