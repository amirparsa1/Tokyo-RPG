   nggate = createObject ( 980, 2776.9004, 913.2002, 12.5, 0, 0, 90.643 )
   colNgGate = createColCircle (2777.8134765625 ,909.9365234375 ,9)


-----------------------------------
 khone = createObject(8546, 2808.3999, 990.70001, 13.16, 0, 0, 270,true )
 sakoheli = createObject(3115, 2874.5, 904.79999, 9.8, 0, 0, 179.931,true )
 sakoheli1 = createObject(3115, 2874.5, 928.20001, 9.8, 0, 0, 179.931,true )
 sakoheli2 = createObject(3115, 2874.5, 952.09998, 9.8, 0, 0, 179.931,true )
 sakoheli3 = createObject(3115, 2874.6, 975.90002, 9.8, 0, 0, 179.931,true )
 sakoheli4 = createObject(3115, 2874.6, 1000.4, 9.8, 0, 0, 179.931,true )
 jakson1 = createObject(3530, 2777.2, 904.5, 4.5, 0, 180, 0.012,true )
 jakson2 = createObject(3530, 2777.2, 906.09998, 4.5, 0, 179.995, 0.011,true )
 jakson3 = createObject(3530, 2776.8999, 920.29999, 4.5, 0, 179.995, 271.378,true )
 jakson4 = createObject(3530, 2776.8594, 922, 4.5, 0, 179.995, 271.373,true )
 setObjectScale ( jakson1, 2)
 setObjectScale ( jakson2, 2)
 setObjectScale ( jakson3, 2)
 setObjectScale ( jakson4, 2)
 

----------------------------------



local accSys = exports["Accounts-System"]
function enterngVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) > 3 and tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 6 then	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
	            if vehid == "NgHeli1" or vehid == "NgHeli2" or vehid == "NgHeli3" or vehid == "NgCar1" or vehid == "NgCar3" 
	            or vehid == "NgCar4" or vehid == "NgCar5" or vehid == "NgCar6" or vehid == "NgCar7" or vehid == "NgCar8" 
	            or vehid == "NgCar9" or vehid == "NgCar10" or vehid == "NgCar11" or vehid == "NgCar12" or vehid == "NgCar13"
	            or vehid == "NgCar14" or vehid == "NgCar15" or vehid == "NgCar16" or vehid == "NgTank1" or vehid == "NgTank2"
	            or vehid == "NgTank3" or vehid == "NgJet1" or vehid == "NgJet2" or vehid == "NgJet3" or vehid == "NgMoto1" 
	            or vehid == "NgMoto2" or vehid == "NgMoto3" or vehid == "NgMoto4" or vehid == "NgMoto5" or vehid == "NgMoto6" 
	            or vehid == "NgMoto7" or vehid == "NgMoto8" then
				cancelEvent()
				outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #1953e6Natinoal Guard #ffffffAst Va Shoma Nmitavanid Savar An Shavid", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
	            if vehid == "NgHeli1" or vehid == "NgHeli2" or vehid == "NgHeli3" or vehid == "NgCar1" or vehid == "NgCar3" 
	            or vehid == "NgCar4" or vehid == "NgCar5" or vehid == "NgCar6" or vehid == "NgCar7" or vehid == "NgCar8" 
	            or vehid == "NgCar9" or vehid == "NgCar10" or vehid == "NgCar11" or vehid == "NgCar12" or vehid == "NgCar13"
	            or vehid == "NgCar14" or vehid == "NgCar15" or vehid == "NgCar16" or vehid == "NgTank1" or vehid == "NgTank2"
	            or vehid == "NgTank3" or vehid == "NgJet1" or vehid == "NgJet2" or vehid == "NgJet3" or vehid == "NgMoto1" 
	            or vehid == "NgMoto2" or vehid == "NgMoto3" or vehid == "NgMoto4" or vehid == "NgMoto5" or vehid == "NgMoto6" 
	            or vehid == "NgMoto7" or vehid == "NgMoto8" then
				cancelEvent()
				outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #1953e6Natinoal Guard #ffffffAst Va Shoma Nmitavanid Savar An Shavid", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterngVehicle ) 


addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, ng_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( ng_cars )
			if vehid == "NgHeli1" or vehid == "NgHeli2" or vehid == "NgHeli3" or vehid == "NgCar1" or vehid == "NgCar3" 
	        or vehid == "NgCar4" or vehid == "NgCar5" or vehid == "NgCar6" or vehid == "NgCar7" or vehid == "NgCar8" 
	        or vehid == "NgCar9" or vehid == "NgCar10" or vehid == "NgCar11" or vehid == "NgCar12" or vehid == "NgCar13"
         	or vehid == "NgCar14" or vehid == "NgCar15" or vehid == "NgCar16" or vehid == "NgTank1" or vehid == "NgTank2"
	        or vehid == "NgTank3" or vehid == "NgJet1" or vehid == "NgJet2" or vehid == "NgJet3" or vehid == "NgMoto1" 
	        or vehid == "NgMoto2" or vehid == "NgMoto3" or vehid == "NgMoto4" or vehid == "NgMoto5" or vehid == "NgMoto6" 
	        or vehid == "NgMoto7" or vehid == "NgMoto8" then
				if not isVehicleOccupied(ng_cars) then
					respawnVehicle(ng_cars)
					setElementData( ng_cars ,"fuel",105)
				end
			end
		end
		for index, ng_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(ng_members), "pMember")) == 3 then
				outputChatBox("#1953e6(Natinoal Guard):#ffffffTamamie Khodro Haye Faction Tavasote #1953e6"..getPlayerName(thePlayer).." #ffffffRespawn Shodand!", ng_members, 255, 255, 255, true)
			end
		end
	end
end
)

function openNgGate(thePlayer)
if getElementData(thePlayer, "loggedIn") == true then
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3  then
		moveObject(nggate,3000,2776.9004, 913.2002, 4)
		setTimer(
		function()
			moveObject(nggate,3000,2776.9004, 913.2002, 12.5)
		end, 30000, 1)
	end
end
end
addEventHandler( "onColShapeHit", colNgGate, openNgGate )

function closeNgGate(thePlayer)
	moveObject(nggate,3000,2776.9004, 913.2002, 12.5)
end
addEventHandler( "onColShapeLeave", colNgGate, closeNgGate )








for index, ng_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( ng_cars )
			if vehid == "NgHeli1" or vehid == "NgHeli2" or vehid == "NgHeli3" or vehid == "NgCar1" or vehid == "NgCar3" 
	            or vehid == "NgCar4" or vehid == "NgCar5" or vehid == "NgCar6" or vehid == "NgCar7" or vehid == "NgCar8" 
	            or vehid == "NgCar9" or vehid == "NgCar10" or vehid == "NgCar11" or vehid == "NgCar12" or vehid == "NgCar13"
	            or vehid == "NgCar14" or vehid == "NgCar15" or vehid == "NgCar16" or vehid == "NgTank1" or vehid == "NgTank2"
	            or vehid == "NgTank3" or vehid == "NgJet1" or vehid == "NgJet2" or vehid == "NgJet3" or vehid == "NgMoto1" 
	            or vehid == "NgMoto2" or vehid == "NgMoto3" or vehid == "NgMoto4" or vehid == "NgMoto5" or vehid == "NgMoto6" 
	            or vehid == "NgMoto7" or vehid == "NgMoto8" then
			toggleVehicleRespawn ( ng_cars, true )
			setVehicleIdleRespawnDelay ( ng_cars, 1200000 ) --5Min--
			setElementData( ng_cars ,"fuel",105)
		end
	end



function setbenzin (thePlayer, cmd)
	for index, ng_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( ng_cars )
			if vehid == "NgHeli1" or vehid == "NgHeli2" or vehid == "NgHeli3" or vehid == "NgCar1" or vehid == "NgCar3" 
	            or vehid == "NgCar4" or vehid == "NgCar5" or vehid == "NgCar6" or vehid == "NgCar7" or vehid == "NgCar8" 
	            or vehid == "NgCar9" or vehid == "NgCar10" or vehid == "NgCar11" or vehid == "NgCar12" or vehid == "NgCar13"
	            or vehid == "NgCar14" or vehid == "NgCar15" or vehid == "NgCar16" or vehid == "NgTank1" or vehid == "NgTank2"
	            or vehid == "NgTank3" or vehid == "NgJet1" or vehid == "NgJet2" or vehid == "NgJet3" or vehid == "NgMoto1" 
	            or vehid == "NgMoto2" or vehid == "NgMoto3" or vehid == "NgMoto4" or vehid == "NgMoto5" or vehid == "NgMoto6" 
	            or vehid == "NgMoto7" or vehid == "NgMoto8" then
			if not isVehicleOccupied(ng_cars) then
			local engine = getVehicleEngineState(ng_cars)
			if engine == false then
			setElementData( ng_cars ,"fuel",105)
		end
		end
	end
	end
end
setTimer ( setbenzin, 1200000, 0 ) --40Min--
---------------------------------











