home = {}
home.temp = {}
homeControl = {}
local sX, sY = guiGetScreenSize()
local px, py = (sX/1600), (sY/900)
local x,y = (sX/px), (sY/py)
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


local window_buyHome = guiCreateWindow(0.35,0.2, 0.3,0.23, 'Покупка гаража',true)
guiWindowSetSizable(window_buyHome,false)
guiSetVisible(window_buyHome,false)

local label_homePrice = guiCreateLabel(0,0.12,1,0.1,'Цена: 2000$',true,window_buyHome)
guiLabelSetHorizontalAlign(label_homePrice,'center')

local label_homeCapacity = guiCreateLabel(0,0.22,1,0.1,'Вместимость гаража: 3',true,window_buyHome)
guiLabelSetHorizontalAlign(label_homeCapacity,'center')

local label_home_i1 = guiCreateLabel(0,0.32,1,0.1,'Хотите приобрести этот гараж?',true,window_buyHome)
guiLabelSetHorizontalAlign(label_home_i1,'center')

local button_buyHome = guiCreateButton(0, 0.48, 1, 0.2, 'Kharid', true,window_buyHome)
addEventHandler('onClientGUIClick',button_buyHome,function()
	if source ~= button_buyHome then return end
	local money = getPlayerMoney()
	local data = home.temp.data
	local marker = home.temp.marker
	if money < data.price then
		outputChatBox('#D00000[Покупка]: #FFFFFFНе хватает денег для покупки гаража', 255, 0, 0, true)
	else
		triggerServerEvent('home:buyHome',getLocalPlayer(),data,marker)
	end

	guiSetVisible(window_buyHome,false)
	showCursor(false)
	home.temp = {}
end)



local button_cancelHomeBuying = guiCreateButton(0, 0.7, 1, 0.2, 'Отмена', true,window_buyHome)
addEventHandler('onClientGUIClick',button_cancelHomeBuying,function()
	if source ~= button_cancelHomeBuying then return end
	guiSetVisible(window_buyHome,false)
	showCursor(false)
	home.temp = {}
end)
function startHomeBuying()
	housevisable = true
	local ply = getLocalPlayer()
	local marker = source
	local data = getElementData(marker,'data')
	idgarage = data.id
	ownergarage = data.owner
	home.temp.data = data
	home.temp.marker = marker
	garageprice = data.price
	datakharid = home.temp.data
	markerkharid = home.temp.marker
	--guiSetVisible(window_buyHome,true)
	--outputChatBox("IS.."..idhouses)
	addEventHandler("onClientRender",root,drawHouSys)

end
addEvent('home:startHomeBuying',true)
addEventHandler('home:startHomeBuying',getRootElement(),startHomeBuying)

local items = dxCreateFont("Data/Rage.ttf", (px+py)*6) 
local poter = dxCreateFont("Data/Rage.ttf", (px+py)*10)

