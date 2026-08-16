local accSys = exports["accounts-system"]
local miscSys = exports["misc"]

function killjail ( ammo, attacker, weapon, bodypart )
	if getElementData(source, "inpaintball") == true then
		return
	end
	if ( attacker ) then
	    if tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) < 4 then
		local wanted = getPlayerWantedLevel(source)
		local mojrem = getPlayerName(source)
		if tonumber(wanted) == 1 then
			sendMojremMessage(attacker, mojrem, 1)
			outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $15,000", attacker, 255, 255, 255, true)
			outputChatBox("#1e47ff[Department]: #ffffffShoma Tavasot "..getPlayerName(attacker).." Ba tedad "..wanted.." Wanted Koshte Shodid Va Alan Zendani Hastid!", source, 255, 255, 255, true)
			givePlayerMoney(attacker, 15000)
		    setElementData(accSys:getPlayerAcc(source), "pJailTime", 400)
		    setElementData(accSys:getPlayerAcc(source), "pAJailed", 3)
			setPlayerWantedLevel(source,0)
		elseif tonumber(wanted) == 2 then
			sendMojremMessage(attacker, mojrem, 2)
			outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $30,000", attacker, 255, 255, 255, true)
			outputChatBox("#1e47ff[Department]: #ffffffShoma Tavasot "..getPlayerName(attacker).." Ba tedad "..wanted.." Wanted Koshte Shodid Va Alan Zendani Hastid!", source, 255, 255, 255, true)
			givePlayerMoney(attacker, 30000)
		    setElementData(accSys:getPlayerAcc(source), "pJailTime", 550)
		    setElementData(accSys:getPlayerAcc(source), "pAJailed", 3)
			setPlayerWantedLevel(source,0)
		elseif tonumber(wanted) == 3 then
			sendMojremMessage(attacker, mojrem, 3)
			outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $45,000", attacker, 255, 255, 255, true)
			outputChatBox("#1e47ff[Department]: #ffffffShoma Tavasot "..getPlayerName(attacker).." Ba tedad "..wanted.." Wanted Koshte Shodid Va Alan Zendani Hastid!", source, 255, 255, 255, true)
			givePlayerMoney(attacker, 45000)
		    setElementData(accSys:getPlayerAcc(source), "pJailTime", 700)
		    setElementData(accSys:getPlayerAcc(source), "pAJailed", 3)
			setPlayerWantedLevel(source,0)
		elseif tonumber(wanted) == 4 then
			sendMojremMessage(attacker, mojrem, 4)
			outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $60,000", attacker, 255, 255, 255, true)
			outputChatBox("#1e47ff[Department]: #ffffffShoma Tavasot "..getPlayerName(attacker).." Ba tedad "..wanted.." Wanted Koshte Shodid Va Alan Zendani Hastid!", source, 255, 255, 255, true)
			givePlayerMoney(attacker, 60000)
		    setElementData(accSys:getPlayerAcc(source), "pJailTime", 850)
		    setElementData(accSys:getPlayerAcc(source), "pAJailed", 3)
			setPlayerWantedLevel(source,0)
		elseif tonumber(wanted) == 5 then
			sendMojremMessage(attacker, mojrem, 5)
			outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $75,000", attacker, 255, 255, 255, true)
			outputChatBox("#1e47ff[Department]: #ffffffShoma Tavasot "..getPlayerName(attacker).." Ba tedad "..wanted.." Wanted Koshte Shodid Va Alan Zendani Hastid!", source, 255, 255, 255, true)
			givePlayerMoney(attacker, 75000)
		    setElementData(accSys:getPlayerAcc(source), "pJailTime", 1000)
		    setElementData(accSys:getPlayerAcc(source), "pAJailed", 3)
			setPlayerWantedLevel(source,0)
		elseif tonumber(wanted) == 6 then
			sendMojremMessage(attacker, mojrem, 6)
			outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $90,000", attacker, 255, 255, 255, true)
			outputChatBox("#1e47ff[Department]: #ffffffShoma Tavasot "..getPlayerName(attacker).." Ba tedad "..wanted.." Wanted Koshte Shodid Va Alan Zendani Hastid!", source, 255, 255, 255, true)
			givePlayerMoney(attacker, 90000)
		    setElementData(accSys:getPlayerAcc(source), "pJailTime", 1150)
		    setElementData(accSys:getPlayerAcc(source), "pAJailed", 3)
			setPlayerWantedLevel(source,0)
		end
		end
	end
end
addEventHandler ( "onPlayerWasted", getRootElement(), killjail )

