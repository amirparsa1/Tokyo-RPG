local accSys = exports["Accounts-System"] --==#Exo4Ever==--
local SfPizzaBoyGetJob = createPickup ( 378.7626953125 ,-118.802734375 ,1001.5921875 , 3,  1314, 0)
setElementInterior( SfPizzaBoyGetJob, 5)


addEventHandler("onPickupHit",SfPizzaBoyGetJob,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pJob")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pJob")) == 7  then
			triggerClientEvent("ShowPizzaPanel", hitElement, hitElement)
		else
			outputChatBox("#ff0000[Error]: #ffffffShoma Darhal Hazer Shoghl Darid, #ffff00/estefa #ffffffBaraye Estefa Dadan!", hitElement,100,100,100, true)
		end
	end
end)
local mashin = {}
local randompos = {
	[1] = {2095.9091796875 ,-1819.818359375 ,12.981447219849,0,0,89.714294433594},
	[2] = {2094.3203125 ,-1813.533203125 ,12.982682228088,0,0,89.714294433594},
	[3] = {2094.3203125 ,-1813.533203125 ,12.982682228088,0,0,89.714294433594},
}
function GivePizzaJob(thePlayer)

	setElementData(accSys:getPlayerAcc(thePlayer), "pJob", 7)
	fadeCamera( thePlayer, false,0.5)
	setTimer(function()
		-- FIX (bugfix pass 4): the element can be gone by the time this timer
		--   fires (player quit / object destroyed). Without this guard MTA
		--   raises "Bad argument" and the rest of the callback never runs.
		if not isElement(thePlayer) then return end
		local c = math.random(1,3)
		local pname = getPlayerName(thePlayer)
		mashin[thePlayer] = createVehicle( 448, randompos[c][1], randompos[c][2], randompos[c][3], randompos[c][4], randompos[c][5], randompos[c][6] )
		setElementID( mashin[thePlayer], "PizzaBoy["..pname.."]" )
		setElementModel( thePlayer, 155 )
		setElementData( mashin[thePlayer], "owner", "PizzaBoy" )
		warpPedIntoVehicle(thePlayer,mashin[thePlayer],0)
		setVehicleDamageProof(mashin[thePlayer], true)
		setElementInterior(thePlayer,0)
		fadeCamera(thePlayer, true,0.5)
	end,1000,1)
	outputChatBox("#00ff00[Pizza-Boy]: #ffffffTabrik, Shoma Pizza-Boy Hastid!", thePlayer, 255, 255, 0,true)
end
addEvent("GivePizzaJob",true)
addEventHandler("GivePizzaJob", root,GivePizzaJob)

