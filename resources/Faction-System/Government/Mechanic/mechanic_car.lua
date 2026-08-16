local accSys = exports["Accounts-System"]
function entermechanicVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 9 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "mech_Car1" or vehid == "mech_Car2" or vehid == "mech_Car3" or vehid == "mech_Car4" or vehid == "mech_Car5" or vehid == "mech_Car6" or vehid == "mech_Car7" or vehid == "mech_Car8" or vehid == "mech_Car9" or vehid == "mech_Car10" or vehid == "mech_Car11" or vehid == "mech_Car12" or vehid == "mech_Car13" or vehid == "mech_Car14" then
				cancelEvent()
				outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #649c9eSherkat Khadamat Khodro #ffffffAst Va Shoma Nmitavanid Savar An Shavid.", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "mech_Car1" or vehid == "mech_Car2" or vehid == "mech_Car3" or vehid == "mech_Car4" or vehid == "mech_Car5" or vehid == "mech_Car6" or vehid == "mech_Car7" or vehid == "mech_Car8" or vehid == "mech_Car9" or vehid == "mech_Car10" or vehid == "mech_Car11" or vehid == "mech_Car12" or vehid == "mech_Car13" or vehid == "mech_Car14" then
				cancelEvent()
				outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #649c9eSherkat Khadamat Khodro #ffffffAst Va Shoma Nmitavanid Savar An Shavid.", player, 230,0,0 ,true)
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), entermechanicVehicle ) 

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 9 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, mechanic_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( mechanic_cars )
			if vehid == "mech_Car1" or vehid == "mech_Car2" or vehid == "mech_Car3" or vehid == "mech_Car4" or vehid == "mech_Car5" or vehid == "mech_Car6" or vehid == "mech_Car7" or vehid == "mech_Car8" or vehid == "mech_Car9" or vehid == "mech_Car10" or vehid == "mech_Car11" or vehid == "mech_Car12" or vehid == "mech_Car13" or vehid == "mech_Car14" then
				if not isVehicleOccupied(mechanic_cars) then
					respawnVehicle(mechanic_cars)
					setElementData( mechanic_cars ,"fuel",105)
				end
			end
		end
		for index, mechanic_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(mechanic_members), "pMember")) == 9 then
				outputChatBox("#649c9e(Sherkat Khadam Khodro):#ffffffTamamie Khodro Haye Faction Tavasote #649c9e"..getPlayerName(thePlayer).." #ffffffRespawn Shodand!", mechanic_members, 255, 255, 255, true)
			end
		end
	end
end
)






for index, Mech_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( Mech_cars )
if vehid == "mech_Car1" or vehid == "mech_Car2" or vehid == "mech_Car3" or vehid == "mech_Car4" or vehid == "mech_Car5" or vehid == "mech_Car6" or vehid == "mech_Car7" or vehid == "mech_Car8" or vehid == "mech_Car9" or vehid == "mech_Car10" or vehid == "mech_Car11" or vehid == "mech_Car12" or vehid == "mech_Car13" or vehid == "mech_Car14" then
			toggleVehicleRespawn ( Mech_cars, true )
			setVehicleIdleRespawnDelay ( Mech_cars, 1200000 ) --5Min--
			setElementData( Mech_cars ,"fuel",105)
		end
	end



function setbenzin (thePlayer, cmd)
	for index, Mech_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( Mech_cars )
if vehid == "mech_Car1" or vehid == "mech_Car2" or vehid == "mech_Car3" or vehid == "mech_Car4" or vehid == "mech_Car5" or vehid == "mech_Car6" or vehid == "mech_Car7" or vehid == "mech_Car8" or vehid == "mech_Car9" or vehid == "mech_Car10" or vehid == "mech_Car11" or vehid == "mech_Car12" or vehid == "mech_Car13" or vehid == "mech_Car14" then
			if not isVehicleOccupied(Mech_cars) then
			local engine = getVehicleEngineState(Mech_cars)
			if engine == false then
			setElementData( Mech_cars ,"fuel",105)
		end
		end
	end
	end
end
setTimer ( setbenzin, 1200000, 0 ) --40Min--
---------------------------------








jakson1 = createObject(12943, 857.90039, -1168.4004, 15.9, 0, 0, 269.396,true )
jakson2 = createObject(12943, 870.2998, -1168.4004, 15.9, 0, 0, 269.396,true )

jakson4 = createObject(3776, 825.70001, -1184.7, 25, 0, 0, 271.918,true )
jakson5 = createObject(11387, 886.40039, -1184.7002, 18.973, 0, 0, 268.462,true )
---setObjectScale ( sako, 1)




local blipmechanichi = createBlip ( 885.251953125 ,-1216.6650390625 ,16.9765625 , 27 )
setElementData(blipmechanichi,'blipName',"Mechanici")



