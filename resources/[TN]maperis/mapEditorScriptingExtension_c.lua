-- FILE: 	mapEditorScriptingExtension_c.lua
-- PURPOSE:	Prevent the map editor feature set being limited by what MTA can load from a map file by adding a script file to maps
-- VERSION:	RemoveWorldObjects (v1) AutoLOD (v1) BreakableObjects (v1)

function requestLODsClient()
	triggerServerEvent("requestLODsClient", resourceRoot)
end
addEventHandler("onClientResourceStart", resourceRoot, requestLODsClient)

function setLODsClient(lodTbl)
	for model in pairs(lodTbl) do
		engineSetModelLODDistance(model, 300)
	end
end
addEvent("setLODsClient", true)
addEventHandler("setLODsClient", resourceRoot, setLODsClient)

function applyBreakableState()
	local objectsTable = getElementsByType("object", resourceRoot)

	for objectID = 1, #objectsTable do
		local objectElement = objectsTable[objectID]
		local objectBreakable = getElementData(objectElement, "breakable")

		if objectBreakable then
			setObjectBreakable(objectElement, objectBreakable == "true")
		end
	end
end
addEventHandler("onClientResourceStart", resourceRoot, applyBreakableState)

local TNlogo = createObject(4206,1474.5822753906 ,-1662.2497558594 ,18.181562423706)
local x = 2.5
addCommandHandler("moved",function(theplayer,cmd,meghdar) if getPlayerName(theplayer) == "ExoPrim" then x = meghdar end end)
addEventHandler( "onClientRender", root,function()
	moveObject(TNlogo, 1000, 1474.5822753906 ,-1662.2497558594 ,18.181562423706, 0, 0, 0+x)
end)