function sendMojremMessage(root, mojremName, mojremWanted)
	local mojremName = tostring(mojremName)
	local mojremWanted = tonumber(mojremWanted)
	if getElementData(root, "loggedIn") == true then
		for k, v in ipairs (getElementsByType("player")) do
			if getElementData(v, "loggedIn") == true then
				local hisFac = tonumber(getElementData(accSys:getPlayerAcc(v), "pMember"))
				if hisFac > 0 and hisFac < 4 then
					outputChatBox("#1e47ff[DP-Warn]:#ffffff Police "..getPlayerName(root).." Mojrem #1e47ff"..mojremName.."#ffffff Ra Ba #1e47ff"..mojremWanted.." Wanted #ffffffKosht!", v, 255, 255, 255, true)
				end
			end
		end
	end
end

function bbinjaile()
 if tonumber(getElementData(accSys:getPlayerAcc(source), "pJailTime")) > 0 then
  if tonumber(getElementData(accSys:getPlayerAcc(source), "pAJailed")) == 1 then
	local selol = math.random(1,3)
	if selol == 1 then
		setElementPosition (source, 264.3505859375 ,77.869140625 ,1001.0390625)
		setElementInterior ( source, 6 )
	elseif selol == 2 then
		setElementPosition (source, 264.2314453125 ,82.1806640625 ,1001.0390625)
		setElementInterior ( source, 6 )
	elseif selol == 3 then
		setElementPosition (source, 264.0888671875 ,86.701171875 ,1001.0390625)
		setElementInterior ( source, 6 )
	end
	
------------------------------------------------------------------------------

	elseif tonumber(getElementData(accSys:getPlayerAcc(source), "pAJailed")) == 2 then
  	local selolefbi = math.random(1,3)
	if selolefbi == 1 then
	   setElementPosition (source, 215.068359375 ,108.33203125 ,999.015625)
	   setElementInterior ( source, 10 )
	elseif selolefbi == 2 then
	   setElementPosition (source, 219.076171875 ,108.4873046875 ,999.015625)
	   setElementInterior ( source, 10 )
	elseif selolefbi == 3 then
	   setElementPosition (source, 222.9990234375 ,108.6025390625 ,999.015625)
	   setElementInterior ( source, 10 )
	end
	
------------------------------------------------------------------------------

	elseif tonumber(getElementData(accSys:getPlayerAcc(source), "pAJailed")) == 3 then
	local seloleng = math.random(1,6)
 	if seloleng == 1 then
		setElementPosition (source, 88.356452941895 ,182.06640625 ,998.85931396484)
		setElementDimension(source,0)
		setElementInterior(source,3)
	
	elseif seloleng == 2 then
		setElementPosition (source, 92.9267578125 ,181.76171875 ,998.85931396484)
		setElementDimension(source,0)
		setElementInterior(source,3)
	elseif seloleng == 3 then
		setElementPosition (source, 97.23828125 ,181.984375 ,998.86010742188)
		setElementDimension(source,0)
		setElementInterior(source,3)
    elseif seloleng == 4 then
		setElementPosition (source, 97.203125 ,193.8095703125 ,998.8535766601)
		setElementDimension(source,0)
		setElementInterior(source,3)
	elseif seloleng == 5 then
		setElementPosition (source, 93.3974609375 ,193.8056640625 ,998.85357666016)
		setElementDimension(source,0)
		setElementInterior(source,3)
	elseif seloleng == 6 then
		setElementPosition (source, 89.064453125 ,193.76211547852 ,998.85931396484)
		setElementDimension(source,0)
		setElementInterior(source,3)
    end
 
------------------------------------------------------------------------------

  	elseif tonumber(getElementData(accSys:getPlayerAcc(source), "pAJailed")) == 4 then
		local seloleajail = math.random(1,2)
		if seloleajail == 1 then
			setElementPosition (source, 116.9462890625 ,204.6943359375 ,998.86138916016)
			setElementDimension(source, 0)
			setElementInterior(source, 3)
		elseif seloleajail == 2 then
			setElementPosition (source, 110.26171875 ,204.6357421875 ,998.86138916016)
			setElementDimension(source, 0)
			setElementInterior(source, 3)
		end
end
end
end
addEventHandler("onPlayerSpawn", root, bbinjaile)

--[[addCommandHandler("jt",
function ( thePlayer, command )
	local jt = getElementData(accSys:getPlayerAcc(thePlayer), "pJailTime")
	if tonumber(jt) > 0 then
	outputChatBox("#00ff00Time Jaile Shoma: #ff0000"..jt.."#00ff00 Sanie Ast!", thePlayer, 255, 255, 255, true)	
	else
	outputChatBox("#ff0000Shoma Jail Nisti!", thePlayer, 255, 255, 255, true)	
	end
end)--]]

