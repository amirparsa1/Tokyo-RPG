local screenW, screenH = guiGetScreenSize()
BusBg = guiCreateStaticImage((screenW - 482) / 2, (screenH - 230) / 2, 482, 270, "Files/Bg.png", false)

BusLabel1 = guiCreateLabel(126, 0, 222, 49, "Job : Bus Driver", false, BusBg)
font = guiCreateFont("Files/Font.ttf", 17)
guiSetFont(BusLabel1, font)
guiLabelSetHorizontalAlign(BusLabel1, "center", true)
guiLabelSetVerticalAlign(BusLabel1, "center")
BusLabel2 = guiCreateLabel(11, 40, 461, 180, "Ba Ozviat Dar Sherkat AutoBus Rani FearZone \n Mitavanid Tajrobe Kar Dar Ranandegi AutoBus Ra Dashte Bashid! \n Dar In Job Shoma Ba Tavajoh Be Skill Khod Dar In Job Hoghoogh Daryaft Mikonid! \n\n Skill 1 ( 0 - 50 ) : 1000$ - 1500$ \n Skill 2 ( 50 - 100 ) : 1500$ - 2300$ \n Skill 3 ( 100 - 200 ) : 2300$ - 3000$ \n Skill 4 ( 200 - 300 ) : 3000$ - 4500$ \n Skill 5 ( 300 - MAX ) : 5000$ - 6000$", false, BusBg)
guiLabelSetHorizontalAlign(BusLabel2, "center", true)
Reject = guiCreateStaticImage(250, 200, 123, 47, "Files/Reject.png", false, BusBg)
Accept = guiCreateStaticImage(110, 200, 123, 47, "Files/Accept.png", false , BusBg )
guiSetProperty(BusBg, "Visible", "false")


function ShowBusPanel(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(BusBg, "Visible", "True")
		showCursor(true)
	end
end
addEvent("ShowBusPanel",true)
addEventHandler("ShowBusPanel", root, ShowBusPanel)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == Reject then
		guiSetProperty(BusBg, "Visible", "False")
		showCursor(false)
	elseif source == Accept then
		triggerServerEvent("GiveBusJob", getLocalPlayer(), getLocalPlayer() )
		guiSetProperty(BusBg, "Visible", "False")
		showCursor(false)
	end
end)