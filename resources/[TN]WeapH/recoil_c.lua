local x,y = guiGetScreenSize()
local xx,yy = x/1600, y/900
local main = guiCreateWindow((x/2) - (xx*340), yy*250, xx*750, yy*400, "Recoil System", false)
local scroll = guiCreateScrollPane( xx*26, yy*50, xx*700, yy*300, false, main)
local png = {}
local theX = 0
local theY = 0
local position = 1
local radio = {}

	for i=1, 31 do
	png[i] = {}
	png[i][1] = guiCreateStaticImage(xx*theX, yy*theY, xx*64, yy*64, "img/"..i..".png", false, scroll)
	radio[i] = guiCreateRadioButton ( xx*theX+(xx*22), yy*theY + (yy*100), xx*20, yy*20, "", false, scroll )
	position = position + 1
	theX = theX + 100
		if position > 7 then
		position = 1
		theY = theY + 200
		theX = 0
		end
	end
	
local confirm = guiCreateButton(xx*530, yy*350, xx*200, yy*50, "Confirm", false, main)
guiSetProperty(confirm, "HoverTextColour", "FF00FF00" )
local cancel = guiCreateButton(xx*20, yy*350, xx*200, yy*50, "Cancel", false, main)
guiSetProperty(cancel, "HoverTextColour", "FFFE0000" )
guiSetVisible(main, false)
addEventHandler("onClientGUIClick", confirm, function(localPlayer)
local shod = nil
	for n=1, 31 do
		if guiRadioButtonGetSelected( radio[n] ) then
		shod = n
		break
		end
	end
	if shod then
	outputChatBox("#00ff00☑️ #ffffffShekle Aim Shoma Be #00ff00"..shod.." #ffffffTaghir Yaft." ,255,255,255,true)
	showCursor(false)
	guiSetVisible(main, false)
	crossid = shod
	Crosshair_table = dxCreateShader("texture.fx")
	engineApplyShaderToWorldTexture(Crosshair_table, "siteM16")
	local fShod = tostring(shod)
	triggerServerEvent("SaveMyRecoil",getLocalPlayer(),getLocalPlayer(),fShod)
	dxSetShaderValue(Crosshair_table, "gTexture", dxCreateTexture('img/'..shod..'.png'))
	else outputChatBox("#ff0000✖️ #ffffffEbteda Yek Aim Entekhab Konid!" ,255,255,255,true)
	end
end , false )
addEventHandler("onClientGUIClick", cancel, function()
showCursor(false)
guiSetVisible(main, false)
end , false )

addCommandHandler("recoil", function()
guiSetVisible(main, true)
showCursor(true)
end )

addEvent("LoadMyRecoilNow",true)
addEventHandler("LoadMyRecoilNow",getLocalPlayer(),function(player,myRecoil)
	Crosshair_table = dxCreateShader("texture.fx")
	engineApplyShaderToWorldTexture(Crosshair_table, "siteM16")
	dxSetShaderValue(Crosshair_table, "gTexture", dxCreateTexture('img/'..myRecoil..'.png'))
end)