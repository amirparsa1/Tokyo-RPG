local accSys = exports["Accounts-System"]

function entermayorVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 8 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "limozin" then
			cancelEvent()
			outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #FF00FFShahrDar #ffffffAst Va Shoma Nmitavanid Savar An Shavid.", player, 230,0,0 ,true)
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "limozin" then
			cancelEvent()
			outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #FF00FFShahrDar #ffffffAst Va Shoma Nmitavanid Savar An Shavid.", player, 230,0,0 ,true)
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), entermayorVehicle ) 


addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 8 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, mayor_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( mayor_cars )
			if vehid == "limozin" then
				if not isVehicleOccupied(mayor_cars) then
					respawnVehicle(mayor_cars)
					setElementData( mayor_cars ,"fuel",105)
				end
			end
		end
		for index, mayor_members in ipairs(getElementsByType("player")) do 
			if getElementData(mayor_members, "loggedIn") == true then
				if tonumber(getElementData(accSys:getPlayerAcc(mayor_members), "pMember")) == 8 then
					outputChatBox("#FF00FF(Shahrdar):#ffffffTamamie Khodro Haye Faction Tavasote #FF00FF"..getPlayerName(thePlayer).." #ffffffRespawn Shodand!", mayor_members, 255, 255, 255, true)
				end
			end
		end
	end
end
)








for index, sh_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( sh_cars )
			if vehid == "limozin" then
			toggleVehicleRespawn ( sh_cars, true )
			setVehicleIdleRespawnDelay ( sh_cars, 1000000 ) --5Min--
			setElementData( sh_cars ,"fuel",105)
		end
	end



function setbenzin (thePlayer, cmd)
	for index, sh_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( sh_cars )
			if vehid == "limozin" then
			if not isVehicleOccupied(sh_cars) then
			local engine = getVehicleEngineState(sh_cars)
			if engine == false then
			setElementData( sh_cars ,"fuel",105)
		end
		end
	end
	end
end
setTimer ( setbenzin, 1000000, 0 ) --40Min--
---------------------------------