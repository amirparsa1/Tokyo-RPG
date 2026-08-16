SlotBG = {}
Slot = {}
IsSlot = {}
SlotBack = {}
BackSlot = {}
Actions = {}
Amounts = {}
IsItemSlot = {}
local hideALL = false
local sx, sy = guiGetScreenSize()
local px, py = (sx), (sy/900)
local x, y = (sx/1600), (sy/900)
local screen = dxCreateScreenSource ( sx, sy ) 
local notfSys = exports["notf"]

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

occupiedGUI = nil
occupiedSlot = nil
occupiedSlot2 = nil
attachedGUI = nil
ActionSlot = nil

ClientTable = {}

-- Fonts 
RageFont = guiCreateFont("Fonts/Rage.ttf", 10)
newFont = guiCreateFont("assets/font1.ttf", 10)
normalfont = guiCreateFont("Fonts/font.ttf", 10)


local semsar = createPed(31,-74.9912109375 ,-777.6943359375 ,9.9667482376099,-90)
setElementFrozen(semsar,true)
function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", semsar, cancelPedDamage)



local mtarget2 = false
local VIsit = false 
addEvent("On",true)
addEventHandler("On",getLocalPlayer(),function(p,t)
	mtarget2 = t
	Visit = true
	guiSetProperty(finderBG,"Visible","True")
end)

addEvent("Off",true)
addEventHandler("Off",getLocalPlayer(),function(p)
	mtarget2 = false
	Visit = false
	
	guiSetProperty(finderBG,"Visible","False")
	
end)




addEventHandler("onClientRender",root,function()
	if mtarget2 then
		if Visit == true then
			fi = guiSetText(finderFasele," "..math.floor(getDistanceBetweenPoints3D(Vector3(getElementPosition(getLocalPlayer())),Vector3(getElementPosition(mtarget2)))))
        	guiSetFont(finderFasele,Finder)
		end
	end
end)

addEventHandler("onClientGUIClick",root,function()

	if source == ClosePanel then 

		guiSetProperty(finderBG,"Visible","False")

	end

end)




function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end
local font1 = guiCreateFont("assets/IRANSans.ttf",32)
itemcraftis={}
local formols = {
	["606156"] = {3},
	["575961"] = {5},
	["566159"] = {7},
	["586057"] = {8},
	["566059"] = {10},
	["615658"] = {11},
	["585661"] = {12},
	["565759"] = {16},
	["596156"] = {17},
	["605659"] = {24},
	["575659"] = {25},
	["585960"] = {27},
	["615859"] = {28},
}
InventoryBG = guiCreateStaticImage(0.095, 0.08, 0.80, 0.81, "assets/bg.png", true)

