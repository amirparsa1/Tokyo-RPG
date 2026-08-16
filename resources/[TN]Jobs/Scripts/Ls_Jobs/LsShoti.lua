local accSys = exports["Accounts-System"] -- Code By ExMmD | FearZone For Ever
local rootElement = getRootElement()
local pedinviter = createPed( 212, 2449.5869140625 ,-1758.6845703125 ,13.592364311218, 186)
setElementFrozen(pedinviter, true)
local LsShotiJobMarker = createPickup ( 2449.5810546875 ,-1759.3876953125 ,13.590818405151 , 3,  1314, 0)

local randompos = {
	[1] = {2371.357421875 ,-1890.2109375 ,13.3828125,0,0,0},
	[2] = {2473.923828125 ,-1550.1806640625 ,24.005052566528,0,0,0},
	[3] = {2182.716796875 ,-1497.7294921875 ,23.979249954224,0,0,0},
}
local mashin = {}
addEvent("GiveShotiJob",true)
addEventHandler("GiveShotiJob", root,
function (thePlayer,mahmole)

	setElementData(accSys:getPlayerAcc(thePlayer), "pJob", 9)
	fadeCamera( thePlayer, false,0.5)
	setTimer(function()
		-- FIX (bugfix pass 4): the element can be gone by the time this timer
		--   fires (player quit / object destroyed). Without this guard MTA
		--   raises "Bad argument" and the rest of the callback never runs.
		if not isElement(thePlayer) then return end
		local c = math.random(1,3)
		local pname = getPlayerName(thePlayer)
		mashin[thePlayer] = createVehicle( 551, randompos[c][1], randompos[c][2], randompos[c][3], randompos[c][4], randompos[c][5], randompos[c][6] )
		setElementData(thePlayer, "inBox", mahmole)
		setElementID( mashin[thePlayer] ,"Shoti["..pname.."]")
		setElementData( mashin[thePlayer] , "owner", "Shoti" )
		warpPedIntoVehicle(thePlayer,mashin[thePlayer] ,0)
		fadeCamera(thePlayer, true,0.5)
	end,1000,1)
	outputChatBox("#00ff00[Akbar-Mofangi]: #ffffffBia Berim Ta Mashino Behet Bedam!", thePlayer, 255, 255, 0,true)
end)

addEventHandler( "onPlayerWasted", getRootElement(),function()
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pJob")) == 9 then
		if isPedInVehicle(thePlayer) then
			local vehicle = mashin[source]
			local vehid = getElementID ( vehicle )
			if getElementData(vehicle,"owner") == "Shoti" then
				if vehid == "Shoti["..getPlayerName(source).."]" then
					destroyElement(vehicle)
					outputChatBox("#ffff00[Shoti]: #ffffffMashti Mordi Ke Boro Vaghti Khob Shodi Bia !.", source, 255, 255, 0,true)
				end
			end
		end
	end
end)


addEventHandler("onVehicleStartExit", rootElement,
function (thePlayer, seat, jacked)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJob")) == 9 then
		local vehid = getElementID ( source )
		if getElementData(source,"owner") == "Shoti" then
			if vehid == "Shoti["..getPlayerName(thePlayer).."]" then
				destroyElement(source)
				outputChatBox("#ffff00[Shoti]: #ffffffShoma Az 405 Piade Shodid Va Kare Shoma Be Payan Resid!", thePlayer, 255, 255, 0,true)
			end
		end
	end
end)

addEventHandler( "onPlayerQuit", getRootElement( ),
function()
	if mashin[source] then
		destroyElement(mashin[source])
	end
end)

addEventHandler("onPickupHit",LsShotiJobMarker,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pJob")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pJob")) == 9 then
			triggerClientEvent("ShowShotiPanel", hitElement, hitElement)
		else
			outputChatBox("#ff0000[Error]: #ffffffShoma Darhal Hazer Shoghl Darid, #ffff00/estefa #ffffffBaraye Estefa Dadan!", hitElement,100,100,100, true)
		end
	end
