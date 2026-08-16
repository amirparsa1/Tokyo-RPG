local accSys = exports["Accounts-System"]
function entermedicVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 4 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "MCar1" or vehid == "MCar2" or vehid == "MCar3" or vehid == "MCar4" or vehid == "MCar5" 
			or vehid == "MCar6" or vehid == "MCar7" or vehid == "MCar8" or vehid == "MMoto1" or vehid == "MMoto2" 
			or vehid == "MMoto3" or vehid == "MMoto4" or vehid == "MMoto5" or vehid == "MMoto6" or vehid == "MMoto7" 
			or vehid == "MHeli1" or vehid == "MHeli2" or vehid == "MHeli3" or vehid == "MHeli4" then
			cancelEvent()
			outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #ff7700Medic #ffffffAst Va Shoma Nmitavanid Savar An Shavid.", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "MCar1" or vehid == "MCar2" or vehid == "MCar3" or vehid == "MCar4" or vehid == "MCar5" 
			or vehid == "MCar6" or vehid == "MCar7" or vehid == "MCar8" or vehid == "MMoto1" or vehid == "MMoto2" 
			or vehid == "MMoto3" or vehid == "MMoto4" or vehid == "MMoto5" or vehid == "MMoto6" or vehid == "MMoto7" 
			or vehid == "MHeli1" or vehid == "MHeli2" or vehid == "MHeli3" or vehid == "MHeli4" then
			cancelEvent()
			outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #ff7700Medic #ffffffAst Va Shoma Nmitavanid Savar An Shavid", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), entermedicVehicle ) 

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, medic_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( medic_cars )
				if vehid == "MCar1" or vehid == "MCar2" or vehid == "MCar3" or vehid == "MCar4" or vehid == "MCar5" 
			or vehid == "MCar6" or vehid == "MCar7" or vehid == "MCar8" or vehid == "MMoto1" or vehid == "MMoto2" 
			or vehid == "MMoto3" or vehid == "MMoto4" or vehid == "MMoto5" or vehid == "MMoto6" or vehid == "MMoto7" 
			or vehid == "MHeli1" or vehid == "MHeli2" or vehid == "MHeli3" or vehid == "MHeli4" then
				if not isVehicleOccupied(medic_cars) then
					respawnVehicle(medic_cars)
					setElementData( medic_cars ,"fuel",105)
				end
			end
		end
		for index, medic_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(medic_members), "pMember")) == 4 then
				outputChatBox("#ff7700(Medic):#ffffffTamamie Khodro Haye Faction Tavasote #ff7700"..getPlayerName(thePlayer).." #ffffffRespawn Shodand!", medic_members, 255, 255, 255, true)
			end
		end
	end
end
)






for index, medic_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( medic_cars )
			if vehid == "MCar1" or vehid == "MCar2" or vehid == "MCar3" or vehid == "MCar4" or vehid == "MCar5" 
			or vehid == "MCar6" or vehid == "MCar7" or vehid == "MCar8" or vehid == "MMoto1" or vehid == "MMoto2" 
			or vehid == "MMoto3" or vehid == "MMoto4" or vehid == "MMoto5" or vehid == "MMoto6" or vehid == "MMoto7" 
			or vehid == "MHeli1" or vehid == "MHeli2" or vehid == "MHeli3" or vehid == "MHeli4" then
			toggleVehicleRespawn ( medic_cars, true )
			setVehicleIdleRespawnDelay ( medic_cars, 1200000 ) --5Min--
			setElementData( medic_cars ,"fuel",105)
		end
	end



function setbenzin (thePlayer, cmd)
	for index, medic_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( medic_cars )
			if vehid == "MCar1" or vehid == "MCar2" or vehid == "MCar3" or vehid == "MCar4" or vehid == "MCar5" 
			or vehid == "MCar6" or vehid == "MCar7" or vehid == "MCar8" or vehid == "MMoto1" or vehid == "MMoto2" 
			or vehid == "MMoto3" or vehid == "MMoto4" or vehid == "MMoto5" or vehid == "MMoto6" or vehid == "MMoto7" 
			or vehid == "MHeli1" or vehid == "MHeli2" or vehid == "MHeli3" or vehid == "MHeli4" then
			if not isVehicleOccupied(medic_cars) then
			local engine = getVehicleEngineState(medic_cars)
			if engine == false then
			setElementData( medic_cars ,"fuel",105)
		end
		end
	end
	end
end
setTimer ( setbenzin, 1200000, 0 ) --40Min--
---------------------------------









Medicgate = createObject ( 980, 1144.1162109375 ,-1290.93359375 ,15.3, 0, 0, 0 )
MedicGatecol = createColCircle ( 1144.1162109375 ,-1290.93359375, 7 )


function openMedicGate(thePlayer)
if getElementData(thePlayer, "loggedIn") == true then
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then



		moveObject( Medicgate, 2000, 1144.1162109375 ,-1290.93359375 ,9)

		


	end
end
end
addEventHandler( "onColShapeHit", MedicGatecol, openMedicGate )

function closebase_area69gates(thePlayer)
	moveObject( Medicgate, 2000, 1144.1162109375 ,-1290.93359375 ,15.3, 0,0,0)
end
addEventHandler( "onColShapeLeave", MedicGatecol, closebase_area69gates )




local blipmedic = createBlip ( 1172.24609375 ,-1323.4462890625 ,13 , 22 )
setElementData(blipmedic,'blipName',"Bimarestan")