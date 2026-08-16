local accSys = exports["Accounts-System"]

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

--[[function savarmashinschoolMishe ( thePlayer, seat, jacked ) 
	local theVehicle = getPedOccupiedVehicle (thePlayer)
	if theVehicle then
		local vehid = getElementID ( theVehicle )
		if vehid == "Shheli1" or vehid == "Shheli2" or vehid == "Shheli3" or vehid == "Shheli4" or vehid == "Shheli5" or vehid == "Shcar1" or vehid == "Shcar2" or vehid == "Shcar3" or vehid == "Shcar4" or vehid == "Shcar5" or vehid == "Shcar6" or vehid == "Shcar7"
		or vehid == "Shcar8" or vehid == "Shcar9" or vehid == "Shcar10" or vehid == "motosh1" or vehid == "motosh2" or vehid == "motosh3" or vehid == "motosh4" or vehid == "Shghayegh1" or vehid == "Shghayegh2" then
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 6 then
					cancelEvent()
					outputChatBox ( "#ff0000✖️ #ffffffShoma Nemitavanid Savar In Khodro Shavid!", thePlayer, 230,0,0 ,true)
				end
		end
	end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), savarmashinschoolMishe )
addEventHandler ( "onVehicleEnter", getRootElement(), savarmashinschoolMishe )--]]


function enterschoolVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 6 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "Shheli1" or vehid == "Shheli2" or vehid == "Shheli3" or vehid == "Shheli4" or vehid == "Shheli5" or vehid == "Shcar1" or vehid == "Shcar2" or vehid == "Shcar3" or vehid == "Shcar4" or vehid == "Shcar5" or vehid == "Shcar6" or vehid == "Shcar7"
		or vehid == "Shcar8" or vehid == "Shcar9" or vehid == "Shcar10" or vehid == "motosh1" or vehid == "motosh2" or vehid == "motosh3" or vehid == "motosh4" or vehid == "Shghayegh1" or vehid == "Shghayegh2" then
			cancelEvent()
			outputChatBox ( "#ff0000✖️ #ffffffShoma Nemitavanid Savar In Khodro Shavid!", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "Shheli1" or vehid == "Shheli2" or vehid == "Shheli3" or vehid == "Shheli4" or vehid == "Shheli5" or vehid == "Shcar1" or vehid == "Shcar2" or vehid == "Shcar3" or vehid == "Shcar4" or vehid == "Shcar5" or vehid == "Shcar6" or vehid == "Shcar7"
		or vehid == "Shcar8" or vehid == "Shcar9" or vehid == "Shcar10" or vehid == "motosh1" or vehid == "motosh2" or vehid == "motosh3" or vehid == "motosh4" or vehid == "Shghayegh1" or vehid == "Shghayegh2" then
			cancelEvent()
			outputChatBox ( "#ff0000✖️ #ffffffShoma Nemitavanid Savar In Khodro Shavid!", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterschoolVehicle )



addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, school_cars in ipairs(getElementsByType("vehicle")) do 
			if school_cars then
				local vehid = getElementID ( school_cars )
				if vehid == "Shheli1" or vehid == "Shheli2" or vehid == "Shheli3" or vehid == "Shheli4" or vehid == "Shheli5" or vehid == "Shcar1" or vehid == "Shcar2" or vehid == "Shcar3" or vehid == "Shcar4" or vehid == "Shcar5" or vehid == "Shcar6" or vehid == "Shcar7"
		or vehid == "Shcar8" or vehid == "Shcar9" or vehid == "Shcar10" or vehid == "motosh1" or vehid == "motosh2" or vehid == "motosh3" or vehid == "motosh4" or vehid == "Shghayegh1" or vehid == "Shghayegh2" then
					if not isVehicleOccupied(school_cars) then
						respawnVehicle(school_cars)
						setElementData( school_cars ,"fuel",105)
					end
				end
			end
		end
		for index, school_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(school_members), "pMember")) == 6 then
				outputChatBox("#00ff00[Tavajoh]: #ffffffTamamie Khodro Haye Faction Tavasote "..getPlayerName(thePlayer).." Respawn Shodand!", school_members, 255, 255, 255, true)
			end
		end
	end
