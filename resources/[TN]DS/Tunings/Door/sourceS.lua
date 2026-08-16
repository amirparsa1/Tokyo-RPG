local accSys = exports["Accounts-System"]
addCommandHandler("setdoor",
function (thePlayer, command, state)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if theVehicle then
		local state = tostring(state)
		if state == "true" then
			setElementData(theVehicle, "tuning.lsdDoor", state)
			triggerClientEvent("addLSDdoor", resourceRoot, theVehicle)
			outputChatBox("#00ff00[Success]: #ffffffDarha Behalate LSD Tabdil Shod!", thePlayer, 255, 255, 255, true)
		elseif state == "false" then
			triggerClientEvent("removeLSDdoor", resourceRoot, theVehicle)
			outputChatBox("#00ff00[Success]: #ffffffDarha Behalate Mamooli Tabdil Shod!", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000[Error]: #ffffffState Can Set: True Or False", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Dakhel Mashin Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end)