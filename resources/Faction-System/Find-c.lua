
local screenW, screenH = guiGetScreenSize()
FindW = guiCreateWindow((screenW - 250) / 2, (screenH - 100) / 1.1, 250, 100, "Find", false)
guiSetVisible(FindW, false)

vaziat = guiCreateLabel(20, 20, 100, 100, "Vaziat", false, FindW)
vaziatt = guiCreateLabel(100, 20, 100, 100, "", false, FindW)

tomashin = guiCreateLabel(20, 60, 100, 100, "to Mashin", false, FindW)
piade = guiCreateLabel(100, 60, 100, 100, "piade", false, FindW)

guiSetVisible(tomashin, false)
guiSetVisible(piade, false)


-- Refresh find Medic
function RefreshMedic ()
	if getElementData(getLocalPlayer(), "DarHaleFind") == 6 then
		triggerServerEvent("RefreshkonFindMedic", getLocalPlayer(), getLocalPlayer() )
	end
end
setTimer(RefreshMedic, 1000 ,1)

--[[
-- Refresh find PD
function RefreshkonPd ()
	if getElementData(getLocalPlayer(), "DarHaleFindePd") == 3 then
		triggerServerEvent("RefreshkonFindPd", getLocalPlayer(), getLocalPlayer() )
	end
end
setTimer(RefreshkonPd, 1000 ,1)


-- Refresh find FBI
function RefreshkonFbi ()
	if getElementData(getLocalPlayer(), "DarHaleFindeFBI") == 8 then
		triggerServerEvent("RefreshkonFindFbi", getLocalPlayer(), getLocalPlayer() )
	end
end
setTimer(RefreshkonFbi, 1000 ,1)


-- Refresh find Ng
function RefreshkonNg ()
	if getElementData(getLocalPlayer(), "DarHaleFindeNg") == 19 then
		triggerServerEvent("RefreshkonFindNg", getLocalPlayer(), getLocalPlayer() )
	end
end
setTimer(RefreshkonNg, 1000 ,1)
--]]