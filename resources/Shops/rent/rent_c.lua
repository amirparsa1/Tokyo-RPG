--Rent System By Rigel!
local screenW, screenH = guiGetScreenSize()
function renderRent()
	dxDrawText("/rentveh", (screenW - 384) / 2, (screenH - 160) / 2 - 200, ((screenW - 384) / 2) + 384, ( (screenH - 160) / 2 - 200) + 160, tocolor(78, 254, 0, 255), 6.00, "pricedown", "left", "top", false, false, false, false, false)
	dxDrawText("For Rent Veh", (screenW - 1105) / 2, (screenH - 180) / 2, ((screenW - 1105) / 2) + 1105, ( (screenH - 180) / 2) + 180, tocolor(255, 255, 255, 255), 6.00, "pricedown", "left", "top", false, false, false, false, false)
end

function renderingRent ( )
    addEventHandler ( "onClientRender", root, renderRent ) 
	setTimer(function()
	removeEventHandler("onClientRender", getRootElement(), renderRent)
	end, 3000, 1)
end

addEvent( "onRenting", true )
addEventHandler( "onRenting", localPlayer, renderingRent )

function renderUnrent()
    dxDrawText("/unrentveh", 694 + 1, 265 + 1, 800 + 1, 250 + 1, tocolor(0, 0, 0, 255), 6.00, "pricedown", "left", "top", false, false, false, false, false)
    dxDrawText("/unrentveh", (screenW - 532) / 2, (screenH - 151) / 2 -200, ((screenW - 532) / 2) + 532, ( (screenH - 151) / 2 -200) + 151, tocolor(253, 0, 0, 255), 6.00, "pricedown", "left", "top", false, false, false, false, false)
    dxDrawText("For UnRent Veh", 141 + 1, 403 + 1, 1779 + 1, 577 + 1, tocolor(0, 0, 0, 255), 6.00, "pricedown", "left", "top", false, false, false, false, false)
    dxDrawText("For UnRent Veh", (screenW - 1638) / 2, (screenH - 174) / 2 -50, ((screenW - 1638) / 2) + 1638, ( (screenH - 174) / 2 -50) + 174, tocolor(255, 255, 255, 255), 6.00, "pricedown", "left", "top", false, false, false, false, false)
end

function renderingUnrent ( )
    addEventHandler ( "onClientRender", root, renderUnrent ) 
	setTimer(function()
	removeEventHandler("onClientRender", getRootElement(), renderUnrent)
	end, 3000, 1)
end

addEvent( "onUnrenting", true )
addEventHandler( "onUnrenting", localPlayer, renderingUnrent )

function unrenderAll()
	removeEventHandler("onClientRender", getRootElement(), renderRent)
	removeEventHandler("onClientRender", getRootElement(), renderUnrent)
end
addEvent( "unRenderingAll", true )
addEventHandler( "unRenderingAll", localPlayer, unrenderAll )