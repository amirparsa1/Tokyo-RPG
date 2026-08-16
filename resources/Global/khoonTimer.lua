--[[function syncHealth (thePlayer)
	local sleeping = getElementData(thePlayer, "pSleep")
	if tonumber(sleeping) == 0 then
		
        setElementHealth ( thePlayer, getElementHealth(thePlayer) - 20 )
        outputChatBox("-1.", thePlayer, 51, 171, 171)

	end
end
setTimer ( syncHealth, 40000, 0 )