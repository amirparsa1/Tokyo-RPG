local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

ticketTax = get("ticketTax")
allowExit = get("allowExit")
rangeOfRadar = get("rangeOfRadar")


function activateSpeedCamera(source, commandName, allowedspeed)
	local ok = 0	
	local radiuses = getElementsByType("colshape")
	for theKey, theRadius in ipairs(radiuses) do
		if getElementData(theRadius, "Creator") == tostring(getPlayerName(source)) then
			ok = 1
		end
	end
		
	if ok == 0 then	
	local theVehicle = getPedOccupiedVehicle ( source )
	if theVehicle then 
		local vehid = getElementID ( theVehicle )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
		integerspeed = tonumber(allowedspeed)
		if integerspeed then
			if vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
				or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
				or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" then
				if integerspeed > 59 and integerspeed <500 then
					setElementFrozen(theVehicle, true)
					setElementData(theVehicle, "Speedcamera", 1)
					local x, y, z = getElementPosition(theVehicle)
					radius = createColSphere(x, y, z, rangeOfRadar)
					local creator = getPlayerName(source)
					setElementData(theVehicle, "Creator", creator)
					setElementData(radius, "Creator", creator)
					setElementData(radius, "Allowedspeed", integerspeed)
					outputChatBox("#EEE685SpeedCam e Shoma Fa'al Shod.", source, 255, 255, 255, true)	
					playSoundFrontEnd ( source, 101 )
				end
			end
	end
	else
		outputChatBox("SYNTAX: /speedon <speed allowed in km/h but bigger than 60>", source)
		outputChatBox("EXAMPLE: /speedon 70", source)
	end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Police Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#EEE685Shoma Dar Hale Hazer SpeedCam Hastid Nemitonid Dobare Bezarid", source, 255, 255, 255, true)
	end
end
addCommandHandler("speedon", activateSpeedCamera)

function deactivateSpeedCamera(source, commandName)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
	if isPedInVehicle(source) then
	local theVehicle = getPedOccupiedVehicle ( source )
	if theVehicle then
	local vehid = getElementID ( theVehicle )
	if vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
				or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
				or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" then
		setElementFrozen(theVehicle, false)
		setElementData(theVehicle, "Speedcamera", 0)
		local radiuses = getElementsByType("colshape")
		for theKey, theRadius in ipairs(radiuses) do
			if getElementData(theRadius, "Creator") == tostring(getPlayerName(source)) then
				destroyElement(theRadius)
			end
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Police Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#EEE685SpeedCam e Shoma Gheyre Fa'al Shod.", source, 255, 255, 255, true)	
		playSoundFrontEnd ( source, 101 )
	end
	else
		outputChatBox("#EEE685Shoma Dakhele Mashin Nistid Baray Zadane In Cmd.", source, 255, 255, 255, true)
	end
end
end
addCommandHandler("speedoff", deactivateSpeedCamera)

function ifPlayerDisconnects()
	local vehicles = getElementsByType("vehicle")
	for theKey, theVehicle in ipairs(vehicles) do
		if getElementData(theVehicle, "Creator") == tostring(getPlayerName(source)) then
			setElementFrozen(theVehicle, false)
			setElementData(theVehicle, "Speedcamera", 0)
		end
	end
	local radiuses = getElementsByType("colshape")
	for theKey, theRadius in ipairs(radiuses) do
		if getElementData(theRadius, "Creator") == tostring(getPlayerName(source)) then
			destroyElement(theRadius)
		end
	end
	outputChatBox("#EEE685SpeedCam e Shoma Gheyre Fa'al Shod.", source, 255, 255, 255, true)	
end
addEventHandler("onPlayerQuit", getRootElement(), ifPlayerDisconnects)

function ifPlayerDies()
	local vehicles = getElementsByType("vehicle")
	for theKey, theVehicle in ipairs(vehicles) do
		if getElementData(theVehicle, "Creator") == tostring(getPlayerName(source)) then
			setElementFrozen(theVehicle, false)
			setElementData(theVehicle, "Speedcamera", 0)
		end
	end
	local radiuses = getElementsByType("colshape")
	for theKey, theRadius in ipairs(radiuses) do
		if getElementData(theRadius, "Creator") == tostring(getPlayerName(source)) then
			destroyElement(theRadius)
		end
	end
	outputChatBox("#EEE685SpeedCam e Shoma Gheyre Fa'al Shod.", source, 255, 255, 255, true)	
end
addEventHandler("onPlayerWasted", getRootElement(), ifPlayerDies)

