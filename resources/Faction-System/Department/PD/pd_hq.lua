local accSys = exports["Accounts-System"]

   policeGate = createObject ( 968, 1544.6999511719, -1630.8000488281, 13.199999809265, 0, 90, 89.999938964844 )
   policeGate2 = createObject ( 971, 1588.99, -1638.1, 15, 0, 0, 180 )
   policeGatecol = createColCircle ( 1544.45618, -1627.38220, 7 )
   markerPoliceGate2 = createColCircle ( 1589.11, -1635.1, 9 )

function enterpdVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) > 3 and tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 6 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			if theVehicle then
				local vehid = getElementID ( theVehicle )
				if vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
				or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
				or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" or vehid == "helipd1" or vehid == "helipd2" or vehid == "helipd3" or vehid == "helipd4" then
				cancelEvent()
				outputChatBox ( "#ff0000✖️ #ffffffShoma Nemitavanid Savar In Khodro Shavid!", player, 230,0,0 ,true) 
				end
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			if theVehicle then
				local vehid = getElementID ( theVehicle )
				if vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
				or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
				or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" or vehid == "helipd1" or vehid == "helipd2" or vehid == "helipd3" or vehid == "helipd4" then
				cancelEvent()
				outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #2f64e1Police Department #ffffffAst Va Shoma Nmitavanid Savar An Shavid!!", player, 230,0,0 ,true) 
			end
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterpdVehicle ) 

function isVehicleOccupied(vehicle)
	if vehicle then
		assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
		local _, occupant = next(getVehicleOccupants(vehicle))
		return occupant and true, occupant
	end
end

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, pd_cars in ipairs(getElementsByType("vehicle")) do 
			if pd_cars then
				local vehid = getElementID ( pd_cars )
				if vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
				or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
				or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" or vehid == "helipd1" or vehid == "helipd2" or vehid == "helipd3" or vehid == "helipd4" then
					if not isVehicleOccupied(pd_cars) then
						respawnVehicle(pd_cars)
						setElementData( pd_cars ,"fuel",105)
					end
				end
			end
		end
		for index, pd_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(pd_members), "pMember")) == 1 then
				if getElementData(pd_members, "loggedIn") == true then
					outputChatBox("#2f64e1(Police Deaprtment):#ffffffTamamie Khodro Haye Faction Tavasote #2f64e1"..getPlayerName(thePlayer).." #ffffffRespawn Shodand!", pd_members, 255, 255, 255, true)
				end
			end
		end
	end
end
)

function openPoliceGate(thePlayer)
    if getElementData(thePlayer, "loggedIn") == true then
   	 	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
	  setElementRotation ( policeGate,0,0,90)
	  setTimer(
		function()
			setElementRotation ( policeGate,0,90,90)
		end, 30000, 1)
	end
  end
end
addEventHandler( "onColShapeHit", policeGatecol, openPoliceGate )

function closebase_area69gates(thePlayer)
	setElementRotation ( policeGate,0,90,90)
end
addEventHandler( "onColShapeLeave", policeGatecol, closebase_area69gates )

function openPoliceGate2(thePlayer)
   if getElementData(thePlayer, "loggedIn") == true then
   	 	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		moveObject(policeGate2,3000,1588.99, -1638.1, 6)
		setTimer(
		function()
			moveObject(policeGate2,3000,1588.99, -1638.1, 15)
		end, 30000, 1)
	end
	end
end
addEventHandler( "onColShapeHit", markerPoliceGate2, openPoliceGate2 )

function closePoliceGate2(thePlayer)
	moveObject(policeGate2,3000,1588.99, -1638.1, 15)
end
addEventHandler( "onColShapeLeave", markerPoliceGate2, closePoliceGate2 )







for index, pd_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( pd_cars )
			if vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
				or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
				or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" or vehid == "helipd1" or vehid == "helipd2" or vehid == "helipd3" or vehid == "helipd4" then
			toggleVehicleRespawn ( pd_cars, true )
			setVehicleIdleRespawnDelay ( pd_cars, 1200000 ) --5Min--
			setElementData( pd_cars ,"fuel",105)
		end
	end



function setbenzin (thePlayer, cmd)
	for index, pd_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( pd_cars )
			if vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
				or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
				or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" or vehid == "helipd1" or vehid == "helipd2" or vehid == "helipd3" or vehid == "helipd4" then
			if not isVehicleOccupied(pd_cars) then
			local engine = getVehicleEngineState(pd_cars)
			if engine == false then
			setElementData( pd_cars ,"fuel",105)
		end
		end
	end
	end
end
setTimer ( setbenzin, 1200000, 0 ) --40Min--
---------------------------------