local SfPizzaLocations = {
	{646.3935546875 ,-1634.203125 ,15.085475921631, 650.90234375 ,-1619.4521484375 ,15},
	{681.908203125 ,-1058.8125 ,49.599632263184, 699.3935546875 ,-1059.59375 ,49.421691894531},
	{1463.0576171875 ,-880.994140625 ,55.569095611572, 1468.7646484375 ,-904.583984375 ,54.8359375},
	{322.162109375 ,-1742.083984375 ,4.4207496643066, 305.6201171875 ,-1746.9833984375 ,4.546875},
	{941.7392578125 ,-1817.830078125 ,12.877616882324, 925.8994140625 ,-1819.3740234375 ,13.315408706665},
	{814.3203125 ,-1815.544921875 ,12.837131500244, 794.099609375 ,-1812.6982421875 ,13.0234375},
	{1201.0078125 ,-1279.251953125 ,13.3828125, 1181.001953125 ,-1261.0546875 ,15.1796875},
	{1035.3056640625 ,-1754.9775390625 ,13.370376586914, 1026.7919921875 ,-1772.2626953125 ,13.553016662598},
	{916.583984375 ,-1528.826171875 ,13.3828125, 901.576171875 ,-1515.525390625 ,14.111530303955},
	{780.923828125 ,-1539.8671875 ,13.37996006012, 780.3642578125 ,-1572.7666015625 ,13.546875},
	{1810.4130859375 ,-2110.701171875 ,13.3828125, 1801.814453125 ,-2100.0400390625 ,14.021014213562},
	{1746.3486328125 ,-2105.5 ,13.546875, 1733.994140625 ,-2097.9755859375 ,14.036639213562},
	{1234.2275390625 ,-1039.0751953125 ,31.734375, 1229.4658203125 ,-1016.9638671875 ,32.6015625},
	{666.890625 ,-1264.1552734375 ,13.4609375, 688.111328125 ,-1275.578125 ,13.558198928833},
	{362.1416015625 ,-1512.5107421875 ,32.848594665527, 328.958984375 ,-1513.2763671875 ,36.0390625},
	{1357.595703125 ,-1415.841796875 ,13.386874198914, 1367.65625 ,-1432.2509765625 ,14.0546875},
	{1344.275390625 ,-1486.71875 ,13.390607833862, 1345.87890625 ,-1500.4091796875 ,13.546875},
	{1281.755859375 ,-1572.1806640625 ,13.3828125, 1257.560546875 ,-1583.5703125 ,13.546875},
	{1225.0869140625 ,-1572.1328125 ,13.390617370605, 1217.2939453125 ,-1583.513671875 ,13.546875},
	{2132.6416015625 ,-999.615234375 ,59.996883392334, 2140.6484375 ,-1006.7421875 ,61.801342010498},
	{1998.96875 ,-1005.7353515625 ,28.828151702881, 2001.8193359375 ,-993.21484375 ,31.482215881348},
	{2047.2529296875 ,-978.0478515625 ,44.127506256104, 2043.494140625 ,-966.0625 ,43.708564758301},
	{1879.9560546875 ,-1047.767578125 ,23.6796875, 1893.271484375 ,-1070.5693359375 ,23.9375},
	{1928.6953125 ,-1049.095703125 ,24.064683914185, 1935.0439453125 ,-1071.66796875 ,24.416820526123},
	{1954.1748046875 ,-1053.248046875 ,24.224514007568, 1955.244140625 ,-1075.251953125 ,24.796701431274},
	{2010.7060546875 ,-1063.359375 ,24.465978622437, 2024.5908203125 ,-1053.6103515625 ,25.596122741699},
	{2053.3857421875 ,-1082.037109375 ,24.699499130249, 2060.68359375 ,-1076.0146484375 ,24.897745132446},
	{2131.5947265625 ,-1087.9365234375 ,24.1018409729, 2140.2861328125 ,-1083.005859375 ,24.464616775513},
	{2257.6240234375 ,-1057.2255859375 ,50.284420013428, 2256.9326171875 ,-1068.91015625 ,49.4765625},
	{2197.1171875 ,-1011.517578125 ,62.067707061768, 2204.7236328125 ,-990.05078125 ,63.9296875},
	{2559.6240234375 ,-1040 ,69.571441650391, 2579.5615234375 ,-1034.8798828125 ,69.581428527832},
	{2540.412109375 ,-1088.9970703125 ,61.686149597168, 2571.7783203125 ,-1091.0283203125 ,66.963851928711},
	{2526.0400390625 ,-1106.884765625 ,56.894195556641, 2520.115234375 ,-1113.2275390625 ,56.203125},
	{1920.77734375 ,-1612.419921875 ,13.3828125, 1909.8583984375 ,-1598.533203125 ,14.306245803833},
	{2296.9150390625 ,-1659.6455078125 ,14.67910861969, 2307.0244140625 ,-1677.412109375 ,14.00115776062},
	{2347.169921875 ,-1658.953125 ,13.379342079163, 2368.3203125 ,-1674.4541015625 ,13.906294822693},
	{2434.142578125 ,-1658.90234375 ,13.3828125, 2451.7509765625 ,-1642.443359375 ,13.735734939575},
	{2489.8251953125 ,-1677.279296875 ,13.337329864502, 2495.3876953125 ,-1689.697265625 ,14.592934608459},
	{2571.1337890625 ,-1239.2783203125 ,47.379703521729, 2585.1142578125 ,-1237.984375 ,48.421875},
	{917.119140625 ,-1663.83203125 ,13.390623092651, 893.4462890625 ,-1637.0185546875 ,14.9296875},
	{1731.96875 ,-1854.833984375 ,13.4140625, 1743.00390625 ,-1863.279296875 ,13.575267791748},
	{1784.4541015625 ,-1894.3798828125 ,13.392580032349, 1753.8798828125 ,-1894.0751953125 ,13.557065963745},
	{1823.22265625 ,-2027.884765625 ,13.3828125, 1817.3720703125 ,-2007.5166015625 ,13.554395675659},
	{1952.2431640625 ,-2052.4189453125 ,13.3828125, 1945.2021484375 ,-2044.6455078125 ,13.546875},
	{1945.23828125 ,-1932.4814453125 ,13.3828125, 1937.7666015625 ,-1911.2529296875 ,15.256797790527},
	{1873.5390625 ,-1932.3212890625 ,13.380420684814, 1872.2412109375 ,-1912.74609375 ,15.256797790527},
	{2701.142578125 ,-2003.51953125 ,13.407940864563, 2696.26171875 ,-1991.08984375 ,13.960982322693},
	{2653.8798828125 ,-2003.3193359375 ,13.3828125, 2637.1552734375 ,-2012.10546875 ,13.81386089325},
	{2865.484375 ,-1530.099609375 ,10.921875, 2852.2509765625 ,-1532.4140625 ,11.09375},
	{2876.197265625 ,-1466.2705078125 ,10.7890625, 2866.2177734375 ,-1465.806640625 ,10.952748298645},
}
--{ X1, Y1, Z1, X2, Y2, Z2 },

