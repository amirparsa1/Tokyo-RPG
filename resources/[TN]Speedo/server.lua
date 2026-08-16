

isBike2 = {[509]=true, [509]=true, [481]=true, [462]=true, [581]=true, [473]=true, [593]=true, [519]=true, [468]=true, [522]=true, [521]=true, [577]=true, [510]=true, [472]=true, [493]=true, [484]=true, [430]=true, [453]=true, [452]=true, [446]=true, [454]=true, [592]=true, [577]=true, [511]=true, [512]=true, [593]=true, [520]=true, [553]=true, [476]=true, [519]=true, [460]=true, [513]=true, [548]=true, [425]=true, [417]=true, [487]=true, [488]=true, [497]=true, [563]=true, [447]=true, [469]=true, [463]=true, [461]=true, [448]=true, [595]=true, [586]=true}
--isBike2 = {[509]=true, [481]=true, [462]=true, [581]=true, [473]=true, [593]=true, [519]=true, [577]=true, [510]=true}
addEvent("cheraq", true)
addEventHandler("cheraq", root,
function()
	local vehicle = getPedOccupiedVehicle(source)
	if vehicle then
		if isBike[getElementModel(vehicle)] then return end
		local seat = getPedOccupiedVehicleSeat (source)
		if tonumber(seat) == 0 then
			if getVehicleOverrideLights(vehicle) ~= 2 then
				setVehicleOverrideLights(vehicle, 2)
			else
				setVehicleOverrideLights(vehicle, 1)
			end
		end
	end
end
)



