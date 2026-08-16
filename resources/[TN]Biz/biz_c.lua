notfSys = exports["notf"]

player = getLocalPlayer()

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
streamedDisplays = {}

local Guivar = 0 -- createhouse Menue
local Guivar2 = 0 -- MENUE
local Guivar3 = 0

local Fenster = {}
local Knopf = {}
local Label = {}
local Edit = {}
local Grid = {}
local Bild = {}

local Fenster2 = {}
local Knopf2 = {}
local Label2 = {}
local Edit2 = {}
local Radio2 = {}
local Checkbox2 = {}
local Grid2 = {}

local Fenster3 = {}
local Knopf3 = {}
local Label3 = {}

function convertNumber( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1,%2' )    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end


function removeHex(text, digits)
    assert(type(text) == "string", "Bad argument 1 @ removeHex [String expected, got " .. tostring(text) .. "]")
    assert(digits == nil or (type(digits) == "number" and digits > 0), "Bad argument 2 @ removeHex [Number greater than zero expected, got " .. tostring(digits) .. "]")
    return string.gsub(text, "#" .. (digits and string.rep("%x", digits) or "%x+"), "")
end

local houseInteriors = { -- I don't really use tables
	[1] = "286.148986,-40.644397,1001.515625, 1, Ammunation",
}

addEvent("showCreateBizPage",true)
addEventHandler("showCreateBizPage", player, function()
	if(Guivar == 1) then return end
	Guivar = 1
	guiSetInputMode("no_binds_when_editing")
	
	showCursor(true)
	
	local X, Y, Width, Height = getMiddleGuiPosition(787,269) -- I'm too lazy :D
	Fenster[1] = guiCreateWindow(X, Y, Width, Height, "Business Creation",false)
	Label[1] = guiCreateLabel(495,24,107,17,"Interior preview:",false,Fenster[1])
	guiSetFont(Label[1],"default-bold-small")
	Label[2] = guiCreateLabel(490,27,124,15,"___________________",false,Fenster[1])
	guiLabelSetColor(Label[2],0, 255, 0)
	Edit[1] = guiCreateEdit(159,84,33,27,"",false,Fenster[1]) -- X INT
	Label[3] = guiCreateLabel(161,52,135,30,"X, Y, Z and INT\nof the House(Inside):",false,Fenster[1])
	guiSetFont(Label[3],"default-bold-small")
	Edit[2] = guiCreateEdit(196,84,33,27,"",false,Fenster[1]) -- Y INT
	Edit[3] = guiCreateEdit(234,84,33,27,"",false,Fenster[1]) -- Z INT
	Knopf[1] = guiCreateButton(156,116,112,32,"Set ----->",false,Fenster[1])
	Edit[4] = guiCreateEdit(17,177,80,27,"",false,Fenster[1]) -- PRICE 
	Label[4] = guiCreateLabel(103,183,19,22,"$",false,Fenster[1])
	guiSetFont(Label[4],"default-bold-small")
	Knopf[2] = guiCreateButton(13,221,112,32,"Cancel",false,Fenster[1])
	Knopf[3] = guiCreateButton(132,221,107,31,"Create House",false,Fenster[1])
	Label[5] = guiCreateLabel(15,22,107,17,"Creation settings:",false,Fenster[1])
	guiSetFont(Label[5],"default-bold-small")
	Label[6] = guiCreateLabel(10,25,124,15,"___________________",false,Fenster[1])
	guiLabelSetColor(Label[6],0,255,0)
	Knopf[4] = guiCreateButton(15,114,112,32,"My Position",false,Fenster[1])
	Label[7] = guiCreateLabel(20,50,135,30,"X, Y, Z Position\nof the House(Outside):",false,Fenster[1])
	guiSetFont(Label[7],"default-bold-small")
	Label[8] = guiCreateLabel(18,157,46,19,"Price:",false,Fenster[1])
	guiSetFont(Label[8],"default-bold-small")
	Edit[5] = guiCreateEdit(18,82,33,27,"",false,Fenster[1]) -- X House
	Edit[6] = guiCreateEdit(55,82,33,27,"",false,Fenster[1]) -- Y ""
	Edit[7] = guiCreateEdit(93,82,33,27,"",false,Fenster[1]) -- Z ""
	Grid[1] = guiCreateGridList(314,23,162,237,false,Fenster[1])
	guiGridListSetSelectionMode(Grid[1],1)

	guiGridListAddColumn(Grid[1],"ID",0.2)

	guiGridListAddColumn(Grid[1],"Description",1)
	
	Edit[8] = guiCreateEdit(272,84,33,27,"",false,Fenster[1]) -- INT INT
	Bild[1] = guiCreateStaticImage(486,51,290,204,"assets/choose.png",false,Fenster[1])
	Label[9] = guiCreateLabel(164,22,107,17,"Interior:",false,Fenster[1])
	guiSetFont(Label[9],"default-bold-small")
	Label[10] = guiCreateLabel(159,25,124,15,"___________________",false,Fenster[1])
	guiLabelSetColor(Label[10],0,255,0)
	
	-- FILL THE LIST --
	for i = 1, #houseInteriors, 1 do
		local row = guiGridListAddRow(Grid[1])
		guiGridListSetItemText(Grid[1], row, 1, i, false, false)
		guiGridListSetItemText(Grid[1], row, 2, gettok(houseInteriors[i], 5, string.byte(",")), false, false)
	end
	-- GRIDLIST EVENT --
	addEventHandler("onClientGUIClick", Grid[1], function()
		local text = guiGridListGetItemText(Grid[1], guiGridListGetSelectedItem(Grid[1]), 1)
		if(text == "") or (text == " ") then
			guiStaticImageLoadImage(Bild[1], "assets/choose.png")
		else
			if(fileExists("assets/"..text..".jpg")) then
				guiStaticImageLoadImage(Bild[1], "assets/"..text..".jpg")
			else
				guiStaticImageLoadImage(Bild[1], "assets/choose.png")
			end
		end
	end, false)
	---------------------------
	-- BUTTON EVENT HANDLERS --
	---------------------------
	
	-- CREATE HOUSE BUTTON --
	addEventHandler("onClientGUIClick", Knopf[3], function()
		local x, y, z, intx, inty, intz, int, price = guiGetText(Edit[5]), guiGetText(Edit[6]), guiGetText(Edit[7]), guiGetText(Edit[1]), guiGetText(Edit[2]), guiGetText(Edit[3]), guiGetText(Edit[8]), guiGetText(Edit[4])
		if(x == "") or (y == "") or (z == "") or (intx == "") or (inty == "") or (intz == "") then outputChatBox("You must insert a value in all text fields!", 255, 0, 0) return end
		price = tonumber(price)
		if(price < 0) or (price > 10000000) then outputChatBox("Bad Price!", 255, 0, 0) return end
		triggerServerEvent("createNewBusiness", player, x, y, z, int, intx, inty, intz, price)
	end, false)
	
	-- INTERIOR BUTTON --
	addEventHandler("onClientGUIClick", Knopf[1], function()
		local id = tonumber(guiGridListGetItemText(Grid[1], guiGridListGetSelectedItem(Grid[1]), 1))
		if(id == nil) then outputChatBox("You must select a house interior!", 255, 0, 0) return end
		local text = houseInteriors[id]
		local x, y, z, int = gettok(text, 1, string.byte(",")), gettok(text, 2, string.byte(",")), gettok(text, 3, string.byte(",")), gettok(text, 4, string.byte(","))
		guiSetText(Edit[1], x)
		guiSetText(Edit[2], y)
		guiSetText(Edit[3], z)
		guiSetText(Edit[8], int)
	end, false)
	
	-- MY POSITION BUTTON --
	addEventHandler("onClientGUIClick", Knopf[4], function()
		local x, y, z = getElementPosition(player)
		guiSetText(Edit[5], x)
		guiSetText(Edit[6], y)
		guiSetText(Edit[7], z)
	end, false)
	
	-- CANCEL BUTTON --
	addEventHandler("onClientGUIClick", Knopf[2], function()
		Guivar = 0
		showCursor(false)
		destroyElement(Fenster[1])
	end, false)
end)

addEvent("streamBusinessDisplay",true)
addEventHandler("streamBusinessDisplay", getRootElement(), function(ID,Table)
	streamedDisplays[ID] = Table
end)
--[[
addEventHandler("onClientRender", getRootElement(), function()
	for index, house in pairs(streamedDisplays) do
		local x, y, z = house["bX"],house["bY"],house["bZ"]
		local x2, y2, z2 = getElementPosition(player)
		if(isLineOfSightClear(x, y, z, x2, y2, z2, true, true, false, true)) then
			z = z+0.5
			local sx, sy = getScreenFromWorldPosition(x, y, z)
			if(sx) and (sy) then
				local distance = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
				if(distance < 15) then
					local fontbig = 2-(distance/10)
					if tonumber(house["bLock"]) == 1 then
						lockstate = "Ghofl"
					else
						lockstate = "Baz"
					end
					
					if house["bOwner"] == 0 then
						dxDrawText(""..house["bName"].." ( ID: "..house["bID"].." )\nOwner: "..house["bOwnerName"].."\nPrice: $"..convertNumber(tonumber(house["bPrice"])).."\nIn Business "..lockstate.." Ast!", sx+1.5, sy+1.5, sx, sy, tocolor(0, 0, 0, 200), fontbig, "default-bold", "center")
						dxDrawText(""..house["bName"].." ( ID: "..house["bID"].." )\nOwner: "..house["bOwnerName"].."\nPrice: $"..convertNumber(tonumber(house["bPrice"])).."\nIn Business "..lockstate.." Ast!", sx, sy, sx, sy, tocolor(105 , 186 , 150,250), fontbig, "default-bold", "center")
					else
						if tonumber(house["bForSell"]) >= 1 then
							dxDrawText(""..house["bName"].." ( ID: "..house["bID"].." )\nOwner: "..house["bOwnerName"].."\nVoroodi: $"..convertNumber(tonumber(house["bEnter"])).."\nGheymat Business: $"..convertNumber(tonumber(house["bForSell"])).."\nIn Business "..lockstate.." Ast!", sx+1.5, sy+1.5, sx, sy, tocolor(0, 0, 0, 200), fontbig, "default-bold", "center")
							dxDrawText(""..house["bName"].." ( ID: "..house["bID"].." )\nOwner: "..house["bOwnerName"].."\nVoroodi: $"..convertNumber(tonumber(house["bEnter"])).."\nGheymat Business: $"..convertNumber(tonumber(house["bForSell"])).."\nIn Business "..lockstate.." Ast!", sx, sy, sx, sy, tocolor(105 , 186 , 150,250), fontbig, "default-bold", "center")
						else
							dxDrawText(""..house["bName"].." ( ID: "..house["bID"].." )\nOwner: "..house["bOwnerName"].."\nVoroodi: $"..convertNumber(tonumber(house["bEnter"])).."\nIn Business "..lockstate.." Ast!", sx+1.5, sy+1.5, sx, sy, tocolor(0, 0, 0, 200), fontbig, "default-bold", "center")
							dxDrawText(""..house["bName"].." ( ID: "..house["bID"].." )\nOwner: "..house["bOwnerName"].."\nVoroodi: $"..convertNumber(tonumber(house["bEnter"])).."\nIn Business "..lockstate.." Ast!", sx, sy, sx, sy, tocolor(105 , 186 , 150,250), fontbig, "default-bold", "center")
						end
					end
				end
			end
		end
	end
end)
--]]

function getMiddleGuiPosition(lol, lol2)

	local sWidth, sHeight = guiGetScreenSize()
 
    local Width,Height = lol, lol2
    local X = (sWidth/2) - (Width/2)
    local Y = (sHeight/2) - (Height/2)
	
	return X, Y, Width, Height
end

function getDistanceBetweenElements(element1, element2)
	local x, y, z = getElementPosition(element1)
	local x1, y1, z1 = getElementPosition(element2)
	return getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
end


HouseBG1 = guiCreateStaticImage(0.37, 0.25, 0.25, 0.50, "assets/Dayere.png", true)


HouseIDLabel = guiCreateLabel(0.34, 0.10, 0.32, 0.08, "Pelak: 0", true, HouseBG1)
guiLabelSetColor(HouseIDLabel,165,42,42)
local font0_Rage = guiCreateFont("assets/Rage.ttf", 24)
guiSetFont(HouseIDLabel, font0_Rage)
guiLabelSetHorizontalAlign(HouseIDLabel, "center", false)
guiLabelSetVerticalAlign(HouseIDLabel, "center")

EnterButton = guiCreateStaticImage(0.30,0.65,0.40,0.08,"Data/ENTER.png",true,HouseBG1)
guiSetProperty(EnterButton, "NormalTextColour", "FF00FF00")
--FrameBox = guiCreateStaticImage(-0.08, 0.12, 0.99, 0.45, "assets/Frame.png", true, HouseBG1)

OwnerLabel = guiCreateLabel(0.16, 0.27, 0.82, 0.17, "Owner:", true, HouseBG1)
local font1_Rage = guiCreateFont("assets/Rage.ttf", 17)
guiSetFont(OwnerLabel, font1_Rage)
guiLabelSetColor(OwnerLabel,127,255,212)
PriceLabel = guiCreateLabel(0.16, 0.34, 0.82, 0.17, "Price:", true, HouseBG1)
guiSetFont(PriceLabel, font1_Rage)
guiLabelSetColor(PriceLabel,127,255,212)
Forsellprice = guiCreateLabel(0.16, 0.49, 0.82, 0.17, "ForSellPrice:", true, HouseBG1)
guiSetFont(Forsellprice, font1_Rage)
guiLabelSetColor(Forsellprice,127,255,212)
ZoneLabel = guiCreateLabel(0.16, 0.42, 0.82, 0.17, "Location:", true, HouseBG1)
guiSetFont(ZoneLabel, font1_Rage)
guiLabelSetColor(ZoneLabel,127,255,212)

CloseButton = guiCreateStaticImage(0.30, 0.75, 0.40, 0.08, "Data/Exit.png", true, HouseBG1)
guiSetProperty(CloseButton, "NormalTextColour", "FFFF0000")
PurchaseButton = guiCreateStaticImage(0.65, 0.28, 0.17, 0.06, "Data/buy.png", true, HouseBG1)
guiSetProperty(PurchaseButton, "NormalTextColour", "FF00FF00")
guiSetEnabled( PurchaseButton, true )
SellServerButton = guiCreateStaticImage(0.65, 0.35, 0.17, 0.06, "Data/sell.png", true, HouseBG1)
guiSetProperty(SellServerButton, "NormalTextColour", "FFFF0000")


guiSetProperty(HouseBG1,"Visible","False")

closeTimer = {}

nowBizID = 0

addEvent("closeBizPage",true)
addEventHandler("closeBizPage",getLocalPlayer(),function(p)
	if p == getLocalPlayer() then
		showCursor(false)
		removeEventHandler("onClientRender",p,drawBizSys)
		
		bizvisable = false
	end
	
end)

addEvent("showHousePage",true)
addEventHandler("showHousePage",getLocalPlayer(),function(thePlayer,State,ID,Owner,Zone,Price,LockState,Forsells,maghazename,Vorodi)
	if thePlayer == getLocalPlayer() then
		if bizvisable ~= true then
			showCursor(true)
			bizvisable = true
			addEventHandler("onClientRender",root,drawBizSys)
			
			if closeTimer[getLocalPlayer()] then
				killTimer(closeTimer[getLocalPlayer()])
				closeTimer[getLocalPlayer()] = nil
			end
			nowVorodi=Vorodi
			nowBizID = ID
			nowOwner = Owner
			bmaghazename = maghazename
			nowPrice = Price

			if Forsells > 0 then
			guiSetText(Forsellprice,"PriceForSell: $"..convertNumber(Forsells))
			else
			guiSetText(Forsellprice,"ForSell : Baste ")
			end

			canClose = false

			if LockState == 1 then -- Locked

				guiSetEnabled( EnterButton, false )
				canEnter = false
				enterReason = "Biz Gofle!"
			else 

				canEnter = true
				guiSetEnabled( EnterButton, true )
			end

			if ID == 4 or ID == 5 or ID == 9 or ID == 13 or ID == 14 or ID == 15 then -- Locked
				guiSetEnabled( EnterButton, false )
				canEnter = false
				enterReason = "In Biz Interior Nadare!"
			else 

				canEnter = true
				guiSetEnabled( EnterButton, true )
			end


			canPurchase = true




			closeTimer[getLocalPlayer()] = setTimer(function()
				--guiStaticImageLoadImage(CloseButton, "assets/Close.png")
				closeTimer[getLocalPlayer()] = nil
				canClose = true
			end,2000,1)
		end
	end
end)

local items = dxCreateFont("assets/Rage.ttf", (px+py)*6) 
local poter = dxCreateFont("assets/Rage.ttf", (px+py)*10)

function drawBizSys()

	if bizvisable == true then	

		dxDrawImage(px*603, py*200, px*416, py*446, "assets/Dayere.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(px*769, py*230, px*90, py*90, "Data/shop.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		if string.len(bmaghazename) < 7 then
			dxDrawText(bmaghazename, px*800-(3*string.len(bmaghazename)), py*625, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, poter, "left", "center",false,false,false, false)
		elseif string.len(bmaghazename) > 7 then
			dxDrawText(bmaghazename, px*800-(5*string.len(bmaghazename)), py*625, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, poter, "left", "center",false,false,false, false)
		end
		dxDrawText("Pelak: TN-"..nowBizID, px*775, py*685, px*50, py*50, tocolor(255, 192, 192, 192), fontScale, items, "left", "center",false,false,false, false) 
		if nowOwner == "no-one" then
			if isMouseInPosition(px*674, py*430, px*280, py*54) then
				dxDrawImage(px*674, py*430, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(150,150,150, 255), false)
				dxDrawText("Malek Business: Bedon Malek", px*735, py*740, px*50, py*50, tocolor(255, 255, 153, 255), fontScale, items, "left", "center",false,false,false, false) 
				dxDrawText("Kharide In Business( "..nowPrice.."$ )",px*715, py*860, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
				if getKeyState("mouse1")  then
					if not press then
						press = true
						removeEventHandler("onClientRender",root,drawBizSys)
						showCursor(false)
						bizvisable=false
						triggerServerEvent("requestBuyBiz",getLocalPlayer(),getLocalPlayer(),nowBizID)
					end
				else
					press = false
				
				end
			else
				dxDrawText("Malek Business: Bedon Malek", px*735, py*740, px*50, py*50, tocolor(255, 255, 153, 255), fontScale, items, "left", "center",false,false,false, false) 
				dxDrawText("Kharide In Business( "..nowPrice.."$ )", px*715, py*860, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
				dxDrawImage(px*674, py*430, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(180,180,180, 255), false)
			end
		else
			dxDrawText("Malek Business: "..nowOwner, px*735, py*740, px*50, py*50, tocolor(255, 255, 153, 255), fontScale, items, "left", "center",false,false,false, false) 
			dxDrawText("Kharide In Business( "..nowPrice.."$ )", px*715, py*860, px*130, py*54, tocolor(255, 255, 255, 100), fontScale, items, "left", "center",false,false,true, false)
			dxDrawImage(px*674, py*430, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(192,192,192, 255), false)
		end
		if isMouseInPosition(px*674, py*500, px*280, py*54) then
			dxDrawImage(px*674, py*500, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(150,150,150, 255), false)
			dxDrawText("Vorood( "..nowVorodi.."$ )",px*770, py*1000, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
			if getKeyState("mouse1")  then
				if not press then
					press = true
					triggerServerEvent("requestTeleportToBiz",getLocalPlayer(),getLocalPlayer(),nowBizID)
					removeEventHandler("onClientRender",root,drawBizSys) 
					nowVorodi= nil
					nowBizID = nil
					nowOwner = nil
					bmaghazename = nil
					bizvisable = false
					nowPrice = nil
					showCursor(false)
				end
			else
				press = false
			
			end
		else
			dxDrawText("Vorood( "..nowVorodi.."$ )", px*770, py*1000, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
			dxDrawImage(px*674, py*500, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(180,180,180, 255), false)
		end

		if isMouseInPosition(px*674, py*570, px*280, py*54) then
			dxDrawImage(px*674, py*570, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(150,150,150, 255), false)
			dxDrawText("Bastan",px*800, py*1140, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
			if getKeyState("mouse1")  then
				if not press then
					press = true
					removeEventHandler("onClientRender",root,drawBizSys) 
					nowVorodi= nil
					nowBizID = nil
					nowOwner = nil
					bmaghazename = nil
					bizvisable = false
					nowPrice = Price
					showCursor(false)
				end

			else
				press = false
			
			end
		else
			dxDrawText("Bastan", px*800, py*1140, px*130, py*54, tocolor(255, 255, 255, 255), fontScale, items, "left", "center",false,false,true, false)
			dxDrawImage(px*674, py*570, px*280, py*54, "data/btn.png", 0, 0, 0, tocolor(180,180,180, 255), false)
		end
	end
	

end

function GUIClicked()
	local SoundClick = playSound("assets/Click.mp3",false)
	setSoundVolume(SoundClick,1.00)
end

function HouseLocked()
	local SoundClick = playSound("assets/Locked.mp3",false)
	setSoundVolume(SoundClick,1.00)
end

function HouseEntered()
	local SoundClick = playSound("assets/Enter.mp3",false)
	setSoundVolume(SoundClick,1.00)
end


function ErrorSound()
	local SoundClick = playSound("assets/Error.mp3",false)
	setSoundVolume(SoundClick,1.00)
end

addEvent("playErrorSoundEffect",true)
addEventHandler("playErrorSoundEffect",getLocalPlayer(),function()
	ErrorSound()
end)

addEventHandler("onClientGUIClick",getRootElement(),function()
	if source == CloseButton then
		if canClose then
			GUIClicked()
			guiSetProperty(HouseBG1,"Visible","False")
			showCursor(false)
		else
			HouseLocked()
			notfSys:addNotification("Lotfan Spam Nakonid!","warning")
		end
	elseif source == EnterButton then
		if canEnter then
			GUIClicked()
			triggerServerEvent("requestTeleportToBiz",getLocalPlayer(),getLocalPlayer(),nowBizID)
		else
			HouseLocked()
			notfSys:addNotification(enterReason,"warning")
		end
	elseif source == PurchaseButton then
		if canPurchase then
			GUIClicked()
			triggerServerEvent("requestBuyBiz",getLocalPlayer(),getLocalPlayer(),nowBizID)
		else
			ErrorSound()
			notfSys:addNotification("In Business Saheb Dare!","warning")
		end
	elseif source == SellServerButton then
		if canSell then
			GUIClicked()
			triggerServerEvent("requestSellSvBiz",getLocalPlayer(),getLocalPlayer(),nowBizID)
		else
			ErrorSound()
			notfSys:addNotification("Shoma Sahebe In Business Nisti!","warning")
		end
	end
end)


addEvent("hideHousePage",true)
addEventHandler("hideHousePage",getLocalPlayer(),function(thePlayer,SoundState)
	if thePlayer == getLocalPlayer() then
		guiSetProperty(HouseBG1,"Visible","False")
		showCursor(false)
		if SoundState and SoundState == 1 then
			HouseEntered()
		end
	end
end)

local MarketFont = guiCreateFont("assets/Rage.ttf", 14)

marketBG = guiCreateStaticImage(0.22, 0.20, 0.56, 0.60, "assets/MarketBG.png", true)

buymarket = guiCreateStaticImage(0.04, 0.79, 0.33, 0.15, "assets/MarketBuy.png", true, marketBG)
closemarket = guiCreateStaticImage(0.63, 0.79, 0.33, 0.15, "assets/MarketClose.png", true, marketBG)
cigar = guiCreateStaticImage(0.06, 0.18, 0.24, 0.30, "assets/Cigarette.png", true, marketBG)
lighter = guiCreateStaticImage(0.70, 0.18, 0.24, 0.30, "assets/Lighter.png", true, marketBG)
simcard = guiCreateStaticImage(0.38, 0.18, 0.24, 0.30, "assets/Simcard.png", true, marketBG)

GheymatCigar = guiCreateLabel(0.15, 0.47, 0.82, 0.17, "$5000", true, marketBG)
guiSetFont(GheymatCigar, MarketFont)

GheymatLighter = guiCreateLabel(0.46, 0.47, 0.82, 0.17, "$2000", true, marketBG)
guiSetFont(GheymatLighter, MarketFont)

GheymatSimcard = guiCreateLabel(0.785, 0.47, 0.82, 0.17, "$1000", true, marketBG)
guiSetFont(GheymatSimcard, MarketFont)

guiSetProperty(marketBG,"Visible","False")

addEvent("iwantmarket",true)
addEventHandler("iwantmarket",getLocalPlayer(),function(thePlayer,action)
	if action == "show" then
		guiSetProperty(marketBG,"Visible","True")
		showCursor(true)
	elseif action == "hide" then
		guiSetProperty(marketBG,"Visible","False")
		showCursor(false)
	end
end)
selected = 0

addEventHandler("onClientGUIClick",getRootElement(),function()
	if source == closemarket then
		guiSetProperty(marketBG,"Visible","False")
		showCursor(false)
	elseif source == buymarket then
		if selected >= 1 then
			guiStaticImageLoadImage(lighter,"assets/Lighter.png")
			guiStaticImageLoadImage(simcard,"assets/Simcard.png")
			guiStaticImageLoadImage(cigar,"assets/Cigarette.png")
			triggerServerEvent("requestBuyFromMarket",getLocalPlayer(),getLocalPlayer(),selected)
			selected = 0
		else
			exports["notf"]:addNotification("Shoma Hich Itemi Ra Entekhab Nakardid!","warning")
		end
	elseif source == cigar then
		if selected == 1 then
			guiStaticImageLoadImage(lighter,"assets/Lighter.png")
			guiStaticImageLoadImage(simcard,"assets/Simcard.png")
			guiStaticImageLoadImage(cigar,"assets/Cigarette.png")
			selected = 0
			return
		end
		guiStaticImageLoadImage(lighter,"assets/Lighter.png")
		guiStaticImageLoadImage(simcard,"assets/Simcard.png")
		guiStaticImageLoadImage(cigar,"assets/CigaretteA.png")
		selected = 1
	elseif source == lighter then
		if selected == 2 then
			guiStaticImageLoadImage(lighter,"assets/Lighter.png")
			guiStaticImageLoadImage(simcard,"assets/Simcard.png")
			guiStaticImageLoadImage(cigar,"assets/Cigarette.png")
			selected = 0
			return
		end
		guiStaticImageLoadImage(lighter,"assets/LighterA.png")
		guiStaticImageLoadImage(simcard,"assets/Simcard.png")
		guiStaticImageLoadImage(cigar,"assets/Cigarette.png")
		selected = 2
	elseif source == simcard then
		if selected == 3 then
			guiStaticImageLoadImage(lighter,"assets/Lighter.png")
			guiStaticImageLoadImage(simcard,"assets/Simcard.png")
			guiStaticImageLoadImage(cigar,"assets/Cigarette.png")
			selected = 0
			return
		end
		guiStaticImageLoadImage(lighter,"assets/Lighter.png")
		guiStaticImageLoadImage(simcard,"assets/SimcardA.png")
		guiStaticImageLoadImage(cigar,"assets/Cigarette.png")
		selected = 3
	end
end)


WeaponBG = guiCreateStaticImage(0.34, 0.22, 0.31, 0.55, "assets/Weapon/BG.png", true)

WeaponButton = {}

WeaponButton[30] = guiCreateStaticImage(0.07, 0.30, 0.37, 0.08, "assets/Click.png", true, WeaponBG)
WeaponButton[31] = guiCreateStaticImage(0.56, 0.30, 0.37, 0.08, "assets/Click.png", true, WeaponBG)
WeaponButton[27] = guiCreateStaticImage(0.56, 0.46, 0.37, 0.08, "assets/Click.png", true, WeaponBG)
WeaponButton[28] = guiCreateStaticImage(0.56, 0.62, 0.37, 0.08, "assets/Click.png", true, WeaponBG)
WeaponButton[26] = guiCreateStaticImage(0.56, 0.78, 0.37, 0.08, "assets/Click.png", true, WeaponBG)
WeaponButton[33] = guiCreateStaticImage(0.07, 0.78, 0.37, 0.08, "assets/Click.png", true, WeaponBG)
WeaponButton[29] = guiCreateStaticImage(0.07, 0.62, 0.37, 0.08, "assets/Click.png", true, WeaponBG)
WeaponButton[24] = guiCreateStaticImage(0.07, 0.46, 0.37, 0.08, "assets/Click.png", true, WeaponBG)
WepClose = guiCreateStaticImage(0.04, 0.05, 0.12, 0.12, "assets/Click.png", true, WeaponBG)

WeaponID = {}

for i=1,50 do
	if WeaponButton[i] then
		WeaponID[WeaponButton[i]] = i
	end
end

WeaponPrice = {}
WeaponPrice[30] = 1400
WeaponPrice[31] = 1800
WeaponPrice[27] = 800
WeaponPrice[28] = 1300
WeaponPrice[29] = 700
WeaponPrice[26] = 1100
WeaponPrice[33] = 1000
WeaponPrice[24] = 1500


guiSetProperty(WeaponBG,"Visible","False")

addEvent("showWeapons",true)
addEventHandler("showWeapons",getLocalPlayer(),function(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(WeaponBG,"Visible","True")
		showCursor(true)
	end
end)

addEvent("hideWeapons",true)
addEventHandler("hideWeapons",getLocalPlayer(),function(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(WeaponBG,"Visible","False")
		showCursor(false)
	end
end)

addEventHandler("onClientGUIClick",getRootElement(),function(thePlayer)
	if source == WepClose then
		guiSetProperty(WeaponBG,"Visible","False")
		showCursor(false)
		GUIClicked()
	else
		if WeaponID[source] then
			triggerServerEvent("clientWantBuyGun",getLocalPlayer(),getLocalPlayer(),WeaponID[source],WeaponPrice[WeaponID[source]])
			GUIClicked()
		end
	end
end)


skingui = {}
local screenW ,screenH = guiGetScreenSize()
skingui["bg"] = guiCreateStaticImage(0.34, 0.7, 0.40, 0.25, "BackGround.png", true)

skingui["next"] = guiCreateStaticImage(0.72, 0.4, 0.14, 0.21, "right.png", true, skingui["bg"])
local Font111 = guiCreateFont("font1.ttf", 18)


skingui["previous"] = guiCreateStaticImage(0.15, 0.4, 0.14, 0.21, "left.png", true, skingui["bg"])

skingui["cancel"] = guiCreateStaticImage(0.37, 0.38, 0.28, 0.28, "close.png", true, skingui["bg"])

skingui["text"] = guiCreateLabel(0.2, 0.16, 0.65, 0.2,"Press ((Enter)) For Select Skin",true,skingui["bg"])
guiSetFont(skingui["text"], Font111)

guiSetVisible(skingui["bg"],false)
--guiSetProperty(skingui["text"], "NormalTextColour", "FF3CF237")    


vippoint = 0
genderp = nil
addEvent("toggleskinshop",true)
addEventHandler("toggleskinshop",getLocalPlayer(),function(thePlayer,booling,vip,gender)
	guiSetVisible(skingui["bg"],booling)
	showCursor(booling)
	myindex = 1
	if booling == true then
		if tonumber(gender) == 1 then 
			genderp = 0
		elseif tonumber(gender) == 2 then 
			genderp = 1
		end
		skinshop(genderp)
	end


	vippoint = tonumber(vip)

	
end)

function skinshop(genderp)
	if not myskin then
		myskin = createPed(skintable[genderp][myindex],201.39453125 ,-126.490234375 ,1003.5078125)
		setElementRotation(myskin,0,0,180)
		setElementInterior(myskin,3)
		setElementData(myskin,"PedGM",true)
		setElementFrozen(myskin,true)
		setCameraMatrix(201.33203125 ,-130.6142578125 ,1003.2 ,201.33203125 ,-130.6142578125 ,1003.2)
	end
end
myskin = nil
myindex = 1
--Argument 3 Table Male Or Female = 0 Man , 1 Female
-- 1 = Id Skin , 2 = Vip Or Not[1=yes,2=not] , 3 = gender[ 0 == man , 1==woman ]
skintable = {
	[0] = {1,2,7,18,20,21,22,23,24,25,26,27,28,29,30,32,33,34,35,36,47,78,79,82,83,84,96,97,101,124,128,132,144,146,174,176,177,180,183,184,200,220,230,234,235,236,247,254,297,301,33,310},
	[1] = {9,12,13,31,38,39,40,41,53,54,55,56,63,64,89,90,130,141,148,152,193,207,216,218,219,224,232,238,298},
}


addEventHandler("onClientGUIClick",getRootElement(),function()
	if source == skingui["cancel"] then
		GUIClicked()
		triggerServerEvent("cancelskin",player,player)
		guiSetVisible(skingui["bg"],false)
		showCursor(false)
		myindex = 1
		destroyElement(myskin)
		myskin = nil
	elseif source == skingui["next"] then
		GUIClicked()
		if myindex < #skintable[genderp] then
			myindex = myindex + 1
			setElementModel(myskin,skintable[genderp][myindex])
		end
	elseif source == skingui["previous"] then
		GUIClicked()
		if myindex >= 2 then
			myindex = myindex - 1
			setElementModel(myskin,skintable[genderp][myindex])
		end
	end
end)
 

bindKey("enter","down",function()
	if myskin then


		
		local skinid = tonumber(skintable[genderp][myindex])
		triggerServerEvent("buyskin",player,player,skinid)
		guiSetVisible(skingui["bg"],false)
		showCursor(false)
		myindex = 1
		destroyElement(myskin)
		myskin = nil


				
	end
end)


bindKey("arrow_l","down",function()
	if myskin then
		if myindex >= 2 then
			myindex = myindex - 1
			setElementModel(myskin,skintable[genderp][myindex])
		end	
	end
end)
bindKey("arrow_r","down",function()
	if myskin then

		if myindex < #skintable then
			myindex = myindex + 1
			setElementModel(myskin,skintable[genderp][myindex])
		end
				
	end
end)
addEvent("checkskinshop",true)
addEventHandler("checkskinshop",getLocalPlayer(),function()
	if myskin then
		triggerServerEvent("cancelskin",player,player)
		guiSetVisible(skingui["bg"],false)
		showCursor(false)
		myindex = 1
		destroyElement(myskin)
		myskin = nil
	end
end)

triggerServerEvent("loadbizzesfromsv",getLocalPlayer(),getLocalPlayer())

function leftsync()
	triggerServerEvent("syncRahnama",player,player,"left")
end

function rightsync()
	triggerServerEvent("syncRahnama",player,player,"right")
end

bindKey("[","down",leftsync)
bindKey("]","down",rightsync)



