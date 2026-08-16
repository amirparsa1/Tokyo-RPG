--Rent System By Gi!
function enterVehicle ( thePlayer, seat, jacked ) 
	local theVehicle = getPedOccupiedVehicle (thePlayer)
	local rentStatsVeh = getElementData(theVehicle, "rentStats" )
	local rentStatsPl = getElementData(thePlayer, "rentStats")
	local id = getElementModel(theVehicle)
	local vehid = getElementID ( theVehicle )
	if vehid == "rent1" or vehid == "rent2" or vehid == "rent3" or vehid == "rent4" or vehid == "rent5" or vehid == "rent6" or vehid == "rent7" or vehid == "rent8" or vehid == "rent9" or vehid == "rent10" or vehid == "rent11" or vehid == "rent12" or vehid == "rent13" or vehid == "rent14" or vehid == "rent15" or vehid == "rent16" or vehid == "rent17" or vehid == "rent18" or vehid == "rent19" or vehid == "rent20" or vehid == "rent21" or vehid == "rent22" or vehid == "rent23" or vehid == "rent24" or vehid == "rent25" or vehid == "rent26" or vehid == "rent27" or vehid == "rent28" or vehid == "rent29" or vehid == "rent30" or vehid == "rent31" or vehid == "rent32" or vehid == "rent33" or vehid == "rent34" or vehid == "rent35" or vehid == "rent36" or vehid == "rent37" or vehid == "rent38" or vehid == "rent39" then
		--if seat == 0 then
			if rentStatsVeh == false then
				if rentStatsPl == true then
					triggerClientEvent ( thePlayer, "onUnrenting", thePlayer)
				else
					triggerClientEvent ( thePlayer, "onRenting", thePlayer)
				end
			end
		--end
	end
end
addEventHandler ( "onVehicleEnter", getRootElement(), enterVehicle )

addCommandHandler("rentveh",
function ( thePlayer, command)
	local theVehicle = getPedOccupiedVehicle (thePlayer)
	local rentStatsVeh = getElementData(theVehicle, "rentStats")
	local rentStatsPl = getElementData(thePlayer, "rentStats")
	local sahebRent = getPlayerName(thePlayer)
	local vehid = getElementID ( theVehicle ) 
	if vehid == "rent1" or vehid == "rent2" or vehid == "rent3" or vehid == "rent4" or vehid == "rent5" or vehid == "rent6" or vehid == "rent7" or vehid == "rent8" or vehid == "rent9" or vehid == "rent10" or vehid == "rent11" or vehid == "rent12" or vehid == "rent13" or vehid == "rent14" or vehid == "rent15" or vehid == "rent16" or vehid == "rent17" or vehid == "rent18" or vehid == "rent19" or vehid == "rent20" or vehid == "rent21" or vehid == "rent22" or vehid == "rent23" or vehid == "rent24" or vehid == "rent25" or vehid == "rent26" or vehid == "rent27" or vehid == "rent28" or vehid == "rent29" or vehid == "rent30" or vehid == "rent31" or vehid == "rent32" or vehid == "rent33" or vehid == "rent34" or vehid == "rent35" or vehid == "rent36" or vehid == "rent37" or vehid == "rent38" or vehid == "rent39" then
		--if seat == 0 then
			if rentStatsVeh == false then
				if rentStatsPl == false then
					if getPlayerMoney(thePlayer) >= 600 then
						takePlayerMoney(thePlayer, 600)
						setElementData(theVehicle, "rentStats", sahebRent)
						setElementData(thePlayer, "rentStats", true)
						outputChatBox("#00ff00[Done]: #ffffffShoma Ba Movafaqiat In Mashin Ra Rent Kardid! #ffff00[-600$ For Rent]", thePlayer, 194, 162, 218 , true)
					else
						outputChatBox("#ff0000[Error]: #ffffffShoma Poole Kafi Baraye Rent Kardan In Mashin Ra Nadarid #ffff00[600$ Needed For Rent]", thePlayer, 194, 162, 218 , true)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffShoma Az Qabl Yek Mashin Ra Rent Kardid , Ebteda /unrent Konid!", thePlayer, 194, 162, 218 , true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffIn Mashin Az Qabl Tavasot "..rentStatsVeh.." Rent Shode Ast!", thePlayer, 194, 162, 218 , true)
			end
		--end
	else
		outputChatBox("#ff0000[Error]: #ffffffIn Mashin Ke Baraye Rent Kardan Nist !", thePlayer, 194, 162, 218, true)
	end
