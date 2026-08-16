local accSys = exports["[Atis]Accounts"] -- Public By Arlixx 
local miscSys = exports["[Atis]Misc"] -- Telegram: @EnixGame

--Local Functions ...
function convertNumber( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1,%2' )    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

addEventHandler ( "onVehicleStartEnter", getRootElement(), -- Admin Level 1 Vehs
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if vehid == "AdminCar1" or vehid == "AdminCar2" or vehid == "AdminCar3" or vehid == "AdminCar4" or vehid == "AdminCar5" or vehid == "AdminCar6" or vehid == "AdminCar7" or vehid == "AdminCar8" or vehid == "AdminCar9" or vehid == "AdminBike1" or vehid == "AdminBike2" or vehid == "AdminBike3" or vehid == "AdminBike4" or vehid == "AdminBike5" or vehid == "AdminHeli1" or vehid == "AdminHeli2" or vehid == "AdminHeli3" or vehid == "AdminHeli4" or vehid == "AdminHeli5" or vehid == "AdminHeli6" or vehid == "AdminBoat1" or vehid == "AdminBoat2" or vehid == "AdminBoat3" then
		if seat == 0 then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
				cancelEvent()
				outputChatBox ( "#ff0000Error: Baraye inkar Shoma Bayad Admin Level (1) Be Bala Bashid!", thePlayer, 230,0,0 ,true)
			else
				outputChatBox ( "#ff0000[Staff]: #ffffffShoma Savar Mashin Admini Shodid!", thePlayer, 230,0,0 ,true)
			end
		end
	end
end)

addEventHandler ( "onVehicleStartEnter", getRootElement(),  -- Admin Level 7 Vehs
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if vehid == "AdminHydra" or vehid == "AdminHeliX" or vehid == "AdminHeliX1" or vehid == "AdminHeliX2" or vehid == "AdminCarX" or vehid == "AdminVIP" then
		if seat == 0 then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
				cancelEvent()
				outputChatBox ( "#ff0000Error: Baraye inkar Shoma Bayad Admin Level (7) Be Bala Bashid!", thePlayer, 230,0,0 ,true)
			else
				outputChatBox ( "#ff0000[Staff]: #ffffffShoma Savar Mashin Admini Shodid!", thePlayer, 230,0,0 ,true)
			end
		end
	end
end)

addEventHandler ( "onVehicleStartEnter", getRootElement(),  -- Admin Level 7 Vehs
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if vehid == "HelperBoat1" or vehid == "HelperBoat2" or vehid == "HelperBoat3" or vehid == "HelperHeli1" or vehid == "HelperHeli2" or vehid == "HelperHeli3" or vehid == "HelperHeli14" or vehid == "HelperBike1" or vehid == "HelperBike2" or vehid == "HelperBike3" or vehid == "HelperBike4" or vehid == "HelperBike5" or vehid == "HelperCar1" or vehid == "HelperCar2" or vehid == "HelperCar3" or vehid == "HelperCar4" or vehid == "HelperCar5" or vehid == "HelperCar6" then
		if seat == 0 then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) < 1 then
				cancelEvent()
				outputChatBox ( "#ff0000Error: Baraye inkar Shoma Bayad Helper Bashid!", thePlayer, 230,0,0 ,true)
			else
				outputChatBox ( "#ff0000[Staff]: #ffffffShoma Savar Mashin Helperi Shodid!", thePlayer, 230,0,0 ,true)
			end
		end
	end
end)