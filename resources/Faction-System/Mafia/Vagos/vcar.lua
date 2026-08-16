local accSys = exports["Accounts-System"]
function entervagosVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 15 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
	if vehid == "vago1" or vehid == "vago2" or vehid == "vago3" or vehid == "vago4" or vehid == "vago5" or vehid == "vago6" or vehid == "vago7" or vehid == "vago8" or vehid == "vago9" 
    or vehid == "vago10" or vehid == "vago11" or vehid == "vago12" or vehid == "vago13" or vehid == "vago14" or vehid == "vago15" or vehid == "vago16" or vehid == "vago17" 
	or vehid == "vago18" or vehid == "vago19" or vehid == "vago20" or vehid == "vago21" or vehid == "vago22"or vehid == "vago23" or vehid == "vago24" or vehid == "vago25" then
				cancelEvent()
				outputChatBox ( "#ff0000Shoma Nemitavanid Savar In Khodro Shavid!", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
	if vehid == "vago1" or vehid == "vago2" or vehid == "vago3" or vehid == "vago4" or vehid == "vago5" or vehid == "vago6" or vehid == "vago7" or vehid == "vago8" or vehid == "vago9" 
    or vehid == "vago10" or vehid == "vago11" or vehid == "vago12" or vehid == "vago13" or vehid == "vago14" or vehid == "vago15" or vehid == "vago16" or vehid == "vago17" 
	or vehid == "vago18" or vehid == "vago19" or vehid == "vago20" or vehid == "vago21" or vehid == "vago22"or vehid == "vago23" or vehid == "vago24" or vehid == "vago25" then
				cancelEvent()
				outputChatBox ( "#ff0000Shoma Nemitavanid Savar In Khodro Shavid!", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), entervagosVehicle ) 

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 15 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, vagos_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( vagos_cars )
			if vehid == "vago1" or vehid == "vago2" or vehid == "vago3" or vehid == "vago4" or vehid == "vago5" or vehid == "vago6" or vehid == "vago7" or vehid == "vago8" or vehid == "vago9" 
			or vehid == "vago10" or vehid == "vago11" or vehid == "vago12" or vehid == "vago13" or vehid == "vago14" or vehid == "vago15" or vehid == "vago16" or vehid == "vago17" 
			or vehid == "vago18" or vehid == "vago19" or vehid == "vago20" or vehid == "vago21" or vehid == "vago22"or vehid == "vago23" or vehid == "vago24" or vehid == "vago25" then
				if not isVehicleOccupied(vagos_cars) then
					respawnVehicle(vagos_cars)
				end
			end
		end
		for index, vagos_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(vagos_members), "pMember")) == 15 then
				outputChatBox("#ff0000[Tavajoh] #ffffffTamamie Khodro Haye Faction Tavasote "..getPlayerName(thePlayer).." Respawn Shodand!", vagos_members, 255, 255, 255, true)
			end
		end
	end
end
)

vagosgate = createObject ( 980, 2501.7002, -1388.7998, 30.2, 0, 0, 270 )
colvagosgate = createColCircle ( 2501.7002, -1388.7998 ,12.9)

function openvagosgate(thePlayer)
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 15 then
		moveObject(vagosgate,3000,2501.7002, -1388.7998, 20.2)
		setTimer(
		function()
			moveObject(vagosgate,3000,2501.7002, -1388.7998, 30.2)
		end, 30000, 1)
	end
end
addEventHandler( "onColShapeHit", colvagosgate, openvagosgate )

function closevagosgate(thePlayer)
	moveObject(vagosgate,3000,2501.7002, -1388.7998, 30.2)
end
addEventHandler( "onColShapeLeave", colvagosgate, closevagosgate )

vagosgate2 = createObject ( 988, 2473, -1371.1, 28.7, 0, 0, 270 )
colvagosgate2 = createColCircle ( 2473, -1371.1 ,12.9)

function openvagosgate2(thePlayer)
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 15 then
		moveObject(vagosgate2,3000,2473, -1371.1, 18.7)
		setTimer(
		function()
			moveObject(vagosgate2,3000,2473, -1371.1, 28.7)
		end, 30000, 1)
	end
end
addEventHandler( "onColShapeHit", colvagosgate2, openvagosgate2 )

function closevagosgate2(thePlayer)
	moveObject(vagosgate2,3000,2473, -1371.1, 28.7)
end
addEventHandler( "onColShapeLeave", colvagosgate2, closevagosgate2 )

vagosgate3 = createObject ( 988, 2473.1001, -1402.5, 28.7, 0, 0, 270 )
colvagosgate3 = createColCircle ( 2473.1001, -1402.5 ,12.9)

function openvagosgate3(thePlayer)
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 15 then
		moveObject(vagosgate3,3000,2473.1001, -1402.5, 18.7)
		setTimer(
		function()
			moveObject(vagosgate3,3000,2473.1001, -1402.5, 28.7)
		end, 30000, 1)
	end
end
addEventHandler( "onColShapeHit", colvagosgate3, openvagosgate3 )

function closevagosgate3(thePlayer)
	moveObject(vagosgate3,3000,2473.1001, -1402.5, 28.7)
end
addEventHandler( "onColShapeLeave", colvagosgate3, closevagosgate3 )
