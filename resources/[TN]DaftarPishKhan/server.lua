local accSys = exports["Accounts-System"]
local notfSys = exports["notf"]
local houseSys = exports["[TN]House"]
local dbpTime = 500
local pick = createPickup ( 1878.1396484375 ,-2544.03125 ,0.81875002384186 , 3, 1239, 0)
setElementInterior(pick, 341 )
setElementDimension(pick, 0 )
function UpdateMyNameForHouses( MyNowName , NewName )	
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM houses;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local owner = row['OWNER']
			local rent1 = row['RENT1']
			local rent2 = row['RENT2']
			local rent3 = row['RENT3']
			local rent4 = row['RENT4']
			local rent5 = row['RENT5']
			local id = row['ID']
			if owner == MyNowName then
				houseSys:setHouseData(id, "OWNER", NewName)
			elseif rent1 == MyNowName then
				houseSys:setHouseData(id, "RENT1", NewName)
			elseif rent2 == MyNowName then
				houseSys:setHouseData(id, "RENT2", NewName)
			elseif rent3 == MyNowName then
				houseSys:setHouseData(id, "RENT3", NewName)
			elseif rent4 == MyNowName then
				houseSys:setHouseData(id, "RENT4", NewName)
			elseif rent5 == MyNowName then
				houseSys:setHouseData(id, "RENT5", NewName)
			end
		end
		dbFree(query)
	end
end
function UpdateMyNameForDsCars( MyNowName , NewName )	
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local ChangeVehOwnerQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `vehicles` SET `vOwner` = '"..NewName.."' WHERE `vOwner` = '"..MyNowName.."'")
			dbFree(ChangeVehOwnerQuery)
		end
		dbFree(query)
	end
	for _, vehs in ipairs(getElementsByType("vehicle")) do
		if getElementData(vehs,"owner") == MyNowName then
			setElementData(vehs,"owner",NewName)
		end
	end
end


function registerPlayer(source,Hexs2, username, password, email)
    dbQuery(function (qh)
        local res = dbPoll(qh, 0)
        if type(res[1]) ~= "nil" then
            exports["notf"]:addNotification(source, "In Name Az Ghabl Vojood Darad!" , 'error')
            return false
        end
        if tonumber(getElementData(accSys:getPlayerAcc(source), "pGold")) >= 500 then
            local pGold = getElementData(accSys:getPlayerAcc(source), "pGold")
            setElementData(accSys:getPlayerAcc(source), "pGold", tonumber(pGold) - 500)
            local Khodesh1 = getElementData(accSys:getPlayerAcc(source), "pName")
            setElementData(accSys:getPlayerAcc(source), "pOldHouseName", Khodesh1)
            triggerClientEvent ( source, "PlayMovafagh", source)  
            local MyNowName = getPlayerName(source)
            UpdateMyNameForHouses( MyNowName , Hexs2 )
            UpdateMyNameForDsCars( MyNowName , Hexs2 )
            triggerClientEvent("closepanelsabtahval",source,source)
            notfSys:addNotification(source, "Shoma Ba Movafaghiat Name Khodra Be "..Hexs2.." Taghir Dadid" , 'success')
			setPlayerNametagText( source,Hexs2.." ["..getElementData(source,"TarafID").."]")
            -- Name Bade Chand Sanie Avaz She
            setTimer(
            function ()
                setPlayerName(source,Hexs2)
                setElementData(accSys:getPlayerAcc(source), "pName", Hexs2)
            end, 1000, 1)
        else
            exports["notf"]:addNotification(source, "Shoma Be 500 Gold Baraye Taghir Name Niaz Darid! Baraye Afzayesh Gold /shop" , 'error')
        end
    end, exports.mysql:getMySQLC(), "SELECT `pID` FROM `users` WHERE `pName`=?", Hexs2)
end
addEvent("ChangeShePname", true)
addEventHandler("ChangeShePname", getRootElement(), registerPlayer)
addEventHandler( "onPickupHit", pick,function(hitElement)
    local goldesh = getElementData(accSys:getPlayerAcc(hitElement), "pGold")
    triggerClientEvent("openpanelsabtahval",hitElement,hitElement,goldesh)
end)
addEventHandler( "onPickupLeave", pick,function(hitElement)
    triggerClientEvent("closepanelsabtahval",hitElement,hitElement)
end)
local blipsabteahval = createBlip( 1247.9853515625 ,-1559.9384765625 ,14,24)
setElementData( blipsabteahval, 'blipName',"Daftare Pishkhan" )