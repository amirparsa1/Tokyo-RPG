local accSys = exports["Accounts-System"]
function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

function enterhitVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 5 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getVehiclePlateText ( theVehicle )
			if vehid == "ICA 1" or vehid == "ICA 2" or vehid == "ICA 3" or vehid == "ICA 4" or vehid == "ICA 5" or vehid == "ICA 6" or vehid == "ICA 7" or vehid == "ICA 8" or vehid == "ICA 9" or vehid == "ICA 10"
			or vehid == "ICA 11" or vehid == "ICA 12" or vehid == "ICA 13" or vehid == "ICA 14" or vehid == "ICA 15" or vehid == "ICA 16" or vehid == "ICA 17" or vehid == "ICA 18" or vehid == "ICA 19" or vehid == "ICA 20"
			or vehid == "ICA 21" or vehid == "ICA 22" then
				cancelEvent()
				outputChatBox ( "#ff0000In Khodro Motalegh Be Sazmane ICA (RP) Mibashad!", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getVehiclePlateText ( theVehicle )
			if vehid == "ICA 1" or vehid == "ICA 2" or vehid == "ICA 3" or vehid == "ICA 4" or vehid == "ICA 5" or vehid == "ICA 6" or vehid == "ICA 7" or vehid == "ICA 8" or vehid == "ICA 9" or vehid == "ICA 10"
			or vehid == "ICA 11" or vehid == "ICA 12" or vehid == "ICA 13" or vehid == "ICA 14" or vehid == "ICA 15" or vehid == "ICA 16" or vehid == "ICA 17" or vehid == "ICA 18" or vehid == "ICA 19" or vehid == "ICA 20"
			or vehid == "ICA 21" or vehid == "ICA 22" then
			cancelEvent()
			outputChatBox ( "#ff0000In Khodro Motalegh Be Sazmane ICA (RP) Mibashad!", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterhitVehicle ) 


addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, hit_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getVehiclePlateText ( hit_cars )
			if vehid == "ICA 1" or vehid == "ICA 2" or vehid == "ICA 3" or vehid == "ICA 4" or vehid == "ICA 5" or vehid == "ICA 6" or vehid == "ICA 7" or vehid == "ICA 8" or vehid == "ICA 9" or vehid == "ICA 10"
			or vehid == "ICA 11" or vehid == "ICA 12" or vehid == "ICA 13" or vehid == "ICA 14" or vehid == "ICA 15" or vehid == "ICA 16" or vehid == "ICA 17" or vehid == "ICA 18" or vehid == "ICA 19" or vehid == "ICA 20"
			or vehid == "ICA 21" or vehid == "ICA 22" then
				if not isVehicleOccupied(hit_cars) then
					respawnVehicle(hit_cars)
				end
			end
		end
		for index, hit_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(hit_members), "pMember")) == 5 then
				outputChatBox("#ff0000[Tavajoh] #ffffffTamamie Khodro Haye Faction Tavasote "..getPlayerName(thePlayer).." Respawn Shodand!", hit_members, 255, 255, 255, true)
			end
		end
	end
end
)

function colorarosetkon ()
		for index, hit_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getVehiclePlateText ( hit_cars )
			if vehid == "ICA 1" or vehid == "ICA 2" or vehid == "ICA 3" or vehid == "ICA 4" or vehid == "ICA 5" or vehid == "ICA 6" or vehid == "ICA 7" or vehid == "ICA 8" or vehid == "ICA 9" or vehid == "ICA 10"
			or vehid == "ICA 11" or vehid == "ICA 12" or vehid == "ICA 13" or vehid == "ICA 14" or vehid == "ICA 15" or vehid == "ICA 16" or vehid == "ICA 17" or vehid == "ICA 18" or vehid == "ICA 19" or vehid == "ICA 20"
			or vehid == "ICA 21" or vehid == "ICA 22" then		
				setVehicleColor( hit_cars, 0, 0, 0 )
			end
		end
end
addEventHandler ( "onResourceStart", getRootElement(), colorarosetkon )

hitmangate = createObject ( 980, 2220.5 ,-2660.1416015625 ,15, 0, 0, -50 )
colhitmangate = createColCircle ( 2220.5 ,-2660.1416015625 ,10)


--Gate Hitman
function openhitmangate(thePlayer)
	if getElementType(thePlayer) == "player" then
    	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
			moveObject(hitmangate,3000,2220.5 ,-2660.1416015625 ,7)
			setTimer(
			function()
				moveObject(hitmangate,5000,2220.5 ,-2660.1416015625 ,15)
			end, 30000, 1)
		end
	end
end
addEventHandler( "onColShapeHit", colhitmangate, openhitmangate )
function closehitmangate(thePlayer)
	if getElementType(thePlayer) == "player" then
		moveObject(hitmangate,3000,2220.5 ,-2660.1416015625 ,15)
	end
end
addEventHandler( "onColShapeLeave", colhitmangate, closehitmangate )

hitmangate2 = createObject ( 971 ,2061.609375 ,-2700.6064453125 ,15, 0, 0, -90 )
colhitmangate2 = createColCircle ( 2061.609375 ,-2700.6064453125 ,10)

function openhitmangate2(thePlayer)
	if getElementType(thePlayer) == "player" then
    	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
			moveObject(hitmangate2,3000,2061.609375 ,-2700.6064453125 ,8)
			setTimer(
			function()
				moveObject(hitmangate2,5000, 2061.609375 ,-2700.6064453125 ,15)
			end, 30000, 1)
		end
	end
end
addEventHandler( "onColShapeHit", colhitmangate2, openhitmangate2 )

function closehitmangate2(thePlayer)
	if getElementType(thePlayer) == "player" then
		moveObject(hitmangate2,3000,2061.609375 ,-2700.6064453125 ,15)
	end
end
addEventHandler( "onColShapeLeave", colhitmangate2, closehitmangate2 )