function drawHouSys()

	if housevisable == true then
		showCursor(true)	
		dxDrawImage(px*603, py*200, px*416, py*446, "Data/BG.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(px*765, py*230, px*90, py*90, "Data/icon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawText("Parking Information", px*715, py*625, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, poter, "left", "center",false,false,false, false)
		dxDrawText("Pelak: TN-"..idgarage, px*775, py*685, px*50, py*50, tocolor(255, 192, 192, 192), fontScale, items, "left", "center",false,false,false, false) 
		dxDrawText("(( In Parking Baraye Kharid Mibashad ))", px*688, py*740, px*50, py*50, tocolor(255, 255, 153, 255), fontScale, items, "left", "center",false,false,false, false)
		dxDrawText("Vorood Be Parking", px*757, py*1000, px*130, py*54, tocolor(255, 255, 255, 100), fontScale, items, "left", "center",false,false,true, false)
		dxDrawImage(px*674, py*500, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(192,192,192, 255), false)
			
			if isMouseInPosition(px*674, py*430, px*280, py*54) then
				dxDrawImage(px*674, py*430, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(150,150,150, 255), false)
				
				dxDrawText("Kharide In Parking ("..garageprice.." Gold)", px*715, py*860, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
				if getKeyState("mouse1")  then
					if not press then
						press = true
						triggerServerEvent('home:buyHome',getLocalPlayer(),datakharid,markerkharid)
						home.temp = {} 
						removeEventHandler("onClientRender",root,drawHouSys)
						showCursor(false)
						housevisable = true
					end
				else
					press = false
				
				end
			else
				 
				dxDrawText("Kharide In Parking ("..garageprice.." Gold)", px*715, py*860, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
				dxDrawImage(px*674, py*430, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(180,180,180, 255), false)
			end

			
		



			if isMouseInPosition(px*674, py*570, px*280, py*54) then
				dxDrawImage(px*674, py*570, px*280, py*54, "Data/btn.png", 0, 0, 0, tocolor(150,150,150, 255), false)
				dxDrawText("Bastan",px*800, py*1140, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
				if getKeyState("mouse1")  then
					if not press then

						removeEventHandler("onClientRender",root,drawHouSys) 
						housevisable=false
						showCursor(false)
					end

				else
					press = false
				
				end
			else
				dxDrawText("Bastan", px*800, py*1140, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
				dxDrawImage(px*674, py*570, px*280, py*54, "Data/btn.png", 0, 0, 0, tocolor(180,180,180, 255), false)
			end
	end
	

end

function openHomeControl(data)
	player=getLocalPlayer()
	idgarage = data.id
	ownergarage = data.owner
	garageprice = data.price
	housmodevisable = true
	addEventHandler("onClientRender",root,drawHoumodSys)
end
addEvent('home:openHomeControl',true)
addEventHandler('home:openHomeControl',getRootElement(),openHomeControl)

function drawHoumodSys()

	if housmodevisable == true then
		showCursor(true)	
		dxDrawImage(px*603, py*200, px*416, py*446, "Data/BG.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(px*765, py*230, px*90, py*90, "Data/icon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawText("Parking Information", px*715, py*625, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, poter, "left", "center",false,false,false, false)
		dxDrawText("Pelak: TN-"..idgarage, px*775, py*685, px*50, py*50, tocolor(255, 192, 192, 192), fontScale, items, "left", "center",false,false,false, false) 
		dxDrawText("Malek Parking:"..ownergarage, px*735, py*740, px*50, py*50, tocolor(255, 255, 153, 255), fontScale, items, "left", "center",false,false,false, false)
		dxDrawText("Kharide In Parking ( "..garageprice.." )", px*715, py*860, px*130, py*54, tocolor(255, 255, 255, 100), fontScale, items, "left", "center",false,false,true, false)
		dxDrawImage(px*674, py*430, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(180,180,180, 255), false)
		if isMouseInPosition(px*674, py*500, px*280, py*54) then
			dxDrawImage(px*674, py*500, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(150,150,150, 255), false)
			dxDrawText("Vorood Be Parking",px*757, py*1000, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
			if getKeyState("mouse1")  then
				if not press then
					press = true
					
					triggerServerEvent('home:warpToHome',getLocalPlayer(),homeControl.marker,ownergarage,getLocalPlayer())
					removeEventHandler("onClientRender",root,drawHouSys) 
					housevisable = false
					nowPrice = nil
					showCursor(false)
				end
			else
				press = false
			
			end
		else
			dxDrawText("Vorood Be Parking", px*757, py*1000, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
			dxDrawImage(px*674, py*500, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(180,180,180, 255), false)
		end
		if isMouseInPosition(px*674, py*570, px*280, py*54) then
			dxDrawImage(px*674, py*570, px*280, py*54, "Data/btn.png", 0, 0, 0, tocolor(150,150,150, 255), false)
			dxDrawText("Bastan",px*800, py*1140, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
			if getKeyState("mouse1")  then
				if not press then

					removeEventHandler("onClientRender",root,drawHoumodSys) 
					housevisable=false
					showCursor(false)
				end

			else
				press = false
			
			end
		else
			dxDrawText("Bastan", px*800, py*1140, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
			dxDrawImage(px*674, py*570, px*280, py*54, "Data/btn.png", 0, 0, 0, tocolor(180,180,180, 255), false)
		end
	end
	

end