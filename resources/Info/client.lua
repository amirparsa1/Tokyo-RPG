-- #ExoPrim
local screenW, screenH = guiGetScreenSize()
local font = guiCreateFont("Data/date_font.ttf", 12.5)
local fonttimer = dxCreateFont("Data/GOTHIC.ttf", (x+y)*27)
window = guiCreateStaticImage((screenW - 300) / 8, (screenH - 100) / 1.4, 300, 100, "Data/Kadr.png", false)
--guiWindowSetSizable(window, true)
labelesh = guiCreateLabel(78, 34, 300, 100, "", false, window)
guiSetFont(labelesh, font)
guiLabelSetColor(labelesh,0 , 255 , 0 )




local newFont1 = dxCreateFont( "Data/date_font.ttf", 22 )
local font5 = dxCreateFont("Data/GOTHIC.ttf", 24)
local newFont12 = dxCreateFont( "Data/date_font.ttf", 20 ) 
local rootElement = getRootElement()
local screenW,screenH = guiGetScreenSize()
local resW, resH = 1280, 720
local x, y =  (screenW/resW), (screenH/resH)
addEventHandler("onClientResourceStart",resourceRoot,
function ()
	setElementData(getLocalPlayer(), "nowInfo", true)
end)

addEventHandler("onClientRender", getRootElement(),
function ()
		local date = getRealTime()
		local year = date.year + 1900
		local month = date.month + 1
		if month < 10 then
			month = "0"..date.month + 1
		end
		local day = date.monthday 
		if day < 10 then
			day = "0"..date.monthday
		end

		local playerName = getPlayerName(localPlayer)
		local name =  getPlayerName( localPlayer ):gsub('#%x%x%x%x%x%x', '')
		local health = getElementHealth(getLocalPlayer())
		local colete = math.floor (getPedArmor(getLocalPlayer()))
		
		


	local jailTimer = getElementData(getLocalPlayer() ,"pJailTime")


			if getPlayerName(getLocalPlayer()) == "ExoPrim" then
				local jailtime = dxDrawText("#ff0000Jail Time:#ffffff " ,x*20, y*430, x*0, y*10,tocolor(73,208,141,255),0.5,font5,"left","top",false,false,false, true)

			end
		

		
	
		local hastyana = getElementData(getLocalPlayer() ,"inpaintball")
		local paintscore = getElementData(getLocalPlayer() ,"paintscore")
		local killscore = getElementData(getLocalPlayer() ,"paintballkills")
		local tiempaintball = getElementData(getLocalPlayer() ,"pbTime") / 1000
		local timerpant = dxDrawText("#ee991aTime:#ffffff "..tiempaintball ,x*630, y*10, x*0, y*10,tocolor(73,208,141,255),0.5,font5,"left","top",false,false,false, true)
	if getElementData(getLocalPlayer(), "nowInfo") == true then

		if tonumber(tiempaintball) > 0 then
			local timerpant = dxDrawText("#ee991aTime:#ffffff "..tiempaintball ,x*630, y*10, x*0, y*10,tocolor(73,208,141,255),0.5,font5,"left","top",false,false,false, true)
			
			local paintscoreshow = dxDrawText("#ee991aScore:#ffffff "..paintscore ,x*20, y*420, x*0, y*10,tocolor(73,208,141,255),0.5,font5,"left","top",false,false,false, true)
			local paintkillshow = dxDrawText("#ee991akill:#ffffff "..killscore ,x*20, y*440, x*0, y*10,tocolor(73,208,141,255),0.5,font5,"left","top",false,false,false, true)
		else
			if paintscoreshow then
				destroyElement(timerpant)
				destroyElement(paintscoreshow)
				destroyElement(paintkillshow)
			end
		end

	end
end)

function dxDrawBorderedText( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
	dxDrawText ( text, x - 2, y - 2, w - 2, h - 1, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 2, y - 2, w + 2, h - 2, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x - 2, y + 2, w - 2, h + 2, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 2, y + 2, w + 2, h + 2, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clp, wordBreak, false )
	dxDrawText ( text, x - 2, y, w - 2, h, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 2, y, w + 2, h, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y - 2, w, h - 2, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y + 2, w, h + 2, tocolor ( 0, 0, 0, 100 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
end