local SfPVehicle = {}
local SfPNowPizza = {}
local SfPNowPizzaMarker1ID = {}
local SfPNowPizzaMarker1 = {}
local SfPNowPizzaMarker2ID = {}
local SfPNowPizzaMarker2 = {}
local SfPNowPizzaBlip = {}

addEventHandler ( "onVehicleStartEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if getElementData(source,"owner") == "PizzaBoy" then
		if vehid == "PizzaBoy["..getPlayerName(thePlayer).."]"  then
			if jacked then outputChatBox ( "#ff0000Error: Bande Khoda Dare Kar Mikone Azar Dari Mage!", thePlayer, 230,0,0 ,true) cancelEvent() return false end
			if seat == 0 then
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJob")) ~= 7 then
					cancelEvent()
					outputChatBox ( "#ff0000Error: Shoma Pizza Boy Nistid!", thePlayer, 230,0,0 ,true)
				end
			end
		else

			cancelEvent()
			outputChatBox ( "#ff0000Error: In Motor Motalegh Be "..vehid.." Mibashad V Nemitavanid Savar An Sahvid !.", thePlayer, 230,0,0 ,true)
		end


	end
end)

addEventHandler ( "onVehicleEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if vehid == "PizzaBoy["..getPlayerName(thePlayer).."]" then
		if seat == 0 then
			setVehicleHandling(source, "maxVelocity", 50)
			if not SfPNowPizzaMarker1[thePlayer] then
				if not SfPVehicle[thePlayer] then
					SfPVehicle[thePlayer] = source
					Voice = math.random( 1 , 7 )
					triggerClientEvent( "PizzaSound", resourceRoot, Voice )
				end
				local Shansi = math.random( 1 , 50 )
				SfPNowPizzaMarker1[thePlayer] = createMarker(SfPizzaLocations[Shansi][1],SfPizzaLocations[Shansi][2],SfPizzaLocations[Shansi][3]-2,"checkpoint",3,255, 255, 0,200, thePlayer)
				SfPNowPizzaMarker1ID[SfPNowPizzaMarker1[thePlayer]] = Shansi
				SfPNowPizzaBlip[thePlayer] = createBlipAttachedTo(SfPNowPizzaMarker1[thePlayer], 56, 2, 255, 0, 0, 255,  0 , 65535,thePlayer)
			end
		end
	end
end)