end
)








for index, school_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( school_cars )
		if vehid == "Shheli1" or vehid == "Shheli2" or vehid == "Shheli3" or vehid == "Shheli4" or vehid == "Shheli5" or vehid == "Shcar1" or vehid == "Shcar2" or vehid == "Shcar3" or vehid == "Shcar4" or vehid == "Shcar5" or vehid == "Shcar6" or vehid == "Shcar7"
		or vehid == "Shcar8" or vehid == "Shcar9" or vehid == "Shcar10" or vehid == "motosh1" or vehid == "motosh2" or vehid == "motosh3" or vehid == "motosh4" or vehid == "Shghayegh1" or vehid == "Shghayegh2" then
			toggleVehicleRespawn ( school_cars, true )
			setVehicleIdleRespawnDelay ( school_cars, 1200000 ) --5Min--
			setElementData( school_cars ,"fuel",105)
		end
	end



function setbenzin (thePlayer, cmd)
	for index, school_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( school_cars )
		if vehid == "Shheli1" or vehid == "Shheli2" or vehid == "Shheli3" or vehid == "Shheli4" or vehid == "Shheli5" or vehid == "Shcar1" or vehid == "Shcar2" or vehid == "Shcar3" or vehid == "Shcar4" or vehid == "Shcar5" or vehid == "Shcar6" or vehid == "Shcar7"
		or vehid == "Shcar8" or vehid == "Shcar9" or vehid == "Shcar10" or vehid == "motosh1" or vehid == "motosh2" or vehid == "motosh3" or vehid == "motosh4" or vehid == "Shghayegh1" or vehid == "Shghayegh2" then
			if not isVehicleOccupied(school_cars) then
			local engine = getVehicleEngineState(school_cars)
			if engine == false then
			setElementData( school_cars ,"fuel",105)
		end
		end
	end
	end
end
setTimer ( setbenzin, 1200000, 0 ) --40Min--
---------------------------------









function vhandling ( )
   for _,v in pairs(getElementsByType("vehicle")) do
      if getElementModel(v) == 547 then
        setVehicleHandling (v, "mass", 1550.0)
		setVehicleHandling(v, "turnMass", 2200)
		
        setVehicleHandling(v, "tractionMultiplier", 1)
        setVehicleHandling(v, "tractionLoss", 1)
        
		setVehicleHandling(v, "brakeBias", 0.7)
        setVehicleHandling(v, "maxVelocity", 220.0)
        setVehicleHandling(v, "engineAcceleration", 17.0 )
		
        setVehicleHandling(v, "driveType", "rwd")
		setVehicleHandling(v, "dragCoeff", 1.9 )
        setVehicleHandling(v, "brakeDeceleration", 20.0)
		setVehicleHandling(v, "engineInertia", 25)
       

		

        
      end
   end
end
addEventHandler ( "onVehicleEnter", getRootElement(), vhandling )




function vhandling ( )
   for _,v in pairs(getElementsByType("vehicle")) do
       if getElementModel(v) == 547 then
         setVehicleHandling (v, "mass", 1550.0)
		setVehicleHandling(v, "turnMass", 2200)
		
        setVehicleHandling(v, "tractionMultiplier", 1)
        setVehicleHandling(v, "tractionLoss", 1)
        
		setVehicleHandling(v, "brakeBias", 0.7)
        setVehicleHandling(v, "maxVelocity", 220.0)
        setVehicleHandling(v, "engineAcceleration", 17.0 )
		
        setVehicleHandling(v, "driveType", "rwd")
		setVehicleHandling(v, "dragCoeff", 1.9 )
        setVehicleHandling(v, "brakeDeceleration", 20.0)
		setVehicleHandling(v, "engineInertia", 25)

		

        
      end
   end
end
addEventHandler ( "onResourceStart", getRootElement(), vhandling )
