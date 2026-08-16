local dbpTime = 500
local accSys = exports["Accounts-system"]

--[[ Table Baraye Bet Shop Locations ]]--
local DadgahLocations = {
	--{x, y, z},
    {1567.9599609375 ,-1667.4482421875 ,17.58993721008-0.9},
}
createBlip(1567.9599609375 ,-1667.4482421875 ,17.58993721008, 19)
local betMarker = {}
function openDadgahPannel(hitElement)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		triggerClientEvent("DadGaPannel", hitElement, hitElement)
		local wKill = getElementData(accSys:getPlayerAcc(hitElement), "wKill")
		exports["notf"]:addNotification(hitElement, "Tedad Kill Haye Shoma [ "..wKill.." ] Nafar!", 'warning')
	end
end

function createMarkers()
    for i=1 , #DadgahLocations do
        local x,y,z = DadgahLocations[i][1],DadgahLocations[i][2],DadgahLocations[i][3]
        betMarker[i] = createMarker(x,y,z , "cylinder", 1, 0, 255, 0,255)
        addEventHandler("onMarkerHit",betMarker[i],openDadgahPannel)
    end
end	
createMarkers()


function pardakhtdie(root)
	local wKill = getElementData(accSys:getPlayerAcc(root), "wKill")*600
	if wKill > 99999999 then exports["notf"]:addNotification(root, "Account Shoma Suspand Shode Ast Ba Owner Hamahang Shavid!!", 'error') return false end
	if wKill == 0 then exports["notf"]:addNotification(root, "Shoma Ta Konon Jormi Mortakeb Nashodid!", 'error') return false end
	if getPlayerMoney(root) < tonumber(wKill) then exports["notf"]:addNotification(root, "Mojodi Kafi Nist!", 'warning') return false end
	setElementData(accSys:getPlayerAcc(root), "wKill", 0)
	setElementData(accSys:getPlayerAcc(root), "pWanted", 0)
	setPlayerWantedLevel(root, 0)
	takePlayerMoney(root, tonumber(wKill))
	exports["notf"]:addNotification(root, "Jarayem Ba Mofaqiat Pardakhat Shod! -"..tonumber(wKill).." Toman", 'info')
end
addEvent("pardakhtdie",true)
addEventHandler("pardakhtdie", root, pardakhtdie)

