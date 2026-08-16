local sX, sY = guiGetScreenSize()
local px, py = (sX/1600), (sY/900)
local x,y = (sX/px), (sY/py)
ErtefaLevelRew = 0
Levelshon = 0
local font1 = dxCreateFont("Files/font/IRANSans.ttf", (px+py)*40)
local font2 = dxCreateFont("Files/font/IRANSans.ttf", (px+py)*8)
local font3 = dxCreateFont("Files/font/IRANSans.ttf", (px+py)*7)
local font4 = dxCreateFont("Files/font/IRANSans.ttf", (px+py)* 5)
local font5 = dxCreateFont("Files/font/IRANSans.ttf", (px+py)* 3.5)
local font6 = dxCreateFont("Files/font/IRANSans.ttf", (px+py)* 4)
local font7 = dxCreateFont("Files/font/IRANSans.ttf", (px+py)* 6)
local font8 = dxCreateFont("Files/font/IRANSans.ttf", (px+py)*15)
local font9 = dxCreateFont("Files/font/IRANSans.ttf", (px+py)*10.5)
local poter = dxCreateFont("Files/font/IRANSans.ttf", (px+py)*17)

-- Color Name (Cpicker2)
addEventHandler("onColorPickerOK2", root,
function(element, hex,r,g,b)
	triggerServerEvent("setColorName", getLocalPlayer(), getLocalPlayer(), hex,r,g,b)
end)


-- Color Name Test (Cpicker2)
addEventHandler("onColorPickerOK2", root,
function(element, hex,r,g,b)
	triggerServerEvent("StartTesteColorName", getLocalPlayer(), getLocalPlayer(), hex,r,g,b)
end)

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



function updateStats( root , NameFard, Tamrin, levelesh, Warn, Punish, Rob , respectash,Goldesh,MemberShip, mail, ref, faction, number, EveryExForLevUp, registerArq, lastArq, preArq, hisJob, genderesh, namesh, agesh, bankaParasi, slotesh, carlic, carlicV, carlicV2, motorlic, motorlicV, motorlicV2 , flylic, flylicV, flylicV2, boatlic, boatlicV, boatlicV2, matlic, matlicV, matlicV2, gunlic, gunlicV, gunlicV2, materialskill, BusSkill, SudaSkill, pilotskill, TrcukerSkill, StSkill, PlayTimePlayer,Ak47GSkill,DesertGSkill,M4GSkill,MP5GSkill,PistolsGSkill,SawensGSkill,ShotgunGSkill,SniperGSkill,Spaz12GSkill,UziGSkill,rankesh,tarikhesh,fw,facid,neededEx,mared,Spawnesh,seriallock,pip,logoid,famorfac)
	if root == getLocalPlayer() then
        m1 = tostring(root)
        m2 = tostring(NameFard)
        m3 = tostring(Tamrin)
        m4 = tostring(levelesh)
        m5 = tostring(Warn)
        m6 = tostring(Punish)
        m7 = tostring(Rob)
        m8 = tostring(respectash)
        m9 = tostring(Goldesh)
        m10 = tostring(MemberShip)
        m11 = tostring(mail)
        m12 = tostring(ref)
        m13 = tostring(faction)
        m15 = tostring(number)
        m16 = tostring(EveryExForLevUp)
        m17 = tostring(registerArq)
        m18 = tostring(lastArq)
        m19 = tostring(preArq)
        m20 = tostring(hisJob)
        m21 = tostring(genderesh)
        m22 = tostring(namesh)
        m23 = tostring(agesh)
        m24 = tostring(bankaParasi)
        m25 = tostring(slotesh)
        m26 = tostring(carlic)
        m27 = tostring(carlicV)
        m28 = tostring(carlicV2)
        m29 = tostring(motorlic)
        m30 = tostring(motorlicV)
        m31 = tostring(motorlicV2)
        m32 = tostring(flylic)
        m33 = tostring(flylicV)
        m34 = tostring(flylicV2)
        m35 = tostring(boatlic)
        m36 = tostring(boatlicV)
        m37 = tostring(boatlicV2)
        m38 = tostring(matlic)
        m39 = tostring(matlicV)
        m40 = tostring(matlicV2)
        m41 = tostring(gunlic)
        m42 = tostring(gunlicV)
        m43 = tostring(gunlicV2)
        m44 = tostring(materialskill)
        m45 = tostring(BusSkill)
        m46 = tostring(SudaSkill)
        m47 = tostring(pilotskill)
        m48 = tostring(TrcukerSkill)
        m49 = tostring(StSkill)
        m50 = tostring(PlayTimePlayer)
        m51 = tostring(Ak47GSkill)
        m52 = tostring(DesertGSkill)
        m53 = tostring(M4GSkill)
        m54 = tostring(MP5GSkill)
        m55 = tostring(PistolsGSkill)
        m56 = tostring(SawensGSkill)
        m57 = tostring(ShotgunGSkill)
        m58 = tostring(SniperGSkill)
        m59 = tostring(Spaz12GSkill)
        m60 = tostring(UziGSkill)
        m61 = tostring(rankesh)
        m62 = tostring(tarikhesh)
        m63 = tostring(fw)
        m64 = tostring(logoid)
        m65 = tostring(neededEx)
        m66 = tostring(mared)
        m67 = tostring(Spawnesh)
        if m66 == "" or m66 == nil then 
            m66 = "Mojarad"
        end
        m68 = tostring(seriallock)
        m69 = tostring(pip)
        m70 = tostring(famorfac)
	end