end
)

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addCommandHandler("unrentveh",
function ( thePlayer, command)
	local rentStatsPl = getElementData(thePlayer, "rentStats")
	if rentStatsPl == true then
		outputChatBox("#00ff00[Done]: #ffffffShoma Ba Movafaqiat Mashin Khod Ra Unrent Kardid!", thePlayer, 194, 162, 218, true)
		setElementData(thePlayer, "rentStats", false)
		for index, rentedCar in ipairs(getElementsByType("vehicle")) do 
			if getElementData(rentedCar, "rentStats") == getPlayerName(thePlayer) then
				setElementData(rentedCar, "rentStats", false)
				setElementData(rentedCar, "resShod", true)
				setVehicleEngineState(rentedCar, false)
				addEventHandler("OnGlobalTimer", root, function ()
				if getElementData(rentedCar, "resShod") == true then
					if not isVehicleOccupied(rentedCar) then
						respawnVehicle(rentedCar)
						setElementData(rentedCar, "resShod", false)
						setVehicleLocked(rentedCar, false)
						fixVehicle(rentedCar)
					end
				end
				end)
			end
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffShoma Mashini Ra Rent Nakardid!", thePlayer, 194, 162, 218, true)
	end
end)


function defaultCar()
	if getElementData(source, "rentStats") == true then
		setElementData(source, "rentStats", false)
		local sahebRent = getPlayerName(source)
		for index, rentedCarBy in ipairs(getElementsByType("vehicle")) do 
			if getElementData(rentedCarBy, "rentStats") == getPlayerName(source) then
				setElementData(rentedCarBy, "resShod", true)
				setVehicleEngineState(rentedCarBy, false)
				setElementData(rentedCarBy, "rentStats", false)
				setTimer(addEventHandler("OnGlobalTimer", root, function ()
				if getElementData(rentedCarBy, "resShod") == true then
					if not isVehicleOccupied(rentedCarBy) then
						respawnVehicle(rentedCarBy)
						setElementData(rentedCarBy, "resShod", false)
						setVehicleLocked(rentedCarBy, false)
						fixVehicle(rentedCarBy)
					end
				end
				end), 3000, 1)
			end
		end
	end
end
addEventHandler ( "onPlayerQuit", root, defaultCar )

local fasele  = 5
addCommandHandler("lockrent",
function(thePlayer, cmd)
	local rentStatsPl = getElementData(thePlayer, "rentStats")
	local posX, posY, posZ = getElementPosition( thePlayer )
	local carSphere = createColSphere( posX, posY, posZ, fasele )
	local nearbyCars = getElementsWithinColShape( carSphere, "vehicle" )
	destroyElement( carSphere )
	if rentStatsPl == true then
		for index, nearbyCar in ipairs( nearbyCars ) do 
			if getElementData(nearbyCar, "rentStats") == getPlayerName(thePlayer) then
				setVehicleLocked ( nearbyCar, true )
				outputChatBox("#ffff00[Info]: #ffffffMashine Rent Shode Lock Shod!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
)

addCommandHandler("unlockrent",
function(thePlayer, cmd)
	local rentStatsPl = getElementData(thePlayer, "rentStats")
	local posX, posY, posZ = getElementPosition( thePlayer )
	local carSphere = createColSphere( posX, posY, posZ, fasele )
	local nearbyCars = getElementsWithinColShape( carSphere, "vehicle" )
	destroyElement( carSphere )
	if rentStatsPl == true then
		for index, nearbyCar in ipairs( nearbyCars ) do 
			if getElementData(nearbyCar, "rentStats") == getPlayerName(thePlayer) then
				setVehicleLocked ( nearbyCar, false )
				outputChatBox("#ffff00[Info]: #ffffffMashine Rent Shode UnLock Shod!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
)
function carDefault()
	for index, carForRents in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( carForRents ) 
		if vehid == "rent1" or vehid == "rent2" or vehid == "rent3" or vehid == "rent4" or vehid == "rent5" or vehid == "rent6" or vehid == "rent7" or vehid == "rent8" or vehid == "rent9" or vehid == "rent10" or vehid == "rent11" or vehid == "rent12" or vehid == "rent13" or vehid == "rent14" or vehid == "rent15" or vehid == "rent16" or vehid == "rent17" or vehid == "rent18" or vehid == "rent19" or vehid == "rent20" or vehid == "rent21" or vehid == "rent22" or vehid == "rent23" or vehid == "rent24" or vehid == "rent25" or vehid == "rent26" or vehid == "rent27" or vehid == "rent28" or vehid == "rent29" or vehid == "rent30" or vehid == "rent31" or vehid == "rent32" or vehid == "rent33" or vehid == "rent34" or vehid == "rent35" or vehid == "rent36" or vehid == "rent37" or vehid == "rent38" or vehid == "rent39" then
			setElementData(carForRents, "rentStats", false)
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement(), carDefault )

function respawnMashinRent()
	for index, sahebMashin in ipairs(getElementsByType("player")) do
		if getElementData(source, "rentStats") == getPlayerName(sahebMashin) then
			outputChatBox("#ffff00[Info]: #ffffffMashine Shoma Terekid Va Unrent Shod!", sahebMashin, 255, 255, 255, true)
			setElementData(sahebMashin, "rentStats", false)
			setElementData(source, "rentStats", false)
			setVehicleEngineState(source, false)
			setVehicleLocked(source, false)
		end
	end
end
addEventHandler("onVehicleExplode", getRootElement(), respawnMashinRent)