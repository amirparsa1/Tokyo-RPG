local screenW, screenH = guiGetScreenSize()
TruckerBg = guiCreateStaticImage((screenW - 482) / 2, (screenH - 230) / 2, 482, 270, "Files/Bg.png", false)

TruckerLabel1 = guiCreateLabel(126, 0, 222, 49, "Job : Trucker", false, TruckerBg)
font = guiCreateFont("Files/Font.ttf", 17)
guiSetFont(TruckerLabel1, font)
guiLabelSetHorizontalAlign(TruckerLabel1, "center", true)
guiLabelSetVerticalAlign(TruckerLabel1, "center")
TruckerLabel2 = guiCreateLabel(11, 40, 461, 180, "Ba Ozviat Dar Sherkat Trucker TheNight \n Mitavanid Tajrobe Ja Be Jai Bar Ba Truck Ra Dashte Bashid! \n Dar In Job Shoma Ba Tavajoh Be Skill Khod Dar In Job Hoghoogh Daryaft Mikonid! \n\n Skill 1 ( 0 - 50 ) : 3500$ - 4500$ \n Skill 2 ( 50 - 100 ) : 4500$ - 5500$ \n Skill 3 ( 100 - 200 ) : 5500$ - 6500$ \n Skill 4 ( 200 - 300 ) : 6500$ - 7500$ \n Skill 5 ( 300 - MAX ) : 7500$ - 8500$", false, TruckerBg)
guiLabelSetHorizontalAlign(TruckerLabel2, "center", true)
TruckerReject = guiCreateStaticImage(250, 200, 123, 47, "Files/Reject.png", false, TruckerBg)
TruckerAccept = guiCreateStaticImage(110, 200, 123, 47, "Files/Accept.png", false , TruckerBg )
guiSetProperty(TruckerBg, "Visible", "false")


function ShowTruckerPanel(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(TruckerBg, "Visible", "True")
		showCursor(true)
	end
end
addEvent("ShowTruckerPanel",true)
addEventHandler("ShowTruckerPanel", root, ShowTruckerPanel)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == TruckerReject then
		guiSetProperty(TruckerBg, "Visible", "False")
		showCursor(false)
	elseif source == TruckerAccept then
		triggerServerEvent("GiveTruckerJob", getLocalPlayer(), getLocalPlayer() )
		guiSetProperty(TruckerBg, "Visible", "False")
		showCursor(false)
	end
end)