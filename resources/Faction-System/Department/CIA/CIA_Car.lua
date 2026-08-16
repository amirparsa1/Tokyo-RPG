local accSys = exports["Accounts-System"]-------Faction system by ExoPrim----
local miscSys = exports["misc"]
local notfSys = exports["notf"]
local admSys = exports["[TN]Admin"]
local HouseSys = exports["[TN]House"]


local CarPlateCIA = {
    ["CIA 1"] = true,["CIA 2"] = true,["CIA 3"] = true,["CIA 4"] = true,["CIA 5"] = true,["CIA 6"] = true,["CIA 7"] = true,["CIA 8"] = true,["CIA 9"] = true,["CIA 10"] = true,["CIA 11"] = true,["CIA 12"] = true,["CIA 13"] = true,["CIA 14"] = true,["CIA 15"] = true,["CIA 16"] = true,["CIA 17"] = true,["CIA 18"] = true,["CIA 19"] = true,["CIA 20"] = true,["CIA 21"] = true,["CIA 22"] = true,["CIA 23"] = true,["CIA 24"] = true,["CIA 25"] = true,["CIA 26"] = true,["CIA 27"] = true,["CIA 28"] = true,["CIA 29"] = true,["CIA 30"] = true,["CIA50"] = true,["CIA51"] = true,["CIA52"] = true,["CIA53"] = true,["CIA54"] = true,["CIA55"] = true,["CIA56"] = true,
}
addEventHandler ( "onVehicleStartEnter", getRootElement(),function ( player, seat, jacked ) 
    local pMember = tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) 
    if pMember == 0 or pMember > 3 and pMember ~= 6 then
        if seat == 0 then
            if jacked then
                if getPedOccupiedVehicle (jacked) then
                    local vehid = getVehiclePlateText( getPedOccupiedVehicle (jacked) ) 
                    if CarPlateCIA[vehid] == true then
                        cancelEvent()
                        outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #2f64e1CIA #ffffffAst Va Shoma Nmitavanid Savar An Shavid!!", player, 230,0,0 ,true) 
                    end
                end
            else
                if getPedOccupiedVehicle (player) then
                    local vehid = getVehiclePlateText( getPedOccupiedVehicle (player) ) 
                    if CarPlateCIA[vehid] == true then
                        cancelEvent()
                        outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #2f64e1CIA #ffffffAst Va Shoma Nmitavanid Savar An Shavid!!", player, 230,0,0 ,true) 
                    end
                end
            end
            
        end
    end
end) 

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 then 
		for index, pd_cars in ipairs(getElementsByType("vehicle")) do 
			if pd_cars then
				if CarPlateCIA[getVehiclePlateText( pd_cars )] == true then
					if not isVehicleOccupied(pd_cars) then
						respawnVehicle(pd_cars)
						setElementData( pd_cars ,"fuel",105)
					end
				end
			end
		end
		for index, pd_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(pd_members), "pMember")) == 6 then
				if getElementData(pd_members, "loggedIn") == true then
					outputChatBox("#000000(CIA-Radio):#ffffffTamamie Khodro Haye Faction Tavasote #2f64e1"..getPlayerName(thePlayer).." #ffffffRespawn Shodand!", pd_members, 255, 255, 255, true)
				end
			end
		end
	end
end)