end)

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addEventHandler ( "onVehicleStartEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if getElementData(source,"owner") == "Shoti" then
		if vehid == "Shoti["..getPlayerName( thePlayer ).."]" then
			if seat == 0 then
				if jacked then outputChatBox ( "#ff0000Error: Bande Khoda Dare Kar Mikone Azar Dari Mage!", thePlayer, 230,0,0 ,true) cancelEvent() return false end
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJob")) ~= 9 then
					cancelEvent()
					outputChatBox ( "#ff0000Error: Shoma Shoti Savar Nistid!", thePlayer, 230,0,0 ,true)
				end
			end
		else
			cancelEvent()
			outputChatBox ( "#ff0000Error: In Mashin Motalegh Be "..vehid.." Mibashad V Nemitavanid Savar An Sahvid !.", thePlayer, 230,0,0 ,true)
		end
	end
end)



addEventHandler("onVehicleEnter",getRootElement(),
function( thePlayer, seat, jacked )
	local vehid = getElementID ( source )
	if (type(string.find(vehid,"LsShoti")) == "number") then
		if seat == 0 then
			outputChatBox("#00ff00[Shoti-Savar]: #ffffffBoro Az Mash Hasan Jens Begir! !", thePlayer, 255, 255, 0,true)
		local theVehicle = getPedOccupiedVehicle ( thePlayer )
		setVehicleHandling(theVehicle, "suspensionFrontRearBias", 0.3 )
		end
	end
end)
petJens = createPed( 21, 1401.34765625 ,-1652.677734375 ,13.54687, 5)
setElementFrozen(petJens, true)
petGet = createPed( 21, -1457.9013671875 ,2591.212890625 ,55.984375, 60)
setElementFrozen(petGet, true)


function matanimtimer()
	setTimer ( function()
    setPedAnimation(petJens,"cop_ambient","coplook_shake",1,true,false)
    setPedAnimation(petGet,"cop_ambient","coplook_shake",1,true,false)
	end, 1000, 0 )
end

matanimtimer()






addEvent("givejens",true)
addEventHandler("givejens", root,
function()
	local level = getElementData(accSys:getPlayerAcc(client), "pJob")
	if tonumber(level) == 9 then
		local inBox = getElementData(client, "inBox")
		if inBox == 1 or inBox == 0 then
			local vehid = getElementID(getPedOccupiedVehicle( client ))
			if vehid == "Shoti["..getPlayerName( client ).."]" then
				outputChatBox("#fff000[Ahmad]:#ffffff: Damet Garm Daii Ajab Dast Farmoni Dari Joon! :D", client, 255, 255, 255, true)
				if inBox == 1 then
					outputChatBox("#00ff00+650,000 Toman #ffffff Halalet Bashe Daii jon", client, 255, 255, 255, true)
					givePlayerMoney(client, 650000)
				elseif inBox == 0 then
					local matesh = tonumber(getElementData(accSys:getPlayerAcc(client), "pMats"))
					setElementData(accSys:getPlayerAcc(client), "pMats", matesh+3000)
					outputChatBox("#00ff00+3,000 Material #ffffff Halalet Bashe Daii jon", client, 255, 255, 255, true)
				end
				setElementData(client, "inBox", false)
			else 
				outputChatBox("#ff0000Ba In Mashin Poolam Biari Azat Nmigiram XD Just Shoti!", client, 255, 255, 255, true)
			end
		
		elseif not inBox or inBox == false then
			outputChatBox("#fff000Ahmad:#ffffff Haji Koskholi Namosan?! Das Khali omadi Poolam Mikhaii xD?", client, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffTo Shoti Savar Nisti!!", client, 255, 255, 255, true)
	end
end)


function jenspanel( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "ped" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local fasele = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if fasele < 30 then
			if source == petJens then
                triggerClientEvent("getPanel", player)
			elseif source == petGet then
				triggerClientEvent("givePanel", player)
				end
			end
            end
        end
    end
addEventHandler( "onElementClicked", getRootElement( ), jenspanel )