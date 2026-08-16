
local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
local dbpTime = 500
addCommandHandler("addserial",
function(thePlayer, cmd, plSerial)
	local plSerial = tostring(plSerial)
	if getElementData(accSys:getPlayerAcc(thePlayer), "pSecoundSerial") == 0 then
		if plSerial ~= nil then
			setElementData(accSys:getPlayerAcc(thePlayer), "pSecoundSerial", plSerial)
			outputChatBox("#00ff00[Done]: #ffffffSerial "..plSerial.." Baraye Shoma Ezafe Shod!", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000[Error]: #ffffffLotfan Serial Ra Vared Konid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Ezafe Kardan Serial Ebteda Ba /delserial Serial Qabli Ra Pak Konid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("delserial",
function(thePlayer, cmd)
	if getElementData(accSys:getPlayerAcc(thePlayer), "pSecoundSerial") ~= 0 then
		setElementData(accSys:getPlayerAcc(thePlayer), "pSecoundSerial", 0)
		outputChatBox("#00ff00[Done]: #ffffffSerial Shoma Ba Movafaqiat Hazf Shod!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000[Error]: #ffffffSeriali Baraye In Account Sabt Nashode Ast!", thePlayer, 255, 255, 255, true)
	end
end)