--Khord Be Marker Aval
addEventHandler("onMarkerHit", resourceRoot,
function (hitElement,matchingDimension)
	if (getElementType(hitElement) == "player" and tonumber(getElementData(accSys:getPlayerAcc(hitElement),"pJob")) == 7 and isPedInVehicle(hitElement))  then
		if SfPNowPizzaMarker1[hitElement] == source then
			local vehicle = getPedOccupiedVehicle(hitElement)
			if SfPVehicle[hitElement] == vehicle then
				setElementFrozen(SfPVehicle[hitElement] ,true)
				local Shansi = SfPNowPizzaMarker1ID[SfPNowPizzaMarker1[hitElement]] 
				SfPNowPizzaMarker1ID[SfPNowPizzaMarker1[hitElement]] = nil
				destroyElement(SfPNowPizzaMarker1[hitElement]) 
				SfPNowPizzaMarker1[hitElement] = nil
				destroyElement(SfPNowPizzaBlip[hitElement]) 
				SfPNowPizzaBlip[hitElement] = nil
				SfPNowPizzaMarker2[hitElement] = createMarker(SfPizzaLocations[Shansi][4],SfPizzaLocations[Shansi][5],SfPizzaLocations[Shansi][6]-2,"checkpoint",2,255, 255, 0,200, hitElement)
				SfPNowPizzaBlip[hitElement] = createBlipAttachedTo(SfPNowPizzaMarker2[hitElement], 56, 2, 255, 0, 0, 255,  0 , 65535,hitElement)
				exports["notf"]:addNotification(hitElement, "Az Motor Piade Sho Va Pitzza Ra Tahvil Bede!" , 'info')
			end
		end
	end
end)

