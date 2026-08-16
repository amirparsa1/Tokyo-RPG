local scx,scy = guiGetScreenSize()
local px = scx/1920
local sx,sy = guiGetScreenSize()
local x ,y = (sx/1600),(sy/900)
local sizeX,sizeY = 350*px,350*px
local posX,posY = scx-sizeX,scy-sizeY
local font05 = dxCreateFont( "files/AEROMATICSITALIC.ttf",10*px )
local font1 = dxCreateFont( "files/AEROMATICSBOLD.ttf",17*px )
local font2 = dxCreateFont( "files/AEROMATICSBOLDITALIC.ttf" )
local font3 = dxCreateFont( "files/AEROMATICSITALIC.ttf",50*px )
local font4 = dxCreateFont( "files/AEROMATICSITALIC.ttf",18*px )
function math.lerp(a, b, k)
	local result = a * (1-k) + b * k
	if result >= b then
		result = b
	elseif result <= a then
		result = a
	end
	return result
end
local alpha = 255
local side = true
local pulsing = true
function drawSpeedometer()
	local veh = getPedOccupiedVehicle(localPlayer)
	if veh then
		if not getElementData(getPedOccupiedVehicle(getLocalPlayer()), "fuel") then
			setElementData(getPedOccupiedVehicle(getLocalPlayer()), "fuel", 100)
		end
		local speedx, speedy, speedz = getElementVelocity ( veh )
		local actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5)
		local kmh = math.floor(actualspeed * 180)
		local rotation = math.lerp(-152,90,kmh/300)
		if rotation >= 90 then rotation = math.random(88,92) end
			local gear = getVehicleCurrentGear( veh )
		if gear == 0 then
			if kmh <= 1 then
				gear = "N"
			else
				gear = "R"
			end 
		elseif gear == 1 then
			if kmh <= 2 then
				gear = "N"
			end
		end
		if kmh < 10 then
			kmh = "00"..kmh
		elseif kmh > 10 and kmh < 99 then
			kmh = "0"..kmh
		end
		dxDrawText(gear,x*2820,y*1427,x*50,y*50.5,tocolor(0,100,100),1,font1,"center","center")
		dxDrawText("KMH",x*3030,y*1520 ,x*50,y*50,tocolor(255,255,255,100),1,font1,"center","center")
		dxDrawText(kmh,x*2930,y*1600 ,x*100,y*50,tocolor(255, 255, 255, 255),1,font3,"center","center", false, false, false, false, true)
		local fuelveh = getElementData(veh,"fuel")
		dxDrawRectangle ( x*1480,y*860 ,x*fuelveh,y*19, tocolor ( 102, 178, 255, 255 ) )
		dxDrawLine(x*1480,y*860 ,x*1580,y*860,tocolor ( 255, 255, 255, 255 ) )--Up
		dxDrawLine(x*1480,y*878 ,x*1580,y*878,tocolor ( 255, 255, 255, 255 ) )--Down
		dxDrawLine(x*1480,y*860 ,x*1480,y*878.3,tocolor ( 255, 255, 255, 255 ) )--Right
		dxDrawLine(x*1580,y*860 ,x*1580,y*878.3,tocolor ( 255, 255, 255, 255 ) )--Left
		dxDrawImage(x*1295,y*600,x*280.5,y*285.5,"files/Spedo.png")
		dxDrawImage(x*1295,y*595,x*280.5,y*285.5,"files/strelkaspedo.png",rotation-214) -- -150 to 90
		dxDrawText("Benzin: "..fuelveh.."%",x*3060,y*1763,x*5,y*5,tocolor(255,255,255,255),1,font05,"center","center")
		if getVehicleEngineState( veh ) then
			dxDrawImage(x*1330,y*853,x*35,y*35,"files/engine.png",0,0,0,tocolor(255,255,255,255))
		else
			dxDrawImage(x*1330,y*853,x*35,y*35,"files/engine.png",0,0,0,tocolor(255,255,255,100))
		end
		if getVehicleOverrideLights( veh ) == 2 then
			dxDrawImage(x*1370,y*852,x*40,y*40,"files/light.png",0,0,0,tocolor(255,255,255,255))
			
		elseif getVehicleOverrideLights( veh ) == 1 then
			dxDrawImage(x*1370,y*852,x*40,y*40,"files/light.png",0,0,0,tocolor(255,255,255,100))
		else
			local h,m = getTime()
			if h >= 7 and h <= 21 then
				dxDrawImage(x*1370,y*852,x*40,y*40,"files/light.png",0,0,0,tocolor(255,255,255,100))
			else
				dxDrawImage(x*1370,y*852,x*40,y*40,"files/light.png",0,0,0,tocolor(255,255,255,255))
			end
		end
		if isVehicleLocked(veh) then
			dxDrawImage(x*1410,y*853,x*35,y*35,"files/lock.png",0,0,0,tocolor(255,255,255,255))
		else
			dxDrawImage(x*1410,y*853,x*35,y*35,"files/unlock.png",0,0,0,tocolor(255,255,255,100))
		end
		if getElementData(veh, "dasti") == true  then
			dxDrawImage(x*1442,y*852,x*40,y*40,"files/Dasti.png",0,0,0,tocolor(255,255,255,255))
		else
			dxDrawImage(x*1442,y*852,x*40,y*40,"files/Dasti.png",0,0,0,tocolor(255,255,255,100))
		end
		
	end
end
addEventHandler("onClientRender",root,drawSpeedometer)

bindKey ("1", "down",
function()
	if isPedInVehicle (localPlayer) then
		local veh = getPedOccupiedVehicle(localPlayer)
		local id = getElementModel(veh)
		if id ~= "481" then
			triggerServerEvent("roshanKon", localPlayer)
		end
	end
end)

addEvent("PlayEngin", true)
addEventHandler("PlayEngin",root,
function ()
	local sedaengin = playSound("sounds/1.mp3",false)
	setSoundVolume(sedaengin,1)
end)

bindKey ("j", "down",
function()
	if isPedInVehicle (localPlayer) then
		local veh = getPedOccupiedVehicle(localPlayer)
		local id = getElementModel(veh)
		triggerServerEvent("kapoot", getLocalPlayer())
	end
end
)

bindKey ("k", "down",
function()
	if isPedInVehicle (localPlayer) then
		local veh = getPedOccupiedVehicle(localPlayer)
		local id = getElementModel(veh)
		triggerServerEvent("sandoq", getLocalPlayer())
	end
end
)

bindKey("5","down",function()
	triggerServerEvent( "cheraq", localPlayer  )
end)

bindKey ("i", "down",
function()
	if isPedInVehicle (localPlayer) then
		local veh = getPedOccupiedVehicle(localPlayer)
		local id = getElementModel(veh)
		triggerServerEvent("shagerd", getLocalPlayer())
	end
end
)

bindKey ("3", "down",function()
	if isPedInVehicle (localPlayer) then
		local seat = getPedOccupiedVehicleSeat (localPlayer)
		if tonumber(seat) == 0 then
			if getElementData(getPedOccupiedVehicle(localPlayer), "dasti") == true then

				triggerServerEvent("Dasti",localPlayer)
			else

				triggerServerEvent("Dasti",localPlayer)
			end
		end
	end
end)
addEvent("PlayFalse", true)
addEventHandler("PlayFalse",root,
function ()
	brake_false = playSound("sounds/3.mp3",false)
	setSoundVolume(brake_false,1)
end
)
addEvent("PlayTrue", true)
addEventHandler("PlayTrue",root,
function ()
	brake_true = playSound("sounds/2.mp3",false)
	setSoundVolume(brake_true,1)
end
)

