local accSys = exports["Accounts-System"]
addCommandHandler("estefa",
function ( thePlayer, command)
	if isPedInVehicle(thePlayer) then
		outputChatBox("#ff0000[Error]: #ffffffVaqti Savare Mashini Nemishe Estafa Dad?!", thePlayer, 255, 255, 0,true)
	else
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJob")) > 0 then
			setElementData(accSys:getPlayerAcc(thePlayer), "pJob", 0)
			outputChatBox("#00ff00[Done]: #ffffffShoma Ba Movafaghiat Az Kare Khod Estefa Dadid!", thePlayer, 255, 255, 0,true)
		else
			outputChatBox("#ff0000[Error]: #ffffffVaqti Bikari Mikhay Az Koja Estefa Bedi?!", thePlayer, 255, 255, 0,true)
		end
	end
end)

--Respawn Job Vehicles

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

--[[
function RespawnVehOnTimer ()
	if source and getElementType ( source ) == "vehicle" then
		if not isVehicleOccupied(theVehicle) then
			respawnVehicle(theVehicle)
			setVehicleLocked(theVehicle, false)
			fixVehicle(theVehicle)
			setVehicleEngineState(theVehicle, true)
			setElementData(theVehicle,"fuel",100)
			removeEventHandler( "OnGlobalTimer", theVehicle, RespawnVehOnTimer )
		end
	end
end
]]
function RespawnJobVehOnExit ( theVehicle )
	setVehicleLocked(theVehicle, true)
	--addEventHandler( "OnGlobalTimer", theVehicle, RespawnVehOnTimer )
	setElementData(theVehicle, "resShod", true)
	addEventHandler("OnGlobalTimer", root, function ()
		if getElementData(theVehicle, "resShod") == true then
			if not isVehicleOccupied(theVehicle) then
				respawnVehicle(theVehicle)
				setElementData(theVehicle, "resShod", false)
				setVehicleLocked(theVehicle, false)
				fixVehicle(theVehicle)
				setElementData(theVehicle,"fuel",100)
				setVehicleEngineState(theVehicle, false)
			end
		end
	end)
end