--Khord Be Marker Dovom
addEventHandler("onMarkerHit", resourceRoot,
function (hitElement,matchingDimension)
	if (getElementType(hitElement) == "player" and tonumber(getElementData(accSys:getPlayerAcc(hitElement),"pJob")) == 7 )  then
		if SfPNowPizzaMarker2[hitElement] == source then
			setElementFrozen(hitElement,true)
			destroyElement(SfPNowPizzaMarker2[hitElement])
			SfPNowPizzaMarker2[hitElement] = nil
			destroyElement(SfPNowPizzaBlip[hitElement]) 
			SfPNowPizzaBlip[hitElement] = nil
			destroyElement(SfPNowPizza[hitElement])
			SfPNowPizza[hitElement] = nil
			setPedAnimation( hitElement, "ped","idle_chat", -1, true, false, false )
			exports["notf"]:addNotification(hitElement, "Dar Hale Tahvile Pitzza , Sabr Konid ..." , 'info')
				setTimer(function()
					toggleControl ( hitElement, "jump", true )
					toggleControl ( hitElement, "sprint", true )
					toggleControl ( hitElement, "crouch", true )
					toggleControl ( hitElement, "fire", true )
					toggleControl ( hitElement, "aim_weapon", true )
					setPedAnimation ( hitElement )
					setElementFrozen(hitElement,false)
					if SfPVehicle[hitElement] then
						setElementFrozen(SfPVehicle[hitElement] ,false)
					end
					local mablagh = 0
					if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill")) <= 50 then--skill 1
						mablagh = math.random(800,1000)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill")) <= 100 then--skill 2
						mablagh = math.random(1000,1300)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill")) <= 200 then--skill 3
						mablagh = math.random(1300,1600)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill")) <= 300 then--skill 4
						mablagh = math.random(1600,2000)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill")) > 300 then--skill 5
						mablagh = math.random(2000,3000)
					end
					local PbExtraMoney = 0
					if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pVip")) > 0 then
						PbExtraMoney = math.floor( (tonumber(mablagh) / 100) * 10 )
					end
					givePlayerMoney(hitElement,mablagh + PbExtraMoney)
					skillebadipb = tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill")) + 1
					setElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill",skillebadipb)
					if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill")) <= 50 then--skill 1
						outputChatBox("#00ff00[Pizza-Boy]: #ffffffShoma Pizza Ro Tahvil Dadid! Dastmozd : "..mablagh.."#00ff00$ #ffffff+ "..PbExtraMoney.."#00ff00$ #ffae00(Skill 1 | " ..skillebadipb.." / 50)", hitElement, 255, 255, 0,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill")) <= 100 then--skill 2
						outputChatBox("#00ff00[Pizza-Boy]: #ffffffShoma Pizza Ro Tahvil Dadid! Dastmozd : "..mablagh.."#00ff00$ #ffffff+ "..PbExtraMoney.."#00ff00$ #ffae00(Skill 1 | " ..skillebadipb.." / 100)", hitElement, 255, 255, 0,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill")) <= 200 then--skill 3
						outputChatBox("#00ff00[Pizza-Boy]: #ffffffShoma Pizza Ro Tahvil Dadid! Dastmozd : "..mablagh.."#00ff00$ #ffffff+ "..PbExtraMoney.."#00ff00$ #ffae00(Skill 1 | " ..skillebadipb.." / 200)", hitElement, 255, 255, 0,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill")) <= 300 then--skill 4
						outputChatBox("#00ff00[Pizza-Boy]: #ffffffShoma Pizza Ro Tahvil Dadid! Dastmozd : "..mablagh.."#00ff00$ #ffffff+ "..PbExtraMoney.."#00ff00$ #ffae00(Skill 1 | " ..skillebadipb.." / 300)", hitElement, 255, 255, 0,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPizzaBoySkill")) > 300 then--skill 5
						outputChatBox("#00ff00[Pizza-Boy]: #ffffffShoma Pizza Ro Tahvil Dadid! Dastmozd : "..mablagh.."#00ff00$ #ffffff+ "..PbExtraMoney.."#00ff00$ #ffae00(Skill 1 | " ..skillebadipb.." / Max)", hitElement, 255, 255, 0,true)
					end
				end, 5000, 1)
		end
	end
end)

--pPizzaBoySkill
addEventHandler( "onPlayerQuit", getRootElement( ),
function()
	if mashin[source] then
		destroyElement(mashin[source])
	end
end)

addEventHandler("onVehicleExplode", getRootElement(),
function ()
	local vehid = getElementID ( source )
	if "PizzaBoy["..getPlayerName(thePlayer).."]" then
		destroyElement(source)
		local find = getVehicleController ( source )
		if find then
			if SfPVehicle[find] == source then
				if SfPNowPizzaMarker1[find] then
					destroyElement(SfPNowPizzaMarker1[find]) 
					SfPNowPizzaMarker1[find] = nil
					destroyElement(SfPNowPizzaBlip[find]) 
					SfPNowPizzaBlip[find] = nil
				end
				if SfPNowPizzaMarker2[find] then
					destroyElement(SfPNowPizzaMarker2[find]) 
					SfPNowPizzaMarker2[find] = nil
					destroyElement(SfPNowPizzaBlip[find]) 
					SfPNowPizzaBlip[find] = nil
				end
				if SfPVehicle[find] then
					SfPVehicle[find] = nil
				end
				if SfPNowPizza[find] then
					destroyElement(SfPNowPizza[find])
					SfPNowPizza[find] = nil
					toggleControl ( find, "jump", true )
					toggleControl ( find, "sprint", true )
					toggleControl ( find, "crouch", true )
					toggleControl ( find, "fire", true )
					toggleControl ( find, "aim_weapon", true )
					setPedAnimation ( find )
					setElementFrozen(find,false)
				end
				outputChatBox("#ff0000[Pizza-Boy]: #ffffffMotore Shoma Terekid Va Kare Shoma Be Payan Resid!", find, 255, 255, 255, true)
				setVehicleEngineState(source, false)
				setVehicleLocked(source, false)
				setElementFrozen(source, false)
			end
		end
	end
end)

addEventHandler("onVehicleStartExit",getRootElement(),
function (thePlayer,seat)
	if SfPVehicle[thePlayer] == source then
		if seat == 0 then
			if not isElementFrozen(SfPVehicle[thePlayer]) then
				destroyElement(source)
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 0 then
					setElementModel( thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "cSkin"))) 
				else
					setElementModel( thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "fSkin"))) 
				end
				if SfPNowPizzaMarker2[thePlayer] then
					destroyElement(SfPNowPizzaMarker2[thePlayer]) 
					SfPNowPizzaMarker2[thePlayer] = nil
					destroyElement(SfPNowPizzaBlip[thePlayer]) 
					SfPNowPizzaBlip[thePlayer] = nil
				end
				if SfPNowPizzaMarker1[thePlayer] then
					destroyElement(SfPNowPizzaMarker1[thePlayer]) 
					SfPNowPizzaMarker1[thePlayer] = nil
					destroyElement(SfPNowPizzaBlip[thePlayer]) 
					SfPNowPizzaBlip[thePlayer] = nil
				end
				if SfPVehicle[thePlayer] then
					SfPVehicle[thePlayer] = nil
				end
			end
		end
	end
end)

