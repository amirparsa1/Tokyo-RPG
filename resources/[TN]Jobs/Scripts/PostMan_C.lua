
local screenW, screenH = guiGetScreenSize()
PostBg = guiCreateStaticImage((screenW - 482) / 2, (screenH - 230) / 2, 482, 270, "Files/Bg.png", false)

PostLabel1 = guiCreateLabel(126, 0, 222, 49, "Job : Post Man", false, PostBg)
font = guiCreateFont("Files/Font.ttf", 17)
guiSetFont(PostLabel1, font)
guiLabelSetHorizontalAlign(PostLabel1, "center", true)
guiLabelSetVerticalAlign(PostLabel1, "center")
PostLabel2 = guiCreateLabel(11, 40, 461, 180, "Ba Ozviat Dar Post Man FearZone \n Mitavanid Tajrobe Be Onvane Peyke Name Ra Dashte Bashid! \n Dar In Job Shoma Ba Tavajoh Be Skill Khod Dar In Job Hoghoogh Daryaft Mikonid! \n\n Skill 1 ( 0 - 50 ) : 400$ - 500$ \n Skill 2 ( 50 - 100 ) : 500$ - 600$ \n Skill 3 ( 100 - 200 ) : 600$ - 700$ \n Skill 4 ( 200 - 300 ) : 750$ - 900$ \n Skill 5 ( 300 - MAX ) : 900$ - 1200$", false, PostBg)
guiLabelSetHorizontalAlign(PostLabel2, "center", true)
PostReject = guiCreateStaticImage(250, 200, 123, 47, "Files/Reject.png", false, PostBg)
PostAccept = guiCreateStaticImage(110, 200, 123, 47, "Files/Accept.png", false , PostBg )
guiSetProperty(PostBg, "Visible", "false")


function ShowPostPanel(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(PostBg, "Visible", "True")
		showCursor(true)
	end
end
addEvent("ShowPostPanel",true)
addEventHandler("ShowPostPanel", root, ShowPostPanel)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == PostReject then
		guiSetProperty(PostBg, "Visible", "False")
		showCursor(false)
	elseif source == PostAccept then
		triggerServerEvent("GivePostManJob", getLocalPlayer(), getLocalPlayer() )
		guiSetProperty(PostBg, "Visible", "False")
		showCursor(false)
	end
end)