end
addEvent("upstats",true)
addEventHandler("upstats", getRootElement(), updateStats)

local info2 = getVersion()
for s, u in pairs (info2) do
    if s == "tag" then
        tag = u
    end
end
local info = dxGetStatus()
for k, v in pairs (info) do
    if k == "VideoCardRAM" then
        
        geraphikvalue = v
        
    end
    if k == "VideoCardName" then
        geraphikname = v
    end
    if k == "VideoMemoryFreeForMTA" then 
        freegeraphik = v
    end
    if k == "SettingFOV" then 
        FOV = v
    end
    if k == "VideoCardPSVersion" then 
        vesion = v
    end
    
end
function drawDashBoard() 

    if dashvisable == true then	
        local skinid = getElementModel(getLocalPlayer())
        local playername = getPlayerName(getLocalPlayer())
        dxDrawImage(px*27, py*23, px*1550, py*850, "Files/Panel.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(px*75, py*73, px*120, py*117, "Files/Avatars/"..skinid..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(playername, px*230, py*160, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, poter, "left", "center",false,false,false, false) 
        dxDrawText("ID:", px*235, py*250, px*45, py*24, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false) 
        dxDrawText("Level:", px*298, py*250, px*45, py*24, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false) 
        dxDrawText(m12, px*256, py*250, px*45, py*24, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
        dxDrawText(m4, px*340, py*250, px*45, py*24, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false) 
        dxDrawText("Serial:", px*230, py*335, px*45, py*24, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false)
        dxDrawText(getPlayerSerial(getLocalPlayer()), px*280, py*335, px*45, py*24, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
        dxDrawText("World\nMemberShip", px*1361, py*195, px*45, py*24, tocolor(255, 255, 255, 255), fontScale, font9, "center", "center",false,false,false, false)
        if m10 == "0" then 
            dxDrawText("No Active", px*668, py*327, px*45, py*24, tocolor(255, 0, 0, 255), fontScale, font2, "left", "center",false,false,false, false)
        else
            dxDrawText(m10, px*685, py*327, px*45, py*24, tocolor(0, 255, 0, 255), fontScale, font2, "left", "center",false,false,false, false)
        end
        if m70 == "faction" then
            dxDrawImage(px*831, py*73, px*120, py*117, "Files/flogo/"..m64..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif m70 == "family" then
            dxDrawImage(px*831, py*73, px*120, py*117, "Files/famlogo/"..m64..".dds", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        else
            dxDrawImage(px*831, py*73, px*120, py*117, "Files/flogo/"..m64..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end
        dxDrawText(m13, px*990, py*180, px*45, py*24, tocolor(255, 255, 255, 255), fontScale, font9, "left", "center",false,false,false, false)
        dxDrawText(m61, px*990, py*235, px*45, py*24, tocolor(128, 128, 128, 255), fontScale, font9, "left", "center",false,false,false, false)
        dxDrawText("FP:      |  FW:", px*1050, py*330, px*45, py*24, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false)
        dxDrawText(m6, px*1080, py*330, px*45, py*24, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
        dxDrawText(m63.."/3", px*1155, py*330, px*45, py*24, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
        if tab == 1  then
            dxDrawImage(px*478, py*300, px*900, py*460, "Files/Panel_Stats.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawText("Cash:", px*560, py*688, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false) 
            dxDrawText("Register Time:", px*880, py*688, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false) 
            dxDrawText("Respect:", px*1210, py*688, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false) 
            dxDrawText(getPlayerMoney(getLocalPlayer()).." $", px*603, py*690, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText(m17, px*983, py*690, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText("("..m8.."/"..m65..")", px*1275, py*690, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText("Bank:", px*560, py*768, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText("Total Played:", px*880, py*768, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText("Last-Login Time:", px*1077, py*768, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText(m24.." $", px*603, py*770, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText(m50.." Saat", px*975, py*770, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText(m18, px*1195, py*770, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText("Gold:", px*560, py*852, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText("Warn:", px*852, py*852, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false) 
            dxDrawText("Vehicle Slot:", px*970, py*852, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false) 
            dxDrawText("COMING SOON....", px*1180, py*852, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false) 
            dxDrawText(m9.." g", px*603, py*853, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText(m5.."/3", px*900, py*853, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText(m25 , px*1060, py*853, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText("Black Cash:", px*560, py*935, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false) 
            dxDrawText("Phone Number:", px*865, py*935, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false) 
            dxDrawText("Vaziat Ta'ahol:", px*1140, py*935, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font3, "left", "center",false,false,false, false) 
            dxDrawText("0 $", px*650, py*937, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText(m15, px*975, py*937, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText(m66 , px*1248, py*937, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
            dxDrawText("Training Gun:", px*518, py*1213, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText("Vehicle:", px*840, py*1213, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText("Bike:", px*1055, py*1213, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText(m3.."/20" , px*628, py*1213, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText(m26.." Saat", px*905, py*1213, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText(m29.." Saat" , px*1100, py*1213, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText("Bank Robbery:", px*517, py*1297, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText("Boat:", px*840, py*1297, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText("Weapon:", px*1025, py*1297, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText(m7.."/20" , px*637, py*1298, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText(m35.." Saat", px*887, py*1298, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText(m41.." Saat" , px*1095, py*1298, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText("Biz Rob:", px*518, py*1381, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText("Material:", px*840, py*1381, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText("Plane:", px*1043, py*1381, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText(m3.."/20", px*590, py*1381, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText(m26.." Saat" , px*908, py*1381, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText(m29.." Saat" , px*1095, py*1381, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
        elseif tab == 2  then
            if isMouseInPosition(px*520, py*390, px*130, py*25) then
                dxDrawImage(px*520,  py*280, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawImage(px*520,  py*280, px*130, py*100, "Files/items/RockStarMemberShip.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*520, py*390, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawText("2500", px*550, py*758, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        triggerServerEvent("PremiumKonGold30", getLocalPlayer(), getLocalPlayer() )  

                    end

                else
                    press = false
                
                end
            else
                dxDrawText("2500", px*550, py*758, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                dxDrawImage(px*520, py*390, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*520,  py*280, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*520,  py*280, px*130, py*100, "Files/items/RockStarMemberShip.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end
            

            if isMouseInPosition(px*695, py*390, px*130, py*25) then
                dxDrawImage(px*695, py*280, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawImage(px*695, py*280, px*130, py*100, "Files/items/ClearWanted.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*695, py*390, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawText("500", px*725, py*758, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        triggerServerEvent("cwanted", getLocalPlayer(), getLocalPlayer() )  

                    end

                else
                    press = false
                
                end
            else
                dxDrawText("500", px*725, py*758, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                dxDrawImage(px*695, py*390, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*695, py*280, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*695, py*280, px*130, py*100, "Files/items/ClearWanted.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end


            
            if isMouseInPosition(px*870, py*390, px*130, py*25) then
                dxDrawImage(px*870, py*280, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawImage(px*870, py*280, px*130, py*100, "Files/items/Clear30FP.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*870, py*390, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawText("750", px*900, py*758, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        triggerServerEvent("deleteKonFP", getLocalPlayer(), getLocalPlayer() )
                        m6 = 0
                    end

                else
                    press = false
                
                end
            else
                dxDrawText("750", px*900, py*758, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                dxDrawImage(px*870, py*390, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*870, py*280, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*870, py*280, px*130, py*100, "Files/items/Clear30FP.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end
            


            if isMouseInPosition(px*1045, py*390, px*130, py*25) then
                dxDrawImage(px*1045, py*280, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawImage(px*1045, py*280, px*130, py*100, "Files/items/ColorName.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1045, py*390, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawText("500", px*1075, py*758, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        exports["cpicker2"]:openPicker(getLocalPlayer(), "#ffffff", "Change Color Name")
                        
                        triggerServerEvent("BiadPanelColorNCC", getLocalPlayer(), getLocalPlayer() )

                    end

                else
                    press = false
                
                end
            else
                dxDrawText("500", px*1075, py*758, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                dxDrawImage(px*1045, py*390, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1045, py*280, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1045, py*280, px*130, py*100, "Files/items/ColorName.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end

            if isMouseInPosition(px*1220, py*390, px*130, py*25) then
                dxDrawImage(px*1220, py*280, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawImage(px*1220, py*280, px*130, py*100, "Files/items/VehicleSlot.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1220, py*390, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawText("1,250", px*1250, py*758, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        
                        triggerServerEvent("bekharSlot", getLocalPlayer(), getLocalPlayer() )
                        

                    end

                else
                    press = false
                
                end
            else
                dxDrawText("1,250", px*1250, py*758, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                dxDrawImage(px*1220, py*390, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1220, py*280, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1220, py*280, px*130, py*100, "Files/items/VehicleSlot.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end


            ------------------------------------------------------------------------------------------------------------------------------------

            if isMouseInPosition(px*520, py*560, px*130, py*25) then
                dxDrawImage(px*520,  py*450, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawImage(px*520,  py*450, px*130, py*100, "Files/items/PassengerSlot.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*520, py*560, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawText("500", px*550, py*1097, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        exports["notf"]:addNotification("Comming Soon...", "info")

                    end

                else
                    press = false
                
                end
            else
                dxDrawText("500", px*550, py*1097, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                dxDrawImage(px*520, py*560, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*520,  py*450, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*520,  py*450, px*130, py*100, "Files/items/PassengerSlot.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end
            --e box ba 


            if isMouseInPosition(px*695, py*560, px*130, py*25) then
                dxDrawImage(px*695,  py*450, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawImage(px*695,  py*450, px*130, py*100, "Files/items/JourneySpeaker.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*695, py*560, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawText("500", px*725, py*1097, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        exports["notf"]:addNotification("Comming Soon...", "info")

                    end

                else
                    press = false
                
                end
            else
                dxDrawText("500", px*725, py*1097, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                dxDrawImage(px*695, py*560, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*695,  py*450, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*695,  py*450, px*130, py*100, "Files/items/JourneySpeaker.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end


            if isMouseInPosition(px*870, py*560, px*130, py*25) then
                dxDrawImage(px*870,  py*450, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawImage(px*870,  py*450, px*130, py*100, "Files/items/Speaker_1Month.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*870, py*560, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawText("2,500", px*900, py*1097, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        triggerServerEvent("speacker1m", getLocalPlayer(), getLocalPlayer() )
                    end
                else
                    press = false
                
                end
            else
                dxDrawText("2,500", px*900, py*1097, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                dxDrawImage(px*870, py*560, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*870,  py*450, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*870,  py*450, px*130, py*100, "Files/items/Speaker_1Month.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end


            if isMouseInPosition(px*1075, py*560, px*130, py*25) then
                dxDrawImage(px*1045,  py*450, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawImage(px*1045,  py*450, px*130, py*100, "Files/items/Speaker_Lifetime.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1045, py*560, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawText("200,000", px*1075, py*1097, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        triggerServerEvent("bekharlifeSlot", getLocalPlayer(), getLocalPlayer() )
                    end
                else
                    press = false
                
                end
            else
                dxDrawText("200,000", px*1075, py*1097, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                dxDrawImage(px*1045, py*560, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1045,  py*450, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1045,  py*450, px*130, py*100, "Files/items/Speaker_Lifetime.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end


            if isMouseInPosition(px*1220, py*560, px*130, py*25) then
                dxDrawImage(px*1220,  py*450, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawImage(px*1220,  py*450, px*130, py*100, "Files/items/ToysSlot.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1220, py*560, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                dxDrawText("2,000", px*1250, py*1097, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        exports["notf"]:addNotification("Comming Soon...", "info")
                    end
                else
                    press = false
                
                end
            else
                dxDrawText("2,000", px*1250, py*1097, px*130, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false)
                dxDrawImage(px*1220, py*560, px*130, py*25, "Files/Panel_Shop_Buy.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1220,  py*450, px*130, py*100, "Files/Panel_Shop_Box.png", 0, 0, 0, tocolor(255,255,255, 255), true)
                dxDrawImage(px*1220,  py*450, px*130, py*100, "Files/items/ToysSlot.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end
        elseif tab == 3  then
            dxDrawText("Level ", px*50, py*50, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false) 
        elseif tab == 4  then
            dxDrawText("Frind ", px*50, py*50, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,false, false) 
        elseif tab == 5  then
            dxDrawImage(px*500, py*300, px*850, py*460, "Files/Panel_Setting.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawText("GPU:", px*545, py*690, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText("Spawn Location:", px*965, py*690, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText(geraphikname, px*590, py*690, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText(m67, px*1100, py*690, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText("Video Ram:", px*545, py*773, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText("Server Version:", px*965, py*773, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText(geraphikvalue.." MB (Free "..freegeraphik.." MB)", px*640, py*773, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText("v1.21.1", px*1090, py*773, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            
            dxDrawText("SerialLocked:", px*965, py*855, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText("FOV (Field Of View):", px*545, py*855, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText(FOV, px*710, py*855, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText(m68, px*1075, py*855, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText("Vesion:", px*545, py*935, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText("Lastip:", px*965, py*935, px*50, py*50, tocolor(128, 128, 128, 255), fontScale, font2, "left", "center",false,false,false, false) 
            dxDrawText(tag, px*607, py*937, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            dxDrawText(m69, px*1024, py*937, px*50, py*50, tocolor(255, 255, 255, 255), fontScale, font2, "left", "center",false,false,false, false)
            if isMouseInPosition(px*520, py*607, px*130, py*120) then
                dxDrawImage(px*510, py*607, px*130, py*120, "Files/Spawn_Civilian.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                
                    if not press then
                        press = true
                        triggerServerEvent("setPlayerSpawn",getLocalPlayer(),getLocalPlayer(),0)
                    end

                else
                    press = false
                
                end
            else
                dxDrawImage(px*510, py*607, px*130, py*120, "Files/Spawn_Civilian.png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), true)
            end

            if isMouseInPosition(px*650, py*607, px*130, py*120) then
                dxDrawImage(px*650, py*607, px*130, py*120, "Files/Spawn_House.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                
                    if not press then
                        press = true
                        triggerServerEvent("setPlayerSpawn",getLocalPlayer(),getLocalPlayer(),2)
                    end
    
                else
                    press = false
                
                end
            else
                dxDrawImage(px*650, py*607, px*130, py*120, "Files/Spawn_House.png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), true)
            end
            if isMouseInPosition(px*790, py*607, px*130, py*120) then
                dxDrawImage(px*790, py*607, px*130, py*120, "Files/Spawn_FactionFamily.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                
                    if not press then
                        press = true
                        triggerServerEvent("setPlayerSpawn",getLocalPlayer(),getLocalPlayer(),1)
                    end
    
                else
                    press = false
                
                end
            else
                dxDrawImage(px*790, py*607, px*130, py*120, "Files/Spawn_FactionFamily.png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), true)
            end
            if isMouseInPosition(px*930, py*607, px*130, py*120) then
                dxDrawImage(px*930, py*607, px*130, py*120, "Files/Spawn_LastLocation.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                
                    if not press then
                        press = true
                        triggerServerEvent("setPlayerSpawn",getLocalPlayer(),getLocalPlayer(),3)
                    end
    
                else
                    press = false
                
                end
            else
                dxDrawImage(px*930, py*607, px*130, py*120, "Files/Spawn_LastLocation.png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), true)
            end
            if isMouseInPosition(px*1070, py*607, px*130, py*120) then
                dxDrawImage(px*1070, py*607, px*130, py*120, "Files/Spawn_Journey.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                
                    if not press then
                        press = true
                        exports["notf"]:addNotification("Comming Soon...", "info")
                    end
    
                else
                    press = false
                
                end
            else
                dxDrawImage(px*1070, py*607, px*130, py*120, "Files/Spawn_Journey.png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), true)
            end
            if isMouseInPosition(px*1210, py*607, px*130, py*120) then
                dxDrawImage(px*1210, py*607, px*130, py*120, "Files/Spawn_Penthouse.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                
                    if not press then
                        press = true
                        exports["notf"]:addNotification("Comming Soon...", "info")
                    end
    
                else
                    press = false
                
                end
            else
                dxDrawImage(px*1210, py*607, px*130, py*120, "Files/Spawn_Penthouse.png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), true)
            end
        end

    





        if isMouseInPosition(px*1433,py*265, px*100, py*115) then
            
        	dxDrawImage(px*1433,py*265, px*100, py*115, "Files/"..aksstate..".png", 0, 0, 0, tocolor(150,150,150, 255), true)

        	if getKeyState("mouse1")  then
                if aksstate == "Stats" then
        		    if not press then
        		    	press = true
                        tab = 1
                        aksstate = "Setting"
                        
                        aksshop = "Shop"
                        levelaks = "Level_Reward"
                        firindaks = "Referral_Reward"
        		    end
                else
                    if not press then
        		    	press = true
                        tab = 5
                        
                        aksstate = "Stats"
        		    end
                    
                end
        	else
        		press = false
            
        	end
        else
            dxDrawImage(px*1433,py*265, px*100, py*115, "Files/"..aksstate..".png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), true)
        end



        if isMouseInPosition(px*1433,py*400, px*100, py*115) then
        	dxDrawImage(px*1433,py*400, px*100, py*115, "Files/"..aksshop..".png", 0, 0, 0, tocolor(150,150,150, 255), true)

        	if getKeyState("mouse1") then
                if aksshop == "Shop" then
        		    if not press then
        		    	press = true
                        
                        tab = 2
                        aksshop = "Setting"
                        aksstate = "Stats"
                        levelaks = "Level_Reward"
                        firindaks = "Referral_Reward"

        		    end
                else 
                    if not press then
        		    	press = true
                        tab = 5
                        
                        aksshop = "Shop"
        		    end
                end
            else
                press = false
        	end
        else
            dxDrawImage(px*1433,py*400, px*100, py*115, "Files/"..aksshop..".png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), true)
        
        end


        if isMouseInPosition(px*1433,py*535, px*100, py*115) then
        	dxDrawImage(px*1433,py*535, px*100, py*115, "Files/"..levelaks..".png", 0, 0, 0, tocolor(150,150,150, 255), true)
        	if getKeyState("mouse1") then
        	    if not press then
        	    	press = true
                    openMain( )
                    OpenPanelLevelRew(getLocalPlayer(),m4)
        	    end
        	else
        		press = false
        	end
        else
            dxDrawImage(px*1433,py*535, px*100, py*115, "Files/"..levelaks..".png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), true)
        end

        if isMouseInPosition(px*1433,py*670, px*100, py*120) then
        	dxDrawImage(px*1433,py*670, px*100, py*120, "Files/"..firindaks..".png", 0, 0, 0, tocolor(150,150,150, 255), true)

        	if getKeyState("mouse1") then
                if firindaks == "Referral_Reward" then
        		    if not press then
        		    	press = true
                        exports["notf"]:addNotification("Comming Soon...", "info")
                        --[[aksstate = "Stats"
                        aksshop = "Shop"
                        firindaks = "setting"
                        levelaks = "Level_Reward"
                        tab = 4]]
                    end
                else

                    if not press then
                        press = true
                        exports["notf"]:addNotification("Comming Soon...", "info")
                        tab = 5

                        firindaks = "Referral_Reward"
                    end
                end
        		
        	else
        		press = false
            
        	end
        else
            dxDrawImage(px*1433,py*670, px*100, py*120, "Files/"..firindaks..".png", 0, 0, 0, tocolor(255, 255, 255, 255, 255), true)
        end
    end
end
-- 273.625
fonrg1 = guiCreateFont("Files/font/IRANSans.ttf",(px+py)*10)
fonrg2 = guiCreateFont("Files/font/IRANSans.ttf",(px+py)*7)
BGLEVELRIW = guiCreateStaticImage(px*547.25,py*131, px*505.5, py*639.75,"Files/LevelBG.png",false)
guiSetVisible(BGLEVELRIW,false) 
BackForLevelRew = guiCreateStaticImage( px*200 , py*570 , px*103, py*42,"Files/LevelBack.png",false,BGLEVELRIW)
ScoreLevelRiward = guiCreateScrollPane(px*70 ,py*100 , px*380, py*450, false,BGLEVELRIW)
LabelReward = {}
ArryLevel={
    {10,250000,300},
    {15,300000,350},
    {20,350000,400},
    {25,1000000,1000},
    {30,1200000,1200},
    {35,1500000,1500},
    {40,2000000,2000},
    {45,2500000,3000},
    {50,3000000,3000},
    {55,3200000,3500},
    {60,3500000,4000},
    {70,5000000,5000},
    {75,5500000,5000},
    {80,6000000,6000},
    {90,7000000,7500},
    {100,8000000,10000},
    {120,9000000,12000},
    {135,10000000,15000},
    {150,12000000,20000},
}
--(2*(ArryLevel[j][1]/100))
function convertNumber ( number )   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end
LabelReward["Label2"] = {}
LabelReward["Label3"] = {}
function ForPanelLevel(m4)
    for j = 1 , #ArryLevel do
        if tonumber(m4) < tonumber(ArryLevel[j][1]) then
            if ArryLevel[j][1] > 99 then 
                kamkonazx = 5.5
            else
                kamkonazx = 0
            end
            guiCreateStaticImage(px*107.125 , py*70 + ErtefaLevelRew , px*333, py*60,"Files/LevelBox.png",false,ScoreLevelRiward)
            LabelReward[j] = guiCreateLabel( px*121 - kamkonazx , py*80 + ErtefaLevelRew , px*333 , py*60 , ArryLevel[j][1] ,false,ScoreLevelRiward)
            guiLabelSetColor(LabelReward[j],0,0,0)
            guiSetFont(LabelReward[j],fonrg1)
            LabelReward["Label2"][j] = guiCreateLabel( px*220 , py*85 + ErtefaLevelRew , px*150 , py*60 ,convertNumber(ArryLevel[j][2]).."$"  ,false,ScoreLevelRiward)
            guiSetFont(LabelReward["Label2"][j],fonrg2)
            LabelReward["Label3"][j] = guiCreateLabel( px*360 , py*85 + ErtefaLevelRew , px*80 , py*60 ,convertNumber(ArryLevel[j][3]).."g"  ,false,ScoreLevelRiward)
            guiSetFont(LabelReward["Label3"][j],fonrg2)
            ErtefaLevelRew = ErtefaLevelRew + 70
        end
    end

end
addEventHandler("onClientGUIClick",getRootElement(),function()
    if source == BackForLevelRew then
        openMain()
        
    end
end)
function OpenPanelLevelRew(player,level)
    if player == getLocalPlayer() then 
        guiSetVisible(BGLEVELRIW,true)
        ForPanelLevel(level)
        showCursor(true)
    end
end
function ClosePanelLevelRew(player)
    if player == getLocalPlayer() then 
        guiSetVisible(BGLEVELRIW,false) 
    end
end
addCommandHandler("myinfo",function()
    outputChatBox("GPU: "..geraphikname)
    outputChatBox("Value GPU RAM: "..geraphikvalue)
    outputChatBox("GPU RAM Free: "..freegeraphik)
    outputChatBox("Field Of View: "..FOV)
    outputChatBox("vesion Releas: "..tag)
end)
-- Baz Shodan Panel --
function openMain( )
    if getElementData(getLocalPlayer(), "loggedIn") == true then
        
        if dashvisable == nil then
            kamkonazx = 0
            ErtefaLevelRew = 0
            aksstate = "setting"
            aksshop = "Shop"
            levelaks = "Level_Reward"
            firindaks = "Referral_Reward"
            -- FIX (bugfix pass 3): F1 could get stuck (cursor locked, chat hidden,
            --   panel drawn twice). If dashvisable and the render handler ever fell
            --   out of sync -- which happens when another script hides the panel,
            --   on respawn, or when an animation/state change interrupts the close
            --   path -- this line stacked a SECOND onClientRender handler. Removing
            --   it first makes the open idempotent.
            removeEventHandler("onClientRender",root,drawDashBoard)
            addEventHandler("onClientRender",root,drawDashBoard)
            showCursor( true )
            dashvisable = true
            showChat ( false ) 
            triggerServerEvent("StatPlayer", getLocalPlayer(), getLocalPlayer() )
            local sound = playSound("Files/open.m4a")
            ClosePanelLevelRew(getLocalPlayer())
        else
            showChat ( true ) 		
            removeEventHandler("onClientRender",root,drawDashBoard)
            showCursor( false )
            dashvisable = nil
            -- FIX (bugfix pass 3): also drop any animation/sub-panel state so the
            --   next F1 press starts clean instead of reopening mid-animation.
            kamkonazx = 0
            ErtefaLevelRew = 0
            ClosePanelLevelRew(getLocalPlayer())


        end
    end
end
function openPanel (  )
    if getElementData(getLocalPlayer(), "loggedIn") == true then
        tab = 1
        openMain( )
    end
end
bindKey( "F1", "down", openPanel )