addEventHandler("onVehicleExit",getRootElement(),
function (thePlayer,seat)
	if SfPVehicle[thePlayer] == source then
		if seat == 0 then
			if isElementFrozen(source) then
				setTimer(function()
					-- FIX (bugfix pass 4): the element can be gone by the time this timer
					--   fires (player quit / object destroyed). Without this guard MTA
					--   raises "Bad argument" and the rest of the callback never runs.
					if not isElement(thePlayer) then return end
					toggleControl ( thePlayer, "jump", false )
					toggleControl ( thePlayer, "sprint", false )
					toggleControl ( thePlayer, "crouch", false )
					toggleControl ( thePlayer, "fire", false )
					toggleControl ( thePlayer, "aim_weapon", false )
					setPedAnimation(thePlayer,"carry", "crry_prtial",1,true,false,false,true)
					SfPNowPizza[thePlayer] = createObject(1582, 0,0,0)
					exports.bone_attach:attachElementToBone(SfPNowPizza[thePlayer],thePlayer,11,-0.2,0.07,0.2,90,0,0)
				end, 500, 1)
			end
		end
	end
end)

addEventHandler("onPlayerWasted",getRootElement(),
function ( )
    --local OccupiedVeh = getPedOccupiedVehicle(source)
	if SfPVehicle[source] then
		
	    if SfPNowPizzaMarker2[source] then
			if SfPNowPizza[source] then
				destroyElement(SfPNowPizza[source])
				SfPNowPizza[source] = nil
				toggleControl ( source, "jump", true )
				toggleControl ( source, "sprint", true )
				toggleControl ( source, "crouch", true )
				toggleControl ( source, "fire", true )
				toggleControl ( source, "aim_weapon", true )
				setElementFrozen(source,false)
			end
			destroyElement(SfPNowPizzaMarker2[source]) 
			SfPNowPizzaMarker2[source] = nil
			destroyElement(SfPNowPizzaBlip[source]) 
			SfPNowPizzaBlip[source] = nil
		end
	    if SfPNowPizzaMarker1[source] then
			destroyElement(SfPNowPizzaMarker1[source]) 
			SfPNowPizzaMarker1[source] = nil
			destroyElement(SfPNowPizzaBlip[source]) 
			SfPNowPizzaBlip[source] = nil
		end
		destroyElement(SfPVehicle[source])

		SfPVehicle[source] = nil
	end
end)


-- The End --

-- FIX (bugfix pass 4): the per-player gate tables below were never cleared when
--   a player disconnected. Each is tested as `if not <tbl>[thePlayer]`, so a
--   flag left set (or a timer that fires after the quit) leaves the feature
--   dead for that player and keeps the dead element referenced.
addEventHandler("onPlayerQuit", root, function()
	for _, tbl in ipairs({ SfPNowPizzaMarker1, SfPVehicle }) do
		if type(tbl) == "table" and tbl[source] ~= nil then
			if isTimer(tbl[source]) then killTimer(tbl[source]) end
			if isElement(tbl[source]) then destroyElement(tbl[source]) end
			tbl[source] = nil
		end
	end
end)
