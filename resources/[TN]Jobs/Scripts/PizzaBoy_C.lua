
local screenW, screenH = guiGetScreenSize()
PizzaBg = guiCreateStaticImage((screenW - 482) / 2, (screenH - 230) / 2, 482, 270, "Files/Bg.png", false)

PizzaLabel1 = guiCreateLabel(126, 0, 222, 49, "Job : Pizza Boy", false, PizzaBg)
font = guiCreateFont("Files/Font.ttf", 17)
guiSetFont(PizzaLabel1, font)
guiLabelSetHorizontalAlign(PizzaLabel1, "center", true)
guiLabelSetVerticalAlign(PizzaLabel1, "center")
PizzaLabel2 = guiCreateLabel(11, 40, 461, 180, "Ba Ozviat Dar Pizza Boy TheNight \n Mitavanid Tajrobe Beonvane Peyke Pizza Ra Dashte Bashid! \n Dar In Job Shoma Ba Tavajoh Be Skill Khod Dar In Job Hoghoogh Daryaft Mikonid! \n\n Skill 1 ( 0 - 50 ) : 800$ - 1000$ \n Skill 2 ( 50 - 100 ) : 1000$ - 1300$ \n Skill 3 ( 100 - 200 ) : 1300$ - 1600$ \n Skill 4 ( 200 - 300 ) : 1600$ - 2000$ \n Skill 5 ( 300 - MAX ) : 2000$ - 3000$", false, PizzaBg)
guiLabelSetHorizontalAlign(PizzaLabel2, "center", true)
PizzaReject = guiCreateStaticImage(250, 200, 123, 47, "Files/Reject.png", false, PizzaBg)
PizzaAccept = guiCreateStaticImage(110, 200, 123, 47, "Files/Accept.png", false , PizzaBg )
guiSetProperty(PizzaBg, "Visible", "false")


function ShowPizzaPanel(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(PizzaBg, "Visible", "True")
		showCursor(true)
	end
end
addEvent("ShowPizzaPanel",true)
addEventHandler("ShowPizzaPanel", root, ShowPizzaPanel)

addEvent("PizzaStartSound",true)
addEventHandler("PizzaStartSound", resourceRoot, 
function ()
	  local Sound = playSound3D("Files/Pizza1.wav", 415.13888549805 ,98.257637023926 ,12.359034538269, false)
      setSoundMaxDistance(Sound, 30)
end)

addEvent("PizzaSound",true)
addEventHandler("PizzaSound", resourceRoot, 
function ( Voice )
	if Voice == 1 then
		local Sound = playSound3D("Files/Pizza2.wav", 415.13888549805 ,98.257637023926 ,12.359034538269, false)
        setSoundMaxDistance(Sound, 50)
	elseif Voice == 2 then
		local Sound = playSound3D("Files/Pizza3.wav", 415.13888549805 ,98.257637023926 ,12.359034538269, false)
        setSoundMaxDistance(Sound, 50)
	elseif Voice == 3 then
		local Sound = playSound3D("Files/Pizza4.wav", 415.13888549805 ,98.257637023926 ,12.359034538269, false)
        setSoundMaxDistance(Sound, 50)
	elseif Voice == 4 then
		local Sound = playSound3D("Files/Pizza5.wav", 415.13888549805 ,98.257637023926 ,12.359034538269, false)
        setSoundMaxDistance(Sound, 50)
	elseif Voice == 5 then
		local Sound = playSound3D("Files/Pizza6.wav", 415.13888549805 ,98.257637023926 ,12.359034538269, false)
        setSoundMaxDistance(Sound, 50)
	elseif Voice == 6 then
		local Sound = playSound3D("Files/Pizza7.wav", 415.13888549805 ,98.257637023926 ,12.359034538269, false)
        setSoundMaxDistance(Sound, 50)
	elseif Voice == 7 then
		local Sound = playSound3D("Files/Pizza8.wav", 415.13888549805 ,98.257637023926 ,12.359034538269, false)
        setSoundMaxDistance(Sound, 50)
	end
end)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == PizzaReject then
		guiSetProperty(PizzaBg, "Visible", "False")
		showCursor(false)
	elseif source == PizzaAccept then
		triggerServerEvent("GivePizzaJob", getLocalPlayer(), getLocalPlayer() )
		guiSetProperty(PizzaBg, "Visible", "False")
		showCursor(false)
	end
end)