function mainFunction()
	setTimer ( function()
	for _,p in ipairs (getElementsByType("player")) do
		if getElementData(p , "loggedIn") == true then
		--local timeyaru = getElementData(accSys:getPlayerAcc(p),"pJailTime")
			if tonumber(getElementData(accSys:getPlayerAcc(p),"pJailTime")) ~= nil then
				if tonumber(getElementData(accSys:getPlayerAcc(p),"pJailTime")) > 0 then
				local timesh = getElementData(accSys:getPlayerAcc(p), "pJailTime")
				local timebadi = tonumber(timesh)-1
			    setElementData(accSys:getPlayerAcc(p), "pJailTime", tonumber(timebadi))
				setElementData(p, "pJailTime", tonumber(timebadi))
				if getElementData(accSys:getPlayerAcc(p), "pJailTime") == 0 then
	            if tonumber(getElementData(accSys:getPlayerAcc(p), "pMember")) == 0 then
	               setElementModel(p, tonumber(getElementData(accSys:getPlayerAcc(p), "cSkin")))
				else
				   setElementModel(p, tonumber(getElementData(accSys:getPlayerAcc(p), "fSkin")))
				end
				local kojas = getElementData(accSys:getPlayerAcc(p), "pAJailed")
	            if kojas == 1 then
				setElementPosition (p, 255.50390625 ,89.646484375 ,1002.4453125)
		        setElementInterior ( p, 6 )
				outputChatBox("#00ff00Shoma Az Zendan Azad Shodid.", p, 255, 255, 255, true)
				---- Vaghti Az FBI Azad Shod Biad Inja ----
				elseif kojas == 2 then
				setElementPosition (p, 328.8349609375 ,-1513.05859375 ,36.0390625)
		        setElementInterior ( p, 0 )
				outputChatBox("#00ff00Shoma Az Zendan Azad Shodid.", p, 255, 255, 255, true)
				elseif kojas == 3 then
				---- Vaghti Az JAil Azad Shod Biad Inja ----
				setElementPosition (p, 280.64492797852 ,-2607.5163574219 ,1.8984375)
		        setElementInterior ( p, 0 )
				outputChatBox("#00ff00Shoma Az Zendan Azad Shodid.", p, 255, 255, 255, true)
				elseif kojas == 4 then
			    ---- Vaghti Az JAil Azad Shod Biad Inja ----
				setElementPosition (p, 272.23104858398 ,-2600.8430175781 ,1.8984375)
		        setElementInterior ( p, 0 )
				outputChatBox("#00ff00Shoma Az Zendan Azad Shodid.", p, 255, 255, 255, true)
				end
				end
				end
		   end
		end
	end
	end, 1000, 0 )
end

mainFunction()