function vhandling ( )
   for _,v in pairs(getElementsByType("vehicle")) do
      if getElementModel(v) == 598 then
        setVehicleHandling (v, "mass", 1800.0)
		setVehicleHandling(v, "turnMass", 1500)
		setVehicleHandling(v, "suspensionLowerLimit", -0.16)
        setVehicleHandling(v, "tractionMultiplier", 1)
        setVehicleHandling(v, "tractionLoss", 1.2)
        setVehicleHandling(v, "numberOfGears", 5)
		setVehicleHandling(v, "brakeBias", 0.7)
        setVehicleHandling(v, "maxVelocity", 380.0)
        setVehicleHandling(v, "engineAcceleration", 34.0 )
		setVehicleHandling(v, "collisionDamageMultiplier", 0.12)
        setVehicleHandling(v, "driveType", "fwd")
		setVehicleHandling(v, "dragCoeff", 1.2 )
        setVehicleHandling(v, "brakeDeceleration", 20.0)
		setVehicleHandling(v, "engineInertia", 40)
       
		
		
	 elseif getElementModel(v) == 410 then
        setVehicleHandling (v, "mass", 1700.0)
		setVehicleHandling(v, "turnMass", 5000)
        setVehicleHandling(v, "tractionMultiplier", 1.1)
        setVehicleHandling(v, "tractionLoss", 1.2)
        setVehicleHandling(v, "numberOfGears", 5)
		setVehicleHandling(v, "brakeBias", 0.70)
        setVehicleHandling(v, "maxVelocity", 400.0)
        setVehicleHandling(v, "engineAcceleration", 35.0 )
		setVehicleHandling(v, "collisionDamageMultiplier", 0.12)
        setVehicleHandling(v, "driveType", "fwd")
		setVehicleHandling(v, "dragCoeff", 1)
        setVehicleHandling(v, "brakeDeceleration", 20.0)

		
--------- Mashin Jangi NG --------
		elseif getElementModel(v) == 470 then
		setVehicleHandling (v, "mass", 3000.0)
		setVehicleHandling(v, "numberOfGears", 5)
        setVehicleHandling(v, "maxVelocity", 320.0)
        setVehicleHandling(v, "engineAcceleration", 30.0 )
		setVehicleHandling(v, "tractionMultiplier", 1)
		setVehicleHandling(v, "tractionLoss", 0.8)
		setVehicleHandling(v, "collisionDamageMultiplier", 0.12)
		setVehicleHandling(v, "dragCoeff", 1.5 )
        setVehicleHandling(v, "driveType", "awd")
		setVehicleHandling(v, "turnMass", 3000)
		setVehicleHandling(v, "brakeDeceleration", 20.0)
		setVehicleHandling(v, "brakeBias", 0.8)
        
      end
   end
end
addEventHandler ( "onVehicleEnter", getRootElement(), vhandling )




function vhandling ( )
   for _,v in pairs(getElementsByType("vehicle")) do
       if getElementModel(v) == 598 then
        setVehicleHandling (v, "mass", 1800.0)
		setVehicleHandling(v, "turnMass", 1500)
		setVehicleHandling(v, "suspensionLowerLimit", -0.16)
        setVehicleHandling(v, "tractionMultiplier", 1)
        setVehicleHandling(v, "tractionLoss", 1.2)
        setVehicleHandling(v, "numberOfGears", 5)
		setVehicleHandling(v, "brakeBias", 0.7)
        setVehicleHandling(v, "maxVelocity", 380.0)
        setVehicleHandling(v, "engineAcceleration", 34.0 )
		setVehicleHandling(v, "collisionDamageMultiplier", 0.12)
        setVehicleHandling(v, "driveType", "fwd")
		setVehicleHandling(v, "dragCoeff", 1.2 )
        setVehicleHandling(v, "brakeDeceleration", 20.0)
		setVehicleHandling(v, "engineInertia", 40)
       
		
		
	 elseif getElementModel(v) == 410 then 
        setVehicleHandling (v, "mass", 1700.0)
		setVehicleHandling(v, "turnMass", 5000)
        setVehicleHandling(v, "tractionMultiplier", 1.1)
        setVehicleHandling(v, "tractionLoss", 1.2)
        setVehicleHandling(v, "numberOfGears", 5)
		setVehicleHandling(v, "brakeBias", 0.70)
        setVehicleHandling(v, "maxVelocity", 400.0)
        setVehicleHandling(v, "engineAcceleration", 32.0 )
		setVehicleHandling(v, "collisionDamageMultiplier", 0.12)
        setVehicleHandling(v, "driveType", "fwd")
		setVehicleHandling(v, "dragCoeff", 1)
        setVehicleHandling(v, "brakeDeceleration", 20.0)

		
--------- Mashin Jangi NG --------
		elseif getElementModel(v) == 470 then
		setVehicleHandling (v, "mass", 3000.0)
		setVehicleHandling(v, "numberOfGears", 5)
        setVehicleHandling(v, "maxVelocity", 320.0)
        setVehicleHandling(v, "engineAcceleration", 30.0 )
		setVehicleHandling(v, "tractionMultiplier", 1)
		setVehicleHandling(v, "tractionLoss", 0.8)
		setVehicleHandling(v, "collisionDamageMultiplier", 0.12)
		setVehicleHandling(v, "dragCoeff", 1.5 )
        setVehicleHandling(v, "driveType", "awd")
		setVehicleHandling(v, "turnMass", 3000)
		setVehicleHandling(v, "brakeDeceleration", 20.0)
		setVehicleHandling(v, "brakeBias", 0.8)
        
      end
   end
end
addEventHandler ( "onResourceStart", getRootElement(), vhandling )