function vhandling ( )
   for _,v in pairs(getElementsByType("vehicle")) do
      if getElementModel(v) == 596 then -------------- vehicle Id
        setVehicleHandling (v, "mass", 1700.0)
		setVehicleHandling(v, "turnMass", 4000)
        setVehicleHandling(v, "tractionMultiplier", 1.2)
        setVehicleHandling(v, "tractionLoss", 1)
        setVehicleHandling(v, "numberOfGears", 5)
		setVehicleHandling(v, "brakeBias", 0.70)
        setVehicleHandling(v, "maxVelocity", 320.0)
        setVehicleHandling(v, "engineAcceleration", 35.0 )
		setVehicleHandling(v, "collisionDamageMultiplier", 0.12)
        setVehicleHandling(v, "driveType", "awd")
		setVehicleHandling(v, "dragCoeff", 1.7 )
        setVehicleHandling(v, "brakeDeceleration", 20.0)
		setVehicleHandling(v, "engineInertia", 20)
       
		
		
	elseif getElementModel(v) == 427 then -------------- vehicle Id
        setVehicleHandling(v, "tractionMultiplier", 0.8)
        setVehicleHandling(v, "tractionLoss", 0.8)
        setVehicleHandling(v, "turnMass", 12000)
        setVehicleHandling(v, "maxVelocity", 200.0)
        setVehicleHandling(v, "engineAcceleration", 12.0 )
		setVehicleHandling(v, "brakeDeceleration", 10.0)
		setVehicleHandling(v, "collisionDamageMultiplier", 0.1)
		

    elseif getElementModel(v) == 597 then -------------- vehicle Id
        setVehicleHandling (v, "mass", 1800.0)
		setVehicleHandling(v, "turnMass", 3500)
        setVehicleHandling(v, "tractionMultiplier", 1.3)
        setVehicleHandling(v, "tractionLoss", 1)
        setVehicleHandling(v, "numberOfGears", 5)
		setVehicleHandling(v, "brakeBias", 0.70)
        setVehicleHandling(v, "maxVelocity", 350.0)
        setVehicleHandling(v, "engineAcceleration", 34.0 )
		setVehicleHandling(v, "collisionDamageMultiplier", 0.12)
        setVehicleHandling(v, "driveType", "fwd")
		setVehicleHandling(v, "dragCoeff", 1.4 )
        setVehicleHandling(v, "brakeDeceleration", 20.0)
		setVehicleHandling(v, "engineInertia", 10)
		
	elseif getElementModel(v) == 599 then -------------- vehicle Id
        setVehicleHandling(v, "tractionMultiplier", 0.8)
        setVehicleHandling(v, "tractionLoss", 0.9)
        --setVehicleHandling(v, "turnMass", 12000)
        setVehicleHandling(v, "maxVelocity", 200.0)
		setVehicleHandling(v, "dragCoeff", 1.9 )
		setVehicleHandling(v, "driveType", "rwd")
        setVehicleHandling(v, "engineAcceleration", 15.0 )
		setVehicleHandling(v, "brakeDeceleration", 30.0)
		setVehicleHandling(v, "collisionDamageMultiplier", 0.12)
		
      end
   end
end
addEventHandler ( "onVehicleEnter", getRootElement(), vhandling )


function vhandling ( )
   for _,v in pairs(getElementsByType("vehicle")) do
      if getElementModel(v) == 596 then -------------- vehicle Id
        setVehicleHandling (v, "mass", 1700.0)
		setVehicleHandling(v, "turnMass", 4000)
        setVehicleHandling(v, "tractionMultiplier", 1.2)
        setVehicleHandling(v, "tractionLoss", 1)
        setVehicleHandling(v, "numberOfGears", 5)
        setVehicleHandling(v, "maxVelocity", 320.0)
		setVehicleHandling(v, "dragCoeff", 1.7 )
		setVehicleHandling(v, "brakeBias", 0.70)
        setVehicleHandling(v, "engineAcceleration", 35.0 )
		setVehicleHandling(v, "collisionDamageMultiplier", 0.12)
        setVehicleHandling(v, "driveType", "awd")
        setVehicleHandling(v, "brakeDeceleration", 20.0)
		setVehicleHandling(v, "engineInertia", 20)
       
		
		elseif getElementModel(v) == 427 then -------------- vehicle Id
        setVehicleHandling(v, "tractionMultiplier", 0.8)
        setVehicleHandling(v, "tractionLoss", 0.8)
        setVehicleHandling(v, "turnMass", 12000)
        setVehicleHandling(v, "maxVelocity", 200.0)
        setVehicleHandling(v, "engineAcceleration", 12.0 )
		setVehicleHandling(v, "brakeDeceleration", 10.0)
		setVehicleHandling(v, "collisionDamageMultiplier", 0.1)
	
		
        elseif getElementModel(v) == 599 then -------------- vehicle Id
        setVehicleHandling(v, "tractionMultiplier", 0.8)
        setVehicleHandling(v, "tractionLoss", 0.9)
        --setVehicleHandling(v, "turnMass", 12000)
        setVehicleHandling(v, "maxVelocity", 200.0)
		setVehicleHandling(v, "dragCoeff", 1.9 )
		setVehicleHandling(v, "driveType", "rwd")
        setVehicleHandling(v, "engineAcceleration", 15.0 )
		setVehicleHandling(v, "brakeDeceleration", 30.0)
		setVehicleHandling(v, "collisionDamageMultiplier", 0.12)
        
      end
   end
end
addEventHandler ( "onResourceStart", getRootElement(), vhandling )