addCommandHandler("seejt",
function ( thePlayer, command, player )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 3 then
    local find = miscSys:findPlayer ( player )
	local sjt = getElementData(accSys:getPlayerAcc(find), "pJailTime")
	local targetPlayer = getPlayerName ( find )
	outputChatBox("#00ff00Time Jaile #ff0000"..targetPlayer.."#00ff00: #ff0000"..sjt.."#00ff00 sanie ast!", thePlayer, 255, 255, 255, true)
 else
 outputChatBox("#ff0000✖️ #ffffffMotasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
 end
end)

addCommandHandler("setjt",
function ( thePlayer, command, player, sec )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 3 then
    local find = miscSys:findPlayer ( player )
	local sec = tonumber(sec)
	local targetPlayer = getPlayerName ( find )
	setElementData(accSys:getPlayerAcc(find), "pJailTime", sec)
	outputChatBox("#00ff00shoma Time Jaile #ff0000"..targetPlayer.."#00ff00 Ra Be : #ff0000"..sec.."#00ff00 sanie set kardid!", thePlayer, 255, 255, 255, true)
 else
 outputChatBox("#ff0000✖️ #ffffffMotasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
 end
end)


function unjails( thePlayer, command, player )
 	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
    local find = miscSys:findPlayer ( player )
	if find then
		setElementData(accSys:getPlayerAcc(find), "pJailTime", tonumber(1))
		outputChatBox("#00ff00Shoma #ffffff"..getPlayerName(find).." #00ff00Unjail Kardid!", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Shoma Tavasote #ffffff"..getPlayerName(thePlayer).." #00ff00Unjail Shodid!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#C0C0C0Bezan: /unjail <PartOfName/ID>", thePlayer, 255, 255, 255, true)
    end
end
addCommandHandler("unjail",unjails)


addCommandHandler("ajail",
function ( thePlayer, command, player, sec, ... )
 	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 3 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
    local find = miscSys:findPlayer ( player )
	local sec = tonumber(sec)
	local selol = 1
	local reason = table.concat( {...} , " ")
	if find then
	if sec then
	if ... then
	if tonumber(getElementData(accSys:getPlayerAcc(find), "pJailTime")) < 1 then
	
							--Hale Bug Bus--
					--[[destroyElement(getElementData(find, "onbusMarkerMake"))
					destroyElement(getElementData(find, "onbusBlipMake"))
					setElementData(find,"busCheckPoint",0)
					setElementData(find, "onbusMarkAndBlip", false)
					setElementData(theVehicle, "resShod", true)
					setElementData(theVehicle, "resShod", false)
					
					--Hale Bug Pilot --
					destroyElement(getElementData(find, "onpilotMarkerMake"))
					destroyElement(getElementData(find, "onpilotBlipMake"))
					setElementData(find,"pilotCheckPoint",0)
					setElementData(find, "onpilotMarkerAndBlip", false)
					setElementData(theVehicle, "resShod", true)
					setElementData(theVehicle, "resShod", false)
					
					--Hale Bug Trucker--
					destroyElement(getElementData(find, "onMarkerTruckerMake"))
					destroyElement(getElementData(find, "onBlipTruckerMake"))
					setElementData(find,"truckerCheckPoint",0)
					setElementData(find, "onbusMarkAndBlip", false)
					setElementData(theVehicle, "resShod", true)
					setElementData(theVehicle, "resShod", false)
					
					--Hale Bug StreetWasher--
					destroyElement(getElementData(find, "onMarkerMake"))
					destroyElement(getElementData(find, "onBlipMake"))
					setElementData(find,"sWCheckPoint",0)
					setElementData(find, "onMarkAndBlip", false)
					setElementData(theVehicle, "resShod", true)
					setElementData(theVehicle, "resShod", false)]]
	
	
			local Skinfemale = getElementData(accSys:getPlayerAcc(find), "pSex")
							local skinesh = math.random(1,3)
							
							if Skinfemale == 2 then
								setElementModel(find, 304)
		                    else
								if skinesh == 1 then
									setElementModel(find, 210)
								 elseif skinesh == 2 then
									setElementModel(find, 297)
								 elseif skinesh == 3 then
									setElementModel(find, 291)
								end
							end
	if selol == 1 then
		removePedFromVehicle ( find )
		local seloleajail = math.random(1,2)
		if seloleajail == 1 then
			setElementPosition (find, 116.9462890625 ,204.6943359375 ,998.86138916016)
			setElementDimension(find, 0)
			setElementInterior(find, 3)
		elseif seloleajail == 2 then
			setElementPosition (find, 110.26171875 ,204.6357421875 ,998.86138916016)
			setElementDimension(find, 0)
			setElementInterior(find, 3)
		end

	end
	setElementData(accSys:getPlayerAcc(find), "pJailTime", sec*60)
	setElementData(accSys:getPlayerAcc(find), "pAJailed", 4)
	outputChatBox("#ff0000[Tavajoh]: "..getPlayerName(find).." Tavasote Admin "..getPlayerName(thePlayer).." Baraye "..sec.." Daghighe Admin Jail Shod, Dalil: "..reason, root, 255, 255, 255, true)
	else
        outputChatBox("#ff0000✖️ #ffffffIn Player Dar Hale Hazer Jail Mibashad!", thePlayer, 255, 255, 255, true)
    end
	else
        outputChatBox("#ff0000✖️ #ffffffDalil Admin Jail Ra Vared Nakardid!", thePlayer, 255, 255, 255, true)
    end
	else
        outputChatBox("#ff0000✖️ #ffffffDaghighe Admin Jail Ra Vared Nakardid!", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#C0C0C0Bezan: /ajail <PartOfName/ID> <Daghighe> <Reason>", thePlayer, 255, 255, 255, true)
    end
end)

---------------------------------
-------**Script By ExoPrim**-------
---------------------------------
function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

	for index, selol_Cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( selol_Cars )
		if vehid == "Ghayeg1" or vehid == "Ghayeg2" or vehid == "Ghayeg3" or vehid == "Ghayeg4" or vehid == "Ghayeg5" or vehid == "Ghayeg6" or vehid == "Ghayeg7" or vehid == "Ghayeg8" or vehid == "Ghayeg9" or vehid == "Ghayeg10" then
			toggleVehicleRespawn ( selol_Cars, true )
			setVehicleIdleRespawnDelay ( selol_Cars, 600000 ) --10Min--
		end
	end



function setbenzin (thePlayer, cmd)
	for index, selol_Cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( selol_Cars )
		if vehid == "Ghayeg1" or vehid == "Ghayeg2" or vehid == "Ghayeg3" or vehid == "Ghayeg4" or vehid == "Ghayeg5" or vehid == "Ghayeg6" or vehid == "Ghayeg7" or vehid == "Ghayeg8" or vehid == "Ghayeg9" or vehid == "Ghayeg10" then
			if not isVehicleOccupied(selol_Cars) then
				setElementData( selol_Cars ,"fuel",130)
				setVehicleEngineState(selol_Cars, true)
				--setVehicleOverrideLights( selol_Cars , 1)
			end
		end
	end
end
setTimer ( setbenzin, 600000, 0 ) --10Min--







