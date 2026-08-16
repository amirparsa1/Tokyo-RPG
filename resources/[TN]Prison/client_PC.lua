sWWidth,sHHeight = guiGetScreenSize() 
WWidth,HHeight = 603,452
XX = (sWWidth/2) - (WWidth/2)
YY = (sHHeight/2) - (HHeight/2)
	
BackGround = guiCreateStaticImage( XX,YY,WWidth, HHeight, "Images/pc.png", false)  

windows10 = guiCreateStaticImage( 12,13,578,357, "Images/windows10.png", false, BackGround)
HackIcon = guiCreateStaticImage( 10,60,35,35, "Images/HackIcon.png", false, windows10)
PannelAzadi = guiCreateStaticImage( 130,80,300,200, "Images/PannelAzadi.png", false, windows10)
DokmeOpenJail = guiCreateButton(130, 150, 40, 32, "Open Gates", false, PannelAzadi)
guiSetProperty(DokmeOpenJail, "NormalTextColour", "FF00FF00")

guiSetProperty(BackGround, "Visible", "False")
guiSetProperty(PannelAzadi, "Visible", "False")
guiSetProperty(windows10, "Visible", "False")
guiSetProperty(HackIcon, "Visible", "False")






function ShowPCPanelF(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(BackGround, "Visible", "True")
		guiSetProperty(windows10, "Visible", "True")
		guiSetProperty(HackIcon, "Visible", "True")
		showCursor(false)
		
	end
end
addEvent("ShowPCPanel:8549",true)
addEventHandler("ShowPCPanel:8549", root, ShowPCPanelF)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
if source == HackIcon then
		
		guiSetProperty(PannelAzadi, "Visible", "true")
		showCursor(true)
		
	end
end)
addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == DokmeOpenJail then 
		triggerServerEvent("OpenAllGateJail", root,localPlayer)
		guiSetProperty(PannelAzadi, "Visible", "False")
		guiSetProperty(BackGround, "Visible", "False")
		showCursor(false)
		
	end


end)

MarkerPc = createMarker(96.705078125, 185.9794921875, 998.85357666016 -1, "cylinder", 1.3,111,175,230,0)
addEventHandler( "onClientResourceStart", getRootElement( ),
    function()
		if not isElementWithinMarker(getLocalPlayer(),MarkerPc) then		
		guiSetProperty(BackGround, "Visible", "False")
		guiSetProperty(windows10, "Visible", "False")
		guiSetProperty(HackIcon, "Visible", "False")
		end
    end
)



function closePc(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(BackGround, "Visible", "false")
		guiSetProperty(windows10, "Visible", "false")
		guiSetProperty(HackIcon, "Visible", "false")
		showCursor(false)
		
	end
end
addEvent("closePCPanel:8549",true)
addEventHandler("closePCPanel:8549", root, closePc)


