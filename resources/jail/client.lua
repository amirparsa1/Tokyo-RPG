

local screenW, screenH = guiGetScreenSize()
function createJailTime()
	removeEventHandler("onClientRender",getRootElement(),renderLoginPanel) -- FIX: avoid stacking duplicate render handlers
	addEventHandler("onClientRender",getRootElement(),renderLoginPanel)
end
addEvent( "onSyncTime", true )
addEventHandler( "onSyncTime", localPlayer, createJailTime )

function showTime()
	local jailTime = getElementData("jailTimer")
	  dxDrawText("Jail Time: ["..tonumber(jailTime).."]", 10 + 1, 395 + 1, 185 + 1, 425 + 1, tocolor(205, 0, 0, 255), 1.00, "pricedown", "left", "top", false, false, true, false, false)
    dxDrawText("Jail Time: ["..tonumber(jailTime)"]", 10, (screenH - 30) / 2 +50, (10) + 175, ( (screenH - 30) / 2 +50) + 30, tocolor(254, 254, 254, 255), 1.00, "pricedown", "left", "top", false, false, true, false, false)
end