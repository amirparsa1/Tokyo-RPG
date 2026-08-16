local accSys = exports["Accounts-System"]

function enternrVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 7 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "Nrcar1" or vehid == "Nrcar2" or vehid == "Nrcar3" or vehid == "Nrcar4" or vehid == "Nrcar5" or vehid == "Nrcar6" or vehid == "Nrcar7" or vehid == "Nrheli1" or vehid == "Nrheli2" then
			cancelEvent()
			outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #cd5c5cNews Reporter #ffffffAst Va Shoma Nmitavanid Savar An Shavid.", player, 230,0,0,true)
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "Nrcar1" or vehid == "Nrcar2" or vehid == "Nrcar3" or vehid == "Nrcar4" or vehid == "Nrcar5" or vehid == "Nrcar6" or vehid == "Nrcar7" or vehid == "Nrheli1" or vehid == "Nrheli2" then
			cancelEvent()
			outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #cd5c5cNews Reporter #ffffffAst Va Shoma Nmitavanid Savar An Shavid.", player, 230,0,0,true)
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enternrVehicle )

function isVehicleOccupied(vehicle)
	if vehicle then
		assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
		local _, occupant = next(getVehicleOccupants(vehicle))
		return occupant and true, occupant
	end
end 

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, nr_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( nr_cars )
				if vehid == "Nrcar1" or vehid == "Nrcar2" or vehid == "Nrcar3" or vehid == "Nrcar4" or vehid == "Nrcar5" or vehid == "Nrcar6" or vehid == "Nrcar7" or vehid == "Nrheli1" or vehid == "Nrheli2" then
				if not isVehicleOccupied(nr_cars) then
					respawnVehicle(nr_cars)
					setElementData( nr_cars ,"fuel",105)
				end
			end
		end
		for index, nr_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(nr_members), "pMember")) == 7 then
				outputChatBox("#cd5c5c(News Reporter):#ffffffTamamie Khodro Haye Faction Tavasote #cd5c5c"..getPlayerName(thePlayer).." #ffffffRespawn Shodand!", nr_members, 255, 255, 255, true)
			end
		end
	end
end
)

NRgate = createObject ( 971, 777.69922, -1330.279999, 12.9, 0, 0, 179 )
colNRgate = createColCircle ( 777.69922, -1330.09961, 13)

--Gate NR
function openNRgate(thePlayer)
if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 then
			moveObject(NRgate,3000,769.49922, -1330.079999, 12.9)
			setTimer(
			function()
				moveObject(NRgate,3000,777.69922, -1330.279999, 12.9)
			end, 30000, 1)
		end
	end
end
addEventHandler( "onColShapeHit", colNRgate, openNRgate )

function closeNRgate(thePlayer)
		moveObject(NRgate,3000,777.69922, -1330.279999, 12.9)
	end
addEventHandler( "onColShapeLeave", colNRgate, closeNRgate )






for index, nr_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( nr_cars )
			if vehid == "Nrcar1" or vehid == "Nrcar2" or vehid == "Nrcar3" or vehid == "Nrcar4" or vehid == "Nrcar5" or vehid == "Nrcar6" or vehid == "Nrcar7" or vehid == "Nrheli1" or vehid == "Nrheli2" then
			toggleVehicleRespawn ( nr_cars, true )
			setVehicleIdleRespawnDelay ( nr_cars, 1200000 ) --5Min--
			setElementData( nr_cars ,"fuel",105)
		end
	end



function setbenzin (thePlayer, cmd)
	for index, nr_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( nr_cars )
			if vehid == "Nrcar1" or vehid == "Nrcar2" or vehid == "Nrcar3" or vehid == "Nrcar4" or vehid == "Nrcar5" or vehid == "Nrcar6" or vehid == "Nrcar7" or vehid == "Nrheli1" or vehid == "Nrheli2" then
			if not isVehicleOccupied(nr_cars) then
			local engine = getVehicleEngineState(nr_cars)
			if engine == false then
			setElementData( nr_cars ,"fuel",105)
		end
		end
	end
	end
end
setTimer ( setbenzin, 1200000, 0 ) --40Min--
---------------------------------






function vhandling ( )
   for _,v in pairs(getElementsByType("vehicle")) do
      if getElementModel(v) == 603 then
        setVehicleHandling (v, "mass", 1650.0)
		setVehicleHandling(v, "turnMass", 2500)
		
        setVehicleHandling(v, "tractionMultiplier", 0.8)
        setVehicleHandling(v, "tractionLoss", 0.9)
        
		setVehicleHandling(v, "brakeBias", 0.7)
        setVehicleHandling(v, "maxVelocity", 200.0)
        setVehicleHandling(v, "engineAcceleration", 17.0 )
		
        setVehicleHandling(v, "driveType", "rwd")
		setVehicleHandling(v, "dragCoeff", 2 )
        setVehicleHandling(v, "brakeDeceleration", 20.0)
		setVehicleHandling(v, "engineInertia", 20)
       

		

        
      end
   end
end
addEventHandler ( "onVehicleEnter", getRootElement(), vhandling )




function vhandling ( )
   for _,v in pairs(getElementsByType("vehicle")) do
       if getElementModel(v) == 603 then
         setVehicleHandling (v, "mass", 1650.0)
		setVehicleHandling(v, "turnMass", 2500)
		
        setVehicleHandling(v, "tractionMultiplier", 0.8)
        setVehicleHandling(v, "tractionLoss", 0.9)
        
		setVehicleHandling(v, "brakeBias", 0.7)
        setVehicleHandling(v, "maxVelocity", 200.0)
        setVehicleHandling(v, "engineAcceleration", 17.0 )
		
        setVehicleHandling(v, "driveType", "rwd")
		setVehicleHandling(v, "dragCoeff", 1.9 )
        setVehicleHandling(v, "brakeDeceleration", 20.0)
		setVehicleHandling(v, "engineInertia", 20)

		

        
      end
   end
end
addEventHandler ( "onResourceStart", getRootElement(), vhandling )