function DrawCraftSystem()
	dxDrawImage(x*230, y*670, x*1160, y*342, "Panels/CraftBG.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	if isMouseInPosition(x*375,  y*770, x*90, y*49) then
		dxDrawImage(x*375,  y*770, x*90, y*49, "Panels/Clean.png", 0, 0, 0, tocolor(150,150,150, 255), true)
		if getKeyState("mouse1")  then
			if not press then
				press = true
				itemcraft1 = 0
				itemcraft2 = 0
				itemcraft3 = 0
			end
		else
			press = false
		end
	else
		dxDrawImage(x*375,  y*770, x*90, y*49, "Panels/Clean.png", 0, 0, 0, tocolor(255,255,255, 255), true)
	end
	if isMouseInPosition(x*375,  y*830, x*90, y*49) then
		dxDrawImage(x*375,  y*830, x*90, y*49, "Panels/Close.png", 0, 0, 0, tocolor(150,150,150, 255), true)
		if getKeyState("mouse1")  then
			if not press then
				press = true
				itemcraft1 = 0
				itemcraft2 = 0
				itemcraft3 = 0
				removeEventHandler("onClientRender",root,DrawCraftSystem)
				itemcraftis[1] = false
				itemcraftis[2] = false
				itemcraftis[3] = false
			end
		else
			press = false
		end
	else
		dxDrawImage(x*375,  y*830, x*90, y*49, "Panels/Close.png", 0, 0, 0, tocolor(255,255,255, 255), true)
	end
	if isMouseInPosition(x*490,  y*775, x*205, y*94) then
		dxDrawImage(x*490,  y*775, x*205, y*94, "Panels/Craft.png", 0, 0, 0, tocolor(150,150,150, 255), true)
		if getKeyState("mouse1")  then
			if not press then
				press = true
				if formols[itemcraft1..""..itemcraft2..""..itemcraft3] then
					
					triggerServerEvent("RequestKooreItem",getLocalPlayer(),getLocalPlayer(),itemcraftis[1],itemcraftis[2],itemcraftis[3])
				else
					notfSys:addNotification("In Formol Vojod Nadarad.","error")
				end
			end
		else
			press = false
		end
	else
		dxDrawImage(x*490,  y*775, x*205, y*94, "Panels/Craft.png", 0, 0, 0, tocolor(255,255,255, 255), true)
	end
	dxDrawImage(x*756,  y*775, x*100, y*100, "Items/"..itemcraft1..".png", 0, 0, 0, tocolor(255,255,255, 255), true)
	dxDrawImage(x*954,  y*775, x*100, y*100, "Items/"..itemcraft2..".png", 0, 0, 0, tocolor(255,255,255, 255), true)
	dxDrawImage(x*1144,  y*775, x*100, y*100, "Items/"..itemcraft3..".png", 0, 0, 0, tocolor(255,255,255, 255), true)


end


SlotBG[1] = guiCreateStaticImage(0.10+0.02 ,0.18 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[2] = guiCreateStaticImage(0.17+0.02 ,0.18 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[3] = guiCreateStaticImage(0.24+0.02 ,0.18 ,0.06,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[4] = guiCreateStaticImage(0.31+0.02 ,0.18 ,0.06,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[5] = guiCreateStaticImage(0.38+0.02 ,0.18 ,0.06,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[6] = guiCreateStaticImage(0.45+0.02 ,0.18 ,0.06,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[7] = guiCreateStaticImage(0.52+0.02 ,0.18 ,0.06,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[8] = guiCreateStaticImage(0.59+0.02, 0.18, 0.06, 0.096, "assets/Item.png", true, InventoryBG)
SlotBG[9] = guiCreateStaticImage(0.66+0.02, 0.18, 0.06, 0.096, "assets/Item.png", true, InventoryBG)
SlotBG[10] = guiCreateStaticImage(0.73+0.02, 0.18, 0.06, 0.096, "assets/Item.png", true, InventoryBG)
SlotBG[11] = guiCreateStaticImage(0.80+0.02, 0.18, 0.06, 0.096, "assets/Item.png", true, InventoryBG)
SlotBG[12] = guiCreateStaticImage(0.10+0.02 ,0.30 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[13] = guiCreateStaticImage(0.17+0.02 ,0.30 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[14] = guiCreateStaticImage(0.24+0.02 ,0.30 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[15] = guiCreateStaticImage(0.31+0.02 ,0.30 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[16] = guiCreateStaticImage(0.38+0.02 ,0.30 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[17] = guiCreateStaticImage(0.45+0.02 ,0.30 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[18] = guiCreateStaticImage(0.52+0.02 ,0.30 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[19] = guiCreateStaticImage(0.59+0.02 ,0.30 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[20] = guiCreateStaticImage(0.66+0.02 ,0.30 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[21] = guiCreateStaticImage(0.73+0.02 ,0.30 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[22] = guiCreateStaticImage(0.80+0.02 ,0.30 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)	
SlotBG[23] = guiCreateStaticImage(0.10+0.02 ,0.42 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[24] = guiCreateStaticImage(0.17+0.02 ,0.42 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[25] = guiCreateStaticImage(0.24+0.02 ,0.42 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[26] = guiCreateStaticImage(0.31+0.02 ,0.42 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[27] = guiCreateStaticImage(0.38+0.02 ,0.42 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[28] = guiCreateStaticImage(0.45+0.02 ,0.42 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[29] = guiCreateStaticImage(0.52+0.02 ,0.42 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[30] = guiCreateStaticImage(0.59+0.02 ,0.42 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[31] = guiCreateStaticImage(0.66+0.02 ,0.42 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[32] = guiCreateStaticImage(0.73+0.02 ,0.42 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[33] = guiCreateStaticImage(0.80+0.02 ,0.42 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[34] = guiCreateStaticImage(0.10+0.02 ,0.54 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[35] = guiCreateStaticImage(0.17+0.02 ,0.54 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[36] = guiCreateStaticImage(0.24+0.02 ,0.54 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[37] = guiCreateStaticImage(0.31+0.02 ,0.54 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[38] = guiCreateStaticImage(0.38+0.02 ,0.54 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[39] = guiCreateStaticImage(0.45+0.02 ,0.54 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[40] = guiCreateStaticImage(0.52+0.02 ,0.54 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[41] = guiCreateStaticImage(0.59+0.02 ,0.54 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[42] = guiCreateStaticImage(0.66+0.02 ,0.54 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[43] = guiCreateStaticImage(0.73+0.02 ,0.54 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[44] = guiCreateStaticImage(0.80+0.02 ,0.54 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[45] = guiCreateStaticImage(0.10+0.02 ,0.66 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[46] = guiCreateStaticImage(0.17+0.02 ,0.66 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[47] = guiCreateStaticImage(0.24+0.02 ,0.66 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[48] = guiCreateStaticImage(0.31+0.02 ,0.66 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[49] = guiCreateStaticImage(0.38+0.02 ,0.66 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[50] = guiCreateStaticImage(0.45+0.02 ,0.66 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[51] = guiCreateStaticImage(0.52+0.02 ,0.66 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[52] = guiCreateStaticImage(0.59+0.02 ,0.66 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[53] = guiCreateStaticImage(0.66+0.02 ,0.66 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[54] = guiCreateStaticImage(0.73+0.02 ,0.66 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)
SlotBG[55] = guiCreateStaticImage(0.80+0.02 ,0.66 , 0.06 ,0.096, "assets/Item.png", true, InventoryBG)

for i=1,55 do
	Slot[i] = guiCreateStaticImage(0.0, 0.0, 1.00, 1.00, "Items/0.png", true, SlotBG[i])
	Amounts[i] = guiCreateLabel(0.39, 0.65, 0.85, 0.2, "", true, Slot[i])
	guiSetFont(Amounts[i], newFont)
	guiLabelSetHorizontalAlign(Amounts[i], "center", false)
end

local BackgroundSpllitItem = guiCreateWindow((sx - 750) / 2, (sy - 400) / 2, 330, 150, "Tedad Item Ra Vared Konid", false)
guiSetAlpha( BackgroundSpllitItem, 90 )
guiSetProperty( BackgroundSpllitItem, "Visible", "False")
local BanFam = guiCreateButton(40, 70, 120, 40, "Spllit Item", false, BackgroundSpllitItem)
local cancelBanFam = guiCreateButton(170, 70, 120, 40, "Cancel", false, BackgroundSpllitItem)
local BanFamTime = guiCreateEdit(95, 37, 130, 30, "Tedad", false, BackgroundSpllitItem)
guiSetProperty(BackgroundSpllitItem,"AlwaysOnTop","True")
ActionsBG = guiCreateStaticImage(0,0, 0.16, 0.5, "Items/0.png", true)
DropItemx = guiCreateButton(0,0,0.6,0.115,"Drop",true,ActionsBG)
UseItemx = guiCreateButton(0,0.14,0.6,0.115,"Use",true,ActionsBG)
DeleteItemx = guiCreateButton(0,0.28,0.6,0.115,"Delete",true,ActionsBG)
SellItemx = guiCreateButton(0,0.42,0.6,0.115,"Sell",true,ActionsBG)
SpllitItemx = guiCreateButton(0,0.56, 0.6,0.115,"Spllit",true,ActionsBG)
ForgItemx = guiCreateButton(0,0.7, 0.6,0.115,"Forge",true,ActionsBG)
PutInCraftItemx = guiCreateButton(0,0.84, 0.6,0.115,"Put In Craft",true,ActionsBG)



guiSetFont(UseItemx, normalfont)
guiSetProperty(UseItemx, "NormalTextColour", "FF3CF237")    
guiSetEnabled( SellItemx, false )
guiSetFont(DropItemx, normalfont)
guiSetProperty(DropItemx, "NormalTextColour", "FF3CF237")
guiSetFont(DeleteItemx, normalfont)
guiSetProperty(DeleteItemx, "NormalTextColour", "FFFF0000")
guiSetFont(SellItemx, normalfont)
guiSetProperty(SellItemx, "NormalTextColour", "FFFFFF00")
guiSetFont(SpllitItemx, normalfont)
guiSetProperty(SpllitItemx, "NormalTextColour", "FFFF66FF")
guiSetFont(PutInCraftItemx, normalfont)
guiSetProperty(PutInCraftItemx, "NormalTextColour", "FFFFFF00")
guiSetFont(ForgItemx, normalfont)
guiSetProperty(ForgItemx, "NormalTextColour", "FFFFFF00")
function RefreshPanel()
	for i=1,55 do
		if SlotBG[i] then
			IsSlot[SlotBG[i]] = i
			BackSlot[SlotBG[i]] = Slot[i]
			guiSetProperty(BackSlot[SlotBG[i]],"AlwaysOnTop","True")
		end
		if Slot[i] then
			IsSlot[Slot[i]] = i
			SlotBack[Slot[i]] = SlotBG[i]
			guiSetProperty(Slot[i],"AlwaysOnTop","True")
			IsItemSlot[Slot[i]] = i
		end
	end
end

addEventHandler( "onClientRender", root, function()
	if hideALL then
		dxUpdateScreenSource( screen )                  
		dxDrawImage( 0,  0,  sx, sy, screen )  

		
	end
end)
guiSetProperty(InventoryBG,"Visible","False")
guiSetProperty(ActionsBG,"Visible","False")

spamtimer = {}


addEventHandler("onClientMouseEnter", getRootElement(), function()
	local xcf,ycf = getCursorPosition()
	
	if IsSlot[source] then
		if SlotBack[source] then
			
			guiStaticImageLoadImage(SlotBack[source], "Files/Green.png")
			guiStaticImageLoadImage(source, "Items/"..items[IsSlot[source]]..".png")
			if not attachedGUI then
				
				occupiedSlot = tonumber(IsSlot[source])
				occupiedGUI = source
				--outputChatBox(xcf..""..ycf)
				--outputChatBox("Slot: "..occupiedSlot.."")
			end
		else
			guiStaticImageLoadImage(source, "Files/Green.png")
			guiStaticImageLoadImage(BackSlot[source], "Items/"..items[IsSlot[source]]..".png")
			occupiedGUI = BackSlot[source]
			if not attachedGUI then
				
				occupiedSlot = tonumber(IsSlot[source])
				occupiedGUI = source
				--outputChatBox("Slot: "..occupiedSlot.."")
			end
		end
	end
end)
	
addEventHandler("onClientMouseLeave", getRootElement(), function()
	if IsSlot[source] then
		if SlotBack[source] then
			guiStaticImageLoadImage(SlotBack[source], "Files/Item.png")
			guiStaticImageLoadImage(source, "Items/"..items[IsSlot[source]]..".png")
			if not attachedGUI then
				occupiedGUI = nil
			end
			--occupiedSlot = nil
		else
			guiStaticImageLoadImage(source, "Files/Item.png")
			guiStaticImageLoadImage(BackSlot[source], "Items/"..items[IsSlot[source]]..".png")
			if not attachedGUI then
				occupiedGUI = nil
			end
			--occupiedSlot = nil
		end
	end
	
	if source == InventoryBG then
		
	end
end)




addEvent("ShowInventoryForPlayer",true)
addEventHandler("ShowInventoryForPlayer",getLocalPlayer(),function(thePlayer,InventoryData,ShowMode)
	if ( thePlayer == getLocalPlayer() ) then
		-- FIX (bugfix pass 3): the server confirmed, so it is now safe to reveal
		--   the outer frame. See the note in panelinventory().
		inventoryPending = nil
		if ShowMode == 1 then
			LoadPlayerInventory(thePlayer,InventoryData)
		else
			guiSetVisible( InventoryBGFull, true )
			guiSetProperty(InventoryBG,"Visible","True")
			showChat(false)
			hideALL = true
			showCursor(true)
			LoadPlayerInventory(thePlayer,InventoryData)
		end
		RefreshPanel()
	end
end)

items = {}

function LoadPlayerInventory(thePlayer,InvTable)
	for i=1,55 do
		if Slot[i] then
			guiStaticImageLoadImage(Slot[i], "Items/"..InvTable[thePlayer][i]["Item"]..".png")
			guiSetProperty(Slot[i],"AlwaysOnTop","True")
			items[i] = InvTable[thePlayer][i]["Item"]
			if tonumber(InvTable[thePlayer][i]["Item"]) >= 1 then
				guiSetPosition(Slot[i],0.05,0.05,true)
				guiSetSize(Slot[i],0.9,0.9,true)
			end
			for i=1,55 do
				if Amounts[i] then
					guiSetProperty(Amounts[i],"Visible","False")
					if InvTable[thePlayer][i]["Item"] >= 1 then
						if InvTable[thePlayer][i]["Amount"] > 1 then
							guiSetProperty(Amounts[i],"Visible","True")
							guiSetText(Amounts[i],"x"..InvTable[thePlayer][i]["Amount"])
						end
					end
				end
			end
			
			ClientTable = InvTable
			TPlayer = thePlayer
		end
	end
end

Gens = {
	[39] = {"DVD",2000},
	[40] = {"Gold",4000},
	[41] = {"Shamshir",950},
	[42] = {"Einak",1044},
	[43] = {"Spray",1500},
	[44] = {"Khodkar",1333},
	[45] = {"Dampai",700},
	[46] = {"Shishe Shir",1750},
	[47] = {"Pich",1900},
	[48] = {"Achar",1100},
	[49] = {"Ahan",850},
}
sureitems = {}
ItemForUse = {
	[1] = {"Keyk"},
	[3] = {"Fire Bullet"},
	[5] = {"Freez Shot"},
	[6] = {"Galon Benzin"},
	[7] = {"Visiabel"},
	[8] = {"Approval"},
	[9] = {"Kilid"},
	[10] = {"Med Kit"},
	[11] = {"JetPack"},
	[12] = {"Nitrogen"},
	[15] = {"Random Box"},
	[16] = {"Repare"},
	[17] = {"Siah Noor"},
	[18] = {"Ab"},
	[21] = {"Sigar"},
	[22] = {"SimaCard"},
	[23] = {"Special Box"},
	[24] = {"Hunter Bullet"},
	[25] = {"Poison Bullet"},
	[26] = {"Hunter Bullet"},
	[27] = {"Super Jump"},
	[28] = {"Shild"},
	[63] = {"Skin Arian"},
	
}
Focore = {
	[50] = {"Almas Sefid"},
	[51] = {"Almas Sabz"},
	[52] = {"Almas Abi"},
	[53] = {"Almas Sorati"},
	[54] = {"Almas Ghermez"},
	[55] = {"Almas Talaie"},
}

ForCraft = {
	[56] = {"Yaghot Sefid"},
	[57] = {"Yaghot Sabz"},
	[58] = {"Yaghot Abi"},
	[59] = {"Yaghot Sorati"},
	[60] = {"Yaghot Ghermez"},
	[61] = {"Yaghot Talaie"},
}
local TimeKamion = 14
local TimeKamion2 = 18
local TimeKeshti = 17
local TimeMantagheHavaei = 20
local AirDropTime = 19
addEventHandler("onClientGUIClick",getRootElement(),function(button)
	if source == DropItemx then
		triggerServerEvent("RequestDropItem",getLocalPlayer(),getLocalPlayer(),ActionSlot)
		guiSetProperty(ActionsBG,"Visible","False")
	elseif source == UseItemx then -- #USE
		
			

			triggerServerEvent("RequestUseItem",getLocalPlayer(),getLocalPlayer(),ActionSlot)
			guiSetProperty(ActionsBG,"Visible","False")
		
	elseif source == SellItemx then
		if fishes[ClientTable[TPlayer][tonumber(ActionSlot)]["Item"]] then
			triggerServerEvent("RequestSellItem",getLocalPlayer(),getLocalPlayer(),ActionSlot)
			guiSetProperty(ActionsBG,"Visible","False")
		elseif Gens[ClientTable[TPlayer][tonumber(ActionSlot)]["Item"]] then
			triggerServerEvent("RequestSellGens",getLocalPlayer(),getLocalPlayer(),ActionSlot)
			guiSetProperty(ActionsBG,"Visible","False")
		end
	elseif source == DeleteItemx then
		if sureitems[getLocalPlayer()] == true then
			triggerServerEvent("RequestDeleteGens",getLocalPlayer(),getLocalPlayer(),ActionSlot)
			guiSetProperty(ActionsBG,"Visible","False")
		else
			sureitems[getLocalPlayer()] = true
			exports["notf"]:addNotification("Barayr Delete Kardan Item Mojadad Roye Dokme 'Delete' Click Konid!.", 'warning')
		end
	elseif source == SpllitItemx then
		
		guiSetProperty( BackgroundSpllitItem, "Visible", "True")
	elseif source == cancelBanFam then
		guiSetProperty( BackgroundSpllitItem, "Visible", "False")
	elseif source == BanFam then
		local Hexs2 = guiGetText(BanFamTime)
		if ( string.find ( Hexs2, '~' ) ) or ( string.find ( Hexs2, '!' ) )  or ( string.find ( Hexs2, '_' ) ) or ( string.find ( Hexs2, '@' ) ) or ( string.find ( Hexs2, '#' ) ) or ( string.find ( Hexs2, '&' ) ) or ( string.find ( Hexs2, '*' ) ) or ( string.find ( Hexs2, '-' ) ) or ( string.find ( Hexs2, '=' ) ) or ( string.find ( Hexs2, '+' ) ) or ( string.find ( Hexs2, '\\' ) ) or ( string.find ( Hexs2, '|' ) ) or ( string.find ( Hexs2, '{' ) ) or ( string.find ( Hexs2, '}' ) ) or ( string.find ( Hexs2, ';' ) ) or ( string.find ( Hexs2, ':' ) ) or ( string.find ( Hexs2, '"' ) ) or ( string.find ( Hexs2, '<' ) ) or ( string.find ( Hexs2, '>' ) ) or ( string.find ( Hexs2, '/' ) ) or ( string.find ( Hexs2, '?' ) ) then	
			exports["notf"]:addNotification("Tedad Bayad Shamel Addad Bashad.Dar On Nemitavan Az Alamat Estefade Kar!", "error")
            return false	
        end
        -- To New Name Farsi Nabashe
        if ( string.find ( Hexs2, 'ض' ) ) or ( string.find ( Hexs2, 'ص' ) )  or ( string.find ( Hexs2, 'ث' ) ) or ( string.find ( Hexs2, 'ق' ) ) or ( string.find ( Hexs2, 'ف' ) ) or ( string.find ( Hexs2, 'غ' ) ) or ( string.find ( Hexs2, 'ع' ) ) or ( string.find ( Hexs2, 'ه' ) ) or ( string.find ( Hexs2, 'خ' ) ) or ( string.find ( Hexs2, 'ح' ) ) or ( string.find ( Hexs2, 'ج' ) ) or ( string.find ( Hexs2, 'چ' ) ) or ( string.find ( Hexs2, 'ش' ) ) or ( string.find ( Hexs2, 'س' ) ) or ( string.find ( Hexs2, 'ی' ) ) or ( string.find ( Hexs2, 'ب' ) ) or ( string.find ( Hexs2, 'ل' ) ) or ( string.find ( Hexs2, 'ا' ) ) or ( string.find ( Hexs2, 'ت' ) ) or ( string.find ( Hexs2, 'ن' ) )  or ( string.find ( Hexs2, 'م' ) )  or ( string.find ( Hexs2, 'ک' ) )  or ( string.find ( Hexs2, 'گ' ) )  or ( string.find ( Hexs2, 'ظ' ) )  or ( string.find ( Hexs2, 'ط' ) )  or ( string.find ( Hexs2, 'ز' ) )  or ( string.find ( Hexs2, 'ر' ) )  or ( string.find ( Hexs2, 'ذ' ) )  or ( string.find ( Hexs2, 'د' ) )  or ( string.find ( Hexs2, 'ئ' ) )  or ( string.find ( Hexs2, 'و' ) ) or ( string.find ( Hexs2, 'ً' ) )  or ( string.find ( Hexs2, 'ٌ' ) )  or ( string.find ( Hexs2, 'ٍ' ) )  or ( string.find ( Hexs2, 'ريال' ) )  or ( string.find ( Hexs2, '،' ) )  or ( string.find ( Hexs2, '؛' ) )  or ( string.find ( Hexs2, 'َ' ) )  or ( string.find ( Hexs2, 'ُ' ) )  or ( string.find ( Hexs2, 'ِ' ) )  or ( string.find ( Hexs2, 'ّ' ) )  or ( string.find ( Hexs2, 'ۀ' ) )  or ( string.find ( Hexs2, 'آ' ) )  or ( string.find ( Hexs2, 'ـ' ) )  or ( string.find ( Hexs2, '«' ) )  or ( string.find ( Hexs2, '»' ) )  or ( string.find ( Hexs2, 'ة' ) )  or ( string.find ( Hexs2, 'ي' ) )  or ( string.find ( Hexs2, 'ژ' ) )  or ( string.find ( Hexs2, 'ؤ' ) )  or ( string.find ( Hexs2, 'إ' ) )  or ( string.find ( Hexs2, 'أ' ) )  or ( string.find ( Hexs2, 'ء' ) )  or ( string.find ( Hexs2, 'پ' ) )  or ( string.find ( Hexs2, '؟' ) ) then
            exports["notf"]:addNotification("Tedad Bayad Shamel Addad Bashad. Dar On Nemitavan Az Horof Farsi Estefade Kar!", "error")
            return false
        end
		--To New Name English Nabashe
        if  string.find ( Hexs2, 'q' ) or string.find ( Hexs2, 'w' ) or string.find ( Hexs2, 'e' ) or string.find ( Hexs2, 'r' ) or string.find ( Hexs2, 't' ) or string.find ( Hexs2, 'y' ) or string.find ( Hexs2, 'u' ) or string.find ( Hexs2, 'i' ) or string.find ( Hexs2, 'o' ) or string.find ( Hexs2, 'p' ) or string.find ( Hexs2, 'a' ) or string.find ( Hexs2, 's' ) or string.find ( Hexs2, 'd' ) or string.find ( Hexs2, 'f' ) or string.find ( Hexs2, 'g' ) or string.find ( Hexs2, 'h' ) or string.find ( Hexs2, 'j' ) or string.find ( Hexs2, 'k' ) or string.find ( Hexs2, 'l' ) or string.find ( Hexs2, 'z' ) or string.find ( Hexs2, 'x' ) or string.find ( Hexs2, 'c' ) or string.find ( Hexs2, 'v' ) or string.find ( Hexs2, 'b' ) or string.find ( Hexs2, 'n' ) or string.find ( Hexs2, 'm' ) or string.find ( Hexs2, 'Q' ) or string.find ( Hexs2, 'W' ) or string.find ( Hexs2, 'E' ) or string.find ( Hexs2, 'R' ) or string.find ( Hexs2, 'T' ) or string.find ( Hexs2, 'Y' ) or string.find ( Hexs2, 'U' ) or string.find ( Hexs2, 'I' ) or string.find ( Hexs2, 'O' ) or string.find ( Hexs2, 'P' ) or string.find ( Hexs2, 'A' ) or string.find ( Hexs2, 'S' ) or string.find ( Hexs2, 'D' ) or string.find ( Hexs2, 'F' ) or string.find ( Hexs2, 'G' ) or string.find ( Hexs2, 'H' ) or string.find ( Hexs2, 'J' ) or string.find ( Hexs2, 'K' ) or string.find ( Hexs2, 'L' ) or string.find ( Hexs2, 'Z' ) or string.find ( Hexs2, 'X' ) or string.find ( Hexs2, 'C' ) or string.find ( Hexs2, 'V' ) or string.find ( Hexs2, 'B' ) or string.find ( Hexs2, 'N' ) or string.find ( Hexs2, 'M' ) then
            exports["notf"]:addNotification("Tedad Bayad Shamel Addad Bashad.Dar On Nemitavan Az Horof Engisi Estefade Kar!", "error")
            return false
        end
        -- To New Name Fasele Nabashe
        if ( string.find ( Hexs2, '%s' ) ) then
            exports["notf"]:addNotification("Estefade Az Fasele (Space) Baraye Name Sahih Nist!", "error")
            return false
        end
		triggerServerEvent("RequestSpllitGens",getLocalPlayer(),getLocalPlayer(),ActionSlot,guiGetText(BanFamTime) )
	elseif source == ForgItemx then
		triggerServerEvent("RequestForgItem",getLocalPlayer(),getLocalPlayer(),ActionSlot)
	elseif source == PutInCraftItemx then
		removeEventHandler("onClientRender",root,DrawCraftSystem) -- FIX: avoid stacking duplicate render handlers
		addEventHandler("onClientRender",root,DrawCraftSystem)
		if itemcraft1 == 0 then
			itemcraft1 = ClientTable[TPlayer][tonumber(ActionSlot)]["Item"]
			itemcraftis[1] = ActionSlot
		elseif itemcraft2 == 0 then
			itemcraft2 = ClientTable[TPlayer][tonumber(ActionSlot)]["Item"]
			itemcraftis[2] = ActionSlot
		elseif itemcraft3 == 0 then
			itemcraft3 = ClientTable[TPlayer][tonumber(ActionSlot)]["Item"]
			itemcraftis[3] = ActionSlot
		end

	else
		guiSetProperty(ActionsBG,"Visible","False")
	
	end
	if button == "left" and source ~= DeleteItemx then
		guiSetEnabled( ForgItemx, false )
		guiSetEnabled( SellItemx, false )
		sureitems[getLocalPlayer()] = false
		
		guiSetEnabled( SpllitItemx, false )
		guiSetProperty(ActionsBG,"Visible","False")
		if IsItemSlot[source] then
			if tonumber(items[IsItemSlot[source]]) >= 1 then
				if not attachedGUI then
					local x,y = getCursorPosition()
					guiSetProperty(ActionsBG,"Visible","True")
					guiSetPosition(ActionsBG,0.9,0.17,true)
					guiSetProperty(ActionsBG,"AlwaysOnTop","True")
					ActionSlot = IsSlot[source]

					if ForCraft[ClientTable[TPlayer][tonumber(ActionSlot)]["Item"]] then
						guiSetEnabled(PutInCraftItemx,true)
					else
						guiSetEnabled(PutInCraftItemx,false)
					end
					if Focore[ClientTable[TPlayer][tonumber(ActionSlot)]["Item"]] then
						guiSetEnabled( ForgItemx, true )
					else
						guiSetEnabled( ForgItemx, false )
					end
					if not ItemForUse[ClientTable[TPlayer][tonumber(ActionSlot)]["Item"]] then
						guiSetEnabled( UseItemx, false )
					end
					if guiGetText(Amounts[ActionSlot]) ~= "" then
						guiSetEnabled( SpllitItemx, true )
					end
					if fishes[ClientTable[TPlayer][tonumber(ActionSlot)]["Item"]] then
						guiSetEnabled( SellItemx, true )
						guiSetEnabled( UseItemx, false )
					elseif Gens[ClientTable[TPlayer][tonumber(ActionSlot)]["Item"]] then
						guiSetEnabled( UseItemx, false )
						guiSetEnabled( SellItemx, true )
					elseif ItemForUse[ClientTable[TPlayer][tonumber(ActionSlot)]["Item"]] then
						guiSetEnabled( SellItemx, false )
						guiSetEnabled( UseItemx, true )
					end
				end
			end
		end
	end
end)

local x,y = guiGetScreenSize()
function panelinventory()
	if not spamtimer[getLocalPlayer()] then
		if guiGetProperty(InventoryBG,"Visible") == "False" then
			spamtimer[getLocalPlayer()] = setTimer(function()
				spamtimer[getLocalPlayer()] = nil
			end,500,1)
			itemcraft1 = 0 
			itemcraft2 = 0
			itemcraft3 = 0
			-- FIX (bugfix pass 3): F2 sometimes refused to open.
			--   The client used to reveal InventoryBGFull here, but the server
			--   silently drops RequestShowInventory while its own 500ms anti-flood
			--   timer (InvTimer) is running. When that happened InventoryBG never
			--   became "True", so the panel stayed half-open and F2 appeared dead
			--   until something else reset it. The frame is now shown only once
			--   the server answers (see ShowInventoryForPlayer).
			inventoryPending = true
			itemcraftis[1] = false
			itemcraftis[2] = false
			itemcraftis[3] = false
			triggerServerEvent("RequestShowInventory",getLocalPlayer(),getLocalPlayer())
			occupiedGUI = nil
			occupiedSlot = nil
			attachedGUI = nil
			local sound = playSound("Sounds/open.m4a")
		else
			
			spamtimer[getLocalPlayer()] = setTimer(function()
				spamtimer[getLocalPlayer()] = nil
			end,500,1)
			showCursor(false)
			removeEventHandler("onClientRender",root,DrawCraftSystem)
			
			guiSetVisible( InventoryBGFull, false )
			guiSetProperty(InventoryBG,"Visible","False")
			guiSetProperty(ActionsBG,"Visible","False")
			showChat(true)
			hideALL = false
			if occupiedGUI and attachedGUI then
				bekanAzJa()
			end
		end
	end
end
bindKey("F2","down",panelinventory)

-- FIX (bugfix pass 3): recovery path for F2.
--   The server refuses RequestShowInventory while its anti-flood timer runs or
--   before the player is logged in. Without an answer the client used to sit in
--   a pending state with the panel half-open and F2 doing nothing.
addEvent("InventoryOpenRefused", true)
addEventHandler("InventoryOpenRefused", localPlayer, function()
	inventoryPending = nil
	if isElement(InventoryBGFull) then guiSetVisible(InventoryBGFull, false) end
	if isElement(InventoryBG) then guiSetProperty(InventoryBG, "Visible", "False") end
	showCursor(false)
	showChat(true)
	hideALL = false
	-- clear the client-side spam guard too, so the next F2 press works
	if spamtimer[getLocalPlayer()] then
		if isTimer(spamtimer[getLocalPlayer()]) then killTimer(spamtimer[getLocalPlayer()]) end
		spamtimer[getLocalPlayer()] = nil
	end
end)

-- FIX (bugfix pass 3): safety net -- if a request is left pending for more than
--   3 seconds (dropped packet, server error, resource restart), unstick F2.
setTimer(function()
	if inventoryPending then
		inventoryPending = nil
		if isElement(InventoryBGFull) and guiGetVisible(InventoryBGFull)
		   and isElement(InventoryBG) and guiGetProperty(InventoryBG,"Visible") == "False" then
			guiSetVisible(InventoryBGFull, false)
			showCursor(false)
			showChat(true)
			hideALL = false
		end
	end
end, 3000, 0)
function bekanAzJa()
	if occupiedGUI and attachedGUI then
		occupiedGUI = nil
	end
end


LastColor = 0

addEventHandler("onClientRender",root,function()
	if attachedGUI then
		local x,y = getCursorPosition()
		guiSetPosition(attachedGUI,x-0.05,y-0.05,true)
	end
	

	for i=1,55 do
		if Amounts[i] then

			guiLabelSetColor(Amounts[i], 255,255,255)  

		end
	end
end)


addEvent("createEffectForMe",true)
addEventHandler("createEffectForMe",getRootElement(),function(thePlayer,x,y,z,forki)
	if forki == "box" then
		createEffect("explosion_large", x,y,z, 0, 0, 0)
	end
end)

pSound = {}

addEvent("playRingtone",true)
addEventHandler("playRingtone",getRootElement(),function(thePlayer,ringID)
	if pSound[thePlayer] then
		if isElement(pSound[thePlayer]) then
			stopSound(pSound[thePlayer])
			pSound[thePlayer] = nil
		end
	end	
	pSound[thePlayer] = playSound3D("Sounds/Ring"..ringID..".mp3",0,0,0,true)
	setSoundMaxDistance(pSound[thePlayer],15)
	attachElements(pSound[thePlayer],thePlayer)
	setSoundVolume(pSound[thePlayer],0.8)
end)

addEvent("stopRingtone",true)
addEventHandler("stopRingtone",getRootElement(),function(thePlayer)
	if pSound[thePlayer] then
		if isElement(pSound[thePlayer]) then
			stopSound(pSound[thePlayer])
			pSound[thePlayer] = nil
		end
	end
end)

--[[local anim = nil 
local anim = engineLoadIFP ("assets/animations.ifp", "fishanimifp")

engineImportTXD(engineLoadTXD("assets/1246.txd"),1246)
engineReplaceModel(engineLoadDFF("assets/1246.dff", 1246), 1246)

function syncAnimationClient (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "fish1" or animation == "fish2" or animation == "fish3" or animation == "fish4" or animation == "fish5" 
		or animation == "fish6" or animation == "fish7" or animation == "fish8" or animation == "fish9" or animation == "fish10"
		or animation == "fish11" or animation == "fish12" or animation == "fish13" then
			for i = 1,3 do
				setPedAnimation(ped, "fishanimifp", animation, tiempo, repetir, mover, interrumpible)
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end
addEvent("fishing:syncAnimation",true)
addEventHandler("fishing:syncAnimation",getRootElement(),syncAnimationClient)]]

fishWindow = guiCreateWindow(0.22, 0.16, 0.55, 0.69, "Fishing", true)
guiWindowSetMovable(fishWindow, false)
guiWindowSetSizable(fishWindow, false)
guiSetAlpha(fishWindow, 1.00)

fishIcon = guiCreateStaticImage(0.01, 0.22, 0.13, 0.19, "Items/32.png", true, fishWindow)
fishCircle = guiCreateStaticImage(0.37, 0.14, 0.27, 0.32, "assets/fish1.png", true, fishWindow)
fishCancel = guiCreateButton(0.02, 0.89, 0.12, 0.08, "Cancel", true, fishWindow)
local font0_font1 = guiCreateFont("assets/font1.ttf", 10)
guiSetFont(fishCancel, font0_font1)
guiSetProperty(fishCancel, "NormalTextColour", "FFFF0000")
fishBtn = guiCreateLabel(0.41, 0.53, 0.18, 0.24, "K", true, fishWindow)
local font1_font1 = guiCreateFont("assets/font1.ttf", 61)
guiSetFont(fishBtn, font1_font1)
guiLabelSetHorizontalAlign(fishBtn, "center", false)
guiLabelSetVerticalAlign(fishBtn, "center")


guiSetVisible(fishWindow,false)

fishes = {
	[4] = {"Mahie Sefid",0.001,950},
	[30] = {"Khaviar",0.05,18000},
	[31] = {"Mahie Ghermez",0.008,750},
	[32] = {"Mahie Kapoor",0.001,900},
	[33] = {"Ghezel Ala",0.01,7000},
	[34] = {"Mahie Oscar",0.007,2000},
	[35] = {"Meygoo",0.03,14000},
	[36] = {"Setare Daryaei",0.008,5000},
	
}

fishRounds = 0
myFish = 0

addEvent("toggleFishingWindow",true)
addEventHandler("toggleFishingWindow",getLocalPlayer(),function(p,booling,randomkey,fishid)
	guiSetVisible(fishWindow,booling)
	showCursor(booling)
	
	fishingMovingFrq = fishes[fishid][2]
	myFish = tonumber(fishid)
	guiStaticImageLoadImage(fishIcon,"Items/"..fishid..".png")
	
	guiSetPosition(fishIcon,0.01, 0.22,true)
	
	if randomkey then
		nowKey = randomkey
		guiSetText(fishBtn,nowKey)
		for i,v in ipairs({"K","J","K","O","N","B","H","G","R","U"}) do
			unbindKey(v,"down",doFishing)
		end
		
		bindKey(nowKey,"down",doFishing)
	end
	
	if booling == true then
		startFishing()
	end
end)


function startFishing()
	removeEventHandler("onClientRender",root,iconBecomingRight) -- FIX: avoid stacking duplicate render handlers
	addEventHandler("onClientRender",root,iconBecomingRight)
end
 -- 0.386 - 0.495
fishingMovingFrq = 0.05







myFishingSound = {}




is = {}
addEvent("playItemSound",true)
addEventHandler("playItemSound",getRootElement(),function(thePlayer,itemid)
	if is[thePlayer] then
		if isElement(is[thePlayer]) then
			stopSound(is[thePlayer])
		end
		is[thePlayer] = nil
	end
	
	is[thePlayer] = playSound3D("itemsound/"..itemid..".mp3",0,0,0,false)
	setSoundVolume(is[thePlayer],2.00)
	setSoundMaxDistance(is[thePlayer],80)
	attachElements(is[thePlayer],thePlayer)
end)


function weaponSyncer(wep, ammo, clip, px, py, pz, car)
	if wep and px and py and pz and car then
		if getElementType(car) then
			triggerServerEvent("syncWeaponItem", resourceRoot, source,wep,px, py, pz, car)
		end
	end
end
addEventHandler ("onClientPlayerWeaponFire", getRootElement(), weaponSyncer)



monitor1 = guiCreateStaticImage(0.16, 0.08, 0.70, 0.85, "assets/monitor.png", true)
monitorbg = guiCreateStaticImage(0.09, 0.055, 0.82, 0.69, "assets/bg2.png", true, monitor1)
monitortabs = guiCreateTabPanel(0.01, 0.01, 0.98, 0.97, true, monitorbg)
Credits2 = guiCreateTab("Kharide Sharj", monitortabs)
creditscroll = guiCreateScrollPane(0.02, 0.01, 1.00, 1.00, true, Credits2)
closebtn = guiCreateButton(0.02, 0.95, 0.12, 0.09, "Bastan", true, creditscroll)
guiSetFont(closebtn, "default-bold-small")
guiSetProperty(closebtn, "NormalTextColour", "FFFF0000")
kharidbtn = guiCreateButton(0.15, 0.95, 0.12, 0.09, "Kharid", true, creditscroll)
guiSetFont(kharidbtn, "default-bold-small")
guiSetProperty(kharidbtn, "NormalTextColour", "FF10EF5E")
daryaftcode = guiCreateButton(0.28, 0.95, 0.19, 0.09, "Daryaft Code", true, creditscroll)
guiSetFont(daryaftcode, "default-bold-small")
guiSetProperty(daryaftcode, "NormalTextColour", "FF10EF5E")
sharjbox = guiCreateComboBox(0.02, 0.1, 0.27, 0.44, "Entekhabe Sharj", true, creditscroll)

sharjList = {[0] = 2000,[1] = 5000,[2] = 8000,[3] = 10000,[4] = 50000,[5] = 100000}

for i=0,#sharjList do
	guiComboBoxAddItem(sharjbox, "$"..sharjList[i].."")
end


yourcredit = guiCreateLabel(0.02, 0.80, 0.60, 0.08, "Mojoodie Shoma: $0", true, creditscroll) 

guiSetVisible(monitor1,false)

addEvent("toggleMokhaberatPage",true)
addEventHandler("toggleMokhaberatPage",getLocalPlayer(),function(thePlayer,booling,credit2)
	guiSetVisible(monitor1,booling)
	showCursor(booling)
	guiSetText(yourcredit,"Mojoodie Shoma : $"..credit2.."")
	guiComboBoxSetSelected(sharjbox,-1)
end)


addEventHandler("onClientGUIClick",getRootElement(),function()
	if source == kharidbtn then
		local wish = tonumber(guiComboBoxGetSelected(sharjbox))
		if wish >= 0 then
			triggerServerEvent("requestbuysharj",getLocalPlayer(),getLocalPlayer(),sharjList[wish])
		else
			notfSys:addNotification("Lotfan yek Gozine ra Entekhab Namaeid!","warning")
		end
	elseif source == daryaftcode then
		local wish = tonumber(guiComboBoxGetSelected(sharjbox))
		if wish >= 0 then
			triggerServerEvent("requestsharjcode",getLocalPlayer(),getLocalPlayer(),sharjList[wish])
		else
			notfSys:addNotification("Lotfan yek Gozine ra Entekhab Namaeid!","warning")
		end
	elseif source == closebtn then
		guiSetVisible(monitor1,false)
		showCursor(false)
	end
end)




ccbg = guiCreateWindow(0.35, 0.32, 0.30, 0.32, "Credit Code", true)
guiWindowSetMovable(ccbg, false)
guiWindowSetSizable(ccbg, false)
guiSetAlpha(ccbg, 1.00)

cclabel = guiCreateLabel(0.05, 0.14, 0.90, 0.22, "Code Sharje Khod ra Dar Kadre Zir Vared Konid!", true, ccbg)
guiLabelSetHorizontalAlign(cclabel, "center", false)
guiLabelSetVerticalAlign(cclabel, "center")
ccedit = guiCreateEdit(0.16, 0.41, 0.68, 0.12, "", true, ccbg)
ccsubmit = guiCreateButton(0.18, 0.57, 0.20, 0.12, "Submit", true, ccbg)
cccancel = guiCreateButton(0.62, 0.57, 0.20, 0.12, "Cancel", true, ccbg)

guiSetVisible(ccbg,false)

addEvent("togglesharjpanel",true)
addEventHandler("togglesharjpanel",getLocalPlayer(),function(thePlayer,booling,credit2)
	guiSetVisible(ccbg,booling)
	showCursor(booling)
	guiSetText(ccedit,"")
end)


addEventHandler("onClientGUIClick",getRootElement(),function()
	if source == ccsubmit then
		local wish = tostring(guiGetText(ccedit))
		if #wish >= 1 and not string.find(wish," ") then
			triggerServerEvent("requestusesharj",getLocalPlayer(),getLocalPlayer(),wish)
		else
			notfSys:addNotification("Lotfan yek Code Sahih Vared Namaeid!","warning")
		end
	elseif source == cccancel then
		guiSetVisible(ccbg,false)
		showCursor(false)
	end
end)


-- Ghavasi 


local screenW, screenH = guiGetScreenSize()


GhavasBG = guiCreateStaticImage((screenW - 667) / 2, (screenH - 400) / 2, 700, 500, "files/Ghavasi_BG.png", false)
 

Kandan = guiCreateStaticImage(467,299, 184, 61, "files/Kandan.png", false, GhavasBG)
Pooshidan = guiCreateStaticImage(467,144, 176, 61, "files/Pooshidan.png", false , GhavasBG )
Porkardan = guiCreateStaticImage(467,220, 184, 61, "files/Porkardan.png", false, GhavasBG)
Close = guiCreateStaticImage(625,18, 50, 50, "files/Close.png", false, GhavasBG)
--Oxygen = guiCreateStaticImage(900, 50, 50, 50, "files/Oxygen.png", false)
guiSetProperty(GhavasBG, "Visible", "false")

function ShowGhavasPanelf(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(GhavasBG , "Visible", "True")
		showCursor(true)
	end
end
addEvent("ShowGhavasPanel",true)
addEventHandler("ShowGhavasPanel", root, ShowGhavasPanelf)

GhavasBodan = false
OxygenZiad = false
addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == Close then
		guiSetProperty(GhavasBG, "Visible", "False")
		showCursor(false)
	elseif source == Pooshidan then
		if GhavasBodan == false then
			triggerServerEvent("GhavasSho", getLocalPlayer(), getLocalPlayer() )
			triggerServerEvent("setStat", getLocalPlayer(), getLocalPlayer() )
			exports["notf"]:addNotification("Shoma Ghavas Shodid!", "success")
			outputChatBox("#cdcdcd[Ghavasi]#ffffff Ba Dokme ((e)) Mitavanid Ashia Ra Az Zir Ab Jam Konid!",255,255,255,true)
        	GhavasBodan = true
			--guiSetProperty(GhavasBG, "Visible", "False")
			--showCursor(false)
		else 
			exports["notf"]:addNotification("Shoma Dar Hal'e Hazer Ghavas Hastid!", "error")
		end

    elseif source == Kandan then 
		if GhavasBodan == true then 
			
        	triggerServerEvent("GhavasNSho", getLocalPlayer(), getLocalPlayer() )
			triggerServerEvent("cancelStat", getLocalPlayer(), getLocalPlayer() )
        	GhavasBodan = false
			exports["notf"]:addNotification("Shoma Az Ghavasi Kharej Shodid", "success")
			guiSetProperty(GhavasBG, "Visible", "False")
			showCursor(false)
		else 
			exports["notf"]:addNotification("Shoma Ke Ghavas Nistid!", "error")
		end
	elseif source == Porkardan then
		if GhavasBodan == true then 
			if OxygenZiad == false then
        		OxygenZiad = true
				exports["notf"]:addNotification("Shoma Oxygen Ezafi Be Gheimat $2500 Kharidari Kardid!!", "success")
				takePlayerMoney( 2500)
				outputChatBox("#cdcdcd[Ghavasi]#ffffff Ba Dokme ((c)) Mitavanid Az Kapsol Khod Estefade Konid Ra Az Zir Ab Jam Konid!",255,255,255,true)
				guiSetProperty(GhavasBG, "Visible", "False")
				showCursor(false)
			else 
				exports["notf"]:addNotification("Shoma Az Ghabl Oxygen Kharidari Kardid!!", "error")
			end
		else 
			exports["notf"]:addNotification("Shoma Ghavas Nistid!", "error")
			
		end

	end

end)








function SelfmadeHUD()
    if GhavasBodan == true then
	    local screenX, screenY = guiGetScreenSize()
        local standartX, standartY = 1920, 1080
        local sx, sy = screenX / standartX, screenY / standartY
		
	    oxygene=getPedOxygenLevel(getLocalPlayer())
	    
	    
	
	--if isElementInWater(getLocalPlayer()) then
	--dxDrawRectangle(1400*sx, 80*sy, 300*sx, 50*sy, tocolor(healthColor[1], healthColor[2], healthColor[3], 120),false)--OXYGEN Bar
	    --dxDrawRectangle(500*sx, 800*sy, 300/2430*oxygene, 42*sy, tocolor(0, 200, 200, 200),true)--OXYGEN Progress
		dxDrawRectangle(1630*sx, 1000*sy, 50*sx, 300/-3200*oxygene, tocolor(0, 200, 200, 200),true)
	    dxDrawImage(1605*sx, 600*sy, 160*sx, 418*sy, "Files/Oxygen.png", 0, 0, 0, tocolor(255, 255, 255, 255))
	    --dxDrawText("Oxygen • "..math.floor(oxygene/10).." %", 3450*sx, 92*sy, 100*sx, 15*sy, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "top", false, false, true, true, false)
	--end
		
		
	
    end
	
	
end
removeEventHandler("onClientRender",root,SelfmadeHUD) -- FIX: avoid stacking duplicate render handlers
addEventHandler("onClientRender",root,SelfmadeHUD)



---Oxygen---

function OxygenEzaf(button1 ,press1)
	if (press1) then
		if button1 == "c" then
			if GhavasBodan == true then
				if OxygenZiad == true then
					local maxOxygen = math.floor ( 1000 + getPedStat ( localPlayer, 22 ) * 1.5 + getPedStat ( localPlayer, 225 ) * 1.5 )
					setPedOxygenLevel ( localPlayer, maxOxygen )
					outputChatBox("#ff0000Shoma Oxygen Ezafi Khod Ra Estefade Kardid!", 255,255,255,true)
					OxygenZiad = false
				end
			end 
		end 
	end 
end

addEventHandler("onClientKey",root,OxygenEzaf)
-----------





local tomarkerhastsh1 = false 
local tomarkerhastsh2 = false
local tomarkerhastsh3 = false 
local tomarkerhastsh4 = false 
local tomarkerhastsh5 = false 
local tomarkerhastsh6 = false 
local tomarkerhastsh7 = false 
local tomarkerhastsh8 = false 
local tomarkerhastsh9 = false 
local tomarkerhastsh10 = false 
local tomarkerhastsh11 = false 
local tomarkerhastsh12 = false 
local tomarkerhastsh13 = false 
local tomarkerhastsh14 = false 
local tomarkerhastsh15 = false 
local tomarkerhastsh16 = false 
local tomarkerhastsh17 = false 
local tomarkerhastsh18 = false 
local tomarkerhastsh19 = false 
local tomarkerhastsh20 = false 
local tomarkerhastsh21 = false 
local tomarkerhastsh22 = false 
local tomarkerhastsh23 = false 
local tomarkerhastsh24 = false 
local tomarkerhastsh25 = false 
local tomarkerhastsh26 = false 
local tomarkerhastsh27 = false 
local tomarkerhastsh28 = false 
local tomarkerhastsh29 = false 
local tomarkerhastsh30 = false 
local tomarkerhastsh31 = false 
local tomarkerhastsh32 = false 
local tomarkerhastsh33 = false 
local tomarkerhastsh34 = false 
local tomarkerhastsh35 = false 
local tomarkerhastsh36 = false 
local tomarkerhastsh37 = false 
local tomarkerhastsh38 = false 
local tomarkerhastsh39 = false 
local tomarkerhastsh40 = false 
local tomarkerhastsh41 = false 
local tomarkerhastsh42 = false 
local tomarkerhastsh43 = false 
local tomarkerhastsh44 = false 
local tomarkerhastsh45 = false 
local tomarkerhastsh46 = false 
local tomarkerhastsh47 = false 
local tomarkerhastsh48 = false 
local tomarkerhastsh49 = false 
local tomarkerhastsh50 = false 
local tomarkerhastsh51 = false 




addEvent("LoginMarker1",true)
addEventHandler("LoginMarker1",getLocalPlayer(),function()

 
	tomarkerhastsh1 = true 
end)

addEvent("LeaveMarker1",true)
addEventHandler("LeaveMarker1",getLocalPlayer(),function()

	 
	tomarkerhastsh1 = false 

end)

addEvent("LoginMarker2",true)
addEventHandler("LoginMarker2",getLocalPlayer(),function()

 
	tomarkerhastsh2 = true 
end)

addEvent("LeaveMarker2",true)
addEventHandler("LeaveMarker2",getLocalPlayer(),function()

	 
	tomarkerhastsh2 = false 

end)
---------
addEvent("LoginMarker3",true)
addEventHandler("LoginMarker3",getLocalPlayer(),function()

 
	tomarkerhastsh3 = true 
end)

addEvent("LeaveMarker3",true)
addEventHandler("LeaveMarker3",getLocalPlayer(),function()

	 
	tomarkerhastsh3 = false 

end)

addEvent("LoginMarker4",true)
addEventHandler("LoginMarker4",getLocalPlayer(),function()

 
	tomarkerhastsh4 = true 
end)

addEvent("LeaveMarker4",true)
addEventHandler("LeaveMarker4",getLocalPlayer(),function()

	 
	tomarkerhastsh4 = false 

end)
----------
addEvent("LoginMarker5",true)
addEventHandler("LoginMarker5",getLocalPlayer(),function()

 
	tomarkerhastsh5 = true 
end)

addEvent("LeaveMarker5",true)
addEventHandler("LeaveMarker5",getLocalPlayer(),function()

	 
	tomarkerhastsh5 = false 

end)

addEvent("LoginMarker6",true)
addEventHandler("LoginMarker6",getLocalPlayer(),function()

 
	tomarkerhastsh6 = true 
end)

addEvent("LeaveMarker6",true)
addEventHandler("LeaveMarker6",getLocalPlayer(),function()

	 
	tomarkerhastsh6 = false 

end)
---------
addEvent("LoginMarker7",true)
addEventHandler("LoginMarker7",getLocalPlayer(),function()

 
	tomarkerhastsh7 = true 
end)

addEvent("LeaveMarker7",true)
addEventHandler("LeaveMarker7",getLocalPlayer(),function()

	 
	tomarkerhastsh7 = false 

end)

addEvent("LoginMarker8",true)
addEventHandler("LoginMarker8",getLocalPlayer(),function()

 
	tomarkerhastsh8 = true 
end)

addEvent("LeaveMarker8",true)
addEventHandler("LeaveMarker8",getLocalPlayer(),function()

	 
	tomarkerhastsh8 = false 

end)
----------
addEvent("LoginMarker9",true)
addEventHandler("LoginMarker9",getLocalPlayer(),function()

 
	tomarkerhastsh9 = true 
end)

addEvent("LeaveMarker9",true)
addEventHandler("LeaveMarker9",getLocalPlayer(),function()

	 
	tomarkerhastsh9 = false 

end)

addEvent("LoginMarker10",true)
addEventHandler("LoginMarker10",getLocalPlayer(),function()

 
	tomarkerhastsh10 = true 
end)

addEvent("LeaveMarker10",true)
addEventHandler("LeaveMarker10",getLocalPlayer(),function()

	 
	tomarkerhastsh10 = false 

end)
-----------
addEvent("LoginMarker11",true)
addEventHandler("LoginMarker11",getLocalPlayer(),function()

 
	tomarkerhastsh11 = true 
end)

addEvent("LeaveMarker11",true)
addEventHandler("LeaveMarker11",getLocalPlayer(),function()

	 
	tomarkerhastsh11 = false 

end)

addEvent("LoginMarker12",true)
addEventHandler("LoginMarker12",getLocalPlayer(),function()

 
	tomarkerhastsh12 = true 
end)

addEvent("LeaveMarker12",true)
addEventHandler("LeaveMarker12",getLocalPlayer(),function()

	 
	tomarkerhastsh12 = false 

end)
----------
addEvent("LoginMarker13",true)
addEventHandler("LoginMarker13",getLocalPlayer(),function()

 
	tomarkerhastsh13 = true 
end)

addEvent("LeaveMarker13",true)
addEventHandler("LeaveMarker13",getLocalPlayer(),function()

	 
	tomarkerhastsh13 = false 

end)

addEvent("LoginMarker14",true)
addEventHandler("LoginMarker14",getLocalPlayer(),function()

 
	tomarkerhastsh14 = true 
end)

addEvent("LeaveMarker14",true)
addEventHandler("LeaveMarker14",getLocalPlayer(),function()

	 
	tomarkerhastsh14 = false 

end)
------------
addEvent("LoginMarker15",true)
addEventHandler("LoginMarker15",getLocalPlayer(),function()

 
	tomarkerhastsh15 = true 
end)

addEvent("LeaveMarker15",true)
addEventHandler("LeaveMarker15",getLocalPlayer(),function()

	 
	tomarkerhastsh15 = false 

end)

addEvent("LoginMarker16",true)
addEventHandler("LoginMarker16",getLocalPlayer(),function()

 
	tomarkerhastsh16 = true 
end)

addEvent("LeaveMarker16",true)
addEventHandler("LeaveMarker16",getLocalPlayer(),function()

	 
	tomarkerhastsh16 = false 

end)
-------
addEvent("LoginMarker17",true)
addEventHandler("LoginMarker17",getLocalPlayer(),function()

 
	tomarkerhastsh17 = true 
end)

addEvent("LeaveMarker17",true)
addEventHandler("LeaveMarker17",getLocalPlayer(),function()

	 
	tomarkerhastsh17 = false 

end)

addEvent("LoginMarker18",true)
addEventHandler("LoginMarker18",getLocalPlayer(),function()

 
	tomarkerhastsh18 = true 
end)

addEvent("LeaveMarker18",true)
addEventHandler("LeaveMarker18",getLocalPlayer(),function()

	 
	tomarkerhastsh18 = false 

end)
--------
addEvent("LoginMarker19",true)
addEventHandler("LoginMarker19",getLocalPlayer(),function()

 
	tomarkerhastsh19 = true 
end)

addEvent("LeaveMarker19",true)
addEventHandler("LeaveMarker19",getLocalPlayer(),function()

	 
	tomarkerhastsh19 = false 

end)

addEvent("LoginMarker20",true)
addEventHandler("LoginMarker20",getLocalPlayer(),function()

 
	tomarkerhastsh20 = true 
end)

addEvent("LeaveMarker20",true)
addEventHandler("LeaveMarker20",getLocalPlayer(),function()

	 
	tomarkerhastsh20 = false 

end)
-------
addEvent("LoginMarker21",true)
addEventHandler("LoginMarker21",getLocalPlayer(),function()

 
	tomarkerhastsh21 = true 
end)

addEvent("LeaveMarker21",true)
addEventHandler("LeaveMarker21",getLocalPlayer(),function()

	 
	tomarkerhastsh21 = false 

end)

addEvent("LoginMarker22",true)
addEventHandler("LoginMarker22",getLocalPlayer(),function()

 
	tomarkerhastsh22 = true 
end)

addEvent("LeaveMarker22",true)
addEventHandler("LeaveMarker22",getLocalPlayer(),function()

	 
	tomarkerhastsh22 = false 

end)
----------
addEvent("LoginMarker23",true)
addEventHandler("LoginMarker23",getLocalPlayer(),function()

 
	tomarkerhastsh23 = true 
end)

addEvent("LeaveMarker23",true)
addEventHandler("LeaveMarker23",getLocalPlayer(),function()

	 
	tomarkerhastsh23 = false 

end)

addEvent("LoginMarker24",true)
addEventHandler("LoginMarker24",getLocalPlayer(),function()

 
	tomarkerhastsh24 = true 
end)

addEvent("LeaveMarker24",true)
addEventHandler("LeaveMarker24",getLocalPlayer(),function()

	 
	tomarkerhastsh24 = false 

end)
----------
addEvent("LoginMarker25",true)
addEventHandler("LoginMarker25",getLocalPlayer(),function()

 
	tomarkerhastsh25 = true 
end)

addEvent("LeaveMarker25",true)
addEventHandler("LeaveMarker25",getLocalPlayer(),function()

	 
	tomarkerhastsh25 = false 

end)

addEvent("LoginMarker26",true)
addEventHandler("LoginMarker26",getLocalPlayer(),function()

 
	tomarkerhastsh26 = true 
end)

addEvent("LeaveMarker26",true)
addEventHandler("LeaveMarker26",getLocalPlayer(),function()

	 
	tomarkerhastsh26 = false 

end)
----------
addEvent("LoginMarker27",true)
addEventHandler("LoginMarker27",getLocalPlayer(),function()

 
	tomarkerhastsh27 = true 
end)

addEvent("LeaveMarker27",true)
addEventHandler("LeaveMarker27",getLocalPlayer(),function()

	 
	tomarkerhastsh27 = false 

end)

addEvent("LoginMarker28",true)
addEventHandler("LoginMarker28",getLocalPlayer(),function()

 
	tomarkerhastsh28 = true 
end)

addEvent("LeaveMarker28",true)
addEventHandler("LeaveMarker28",getLocalPlayer(),function()

	 
	tomarkerhastsh28 = false 

end)
------------------
addEvent("LoginMarker29",true)
addEventHandler("LoginMarker29",getLocalPlayer(),function()

 
	tomarkerhastsh29 = true 
end)

addEvent("LeaveMarker29",true)
addEventHandler("LeaveMarker29",getLocalPlayer(),function()

	 
	tomarkerhastsh29 = false 

end)

addEvent("LoginMarker30",true)
addEventHandler("LoginMarker30",getLocalPlayer(),function()

 
	tomarkerhastsh30 = true 
end)

addEvent("LeaveMarker30",true)
addEventHandler("LeaveMarker30",getLocalPlayer(),function()

	 
	tomarkerhastsh30 = false 

end)
-------------
addEvent("LoginMarker31",true)
addEventHandler("LoginMarker31",getLocalPlayer(),function()

 
	tomarkerhastsh31 = true 
end)

addEvent("LeaveMarker31",true)
addEventHandler("LeaveMarker31",getLocalPlayer(),function()

	 
	tomarkerhastsh31 = false 

end)

addEvent("LoginMarker32",true)
addEventHandler("LoginMarker32",getLocalPlayer(),function()

 
	tomarkerhastsh32 = true 
end)

addEvent("LeaveMarker32",true)
addEventHandler("LeaveMarker32",getLocalPlayer(),function()

	 
	tomarkerhastsh32 = false 

end)
--------
addEvent("LoginMarker33",true)
addEventHandler("LoginMarker33",getLocalPlayer(),function()

 
	tomarkerhastsh33 = true 
end)

addEvent("LeaveMarker33",true)
addEventHandler("LeaveMarker33",getLocalPlayer(),function()

	 
	tomarkerhastsh33 = false 

end)

addEvent("LoginMarker34",true)
addEventHandler("LoginMarker34",getLocalPlayer(),function()

 
	tomarkerhastsh34 = true 
end)

addEvent("LeaveMarker34",true)
addEventHandler("LeaveMarker34",getLocalPlayer(),function()

	 
	tomarkerhastsh34 = false 

end)
-----------
addEvent("LoginMarker35",true)
addEventHandler("LoginMarker35",getLocalPlayer(),function()

 
	tomarkerhastsh35 = true 
end)

addEvent("LeaveMarker35",true)
addEventHandler("LeaveMarker35",getLocalPlayer(),function()

	 
	tomarkerhastsh35 = false 

end)

addEvent("LoginMarker36",true)
addEventHandler("LoginMarker36",getLocalPlayer(),function()

 
	tomarkerhastsh36 = true 
end)

addEvent("LeaveMarker36",true)
addEventHandler("LeaveMarker36",getLocalPlayer(),function()

	 
	tomarkerhastsh36 = false 

end)
-----------
addEvent("LoginMarker37",true)
addEventHandler("LoginMarker37",getLocalPlayer(),function()

 
	tomarkerhastsh37 = true 
end)

addEvent("LeaveMarker37",true)
addEventHandler("LeaveMarker37",getLocalPlayer(),function()

	 
	tomarkerhastsh37 = false 

end)

addEvent("LoginMarker38",true)
addEventHandler("LoginMarker38",getLocalPlayer(),function()

 
	tomarkerhastsh38 = true 
end)

addEvent("LeaveMarker38",true)
addEventHandler("LeaveMarker38",getLocalPlayer(),function()

	 
	tomarkerhastsh38 = false 

end)
--------
addEvent("LoginMarker39",true)
addEventHandler("LoginMarker39",getLocalPlayer(),function()

 
	tomarkerhastsh39 = true 
end)

addEvent("LeaveMarker39",true)
addEventHandler("LeaveMarker39",getLocalPlayer(),function()

	 
	tomarkerhastsh39 = false 

end)

addEvent("LoginMarker40",true)
addEventHandler("LoginMarker40",getLocalPlayer(),function()

 
	tomarkerhastsh40 = true 
end)

addEvent("LeaveMarker40",true)
addEventHandler("LeaveMarker40",getLocalPlayer(),function()

	 
	tomarkerhastsh40 = false 

end)
---------
addEvent("LoginMarker41",true)
addEventHandler("LoginMarker41",getLocalPlayer(),function()

 
	tomarkerhastsh41 = true 
end)

addEvent("LeaveMarker41",true)
addEventHandler("LeaveMarker41",getLocalPlayer(),function()

	 
	tomarkerhastsh41 = false 

end)

addEvent("LoginMarker42",true)
addEventHandler("LoginMarker42",getLocalPlayer(),function()

 
	tomarkerhastsh42 = true 
end)

addEvent("LeaveMarker42",true)
addEventHandler("LeaveMarker42",getLocalPlayer(),function()

	 
	tomarkerhastsh42 = false 

end)
--------
addEvent("LoginMarker43",true)
addEventHandler("LoginMarker43",getLocalPlayer(),function()

 
	tomarkerhastsh43 = true 
end)

addEvent("LeaveMarker43",true)
addEventHandler("LeaveMarker43",getLocalPlayer(),function()

	 
	tomarkerhastsh43 = false 

end)

addEvent("LoginMarker44",true)
addEventHandler("LoginMarker44",getLocalPlayer(),function()

 
	tomarkerhastsh44 = true 
end)

addEvent("LeaveMarker44",true)
addEventHandler("LeaveMarker44",getLocalPlayer(),function()

	 
	tomarkerhastsh44 = false 

end)
--------------
addEvent("LoginMarker45",true)
addEventHandler("LoginMarker45",getLocalPlayer(),function()

 
	tomarkerhastsh45 = true 
end)

addEvent("LeaveMarker45",true)
addEventHandler("LeaveMarker45",getLocalPlayer(),function()

	 
	tomarkerhastsh45 = false 

end)

addEvent("LoginMarker46",true)
addEventHandler("LoginMarker46",getLocalPlayer(),function()

 
	tomarkerhastsh46 = true 
end)

addEvent("LeaveMarker46",true)
addEventHandler("LeaveMarker46",getLocalPlayer(),function()

	 
	tomarkerhastsh46 = false 

end)
--------------
addEvent("LoginMarker47",true)
addEventHandler("LoginMarker47",getLocalPlayer(),function()

 
	tomarkerhastsh47 = true 
end)

addEvent("LeaveMarker47",true)
addEventHandler("LeaveMarker47",getLocalPlayer(),function()

	 
	tomarkerhastsh47 = false 

end)

addEvent("LoginMarker48",true)
addEventHandler("LoginMarker48",getLocalPlayer(),function()

 
	tomarkerhastsh48 = true 
end)

addEvent("LeaveMarker48",true)
addEventHandler("LeaveMarker48",getLocalPlayer(),function()

	 
	tomarkerhastsh48 = false 

end)
--------------
addEvent("LoginMarker49",true)
addEventHandler("LoginMarker49",getLocalPlayer(),function()

 
	tomarkerhastsh49 = true 
end)

addEvent("LeaveMarker49",true)
addEventHandler("LeaveMarker49",getLocalPlayer(),function()

	 
	tomarkerhastsh49 = false 

end)

addEvent("LoginMarker50",true)
addEventHandler("LoginMarker50",getLocalPlayer(),function()

 
	tomarkerhastsh50 = true 
end)

addEvent("LeaveMarker50",true)
addEventHandler("LeaveMarker450",getLocalPlayer(),function()

	 
	tomarkerhastsh50 = false 

end)
----------------
addEvent("LoginMarker51",true)
addEventHandler("LoginMarker51",getLocalPlayer(),function()

 
	tomarkerhastsh51 = true 
end)

addEvent("LeaveMarker51",true)
addEventHandler("LeaveMarker51",getLocalPlayer(),function()

	 
	tomarkerhastsh51 = false 

end)

-----------------------End End-----------------------------------





--=============================================Create==================================
local Create = false
addEvent("CreateTrue1",true)
addEventHandler("CreateTrue1",getLocalPlayer(),function()

	 
	Create = true 

end)
addEvent("CreateFalse1",true)
addEventHandler("CreateFalse1",getLocalPlayer(),function()

	 
	Create = false 

end)








Box1 = false
Box2 = false
Box3 = false
Box4 = false
Box5 = false
Box6 = false
Box7 = false
Box8 = false
Box9 = false
Box10 = false
Box11 = false
Box12 = false
Box13 = false
Box14 = false
Box15 = false
Box16 = false
Box17 = false
Box18 = false
Box19 = false
Box20 = false
Box21 = false
Box22 = false
Box23 = false
Box24 = false
Box25 = false
Box26 = false
Box27 = false
Box28 = false
Box29 = false
Box30 = false
Box31 = false
Box32 = false
Box33 = false
Box34 = false
Box35 = false
Box36 = false
Box37 = false
Box38 = false
Box39 = false
Box40 = false
Box41 = false
Box42 = false
Box43 = false
Box44 = false
Box45 = false
Box46 = false
Box47 = false
Box48 = false
Box49 = false
Box50 = false
Box51 = false


function Sik(button ,press)
	if (press) then
		if button == "e" then
			if GhavasBodan == true then
				if tomarkerhastsh1 == true and Box1 == false then
					triggerServerEvent("Give1", getLocalPlayer(), getLocalPlayer() )
					bind = true	
					Box1 = true 
					setTimer(function()
				
						Box1 = false
					end,42000,1)
					
				elseif tomarkerhastsh2 == true and Box2 == false then 
					triggerServerEvent("Give2", getLocalPlayer(), getLocalPlayer() )
					Box2 = true 
					setTimer(function()
				
						Box2 = false
					end,42000,1)

				elseif tomarkerhastsh3 == true and Box3 == false then 
					triggerServerEvent("Give3", getLocalPlayer(), getLocalPlayer() )
					Box3 = true 
					setTimer(function()
				
						Box3 = false
					end,42000,1)

				elseif tomarkerhastsh4 == true and Box4 == false then 
					triggerServerEvent("Give4", getLocalPlayer(), getLocalPlayer() )
					Box4 = true 
					setTimer(function()
				
						Box4 = false
					end,42000,1)

				elseif tomarkerhastsh5 == true and Box5 == false then 
					triggerServerEvent("Give5", getLocalPlayer(), getLocalPlayer() )
					Box5 = true 
					setTimer(function()
				
						Box5 = false
					end,42000,1)

				elseif tomarkerhastsh6 == true and Box6 == false then 
					triggerServerEvent("Give6", getLocalPlayer(), getLocalPlayer() )
					Box6 = true 
					setTimer(function()
				
						Box6 = false
					end,42000,1)

				elseif tomarkerhastsh7 == true and Box7 == false then 
					triggerServerEvent("Give7", getLocalPlayer(), getLocalPlayer() )
					Box7 = true 
					setTimer(function()
				
						Box7 = false
					end,42000,1)

				elseif tomarkerhastsh8 == true and Box8 == false then 
					triggerServerEvent("Give8", getLocalPlayer(), getLocalPlayer() )
					Box8 = true 
					setTimer(function()
				
						Box8 = false
					end,42000,1)

				elseif tomarkerhastsh9 == true and Box9 == false then 
					triggerServerEvent("Give9", getLocalPlayer(), getLocalPlayer() )
					Box9 = true 
					setTimer(function()
				
						Box9 = false
					end,42000,1)

				elseif tomarkerhastsh10 == true and Box10 == false then 
					triggerServerEvent("Give10", getLocalPlayer(), getLocalPlayer() )
					Box10 = true 
					setTimer(function()
				
						Box10 = false
					end,42000,1)

				elseif tomarkerhastsh11 == true and Box11 == false then 
					triggerServerEvent("Give11", getLocalPlayer(), getLocalPlayer() )
					Box11 = true 
					setTimer(function()
				
						Box11 = false
					end,42000,1)

				elseif tomarkerhastsh12 == true and Box12 == false then 
					triggerServerEvent("Give12", getLocalPlayer(), getLocalPlayer() )
					Box12 = true 
					setTimer(function()
				
						Box12 = false
					end,42000,1)

				elseif tomarkerhastsh13 == true and Box13 == false then 
					triggerServerEvent("Give13", getLocalPlayer(), getLocalPlayer() )
					Box13 = true 
					setTimer(function()
				
						Box13 = false
					end,42000,1)

				elseif tomarkerhastsh14 == true and Box14 == false then 
					triggerServerEvent("Give14", getLocalPlayer(), getLocalPlayer() )
					Box14 = true 
					setTimer(function()
				
						Box14 = false
					end,42000,1)

				elseif tomarkerhastsh15 == true and Box15 == false then 
					triggerServerEvent("Give15", getLocalPlayer(), getLocalPlayer() )
					Box15 = true 
					setTimer(function()
				
						Box15 = false
					end,42000,1)

				elseif tomarkerhastsh16 == true and Box16 == false then 
					triggerServerEvent("Give16", getLocalPlayer(), getLocalPlayer() )
					Box16 = true 
					setTimer(function()
				
						Box16 = false
					end,42000,1)

				elseif tomarkerhastsh17 == true and Box17 == false then 
					triggerServerEvent("Give17", getLocalPlayer(), getLocalPlayer() )
					Box17 = true 
					setTimer(function()
				
						Box17 = false
					end,42000,1)

				elseif tomarkerhastsh18 == true and Box18 == false then 
					triggerServerEvent("Give18", getLocalPlayer(), getLocalPlayer() )
					Box18 = true 
					setTimer(function()
				
						Box18 = false
					end,42000,1)

				elseif tomarkerhastsh19 == true and Box19 == false then 
					triggerServerEvent("Give19", getLocalPlayer(), getLocalPlayer() )
					Box19 = true 
					setTimer(function()
				
						Box19 = false
					end,42000,1)

				elseif tomarkerhastsh20 == true and Box20 == false then 
					triggerServerEvent("Give20", getLocalPlayer(), getLocalPlayer() )
					Box20 = true 
					setTimer(function()
				
						Box20 = false
					end,42000,1)

				elseif tomarkerhastsh21 == true and Box21 == false then 
					triggerServerEvent("Give21", getLocalPlayer(), getLocalPlayer() )
					Box21 = true 
					setTimer(function()
				
						Box21 = false
					end,42000,1)

				elseif tomarkerhastsh22 == true and Box22 == false then 
					triggerServerEvent("Give2", getLocalPlayer(), getLocalPlayer() )
					Box22 = true 
					setTimer(function()
				
						Box22 = false
					end,42000,1)

				elseif tomarkerhastsh23 == true and Box23 == false then 
					triggerServerEvent("Give23", getLocalPlayer(), getLocalPlayer() )
					Box23 = true 
					setTimer(function()
				
						Box23 = false
					end,42000,1)

				elseif tomarkerhastsh24 == true and Box24 == false then 
					triggerServerEvent("Give24", getLocalPlayer(), getLocalPlayer() )
					Box24 = true 
					setTimer(function()
				
						Box24 = false
					end,42000,1)

				elseif tomarkerhastsh25 == true and Box25 == false then 
					triggerServerEvent("Give25", getLocalPlayer(), getLocalPlayer() )
					Box25 = true 
					setTimer(function()
				
						Box25 = false
					end,42000,1)

				elseif tomarkerhastsh26 == true and Box26 == false then 
					triggerServerEvent("Give26", getLocalPlayer(), getLocalPlayer() )
					Box26 = true 
					setTimer(function()
				
						Box26 = false
					end,42000,1)

				elseif tomarkerhastsh27 == true and Box27 == false then 
					triggerServerEvent("Give27", getLocalPlayer(), getLocalPlayer() )
					Box27 = true 
					setTimer(function()
				
						Box27 = false
					end,42000,1)

				elseif tomarkerhastsh28 == true and Box28 == false then 
					triggerServerEvent("Give28", getLocalPlayer(), getLocalPlayer() )
					Box28 = true 
					setTimer(function()
				
						Box28 = false
					end,42000,1)

				elseif tomarkerhastsh29 == true and Box2 == false then 
					triggerServerEvent("Give29", getLocalPlayer(), getLocalPlayer() )
					Box29 = true 
					setTimer(function()
				
						Box29 = false
					end,42000,1)

				elseif tomarkerhastsh30 == true and Box30 == false then 
					triggerServerEvent("Give30", getLocalPlayer(), getLocalPlayer() )
					Box30 = true 
					setTimer(function()
				
						Box30 = false
					end,42000,1)

				elseif tomarkerhastsh31 == true and Box31 == false then 
					triggerServerEvent("Give2", getLocalPlayer(), getLocalPlayer() )
					Box31 = true 
					setTimer(function()
				
						Box31 = false
					end,42000,1)

				elseif tomarkerhastsh32 == true and Box32 == false then 
					triggerServerEvent("Give32", getLocalPlayer(), getLocalPlayer() )
					Box32 = true 
					setTimer(function()
				
						Box32 = false
					end,42000,1)

				elseif tomarkerhastsh33 == true and Box33 == false then 
					triggerServerEvent("Give33", getLocalPlayer(), getLocalPlayer() )
					Box33 = true 
					setTimer(function()
				
						Box33 = false
					end,42000,1)

				elseif tomarkerhastsh34 == true and Box34 == false then 
					triggerServerEvent("Give34", getLocalPlayer(), getLocalPlayer() )
					Box34 = true 
					setTimer(function()
				
						Box34 = false
					end,42000,1)

				elseif tomarkerhastsh35 == true and Box35 == false then 
					triggerServerEvent("Give35", getLocalPlayer(), getLocalPlayer() )
					Box35 = true 
					setTimer(function()
				
						Box35 = false
					end,42000,1)

				elseif tomarkerhastsh36 == true and Box36 == false then 
					triggerServerEvent("Give36", getLocalPlayer(), getLocalPlayer() )
					Box36 = true 
					setTimer(function()
				
						Box36 = false
					end,42000,1)

				elseif tomarkerhastsh37 == true and Box37 == false then 
					triggerServerEvent("Give37", getLocalPlayer(), getLocalPlayer() )
					Box37 = true 
					setTimer(function()
				
						Box37 = false
					end,42000,1)

				elseif tomarkerhastsh38 == true and Box38 == false then 
					triggerServerEvent("Give38", getLocalPlayer(), getLocalPlayer() )
					Box38 = true 
					setTimer(function()
				
						Box38 = false
					end,42000,1)

				elseif tomarkerhastsh39 == true and Box39 == false then 
					triggerServerEvent("Give39", getLocalPlayer(), getLocalPlayer() )
					Box39 = true 
					setTimer(function()
				
						Box39 = false
					end,42000,1)

				elseif tomarkerhastsh40 == true and Box40 == false then 
					triggerServerEvent("Give40", getLocalPlayer(), getLocalPlayer() )
					Box40 = true 
					setTimer(function()
				
						Box40 = false
					end,42000,1)

				elseif tomarkerhastsh41 == true and Box41 == false then 
					triggerServerEvent("Give41", getLocalPlayer(), getLocalPlayer() )
					Box41 = true 
					setTimer(function()
				
						Box41 = false
					end,42000,1)

				elseif tomarkerhastsh42 == true and Box42 == false then 
					triggerServerEvent("Give42", getLocalPlayer(), getLocalPlayer() )
					Box42 = true 
					setTimer(function()
				
						Box42 = false
					end,42000,1)

				elseif tomarkerhastsh43 == true and Box43 == false then 
					triggerServerEvent("Give43", getLocalPlayer(), getLocalPlayer() )
					Box43 = true 
					setTimer(function()
				
						Box43 = false
					end,42000,1)

				elseif tomarkerhastsh44 == true and Box44 == false then 
					triggerServerEvent("Give44", getLocalPlayer(), getLocalPlayer() )
					Box44 = true 
					setTimer(function()
				
						Box44 = false
					end,42000,1)

				elseif tomarkerhastsh45 == true and Box45 == false then 
					triggerServerEvent("Give45", getLocalPlayer(), getLocalPlayer() )
					Box45 = true 
					setTimer(function()
				
						Box45 = false
					end,42000,1)

				elseif tomarkerhastsh46 == true and Box46 == false then 
					triggerServerEvent("Give46", getLocalPlayer(), getLocalPlayer() )
					Box46 = true 
					setTimer(function()
				
						Box46 = false
					end,42000,1)

				elseif tomarkerhastsh47 == true and Box47 == false then 
					triggerServerEvent("Give47", getLocalPlayer(), getLocalPlayer() )
					Box47 = true 
					setTimer(function()
				
						Box47 = false
					end,42000,1)
					
				elseif tomarkerhastsh48 == true and Box48 == false then 
					triggerServerEvent("Give48", getLocalPlayer(), getLocalPlayer() )
					Box48 = true 
					setTimer(function()
				
						Box448 = false
					end,42000,1)

				elseif tomarkerhastsh49 == true and Box49 == false then 
					triggerServerEvent("Give49", getLocalPlayer(), getLocalPlayer() )
					Box49 = true 
					setTimer(function()
				
						Box49 = false
					end,42000,1)

				elseif tomarkerhastsh50 == true and Box50 == false then 
					triggerServerEvent("Give50", getLocalPlayer(), getLocalPlayer() )
					Box50 = true 
					setTimer(function()
				
						Box450 = false
					end,42000,1)

				elseif tomarkerhastsh51 == true and Box51 == false then 
					triggerServerEvent("Give51", getLocalPlayer(), getLocalPlayer() )
					Box51 = true 
					setTimer(function()
				
						Box51 = false
					end,42000,1)

				end
			end
				
		end
	end
end




addEventHandler("onClientKey",root,Sik)


--[[local bind = false
bindKey('F2', 'down',
function ()
	if tomarkerhastsh1 == true then
    	triggerServerEvent("Give1", getLocalPlayer(), getLocalPlayer() )
		bind = true	
		
	elseif tomarkerhastsh2 == true then 
		triggerServerEvent("Give2", getLocalPlayer(), getLocalPlayer() )
	end
	-- if bind == true then 
	-- 	unbindKey('thePlayer',	'F2', 'down')
	-- 	bind == false 
	-- end
		
	



end)]]




-- function getHealthColor(health)
--     if (health > 100) then
--     	if (health <= 1000) and (health > 500) then
--     		return {0, 250, 200}
--     	elseif (health <= 500) and (health > 250) then
--     		return {0, 250, 200}
--     	elseif (health <= 250) and (health > 0) then
--     		return {0, 250, 250}
--     	end
--     -- else
--     -- 	return {0, 200, 200}
--     end
-- end


addEventHandler ( "onClientPlayerWasted", getLocalPlayer(),
function()

	if GhavasBodan == true then
		triggerServerEvent("GhavasNSho", getLocalPlayer(), getLocalPlayer() )
		triggerServerEvent("cancelStat", getLocalPlayer(), getLocalPlayer() )
		outputChatBox("Shoma Az Job Kharej Shodid!")
		GhavasBodan = false
	end

end)




---------------------------------------


	


local x, y = guiGetScreenSize()
local arrowPos = 0 
local whereGo = 0
local difficulty = 0
local KeyName = ""
local font = dxCreateFont("Files/IRANSans.ttf",32)
engineLoadIFP ("Files/FishAnims.ifp", "fishanimifp")
engineImportTXD(engineLoadTXD("Files/FishingRod.txd"), 2703)
engineReplaceModel(engineLoadDFF("Files/FishingRod.dff", 0), 2703)

createBlip ( 822.025390625 ,-1840.13671875 ,12.632398605347, 58 )

Anims = {
	["fish1"] = true, ["fish2"] = true, ["fish3"] = true,
	["fish4"] = true, ["fish5"] = true, ["fish6"] = true,
	["fish7"] = true, ["fish8"] = true, ["fish9"] = true,
	["fish10"] = true, ["fish11"] = true, 
	["fish13"] = true, ["fish12"] = true,
}


function setPedFishAnim (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "fish1" or animation == "fish2" or animation == "fish3" or animation == "fish4" or animation == "fish5" 
		or animation == "fish6" or animation == "fish7" or animation == "fish8" or animation == "fish9" or animation == "fish10"
		or animation == "fish11" or animation == "fish12" or animation == "fish13" then
			for i = 1,3 do
				setPedAnimation(ped, "fishanimifp", animation, tiempo, repetir, mover, interrumpible)
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end
addEvent("setPedFishAnim",true)
addEventHandler("setPedFishAnim",getRootElement(),setPedFishAnim)

function renderFish()
	dxDrawImage( x - 75, y - 250, 30, 213, "images/Mid.png", 0,0,0, tocolor(255,255,255,150) )
	dxDrawImage( x - 140, y - arrowPos, 200, 300, "images/Arrow.png", 0,0,0, tocolor(255,255,255,200) )
	dxDrawText(KeyName, x - 130, y - 227, 200, 200,tocolor(255,255,255,255),1,font)
	if ( arrowPos > 190 and whereGo == 1 ) then arrowPos = arrowPos - difficulty end
	if ( arrowPos < 400 and whereGo == 2 ) then arrowPos = arrowPos + difficulty end
	if arrowPos == 400 then whereGo = 1 end
	if arrowPos == 190 then whereGo = 2 end
end

function getFish()
	if arrowPos <= 230 and arrowPos >= 190 then 
		triggerServerEvent("onFishingWin",getLocalPlayer(),getLocalPlayer(),FishName)
	else
		triggerServerEvent("onFishingLoose",getLocalPlayer(),getLocalPlayer())
	end

	
	

end
FishName = 0
addEvent("Fish:StartRender",true)
addEventHandler("Fish:StartRender",getLocalPlayer(),function(thePlayer,key,deff)
	removeEventHandler("onClientRender",root,renderFish) -- FIX: avoid stacking duplicate render handlers
	addEventHandler("onClientRender",root,renderFish)
	bindKey(key,"down",getFish)
	KeyName = key
	difficulty = deff
	if deff == 1.5 then 
		FishName = 31
	elseif deff == 2 then 
		FishName = 32
	elseif deff == 2.5 then 
		FishName = 33
	elseif deff == 3 then 
		FishName = 36
	elseif deff == 5 then 
		FishName = 35
	elseif deff == 6 then 
		FishName = 30
	end
	if math.random(1,2) == 1 then 
		arrowPos = 400 
		whereGo = 1
	else
		arrowPos = 190
		whereGo = 2
	end	

	Mmd = setTimer( function()
		if KeyName ~= 0 then
			triggerServerEvent("onFishingLoose",getLocalPlayer(),getLocalPlayer())
		end		
	end, 13000, 1)

end)

addEvent("Fish:StopRender",true)
addEventHandler("Fish:StopRender",getLocalPlayer(),function(thePlayer)
	unbindKey(KeyName,"down",getFish)
	KeyName = ""
	removeEventHandler("onClientRender",root,renderFish)
	difficulty = 0
	arrowPos = 0 
	whereGo = 0
	if isTimer(Mmd) then -- FIX: killTimer on an expired handle raises "Bad argument" and aborts the enclosing function
		killTimer(Mmd)
	end
end)

addEvent("Fish:startFish",true)
addEventHandler("Fish:startFish",getRootElement(),function(thePlayer)
	local a = playSound3D("Sounds/s1.mp3", 0, 0, 0, false)
    setSoundMaxDistance(a, 10)
    attachElements(a, thePlayer)
	a = nil
end)

local Sounds = {}

addEvent("Fish:getFish",true)
addEventHandler("Fish:getFish",getRootElement(),function(thePlayer)
	Sounds[thePlayer] = {}
	Sounds[thePlayer][1] = playSound3D("Sounds/s2.mp3", 0, 0, 0, true)
    setSoundMaxDistance(Sounds[thePlayer][1], 10)
    attachElements(Sounds[thePlayer][1], thePlayer)
	Sounds[thePlayer][2] = setTimer(function(thePlayer)
		if isElement(Sounds[thePlayer][1]) then 
			destroyElement(Sounds[thePlayer][1])
			Sounds[thePlayer] = nil
		end
	end,10000,1,thePlayer)
end)
addEvent("Fish:deleteSound",true)
addEventHandler("Fish:deleteSound",getRootElement(),function(thePlayer)
	if Sounds[thePlayer] then 
		if isElement(Sounds[thePlayer][1]) then 
		destroyElement(Sounds[thePlayer][1])
		if isTimer(Sounds[thePlayer][2]) then killTimer(Sounds[thePlayer][2]) end
		Sounds[thePlayer] = nil
		end
	end
	
end)

rocks = {
	[1] = {-1997.896484375 ,-1575.189453125 ,85.999298095703,51}
}