isBike = {[509]=true, [481]=true, [510]=true, [463]=true}
addEvent("beband", true)
addEventHandler("beband",root,
function()
	local vehicle = getPedOccupiedVehicle(source)
	if vehicle then
		if isBike2[getElementModel(vehicle)] then return end
			setElementData(source, "kamarband", false)
			triggerClientEvent ( source, "PlayKamarbandClose", source)
	end
end
)
local antispamspeedo ={}
isBike = {[509]=true, [481]=true, [510]=true, [463]=true}
addEvent("roshanKon", true)
addEventHandler("roshanKon",root,
function()
	local vehicle = getPedOccupiedVehicle(source)
	if vehicle then
		if isBike[getElementModel(vehicle)] then return end
		local vehicleName = getVehicleName ( vehicle ) -- (#Kz)
		local seat = getPedOccupiedVehicleSeat (source)
		if tonumber(seat) == 0 then
			local engine = getVehicleEngineState(vehicle)
			local vehid = getElementID ( vehicle )
			local rentedBy = getElementData(vehicle, "rentStats")
			local sahebRent = getPlayerName(source)
			if vehid == "rent1" or vehid == "rent2" or vehid == "rent3" or vehid == "rent4" or vehid == "rent5" or vehid == "rent6" or vehid == "rent7" or vehid == "rent8" or vehid == "rent9" or vehid == "rent10" or vehid == "rent11" or vehid == "rent12" or vehid == "rent13" or vehid == "rent14" or vehid == "rent15" or vehid == "rent16" or vehid == "rent17" or vehid == "rent18" or vehid == "rent19" or vehid == "rent20" or vehid == "rent21" or vehid == "rent22" or vehid == "rent23" or vehid == "rent24" or vehid == "rent25" or vehid == "rent26" or vehid == "rent27" or vehid == "rent28" or vehid == "rent29" or vehid == "rent30" or vehid == "rent31" or vehid == "rent32" or vehid == "rent33" or vehid == "rent34" or vehid == "rent35" or vehid == "rent36" or vehid == "rent37" or vehid == "rent38" or vehid == "rent39" then
				if tostring(rentedBy) == tostring(sahebRent) then
					if engine == false then
						setVehicleEngineState(vehicle, true)
					else
						setVehicleEngineState(vehicle, false)
					end
				end
			elseif engine == false then
				if tonumber(getElementData(vehicle,"fuel")) > 0 then
					outputChatBox("#00ff00Engine Started", source, 255, 255, 0,true)
					triggerClientEvent ( source, "PlayEngin", source)
					setTimer(function() setVehicleEngineState(vehicle, true)  end, 1000, 1)
				else
					outputChatBox("#ff0000In Mashin Benzin Nadare!", source, 255, 255, 0,true)
				end
			else
				setVehicleEngineState(vehicle, false)
				outputChatBox("#ff0000Engine Stopped", source, 255, 255, 0,true)
			end
		end
	end
end
)
function sandoq()
	local vehicle = getPedOccupiedVehicle(source)
	if not vehicle then return end
		local seat = getPedOccupiedVehicleSeat (source)
		if tonumber(seat) == 0 then
			if getVehicleDoorOpenRatio ( vehicle, 1 ) == 0 then
				setVehicleDoorOpenRatio(vehicle, 1, 1, 1000)
			else
				setVehicleDoorOpenRatio(vehicle, 1, 0, 1000)
			end
		end
	end
addEvent("sandoq", true)
addEventHandler("sandoq", root, sandoq)
function kapoot()
	local vehicle = getPedOccupiedVehicle(source)
	if not vehicle then return end
		local seat = getPedOccupiedVehicleSeat (source)
		if tonumber(seat) == 0 then
			if getVehicleDoorOpenRatio ( vehicle, 0 ) == 0 then
				setVehicleDoorOpenRatio(vehicle, 0, 1, 1000)
			else
				setVehicleDoorOpenRatio(vehicle, 0, 0, 1000)
			end
		end
	end
addEvent("kapoot", true)
addEventHandler("kapoot", root, kapoot)
addEvent("bazkon", true)
addEventHandler("bazkon",root,
function()
	local vehicle = getPedOccupiedVehicle(source)
	if vehicle then
		if isBike2[getElementModel(vehicle)] then return end
		setElementData(source, "kamarband", true)
		triggerClientEvent ( source, "PlayKamarbandOpen", source)
	end
end
)
function shagerd()
	local vehicle = getPedOccupiedVehicle(source)
	if not vehicle then return end
		local seat = getPedOccupiedVehicleSeat (source)
		if tonumber(seat) == 0 then
			if getVehicleDoorOpenRatio ( vehicle, 3 ) == 0 then
				setVehicleDoorOpenRatio(vehicle, 3, 1, 1000)
			else
				setVehicleDoorOpenRatio(vehicle, 3, 0, 1000)
			end
		end
	end
addEvent("shagerd", true)
addEventHandler("shagerd", root, shagerd)

function exitVehicle ( thePlayer, seat, jacked )
	setElementData(thePlayer, "kamarband", false)
end
addEventHandler ( "onVehicleStartExit", getRootElement(), exitVehicle)

function defaultBelt()
	if getElementData(source, "kamarband") == true then
		setElementData(source, "kamarband", false)
	end
end
addEventHandler ( "onPlayerQuit", root, defaultBelt )

function exitMashin ( thePlayer, seat, jacked )
	local vehicle = getPedOccupiedVehicle(thePlayer)
	if vehicle then
		if isBike[getElementModel(vehicle)] then return end
		local seat = getPedOccupiedVehicleSeat (thePlayer)
		if tonumber(seat) == 0 then
			local engine = getVehicleEngineState(vehicle)
			if engine == true then
				setElementData(vehicle, "motor", true)
			else
				setElementData(vehicle, "motor", false)
			end
		end
	end
end
addEventHandler ( "onVehicleStartExit", getRootElement(), exitMashin)
function enterMashin ( thePlayer, seat, jacked )
	local vehicle = getPedOccupiedVehicle(thePlayer)
	if vehicle then
		if isBike[getElementModel(vehicle)] then return end
		local seat = getPedOccupiedVehicleSeat (thePlayer)
		if tonumber(seat) == 0 then
			if getElementData(vehicle, "motor") == true then
				setVehicleEngineState(vehicle, true)
			else
				setVehicleEngineState(vehicle, false)
			end
			if tonumber(getElementData(vehicle,"nitro")) == 1 then
				addVehicleUpgrade ( vehicle, 1008 )
			elseif tonumber(getElementData(vehicle,"nitro")) == 2 then
				addVehicleUpgrade ( vehicle, 1009 )
			elseif tonumber(getElementData(vehicle,"nitro")) == 3 then
				addVehicleUpgrade ( vehicle, 1010 )
			end
			if isBike2[getElementModel(vehicle)] then return end
			if getElementData(vehicle, "motor") == false then
				toggleControl ( thePlayer, "handbrake",false )
				setControlState(thePlayer, "handbrake", true)
				setElementData(vehicle, "dasti", true)
			end
		end
	end
end
addEventHandler ( "onVehicleEnter", getRootElement(), enterMashin)





addEvent("Dasti", true)
addEventHandler("Dasti",root,
function()
	local vehicle = getPedOccupiedVehicle(source)
	if vehicle then
		if isBike2[getElementModel(vehicle)] then return end
		local seat = getPedOccupiedVehicleSeat (source)
		if tonumber(seat) == 0 then
			if getElementData(vehicle, "dasti") and getElementData(vehicle, "dasti") == true then

				toggleControl(source, "handbrake", true)
				setControlState(source, "handbrake", false)
				setElementData(vehicle, "dasti", false)
				triggerClientEvent ( source, "PlayFalse", source)
			else
				
				toggleControl ( source, "handbrake",false )
				setControlState(source, "handbrake", true)
				setElementData(vehicle, "dasti", true)
				triggerClientEvent ( source, "PlayTrue", source)
			end
		end
	end
end
)


-- fixe Kill Shodan Hengame Benzin Zadan





addEventHandler( "onResourceStart", resourceRoot,
function()
	for _, mashina in ipairs(getElementsByType("vehicle")) do
		setElementData(mashina, "duty", false)
	end
end)

function getElementSpeed(element,unit)
	if (unit == nil) then unit = 0 end
	if (isElement(element)) then
		local x,y,z = getElementVelocity(element)
		if (unit=="mph" or unit==1 or unit =='1') then
			return (x^2 + y^2 + z^2) ^ 0.5 * 100
		else
			return (x^2 + y^2 + z^2) ^ 0.5 * 1.8 * 100
		end
	else
		outputDebugString("Not an element. Can't get speed")
		return false
	end
end
---------------------------------
-------**Script By ExoPrim**-------
---------------------------------
--Hale Buge Benzin--
function isVehicleEmpty( vehicle )
	if not isElement( vehicle ) or getElementType( vehicle ) ~= "vehicle" then
		return true
	end

	local passengers = getVehicleMaxPassengers( vehicle )
	if type( passengers ) == 'number' then
		for seat = 0, passengers do
			if getVehicleOccupant( vehicle, seat ) then
				return false
			end
		end
	end
	return true
end


		--if id ~= 481 or id ~= 510 or id ~= 509 or id ~= 472 or id ~= 473 or id ~= 493 or id ~= 595 or id ~= 484 or id ~= 430 or id ~= 453 or id ~= 452 or id ~= 446 or id ~= 454 or id ~= 592 or id ~= 577 or id ~= 511 or id ~= 512 or id ~= 593 or id ~= 520 or id ~= 553 or id ~= 476 or id ~= 519 or id ~= 460 or id ~= 513 or id ~= 548 or id ~= 425 or id ~= 417 or id ~= 487 or id ~= 488  or id ~= 497  or id ~= 563  or id ~= 447 or id ~= 469  then
			
			
addEventHandler("OnGlobalTimer", root, 
function( thePlayer )
	for _, mashina in ipairs(getElementsByType("vehicle")) do
	    local id = getElementModel ( mashina )
		if id ~= 481 and id ~= 510 and id ~= 509 and id ~= 472 and id ~= 473 and id ~= 493 and id ~= 595 and id ~= 484 and id ~= 430 and id ~= 453 and id ~= 452 and id ~= 446 and id ~= 454 and id ~= 592 and id ~= 577 and id ~= 511 and id ~= 512 and id ~= 593 and id ~= 520 and id ~= 553 and id ~= 476 and id ~= 519 and id ~= 460 and id ~= 513 and id ~= 548 and id ~= 425 and id ~= 417 and id ~= 487 and id ~= 488  and id ~= 497  and  id ~= 563 and id ~= 447 and id ~= 469  then	
		 -- Age 2 Charkhe -- Havapeyma -- Ghayegh Nabod benzin bere -- 
			if not isVehicleEmpty(mashina) then
			if getVehicleEngineState(mashina) == true then
			if getElementData(mashina,"fueltime") then
				if tonumber(getElementSpeed(mashina,"kph")) - 14 > 120 then
					if getElementData(mashina,"fueltime") < 3 then
						setElementData(mashina,"fueltime",25)
						local benzin = getElementData(mashina,"fuel")
						local benzinbadi = tonumber(benzin) - 1
						setElementData(mashina,"fuel",benzinbadi)
					else
						local fueltime = getElementData(mashina,"fueltime")
						local fueltimebadi = tonumber(fueltime) - 2
						setElementData(mashina,"fueltime",fueltimebadi)
					end
				else
					if getElementData(mashina,"fueltime") > 0 then
						local fueltime = getElementData(mashina,"fueltime")
						local fueltimebadi = tonumber(fueltime) - 1
						if tonumber(fueltimebadi) > 0 then
							setElementData(mashina,"fueltime",fueltimebadi)
						else
							setElementData(mashina,"fueltime",25)
							if getElementData(mashina,"fuel") then
								local benzin = getElementData(mashina,"fuel")
								local benzinbadi = tonumber(benzin) - 1
								setElementData(mashina,"fuel",benzinbadi)
							else
								setElementData(mashina,"fuel",100)
							end
						end
					end
				end
				if getElementData(mashina,"fuel") and tonumber(getElementData(mashina,"fuel")) == 0 then
					setVehicleEngineState(mashina, false)
				end
			else
				setElementData(mashina,"fueltime",25)
			end
			end
		end
		end
	end
end)
-------------------------------------------------------------------------
--Script by ExoPrim--
-- Hale Buge Benzin --
--function khorojeCar (thePlayer, seat, jacked)
--local theVehicle = getPedOccupiedVehicle (thePlayer)
	--if jacked then
	--return false
	--end
--local seat = getPedOccupiedVehicleSeat (thePlayer)
	--if tonumber(seat) == 0 then
		--setVehicleEngineState(theVehicle, false)
	--end
--end

--addEventHandler("onVehicleStartExit", getRootElement(), khorojeCar)
--------------------------------------------------------------------------

local PompLocations = {
  
                       -- Truker__ Flint country --

	{-92.1748046875 ,-1162.1572265625 ,2},
	{-96.919921875 ,-1173.6943359375 ,2},
	{-90.18359375 ,-1176.369140625 ,2},
	{-85.5078125 ,-1165.2490234375 ,2},
	
				      -- Smat rast Khaviar IRM__ Tierra Robada --	
	{-1477.8056640625 ,1859.5126953125 ,32.6328125},
	{-1465.0849609375 ,1860.6533203125 ,32.639846801758},
	{-1477.9326171875 ,1867.3154296875 ,32.639846801758},
	{-1465.580078125 ,1868.1689453125 ,32.6328125},

			          --Rosta Samte Rast spray bala chap__ Tierra Robada --	
	{-1329.2421875 ,2669.1279296875 ,50.0625},
	{-1328.783203125 ,2674.693359375 ,50.0625},
	{-1328.06640625 ,2680.0615234375 ,50.0625},
	{-1327.244140625 ,2685.6005859375 ,50.0625},

		              --Spray bala Sf__ Juniper Hollow --	
	{-2410.666015625 ,970.6923828125 ,45.4609375},
	{-2410.6845703125 ,976.03515625 ,45.4609375},
	{-2410.5986328125 ,981.5625 ,45.4609375},

	                  --Vasat samt rast sf__ Easter basin --	

	{-1679.560546875 ,402.9931640625 ,7.3984375},
	{-1675.546875 ,407.1884765625 ,7.3984375},
	{-1670.08203125 ,412.46484375 ,7.3984375},
	{-1665.830078125 ,416.892578125 ,7.3984375},
    {-1686.3115234375 ,409.6435546875 ,7.4056625366211},
	{-1681.9736328125 ,413.7119140625 ,7.3984375},
	{-1676.8486328125 ,419.11328125 ,7.4056625366211},
	{-1672.541015625 ,423.5615234375 ,7.3984375},
	
		             --Rosta goshe chap painn spray dar__ Angel pine --	
	{-2242 ,-2562.5 ,31.921875},
	{-2246.5439453125 ,-2559.7734375 ,31.71431350708},


		             --pain same chap narside be rosta__ Whetstone --	
	{-1600.1650390625 ,-2707.7533203125 ,48.5390625},
	{-1603.974609375 ,-2712.430859375 ,48.533473968506},
	{-1607 ,-2716.8302734375 ,48.5390625},
	{-1610.5 ,-2720.9306640625 ,48.5390625},
	
	                --Rosta Samte Chap Paiin LV__ Montgomery --	
	{1384.46875 ,458.5 ,20.34520339965},
	{1380.0322265625 ,460.5 ,20.345203399658},

	               --Kavir Samte Chap Lv__ Bone Country --	

	{603.0673828125 ,1706.87890625 ,6.9921875},
	{606.9365234375 ,1701.830078125 ,6.9995288848877},
	{610.4173828125 ,1696.8994140625 ,6.9921875},
	{613.9744140625 ,1692.290625 ,7.1875},
    {617.3923828125 ,1687.0869140625 ,6.9921875},
	{620.676171875 ,1682 ,6.9921875},
	{624.2 ,1677.2353515625 ,6.9921875},
	              --LV(Bala-Bala)__ Spinybed --	

	{2141.6923828125 ,2753.26171875 ,10.8203125},
	{2147.619140625 ,2753.26171875 ,10.8203125},
	{2153.2314453125 ,2753.2626953125 ,10.8203125},
	{2153.3271484375 ,2742.4658203125 ,10.8203125},
    {2147.5703125 ,2742.4658203125 ,10.8203125},
	{2141.7509765625 ,2742.46484375 ,10.8203125},
	
	              --LV(Bala-Rast)__ The Emerald Isle --	

	{2207.8 ,2480.3037109375 ,10.995170593262},
	{2207.8 ,2474.6787109375 ,10.995170593262},
	{2207.8 ,2470.279296875 ,10.995170593262},
	{2197 ,2470.2294921875 ,10.995170593262},
    {2197 ,2474.703125 ,10.995170593262},
	{2197 ,2480.310546875 ,10.995170593262},
	
	             --LV(Rast-Paiin)__ Las Venturas --	

	{2634.673828125 ,1111.669921875 ,10.9609375},
	{2639.80859375 ,1111.669921875 ,10.9609375},
	{2645.275390625 ,1111.669921875 ,10.9609375},
	{2645.2861328125 ,1100.8798828125 ,10.9609375},
    {2639.8896484375 ,1100.8798828125 ,10.9609375},
	{2634.5771484375 ,1100.8798828125 ,10.9609375},
	
                 --LV(Paiin)__ Las Venturas --	

	{2120.8427734375 ,914.6396484375 ,10.9609375},
	{2114.9013671875 ,914.6396484375 ,10.9609375},
	{2109.056640625 ,914.6396484375 ,10.9609375},
	{2109.0087890625 ,925.4 ,10.9609375},
    {2114.90625 ,925.4 ,10.9609375},
	{2120.828125 ,925.4 ,10.9609375},
	
                 --LV(BALA)__ Redsands West --
	{1596.1279296875 ,2204.319921875 ,11.060997009277},
	{1602.046875 ,2204.319921875 ,11.060997009277},
	{1590.37890625 ,2204.319921875 ,11.060997009277},
	{1601.986328125 ,2193.8 ,10.8203125},
	{1596.06640625 ,2193.8 ,11.060997009277},
	{1590.3359375 ,2193.130859375 ,11.060997009277},
	
              	--Rosta__ Dillimore --
	{655.8 ,-559.7470703125 ,16.501491546631},
	{655.5 ,-570.4169921875 ,16.501491546631},
	
			    --LS(Bala)Molholand --
	{1000.3037109375 ,-937.2294921875 ,42.328125},
	{1007.678515625 ,-936.373046875 ,42.328125},
	{1004 ,-936.9267578125 ,42.328125},

	
	--LS(Paiin)ldlewood --
	{1942.048828125 ,-1778.5966796875 ,13.640625},
	{1941.951171875 ,-1774.5576171875 ,13.640625},
	{1941.8720703125 ,-1770.65234375 ,13.640625},
	{1941.9423828125 ,-1767.31640625 ,13.640625},
	
	--LS garaj --
	{892.054 ,-1197.334 ,16.976},
}

local PompMarker = {}

function BindKonBezinRe(hitElement,matchingDimension)
	if hitElement and getElementType(hitElement) == "player" then
		if isPedInVehicle(hitElement) then --Faghat Savare Veh Notf Bde #ExoPrim
			exports["notf"]:addNotification(hitElement, "Baraye Benzin Zadan Dokme ( C ) Ra Negah Darid!" , 'info')
			bindKey( hitElement, "C", "down", shorokonbenzino )
			bindKey( hitElement, "C", "up", tamomkonbenzino )
		end
	end
end

function UnBindKonBezinRe(hitElement,matchingDimension)
	if hitElement and getElementType(hitElement) == "player" then
		unbindKey( hitElement, "C", "down", shorokonbenzino )
		unbindKey( hitElement, "C", "up", tamomkonbenzino )
	end
end

function shorokonbenzino( thePlayer )
	if isPedInVehicle ( thePlayer ) then
		if getPedOccupiedVehicleSeat ( thePlayer ) == 0 then
			local Veh = getPedOccupiedVehicle(thePlayer)
			if getVehicleEngineState(Veh) == false then
				setElementData(thePlayer,"inbenzin",true)
			else
				exports["notf"]:addNotification(thePlayer, "Baraye Benzin Zadan Ebteda Motor Khodro Ra Khamosh Konid!" , 'error')
				triggerClientEvent ( thePlayer, "PlayError", thePlayer, "Hello World!" )
			end
		end
	end
end

function tamomkonbenzino( thePlayer )
	setElementData(thePlayer,"inbenzin",nil)
	spFilSound(thePlayer)
end

function createPomps ()
    for i=1 , #PompLocations do
        local x,y,z = PompLocations[i][1],PompLocations[i][2],PompLocations[i][3]
        PompMarker[i] = createMarker(x,y,z-1 , "cylinder", 5, 0, 106, 255,0)
        addEventHandler("onMarkerHit",PompMarker[i],BindKonBezinRe)
		addEventHandler( "onMarkerLeave", PompMarker[i], UnBindKonBezinRe )
    end
end	
createPomps()
local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]


