local timer = setTimer(timerJail,1000,1)

function timerJail()
    if getElementData(source,"jailTimer") > 0 then
		timeRoTamoomKon()
		triggerClientEvent ( source, "onSyncTime")
		resetTimer(timer)
    end
end

addEventHandler("onPlayerSpawn",source,
function()
	if getElementData(source,"jailTimer") > 0 then
		if getElementData(source, "jailLoc") == 1 then
			spawnPlayer(source, 264.228515625, 77.505859375, 1001.0390625)
			setElementInterior ( source, 6 )
		end
	end
end
)

function timeRoTamoomKon()
	local timeJailChande = getElementData(source,"jailTimer")
	local kamkon = tonumber(timeJailChande) - 1
	setElementData(source, "jailTimer", tonumber(kamkon))
end
	

