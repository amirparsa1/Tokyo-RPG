local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1600), (screenH/900)
local dxfont1_font = dxCreateFont("Data/FONT.ttf", (x+y)*11)
local components = { "area_name", "radio", "vehicle_name" }
local newFont12 = dxCreateFont("Data/FONT.ttf",(x+y)*20)
local newFont1 = dxCreateFont("Data/FONT.ttf", (x+y)*12)
local newFont11 = dxCreateFont("Data/FONT.ttf", (x+y)*15)
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
function ()
	for _, component in ipairs( components ) do
		setPlayerHudComponentVisible( component, false )
	end
end)
addEventHandler("onClientRender", root,function()
	local CR,CG,CB = getPlayerNametagColor(getLocalPlayer())
	if getElementData(getLocalPlayer(),"pJailTime") and tonumber(getElementData(getLocalPlayer(),"pJailTime")) >= 1 then
		dxDrawText("Jail Time : #ffffff"..getElementData(getLocalPlayer(),"pJailTime").."", screenW * 0.1162, screenH * 0.7276, screenW * 0.1919, screenH * 0.6758, tocolor(254, 21, 27, 255), 1.00, dxfont1_font, "left", "center", false, false, false, true, false)
	end
	local hastyana = getElementData(getLocalPlayer() ,"inpaintball")
	local paintscore = getElementData(getLocalPlayer() ,"paintscore")
	local killscore = getElementData(getLocalPlayer() ,"paintballkills")
	local tiempaintball = getElementData(getLocalPlayer() ,"pbTime") / 1000
	if tonumber(tiempaintball) > 0 then
		local paintscoreshow = dxDrawText("#ee991aScore:#ffffff "..paintscore ,x*20, y*420, x*0, y*10,tocolor(73,208,141,255),1.00,dxfont1_font,"left","top",false,false,false, true)
		local paintkillshow = dxDrawText("#ee991akill:#ffffff "..killscore ,x*20, y*440, x*0, y*10,tocolor(73,208,141,255),1.00,dxfont1_font,"left","top",false,false,false, true)
	else
		if paintscoreshow then
			destroyElement(paintscoreshow)
			destroyElement(paintkillshow)
		end
	end

end)
local TNText = "Pasargad RPG (Beta 1.0.1)"
local vSize = dxGetTextWidth(TNText)
local iSize = dxGetTextWidth("MTA:SA 1.6*")
local sx, sy = guiGetScreenSize()

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

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
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



local sx = guiGetScreenSize()
local function drawFPS()
    if not getCurrentFPS() then
        return
    end
    local roundedFPS = math.floor(getCurrentFPS())
    --dxDrawText(roundedFPS, sx - dxGetTextWidth(roundedFPS), 0)
end
--Convert Number Baraye Joda Kardan Adad Ha Hast ==> 100,000

