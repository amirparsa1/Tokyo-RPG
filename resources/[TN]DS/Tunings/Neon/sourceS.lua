local accSys = exports["Accounts-System"]
local vehSys = exports["[TN]Ds"]
addEvent("tuning->Neon", true)
addEventHandler("tuning->Neon", root, function(vehicle, neon)
	if vehicle then
		triggerClientEvent(root, "tuning->Neon", root, vehicle, neon)
	end
end)

local infoColors = "Color Ha: White, Blue, Green, Red, Yellow, Pink, Orange, Lightblue, Rasta, Ice Or False"
addCommandHandler("setneon",
function (thePlayer, command, color)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if theVehicle then
		local color = tostring(color)
		if color == "white" then
			setElementData(theVehicle, "tuning.neon", color)

			vehSys:setVehicleData(getElementData(theVehicle,"vehicleID"), "vNeon", 1)

			setElementData(theVehicle, "vehicle.neon.active", false)
			outputChatBox("#00ff00[Success]: #ffffffNeon Be Range "..color.." Set Shod", thePlayer, 255, 255, 255, true)
		elseif color == "blue" then
			setElementData(theVehicle, "tuning.neon", color)
			setElementData(theVehicle, "vehicle.neon.active", false)
			vehSys:setVehicleData(getElementData(theVehicle,"vehicleID"), "vNeon", 2)
			outputChatBox("#00ff00[Success]: #ffffffNeon Be Range "..color.." Set Shod", thePlayer, 255, 255, 255, true)
		elseif color == "green" then
			setElementData(theVehicle, "tuning.neon", color)
			setElementData(theVehicle, "vehicle.neon.active", false)
			vehSys:setVehicleData(getElementData(theVehicle,"vehicleID"), "vNeon", 3)
			outputChatBox("#00ff00[Success]: #ffffffNeon Be Range "..color.." Set Shod", thePlayer, 255, 255, 255, true)
		elseif color == "red" then
			setElementData(theVehicle, "tuning.neon", color)
			setElementData(theVehicle, "vehicle.neon.active", false)
			vehSys:setVehicleData(getElementData(theVehicle,"vehicleID"), "vNeon", 4)
			outputChatBox("#00ff00[Success]: #ffffffNeon Be Range "..color.." Set Shod", thePlayer, 255, 255, 255, true)
		elseif color == "yellow" then
			setElementData(theVehicle, "tuning.neon", color)
			setElementData(theVehicle, "vehicle.neon.active", false)
			vehSys:setVehicleData(getElementData(theVehicle,"vehicleID"), "vNeon", 5)
			outputChatBox("#00ff00[Success]: #ffffffNeon Be Range "..color.." Set Shod", thePlayer, 255, 255, 255, true)
		elseif color == "pink" then
			setElementData(theVehicle, "tuning.neon", color)
			setElementData(theVehicle, "vehicle.neon.active", false)
			vehSys:setVehicleData(getElementData(theVehicle,"vehicleID"), "vNeon", 6)
			outputChatBox("#00ff00[Success]: #ffffffNeon Be Range "..color.." Set Shod", thePlayer, 255, 255, 255, true)
		elseif color == "orange" then
			setElementData(theVehicle, "tuning.neon", color)
			setElementData(theVehicle, "vehicle.neon.active", false)
			vehSys:setVehicleData(getElementData(theVehicle,"vehicleID"), "vNeon", 7)
			outputChatBox("#00ff00[Success]: #ffffffNeon Be Range "..color.." Set Shod", thePlayer, 255, 255, 255, true)
		elseif color == "lightblue" then
			setElementData(theVehicle, "tuning.neon", color)
			setElementData(theVehicle, "vehicle.neon.active", false)
			vehSys:setVehicleData(getElementData(theVehicle,"vehicleID"), "vNeon", 8)
			outputChatBox("#00ff00[Success]: #ffffffNeon Be Range "..color.." Set Shod", thePlayer, 255, 255, 255, true)
		elseif color == "rasta" then
			setElementData(theVehicle, "tuning.neon", color)
			setElementData(theVehicle, "vehicle.neon.active", false)
			vehSys:setVehicleData(getElementData(theVehicle,"vehicleID"), "vNeon", 9)
			outputChatBox("#00ff00[Success]: #ffffffNeon Be Range "..color.." Set Shod", thePlayer, 255, 255, 255, true)
		elseif color == "ice" then
			setElementData(theVehicle, "tuning.neon", color)
			setElementData(theVehicle, "vehicle.neon.active", false)
			vehSys:setVehicleData(getElementData(theVehicle,"vehicleID"), "vNeon", 10)
			outputChatBox("#00ff00[Success]: #ffffffNeon Be Range "..color.." Set Shod", thePlayer, 255, 255, 255, true)
		elseif color == "false" then
			setElementData(theVehicle, "tuning.neon", false)
			setElementData(theVehicle, "vehicle.neon.active", false)
			vehSys:setVehicleData(getElementData(theVehicle,"vehicleID"), "vNeon", 11)
			outputChatBox("#00ff00[Success]: #ffffffNeon Bardashte Shod!", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000[Error]: #ffffff"..infoColors, thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Dakhel Mashin Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end)