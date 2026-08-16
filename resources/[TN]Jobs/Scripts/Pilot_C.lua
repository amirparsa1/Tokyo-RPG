local screenW, screenH = guiGetScreenSize()
PilotBg = guiCreateStaticImage((screenW - 482) / 2, (screenH - 230) / 2, 482, 270, "Files/Bg.png", false)

PilotLabel1 = guiCreateLabel(126, 0, 222, 49, "Job : Bus Driver", false, BusBg)
font = guiCreateFont("Files/Font.ttf", 17)
guiSetFont(PilotLabel1, font)
guiLabelSetHorizontalAlign(PilotLabel1, "center", true)
guiLabelSetVerticalAlign(PilotLabel1, "center")
PilotLabel2 = guiCreateLabel(11, 40, 461, 180, "Ba Ozviat Dar Sherkat Parvaz FearZone \n Mitavanid Tajrobe Kar Dar Khalabani Ra Dashte Bashid! \n Dar In Job Shoma Ba Tavajoh Be Skill Khod Dar In Job Hoghoogh Daryaft Mikonid! \n\n Skill 1 ( 0 - 50 ) : 1000$ - 1500$ \n Skill 2 ( 50 - 100 ) : 1500$ - 2300$ \n Skill 3 ( 100 - 200 ) : 2300$ - 3000$ \n Skill 4 ( 200 - 300 ) : 3000$ - 4000$ \n Skill 5 ( 300 - MAX ) : 5000$ - 6000$", false, PilotBg)
guiLabelSetHorizontalAlign(PilotLabel2, "center", true)
PilotReject = guiCreateStaticImage(250, 200, 123, 47, "Files/Reject.png", false, PilotBg)
PilotAccept = guiCreateStaticImage(110, 200, 123, 47, "Files/Accept.png", false , PilotBg )
guiSetProperty(PilotBg, "Visible", "false")


function ShowPilotPanel(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(PilotBg, "Visible", "True")
		showCursor(true)
	end
end
addEvent("ShowPilotPanel",true)
addEventHandler("ShowPilotPanel", root, ShowPilotPanel)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == Reject then
		guiSetProperty(PilotBg, "Visible", "False")
		showCursor(false)
	elseif source == Accept then
		triggerServerEvent("GivePilotJob", getLocalPlayer(), getLocalPlayer() )
		guiSetProperty(PilotBg, "Visible", "False")
		showCursor(false)
	end
end)