function ticketTheSpeedoman(theVehicle)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 then
	if getElementType(theVehicle) == "vehicle" then
	local vehid = getElementID ( theVehicle )
		if vehid == "carfbi1" or vehid == "carfbi2" or vehid == "carfbi3" or vehid == "carfbi4" or vehid == "carfbi5" or vehid == "carfbi6" or vehid == "carfbi7" or vehid == "carfbi8" or vehid == "carfbi9" 
			or vehid == "carfbi10" or vehid == "carfbi11" or vehid == "carfbi12" or vehid == "carfbi13" or vehid == "carfbi14" or vehid == "motofbi1" or vehid == "motofbi2" or vehid == "motofbi3" or vehid == "motofbi4"
			or vehid == "motofbi5" or vehid == "motofbi6" or vehid == "motofbi7" or vehid == "motofbi8"or vehid == "motofbi9" or vehid == "motofbi10" or vehid == "helifbi1" or vehid == "helifbi2" or vehid == "helifbi3"
			or vehid == "helifbi4" or vehid == "vehicle (Barracks) (1)" or vehid == "vehicle (Barracks) (11)" or vehid == "vehicle (Barracks) (12)" or vehid == "vehicle (Barracks) (13)" or vehid == "vehicle (Barracks) (14)" 
			or vehid == "vehicle (Barracks) (15)" or vehid == "vehicle (Barracks) (16)" or vehid == "vehicle (Barracks) (17)" or vehid == "vehicle (Patriot) (13)" or vehid == "vehicle (Patriot) (14)" 
			or vehid == "vehicle (Patriot) (15)" or vehid == "vehicle (Patriot) (16)" or vehid == "vehicle (Patriot) (22)" or vehid == "vehicle (Cargobob) (1)" or vehid == "vehicle (Sanchez) (1)"
			or vehid == "vehicle (Sanchez) (2)" or vehid == "vehicle (Sanchez) (3)" or vehid == "vehicle (Sanchez) (4)" or vehid == "vehicle (Sanchez) (5)" or vehid == "vehicle (Sanchez) (6)"
			or vehid == "vehicle (Sanchez) (7)" or vehid == "vehicle (Sanchez) (8)" or vehid == "vehicle (Sanchez) (9)" or vehid == "vehicle (Sanchez) (10)" or vehid == "vehicle (Sanchez) (11)" 
			or vehid == "vehicle (Patriot) (23)" or vehid == "vehicle (Seasparrow) (1)" or vehid == "vehicle (Seasparrow) (2)" or vehid == "vehicle (Seasparrow) (3)" or vehid == "vehicle (Hunter) (1)" 
			or vehid == "vehicle (Hunter) (2)" or vehid == "vehicle (Rhino) (3)" or vehid == "vehicle (Rhino) (4)" or vehid == "vehicle (Rhino) (5)" or vehid == "vehicle (Hydra) (1)" or vehid == "vehicle (Police LV) (4)" 
			or vehid == "vehicle (Police LV) (5)" or vehid == "vehicle (Police LV) (6)" or vehid == "vehicle (Police LV) (7)" or vehid == "vehicle (Police LV) (8)" or vehid == "vehicle (Police LV) (9)" or vehid == "vehicle (Flash) (1)" 
			or vehid == "vehicle (Flash) (2)" or vehid == "vehicle (Flash) (3)" or vehid == "vehicle (Flash) (4)" or vehid == "vehicle (Vortex) (1)" or vehid == "vehicle (Vortex) (2)" or vehid == "vehicle (Vortex) (3)" or vehid == "vehicle (Bandito) (1)" 
			or vehid == "vehicle (Bandito) (2)" or vehid == "vehicle (Bandito) (3)" or vehid == "vehicle (Bandito) (4)" or vehid == "vehicle (Vortex) (4)" or vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
				or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
				or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" or vehid == "helipd1" or vehid == "helipd2" or vehid == "helipd3" or vehid == "helipd4" then 
		if getElementData(source, "Creator") then	
			speedx, speedy, speedz = getElementVelocity ( theVehicle )
			actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5) 
			kmh = math.ceil(actualspeed * 180)
			if getElementData(source, "Allowedspeed") < kmh then
				local driver = getVehicleOccupant(theVehicle)
				local moneydriver = getPlayerMoney(driver)
				if getPlayerMoney(driver) > ticketTax and getPlayerMoney(driver) > 0 then
					takePlayerMoney(driver, ticketTax)
					outputChatBox("#EEE685You have been ticketed for speeding ("..kmh.."km/h). You paid #FF0000$"..tostring(ticketTax).."#EEE685.", driver, 255, 255, 255, true)	
					fadeCamera ( driver, false, 0.2, 255, 255, 255)
					setTimer ( fadeCamera, 500, 1, driver, true, 2 )
				else
					takePlayerMoney(driver, getPlayerMoney(driver))
					outputChatBox("#EEE685You have been ticketed for speeding ("..kmh.."km/h). You paid #FF0000$"..tostring(moneydriver).."#EEE685.", driver, 255, 255, 255, true)	
					fadeCamera ( driver, false, 0.2, 255, 255, 255)
					 setTimer ( fadeCamera, 500, 1, driver, true, 2 )
				end
				
				local ticketer = getElementData(source, "Creator")
				local ticketername = getPlayerFromName(ticketer)
				if getPlayerMoney(driver) > ticketTax and getPlayerMoney(driver) > 0 then
					givePlayerMoney( ticketername, ticketTax)
					outputChatBox("#EEE685You ticketed " ..getPlayerName(driver).. " for speeding ("..kmh.."km/h) with #FF0000$"..tostring(ticketTax).."#EEE685.",  ticketername, 255, 255, 255, true)	
					playSoundFrontEnd ( ticketername, 101 )
				else
					givePlayerMoney( ticketername, moneydriver)
					outputChatBox("#EEE685You ticketed " ..getPlayerName(driver).. " for speeding ("..kmh.."km/h) with #FF0000$"..tostring(moneydriver).."#EEE685.",  ticketername, 255, 255, 255, true)	
					playSoundFrontEnd ( ticketername, 101 )
				end
			end
		end
		end
	end
	end
end
addEventHandler("onColShapeHit", getRootElement(), ticketTheSpeedoman)

function stopFromExit(thePlayer)
	if allowExit == false and getElementData(source, "Speedcamera") == 1 then
		cancelEvent()
		outputChatBox("#EEE685You cannot leave the vehicle when speed camera is activated.", thePlayer, 255, 255, 255, true)
	end
end
addEventHandler ( "onVehicleStartExit", getRootElement(), stopFromExit ) 

		