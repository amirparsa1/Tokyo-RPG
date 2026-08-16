local sX, sY = guiGetScreenSize()
local px, py = (sX/1920), (sY/1080)
local x,y = (sX/px), (sY/py)

local font1 = dxCreateFont("files/fonts/font.ttf", 40)
local font2 = dxCreateFont("files/fonts/font.ttf", 15)
local font3 = dxCreateFont("files/fonts/font2.otf", 25)

addEvent("ejectPlayerFromVeh",true)
addEventHandler("ejectPlayerFromVeh",getRootElement(),function(player)
	setPedControlState(player,"enter_exit",true)
end)
setCameraTarget(localPlayer)

function findFontToHeight(font, sizeY)
	local fontScale = 0
	local fontSize
	repeat
		fontScale = fontScale+1
		fontSize = dxGetFontHeight(fontScale, "default-bold")
	until fontSize >= sizeY
	return fontScale
end
fontScale = findFontToHeight(font, sY*0.01)


function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing ( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
		return true
	else
		return false
	end
end


function dxDrawBorderedText( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
    dxDrawText ( text, x - 1, y - 1, w - 1, h - 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x + 1, y - 1, w + 1, h - 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x - 1, y + 1, w - 1, h + 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x + 1, y + 1, w + 1, h + 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x - 1, y, w - 1, h, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x + 1, y, w + 1, h, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x, y - 1, w, h - 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x, y + 1, w, h + 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
end
---------------------------------------------------------------------------------------------------------------------------------------



for k,v in pairs(vehShopsTable) do
	createPickup ( v[1], v[2], v[3]+1 , 3, 1239, 0)
	local marker = createMarker(v[1],v[2],v[3]-5,"cylinder",0.7,255, 255, 255, 255)
	setElementData(marker,"shop",k,false)
	local blip = createBlipAttachedTo( marker, v[10] )
	--local blip = createBlip(v[1],v[2],v[3],55)
	setElementData(blip, 'blipName', v[9])
	setBlipVisibleDistance( blip, 200 )
end

local shopWindow = false
local currentShop = "Wang Cars"
local currentMarker = nil
local veh = nil
local selection = 1
local currentColorR = 255
local currentColorG = 255
local currentColorB = 255
local currentWheels = 1
local press = false



function drawVehicleShop() 
	showChat(false)
	dxDrawImage(px*0, py*0, px*1850, py*1080, "files/fon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawText("Model: ", px*50, py*650, px*807, py*102, tocolor(150, 150, 150, 255), fontScale, font2, "left", "center", false, false, false, false, false)
	dxDrawText(vehShopVehicles[currentShop][selection][2], px*100, py*650, px*807, py*102, tocolor(254, 254, 254, 255), fontScale, font2, "center", "center", false, false, false, false, false)
    dxDrawText("Color: ", px*50, py*850, px*807, py*102, tocolor(150, 150, 150, 255), fontScale, font2, "left", "center", false, false, false, false, false)
    dxDrawImage(px*210, py*457, px*35, py*35, "files/colors/white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(px*260, py*457, px*35, py*35, "files/colors/silver.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(px*310, py*457, px*35, py*35, "files/colors/black.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(px*360, py*457, px*35, py*35, "files/colors/red.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(px*410, py*457, px*35, py*35, "files/colors/orange.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(px*460, py*457, px*35, py*35, "files/colors/green.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(px*510, py*457, px*35, py*35, "files/colors/blue.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Max Speed: ", px*50, py*520, px*300, py*650, tocolor(150, 150, 150, 255), fontScale, font2, "left", "center", false, false, false, false, false)
    dxDrawText("OverClock Az 0 Ta 100: ", px*50, py*605, px*300, py*650, tocolor(150, 150, 150, 255), fontScale, font2, "left", "center", false, false, false, false, false)
	dxDrawText("Shetab: ", px*50, py*690, px*300, py*650, tocolor(150, 150, 150, 255), fontScale, font2, "left", "center", false, false, false, false, false)
	dxDrawText("Vazn: ", px*50, py*780, px*300, py*650, tocolor(150, 150, 150, 255), fontScale, font2, "left", "center", false, false, false, false, false)
    dxDrawText(""..convertNumber(vehShopVehicles[currentShop][selection][4]).." KM.\n"..convertNumber(vehShopVehicles[currentShop][selection][5]).." sec.\n"..convertNumber(vehShopVehicles[currentShop][selection][6]).."\n"..convertNumber(vehShopVehicles[currentShop][selection][11]).." Kg.", px*345, py*650, px*345, py*650, tocolor(254, 254, 254, 255), fontScale, font3, "left", "center", false, false, false, false, false)
	dxDrawText("Vazn: ", px*50, py*780, px*300, py*650, tocolor(150, 150, 150, 255), fontScale, font2, "left", "center", false, false, false, false, false)
	dxDrawText("Kharid: ", px*50, py*950, px*300, py*650, tocolor(150, 150, 150, 255), fontScale*1, font2, "left", "center", false, false, false, false, false)
	dxDrawText("NAMAYESHGAH ", px*150, py*350, px*353, py*54, tocolor(255, 255, 255, 255), fontScale, font1, "left", "center", false, false, false, false, false)

		
		
	---------------------------------------------Color------------------------------------------------------------	
	 if isMouseInPosition(px*310, py*457, px*35, py*35) then --- black
		if getKeyState("mouse1") then
			setVehicleColor( veh, 0, 0, 0, 0, 0, 0 )
			currentColorR = 0
			currentColorG = 0
			currentColorB = 0
		end
	end
	
	if isMouseInPosition(px*260, py*457, px*35, py*35) then -- silver
		if getKeyState("mouse1") then
			setVehicleColor( veh, 109, 109, 109, 109, 109, 109 )
			currentColorR = 109
			currentColorG = 109
			currentColorB = 109
		end
	end
	
	if isMouseInPosition(px*210, py*457, px*35, py*35) then -- white
		if getKeyState("mouse1") then
			setVehicleColor( veh, 255, 255, 255, 255, 255, 255 )
			currentColorR = 255
			currentColorG = 255
			currentColorB = 255 
		end
	end
	
	if isMouseInPosition(px*360, py*457, px*35, py*35) then -- red
		if getKeyState("mouse1") then
			setVehicleColor( veh, 255, 0, 0, 255, 0, 0 )
			currentColorR = 255
			currentColorG = 0
			currentColorB = 0 
		end
	end
	
	if isMouseInPosition(px*410, py*457, px*35, py*35) then -- orange
		if getKeyState("mouse1") then
			setVehicleColor( veh, 255, 132, 0, 255, 132, 0 )
			currentColorR = 255
			currentColorG = 132
			currentColorB = 0 
		end
	end
	
	if isMouseInPosition(px*460, py*457, px*35, py*35) then -- green
		if getKeyState("mouse1") then
			setVehicleColor( veh, 0, 199, 5, 0, 199, 5 )
			currentColorR = 0
			currentColorG = 199
			currentColorB = 5 
		end
	end
	
	if isMouseInPosition(px*510, py*457, px*35, py*35) then -- blue
		if getKeyState("mouse1") then
			setVehicleColor( veh, 18, 0, 157, 18, 0, 157 )
			currentColorR = 18
			currentColorG = 0
			currentColorB = 157 
		end
	end
	

	if isMouseInPosition(px*300, py*362, px*30, py*30) then
		dxDrawImage(px*300, py*362, px*30, py*30, "files/arrow.png", 180, 0, 0, tocolor(150,150,150, 255), false)
		if getKeyState("mouse1") then
			if not press then
				press = true
				if selection > 1 then
					selection = selection - 1
					setElementModel(veh,vehShopVehicles[currentShop][selection][1])
					setVehicleColor( veh, 91, 91, 91, 255, 255, 255, 255, 255, 255, 255, 255, 255 )
					triggerEvent("onGlobalSoundNext", localPlayer, localPlayer)
				end
			end
		else
			press = false
		end
	else

		dxDrawImage(px*300, py*362, px*30, py*30, "files/arrow.png", 180, 0, 0, tocolor(255, 255, 255, 255, 255), false)
	end

	if isMouseInPosition(px*575, py*362, px*30, py*30) then

		dxDrawImage(px*575, py*362, px*30, py*30, "files/arrow.png", 0, 0, 0, tocolor(150,150,150, 255), false)
		if getKeyState("mouse1") then
			if not press then
				press = true
				if selection < #vehShopVehicles[currentShop] then
					selection = selection + 1
					setElementModel(veh,vehShopVehicles[currentShop][selection][1])
					setVehicleColor( veh, 91, 91, 91, 255, 255, 255, 255, 255, 255, 255, 255, 255 )
					triggerEvent("onGlobalSoundNext", localPlayer, localPlayer)
				end
			end
		else
			press = false
		end
	else

		dxDrawImage(px*575, py*362, px*30, py*30, "files/arrow.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	end
	
	
	
	
	
	
	
	
	
	if isMouseInPosition(px*340, py*920, px*300, py*100) then
		
		dxDrawImage(px*340, py*920, px*300, py*100, "files/buygold.png", 0, 0, 0, tocolor(150,150,150, 255), false)
		if getKeyState("mouse1") then
			if not press then
				press = true
				initVehicleShopWindow()
				triggerServerEvent( "buydscarG", localPlayer, localPlayer,vehShopVehicles[currentShop][selection][3], vehShopVehicles[currentShop][selection][8], vehShopVehicles[currentShop][selection][9], vehShopVehicles[currentShop][selection][10], vehShopVehicles[currentShop][selection][11], vehShopVehicles[currentShop][selection][23], vehShopVehicles[currentShop][selection][24],  vehShopVehicles[currentShop][selection][25],  vehShopVehicles[currentShop][selection][26], vehShopVehicles[currentShop][selection][27], vehShopVehicles[currentShop][selection][31], currentColorR, currentColorG, currentColorB,vehShopVehicles[currentShop][selection][13],vehShopVehicles[currentShop][selection][14],vehShopVehicles[currentShop][selection][15],vehShopVehicles[currentShop][selection][16], vehShopVehicles[currentShop][selection][17] ,vehShopVehicles[currentShop][selection][18],vehShopVehicles[currentShop][selection][19],vehShopVehicles[currentShop][selection][20],vehShopVehicles[currentShop][selection][21],vehShopVehicles[currentShop][selection][12] )
			end
		else
			press = false
			
		end
	else

		dxDrawImage(px*340, py*920, px*300, py*100, "files/buygold.png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), false)
	end
	
	
	

	
	
	
	
	if isMouseInPosition(px*2, py*20, px*200, py*50) then
		dxDrawImage(px*2, py*20, px*210, py*70, "files/exit.png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), false)
		if getKeyState("mouse1") then
			if not press then
			press = true
			initVehicleShopWindow()
			triggerEvent("onGlobalSoundExit", localPlayer, localPlayer)
		else
			press = false
			end
		end
	else
		dxDrawImage(px*2, py*20, px*210, py*70, "files/exit.png", 0, 0, 0, tocolor(150,150,150, 255), false)
		
	end


	if vehShopVehicles[currentShop][selection][3] ~= false then
		if isMouseInPosition(px*20, py*920, px*300, py*100) then
			dxDrawImage(px*20, py*920, px*300, py*100, "files/buy.png", 0, 0, 0, tocolor(150,150,150, 255), false)
			if getKeyState("mouse1") then
				if not press then
					press = true
					
	
					initVehicleShopWindow()
	
					triggerServerEvent( "buydscar", localPlayer, localPlayer,vehShopVehicles[currentShop][selection][3], vehShopVehicles[currentShop][selection][8], vehShopVehicles[currentShop][selection][9], vehShopVehicles[currentShop][selection][10], vehShopVehicles[currentShop][selection][11], vehShopVehicles[currentShop][selection][23], vehShopVehicles[currentShop][selection][24],  vehShopVehicles[currentShop][selection][25],  vehShopVehicles[currentShop][selection][26], vehShopVehicles[currentShop][selection][27], vehShopVehicles[currentShop][selection][31], currentColorR, currentColorG, currentColorB,vehShopVehicles[currentShop][selection][13],vehShopVehicles[currentShop][selection][14],vehShopVehicles[currentShop][selection][15],vehShopVehicles[currentShop][selection][16], vehShopVehicles[currentShop][selection][17] ,vehShopVehicles[currentShop][selection][18],vehShopVehicles[currentShop][selection][19],vehShopVehicles[currentShop][selection][20],vehShopVehicles[currentShop][selection][21],vehShopVehicles[currentShop][selection][12] )
				end
			else
				press = false
				
			end
		else
	
			dxDrawImage(px*20, py*920, px*300, py*100, "files/buy.png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), false)
		end
		dxDrawText(""..convertNumber(vehShopVehicles[currentShop][selection][3]).." Mony.", px*60, py*1600, px*275, py*190, tocolor(255, 255, 255, 255), fontScale, font3, "center", "center", false, false, false, false, false)

	end
	dxDrawText(""..convertNumber(vehShopVehicles[currentShop][selection][8]).." Gold.", px*700, py*1600, px*275, py*190, tocolor(255, 255, 0, 255), fontScale, font3, "center", "center", false, false, false, false, false)
	function initDemoTimer()
		if timerShown then
			removeEventHandler( "onClientRender", root, drawDemoTimer)
			if isTimer(demoTimer) then killTimer(demoTimer) end
			demoTimer = nil
		else
			demoTimer = setTimer(function() end, 60000, 1)
			addEventHandler( "onClientRender", root, drawDemoTimer)
		end
		timerShown = not timerShown
	end
	addEvent("initDemoTimer",true)
	addEventHandler("initDemoTimer",root,initDemoTimer)
	function drawDemoTimer()
		if isTimer(demoTimer) then
			local details = getTimerDetails( demoTimer )
			dxDrawRectangle(px*556, py*6, px*255, py*36,tocolor(0,0,0,150))
			--dxDrawText("Окончание Тест Драйва: 0:"..math.floor(details/1000), px*554, py*5, px*811, py*42, tocolor(255, 255, 255, 255), fontScale*1.00, "default-bold", "center", "center", false, false, false, false, false)
		end
	end
end

addEvent("sedayedozdgir", true)
addEventHandler("sedayedozdgir",root,
function ()
	dozdgir_open = playSound("files/sound/dozdgir.mp3",false)
	setSoundVolume(dozdgir_open,1)
end
)


addEvent("sedayeghoflin",true)
addEventHandler("sedayeghoflin",root,
function()

	sedaghofl = playSound("files/sound/ghofl.mp3",false)
	setSoundVolume(sedaghofl,1)

end)




function initVehicleShopWindow()
	if shopWindow then
		--vehShopsTable[currentShop][1][1]

		shopWindow = false
		showCursor(false)
		showChat(true)
		fadeCamera( false, 1 )
		removeEventHandler("onClientRender",root,drawVehicleShop)
		setTimer(function()
				setElementAlpha(currentMarker,255)
				setCameraTarget(localPlayer)
				setElementFrozen(localPlayer,true)
				triggerServerEvent("SetOutOfCarShop",localPlayer, localPlayer, 0, vehShopsTable[currentShop][11],vehShopsTable[currentShop][12],vehShopsTable[currentShop][13] )
				destroyElement(veh)
				destroyElement(pedjayeplayer)
				
				fadeCamera(true,2)


			end,1000,1)
		setTimer(setElementFrozen,2000,1,localPlayer,false)
	else
		shopWindow = true
		currentColor = 1
		currentWheels = 1
		selection = 1
		setElementDimension(localPlayer,1)
		showCursor(true)
		showChat(false)
		fadeCamera( false, 1 )
		setElementFrozen(localPlayer,true)

		setTimer(function() 
			fadeCamera(true,1)
			addEventHandler("onClientRender",root,drawVehicleShop)
			showCursor(true)
			if currentShop ~= "VAZ8" then
				
				setCameraMatrix( -1955, 273 , 36 ,-1953.009765625,265.6650390625,35.097522735596 )
				setElementDimension(localPlayer, 1)
				veh = createVehicle( vehShopVehicles[currentShop][1][1], -1955.709765625,264.6650390625,35.097522735596,0.406494140625,0.0054931640625,325.994995117188 )
				warpPedIntoVehicle( pedjayeplayer, veh)
			else

				setCameraMatrix( 2980 ,-1500 ,2,180 ,0 ,328.4660034179)

				setElementDimension(localPlayer, 1)
				veh = createVehicle( vehShopVehicles[currentShop][1][1], 2965.9326171875 ,-1487.888671875 ,-0.26513919234276 ,5.108642578125 ,359.736328125 ,182.53234863281)
				warpPedIntoVehicle( pedjayeplayer, veh)
			end
			setVehicleColor( veh, 91, 91, 91, 255, 255, 255, 255, 255, 255, 255, 255, 255 )
			currentColorR = 91
			currentColorG = 91
			currentColorB = 91
			
			setElementDimension(veh,1)
			setElementData(veh,"numberType","c")
			setElementData(veh,"number:plate","")
			pedjayeplayer = createPed(tonumber(getElementModel(localPlayer)), 158,165,145 )
			setElementDimension(pedjayeplayer,1)
			setElementPosition(localPlayer,159,159,159)
		end,1000,1)
	end
end


addEventHandler("onClientKey",root,function(key,press)
	if press then
		if not shopWindow then return end
		if key == "mouse_wheel_down" then
			scroll = scroll + 15*px
		elseif key == "mouse_wheel_up" then
			scroll = scroll - 15*px
		end
	end
end)

local managerWindow = nil
local vehmarker = nil
local vehblip = nil
local numberWindow = nil
local barterWindow = nil




addEventHandler("onClientMarkerHit", root, function(player)
if player ~= localPlayer then return end
	local shop = getElementData(source, "shop")
	if shop then
		if getElementType(player) == "player" and player == localPlayer then
			if not getPedOccupiedVehicle( player ) then
				currentShop = shop
				initVehicleShopWindow()
				setElementAlpha(source,0)
				currentMarker = source
			end
		end
	end
	if source == vehmarker then
		destroyElement(vehblip)
		destroyElement(source)
	end
if getElementData(source,"trade") then
		if getElementType(player) == "player" and player == localPlayer then
			if not isPedInVehicle(player) then
				barterMarkerWindow()
			end
		end
	end
end)

bindKey ("2", "down",
function()
	if isPedInVehicle (localPlayer) then
		triggerServerEvent("opencarin", getLocalPlayer(), getLocalPlayer() )
	else
		triggerServerEvent("opencar", getLocalPlayer(), getLocalPlayer() )
	end
end
)