addEventHandler("OnGlobalTimer", root, 
function()
	for _, p in ipairs(getElementsByType("player")) do
		if p then
			if getElementData(p,"inbenzin") and getElementData(p,"inbenzin") == true then
				if isPedInVehicle(p) then
					if tonumber(getPlayerMoney(p)) >= 25 then
						local Veh = getPedOccupiedVehicle(p)
						if getVehicleEngineState(Veh) == false then
							if getElementData(Veh,"fuel") and tonumber(getElementData(Veh,"fuel")) < 100 then
								local BezinGhabli = getElementData(Veh,"fuel")
								local BezinBaadi = tonumber(BezinGhabli) + 5
								setElementData(Veh,"fuel",BezinBaadi)
								takePlayerMoney ( p, 17 )
								stFilSound(p)
							else
							spFilSound(p)
								--triggerClientEvent ( p, "PlayMovafagh", p, "Hello World!" )
								--exports["notf"]:addNotification(p,"Benzin Khodroy Shoma Por Shod." , 'success')
							end
							
							-- Age benzinesh Bishtar az *145 Va kamtar Mosavi *150 Bod Notf Biaad
							if getElementData(Veh,"fuel") and tonumber(getElementData(Veh,"fuel")) >= 146 and getElementData(Veh,"fuel") and tonumber(getElementData(Veh,"fuel")) >= 150 then
								exports["notf"]:addNotification(p,"Benzin Khodroye Shoma Por Ast." , 'error')
								triggerClientEvent ( p, "PlayError", p, "Hello World!" )
							end
							
							-- Age benzinesh Bishtar az *125 Va kamtar Mosavi *130 Bod Notf Biad
							if tonumber(getElementData(accSys:getPlayerAcc(p), "pGoldPremium")) <= 0 then
								if getElementData(Veh,"fuel") and tonumber(getElementData(Veh,"fuel")) >= 126 and getElementData(Veh,"fuel") and tonumber(getElementData(Veh,"fuel")) >= 130 then
									exports["notf"]:addNotification(p,"Benzin Khodroye Shoma Por Ast." , 'error')
									triggerClientEvent ( p, "PlayError", p, "Hello World!" )
								end
							end
							-- Age benzinesh Bishtar az *115 Va kamtar Mosavi *120 Bod Notf Biad
							if tonumber(getElementData(accSys:getPlayerAcc(p), "pGoldPremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(p), "pSilverPremium")) <= 0  then
								if getElementData(Veh,"fuel") and tonumber(getElementData(Veh,"fuel")) >= 116 and getElementData(Veh,"fuel") and tonumber(getElementData(Veh,"fuel")) >= 120 then
									exports["notf"]:addNotification(p,"Benzin Khodroye Shoma Por Ast." , 'error')
									triggerClientEvent ( p, "PlayError", p, "Hello World!" )
								end
							end
						end
					else
					exports["notf"]:addNotification(p, "Baraye Zadan Benzin Hadaghal Be $25 Niaz Darid!" , 'error')
					triggerClientEvent ( p, "PlayError", p, "Hello World!" )
					end
				else
					setElementData(p,"inbenzin",nil)
				end
			end
		end
	end
end)

function stFilSound(root)
	
	triggerClientEvent("fillsoundstart", root, root)
end

function spFilSound(root)
	triggerClientEvent("fillsoundstop", root, root)
end


