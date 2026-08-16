local minute = 0
local money = 0

addEvent("cartheft:opengui", true)
addEventHandler("cartheft:opengui", getRootElement(),
	function()
		guiSetVisible(gui[1], true)
		showCursor(true)
	end
)

addEvent("cartheft:getcar", true)
addEventHandler("cartheft:getcar", getRootElement(),
	function(name, tm, mn, info, x, y)
		local gx = math.floor(x)
		local gy = math.floor(y)
		minute = tm
		money = mn
		guiSetText(gui[6], "Shoma Forsat Darid Dar "..minute.." Daghighe \n Mashin "..name.." Ra Be Ma Dar Makan Moshakhas \n Shode Dar Map Tahvil Bedahid")
		guiSetVisible(gui[5], true)
		showCursor(true)
		zone = createRadarArea(math.random(gx - zoneSize, gx), math.random(gy - zoneSize, gy), zoneSize, zoneSize, 25, 255, 25, 100)
		blip = createBlip(stopMarker[1], stopMarker[2], stopMarker[3], blipId, blipSize)
			setElementData(blip, "exclusiveBlip", true)
		carMarker = createMarker(stopMarker[1], stopMarker[2], stopMarker[3], "cylinder", 4.5,   181 , 246 , 181 ,60)
		addEventHandler("onClientMarkerHit", carMarker, stopJob)
		addEventHandler("onClientRender", getRootElement(), render)
		theftTimer = setTimer(function()
			destroyElement(zone)
			destroyElement(blip)
			destroyElement(carMarker)
			removeEventHandler("onClientRender", getRootElement(), render)
			triggerServerEvent("cartheft:stop", localPlayer)
			minute = 0
			money = 0
		end, (minute * 60000), 1)
	end
)

addEvent("cartheft:opencar", true)
addEventHandler("cartheft:opencar", getRootElement(),
	function()
		guiSetText(gui[9], math.random(1, 9))
		guiSetText(gui[10], math.random(1, 9))
		guiSetText(gui[11], math.random(1, 9))
		guiSetText(gui[12], math.random(1, 9))
		guiSetVisible(gui[8], true)
		showCursor(true)
	end
)

addEventHandler("onClientGUIClick", getRootElement(),
	function(button)
		if source == gui[4] then
			showCursor(false)
			guiSetVisible(gui[1], false)
		elseif source == gui[3] then
			showCursor(false)
			triggerServerEvent("cartheft:getcar", localPlayer)
			guiSetVisible(gui[1], false)
		elseif source == gui[7] then
			showCursor(false)
			guiSetVisible(gui[5], false)
		elseif source == gui[17] then
			showCursor(false)
			guiSetVisible(gui[8], false)
		elseif source == gui[13] then
			local n1 = tonumber(guiGetText(gui[13]))
			if button == "left" then
				n1 = n1 + 1
			elseif button == "right" then
				n1 = n1 - 1
			end
			guiSetText(gui[13], n1)
			chekButtonNumber()
		elseif source == gui[14] then
			local n1 = tonumber(guiGetText(gui[14]))
			if button == "left" then
				n1 = n1 + 1
			elseif button == "right" then
				n1 = n1 - 1
			end
			guiSetText(gui[14], n1)
			chekButtonNumber()
		elseif source == gui[15] then
			local n1 = tonumber(guiGetText(gui[15]))
			if button == "left" then
				n1 = n1 + 1
			elseif button == "right" then
				n1 = n1 - 1
			end
			guiSetText(gui[15], n1)
			chekButtonNumber()
		elseif source == gui[16] then
			local n1 = tonumber(guiGetText(gui[16]))
			if button == "left" then
				n1 = n1 + 1
			elseif button == "right" then
				n1 = n1 - 1
			end
			guiSetText(gui[16], n1)
			chekButtonNumber()
		end
	end
)

function stopJob(hitPlayer, matchingDimension)
	if matchingDimension and hitPlayer == localPlayer then
		local vehicle = getPedOccupiedVehicle(localPlayer)
		if vehicle and getVehicleController(vehicle) == localPlayer then
			if getElementData(vehicle, "cartheft:player") == localPlayer then
				killTimer(theftTimer)
				destroyElement(zone)
				destroyElement(blip)
				destroyElement(carMarker)
				removeEventHandler("onClientRender", getRootElement(), render)
				triggerServerEvent("cartheft:stop", localPlayer, money)
				minute = 0
				money = 0
			else
					outputChatBox("To In Mashin Bari Vojod Nadare.", source, 255, 255, 25)
			end
		end
	end
end

function chekButtonNumber()
	if (guiGetText(gui[9]) == guiGetText(gui[13])) and
		(guiGetText(gui[10]) == guiGetText(gui[14])) and
		(guiGetText(gui[11]) == guiGetText(gui[15])) and
		(guiGetText(gui[12]) == guiGetText(gui[16])) then
			showCursor(false)
			triggerServerEvent("cartheft:opencar", localPlayer)
			guiSetVisible(gui[8], false)
			outputChatBox("Dar Mashin Ba Movafaghiat Hack Shod.", 25, 255, 25)
	end
end