function dxHud1()
	if getElementData(getLocalPlayer(),"loggedIn") == true then
		local vida1 = math.floor(getElementHealth(getLocalPlayer()))
		local healthColor = getHealthColor(vida1)
		local colete = math.floor(getPedArmor(getLocalPlayer()))
		local armorColor = getArmorColor(colete)
		local dinheiro1 = getPlayerMoney(getLocalPlayer())
		local dinheiro2 = tostring(getPlayerMoney(getLocalPlayer())):gsub("#7FFF00-", "#7FFF00")
		if string.len(dinheiro1) < 2 and dinheiro1 >= 0 then
			dinheiro1 = "00000000"..dinheiro1
		elseif string.len(dinheiro1) < 3 and dinheiro1 >= 0 then
			dinheiro1 = "0000000"..dinheiro1
		elseif string.len(dinheiro1) < 4 and dinheiro1 >= 0 then
			dinheiro1 = "000000"..dinheiro1
		elseif string.len(dinheiro1) < 5 and dinheiro1 >= 0 then
			dinheiro1 = "00000"..dinheiro1
		elseif string.len(dinheiro1) < 6 and dinheiro1 >= 0 then
			dinheiro1 = "0000"..dinheiro1
		elseif string.len(dinheiro1) < 7 and dinheiro1 >= 0 then
			dinheiro1 = "000"..dinheiro1
		elseif string.len(dinheiro1) < 8 and dinheiro1 >= 0 then
			dinheiro1 = "00"..dinheiro1
		elseif string.len(dinheiro1) < 9 and dinheiro1 >= 0 then
			dinheiro1 = "0"..dinheiro1
		end

		local ping = getPlayerPing(getLocalPlayer())
		RGB1 = 255
		RGB2 = 255 
		RGB3 = 255
		if ping < 69 then 
			RGB1 = 255
			RGB2 = 255 
			RGB3 = 255
		elseif ping > 70 then 
			RGB1 = 255 
			RGB2 = 247  
			RGB3 = 0 
		elseif ping > 100 then 
			RGB1 = 255 
			RGB2 = 123  
			RGB3 = 0 
		elseif ping > 150 then 
			RGB1 = 255 
			RGB2 = 0 
			RGB3 = 0 
		end






		local ammoClip = getPedAmmoInClip(getLocalPlayer(), getPedWeaponSlot(getLocalPlayer()))
		local ammo = getPedTotalAmmo(getLocalPlayer()) - getPedAmmoInClip(getLocalPlayer())
		local weapon = getPedWeapon(getLocalPlayer())
		local skin = getElementModel(getLocalPlayer())
		local wanted = getPlayerWantedLevel(getLocalPlayer())  or 6
		local H, M = getTime( )

		local time = getRealTime()
		local  S , MO , D , Y=  time.second , time.month ,time.monthday ,time.year

		local MO = time.month + 1
		local Y = time.year + 1900
		if #tostring( H ) == 1 then
			H = "0"..tostring( H )
		end	
		if #tostring( M ) == 1 then
			M = "0"..tostring( M )
		end	
		if #tostring( S ) == 1 then
			S = "0"..tostring( S )
		end	

		if MO < 10 then
			MO = "0"..time.month
		end
		if D < 10 then
			D = "0"..time.month
		end
		local inpaint = getElementData(getLocalPlayer(), "inpaintball")
		local Vida = tonumber(math.floor(getElementHealth(localPlayer)))

    	local Colete = math.floor(getPedArmor(localPlayer))
		local playerName = getPlayerName(localPlayer)
		local pid = getElementData(localPlayer,"TarafID")

		dxDrawText(TNText, sx - iSize - vSize, sy - 14, sx, sy, tocolor(255, 255, 255, 100), 1, "default")
		if getElementData(getLocalPlayer(), "nowHud") ~= true then
		else

			if not getElementData(getLocalPlayer(),"disAll") then
				dxDrawText("#003cffPasargad RPG",x*2840, y*28, x*0, y*0,tocolor(73,208,141,255),0.5,newFont1,"center","center",false,false,false, true)	
				dxDrawImage(x*1300, y*20, x*235, y*100, "Data/img/background.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
				dxDrawText(playerName.." #33FFFF("..pid..")",x*1345, y*32, x*1358, y*40,tocolor( 255, 255, 255, 255 ),0.5,newFont1, "left", "top", false, false, false, true, false)
    	    if tonumber(dinheiro1) > -1 then
				dxDrawText("$"..convertNumber(dinheiro1), x*1100, y*10, x*1440, y*118, tocolor(255, 255, 255, 255), x*0.6, newFont1, "right", "center", false, false, false, false, true)
				dxDrawText(convertNumber(dinheiro2), x*1100, y*10, x*1440, y*118, tocolor(0, 255, 0, 255), x*0.6, newFont1, "right", "center", false, false, false, false, true)

			else
				dxDrawText("$"..convertNumber(dinheiro1), x*1100, y*10, x*1440, y*118, tocolor(255, 255, 255, 255), x*0.6, newFont1, "right", "center", false, false, false, false, true)
				dxDrawText(dinheiro2, x*1100, y*10, x*1440, y*118, tocolor(0, 255, 0, 255), x*0.6, newFont1, "right", "center", false, false, false, false, true)

			end
		

			dxDrawImageSection(x*1372, y*79, (135 * getElementHealth(localPlayer)/100)*x, y*5, 0, 0, 100, 6, 'Data/img/bar.png', 0, 0, 0, tocolor(255, 0, 0, 255))
			dxDrawImageSection(x*1372, y*79, (135 * 100/100)*x, y*6, 0, 0, 100, y*5, 'Data/img/bar.png', 0, 0, 0, tocolor(0, 0, 0, 80))
			dxDrawImageSection(x*1372, y*95, (135 * getPedArmor(localPlayer)/100)*x, y*5, 0, 0, (53 * getPedArmor(localPlayer)/100), 6, 'Data/img/bar.png', 0, 0, 0, tocolor(51,153,255, 255))
			dxDrawImageSection(x*1372, y*95, (135 * 100/100)*x, y*6, 0, 0, 100, y*5, 'Data/img/bar.png', 0, 0, 0, tocolor(0, 0, 0, 80))



    	    dxDrawImage(x*1647, y*100, x*43, y*42/-100*Colete, "Data/img/fundo5.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

			dxDrawImage(x*1300, y*130, x*235, y*35, "Data/Wanted/"..tostring(wanted)..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

			dxDrawImage(x*1300, y*177, x*235, y*35, "Data/img/datebox.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText(H.." : "..M, x*1350, y*185, x*235, y*35, tocolor(255, 255, 255, 255), x*0.5,newFont1, "left", "top", false, false, false, false, true)
			dxDrawText(""..Y.."/"..MO.."/"..D.."", x*1450, y*185, x*235, y*35, tocolor(255, 255, 255, 255), x*0.5,newFont1, "left", "top", false, false, false, false, true)




			if weapon > 0 then 
				dxDrawImage(x*1280+100, y*120+100, x*125+30, y*50, "Data/img/Weapon_BG.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    	    	dxDrawImage(x*1280+100, y*120+100, x*158, y*77, "Data/img/"..tostring(weapon)..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
				dxDrawText(ammo.." | "..ammoClip, x*1290+100, y*130+100, x*1095, y*70, tocolor(254, 254, 254, 255), x*0.42, newFont1, "left", "top", false, false, false, false, false)
			end


    	    dxDrawText(colete.."", x*1350, y*90, x*1394, y*79, tocolor(255, 255, 255, 182), x*0.35, newFont11, "left", "top", false, false, false, false, false)
			dxDrawText(Vida.."", x*1350, y*75, x*1394, y*79, tocolor(255, 255, 255, 182), x*0.35, newFont11, "left", "top", false, false, false, false, false)
		end
	end
end
end


----------------------------------------------------------------------------
local IsThirstHandled = false
local IsHungerHandled = false
----------------------------------------------------------------------------



function getArmorColor(armor)
    if (armor > 0) then
    	if (armor <= 100) and (armor > 75) then
    		return {20, 161, 204}
    	elseif (armor <= 75) and (armor > 50) then
    		return {20, 204, 84}
    	elseif (armor <= 50) and (armor > 25) then
    		return {204, 164, 20}
    	elseif (armor <= 25) and (armor > 0) then
    		return {204, 20, 20}
    	end
    else
    	return {20, 161, 204}
    end
end


function getHealthColor(health)
    if (health > 0) then
    	if (health <= 100) and (health > 50) then
    		return {250, 250, 250}
    	elseif (health <= 50) and (health > 25) then
    		return {250, 250, 0}
    	elseif (health <= 25) and (health > 0) then
    		return {250, 0, 0}
    	end
    else
    	return {250, 250, 250}
    end
end

function renderDxHud()
	addEventHandler("onClientRender", getRootElement(), dxHud1)
	setPlayerHudComponentVisible("armour", false)
	setPlayerHudComponentVisible("wanted", false)
	setPlayerHudComponentVisible("weapon", false)
	setPlayerHudComponentVisible("money", false)
	setPlayerHudComponentVisible("health", false)
	setPlayerHudComponentVisible("clock", false)
	setPlayerHudComponentVisible("breath", false)
	setPlayerHudComponentVisible("ammo", false)
	setElementData(getLocalPlayer(), "nowHud", true)
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), renderDxHud)

function onStop()
	setPlayerHudComponentVisible("armour", true)
	setPlayerHudComponentVisible("wanted", true)
	setPlayerHudComponentVisible("weapon", true)
	setPlayerHudComponentVisible("money", true)
	setPlayerHudComponentVisible("health", true)
	setPlayerHudComponentVisible("clock", true)
	setPlayerHudComponentVisible("breath", true)
	setPlayerHudComponentVisible("ammo", true)
	setElementData(getLocalPlayer(), "nowHud", nil)
end
addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()), onStop)




