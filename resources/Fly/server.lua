local accSys = exports["accounts-system"]
local Superman = {}

-- Static global values
local rootElement = getRootElement()
local thisResource = getThisResource()


-- Resource events
addEvent("superman:start", true)
addEvent("superman:stop", true)
addEvent("superman:checkRight", true)

--
-- Start/stop functions
--
addCommandHandler("afly",
function (thePlayer, command)
	if getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin") > 8 or getElementData(accSys:getPlayerAcc(thePlayer), "MapEditor") == 1 or getElementData(accSys:getPlayerAcc(thePlayer), "Queen") == 1 then
		local nowFly = getElementData(thePlayer, "canFLY")
		if nowFly == true then
			setElementData(thePlayer, "canFLY", false)
			outputChatBox("#ff0000[ADM-System]: #ffffffHalate Fly #ff0000Qeyre Faal #ffffffShod!", thePlayer, 255, 255, 255, true)
		else
			setElementData(thePlayer, "canFLY", true)
			outputChatBox("#ff0000[ADM-System]: #ffffffHalate Fly #00ff00Faal #ffffffShod!", thePlayer, 255, 255, 255, true)
		end
	end
end)

function check(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 8 or getElementData(accSys:getPlayerAcc(thePlayer), "MapEditor") == 1 or getElementData(accSys:getPlayerAcc(thePlayer), "Queen") == 1 then
		triggerClientEvent("flyrookon", thePlayer, thePlayer)
	end
end
addEvent("bbinadmine", true)
addEventHandler("bbinadmine", root,check)

function Superman.Start()
  local self = Superman

  addEventHandler("superman:start", rootElement, self.clientStart)
  addEventHandler("superman:stop", rootElement, self.clientStop)
  addEventHandler("onPlayerVehicleEnter",rootElement,self.enterVehicle)

end
addEventHandler("onResourceStart", getResourceRootElement(thisResource), Superman.Start, false)

function Superman.clientStart()
  setElementData(client, "superman:flying", true)
end

function Superman.clientStop()
  setElementData(client, "superman:flying", false)
end

-- Fix for players glitching other players' vehicles by warping into them while superman is active, causing them to flinch into air and get stuck.
function Superman.enterVehicle()
	if getElementData(source,"superman:flying") or getElementData(source,"superman:takingOff") then
		removePedFromVehicle(source)
		local x,y,z = getElementPosition(source)
		setElementPosition(source,x,y,z)
	end
end