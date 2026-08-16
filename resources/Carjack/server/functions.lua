local accSys = exports["Accounts-System"]
local bot = createPed(startMarkerBotId, startMarker[1], startMarker[2], startMarker[3], startMarker[4])
local marker = createMarker(startMarker[1], startMarker[2], startMarker[3], "corona", 2, 255, 255, 255, 0)

function pedsnpc()
	setTimer ( function()
		
	 	 setPedAnimation(bot,"shop","smoke_ryd",1,true,false)

		
	end, 1000, 0 )
end
pedsnpc()

local getCarList = posList
local getCarCreate = {}

addEventHandler("onMarkerHit", marker,
	function(hitElement, matchingDimension)
		if getElementType(hitElement) == "player" and matchingDimension then
		if isElement(hitElement) then
	    local factionesh = getElementData(accSys:getPlayerAcc(hitElement), "pMember")
		if factionesh == 0 or factionesh == 4 or factionesh == 5 or factionesh == 6 or factionesh == 7 or factionesh == 8 or factionesh == 9 or factionesh == 10 or factionesh == 11 or factionesh == 12 or factionesh == 13 or factionesh == 14 or factionesh == 15 or factionesh == 16 then
			if not isPedInVehicle(hitElement) then
				if not getElementData(hitElement, "cartheft:vehicle") then
					if #getCarList > 0 then
						triggerClientEvent(hitElement, "cartheft:opengui", hitElement)
					else
						outputChatBox("Mashinamon Tamom Shode Boro Badan Bia.", hitElement, 255, 255, 25)
					end
				else
					outputChatBox("Shoma Az Ghabl Yek Mashin Daryaft Kardid.", hitElement, 255, 255, 25)
				end
			end
	else
		outputChatBox("#ff0000✖️ #ffffffShoma Police Hastid Va Nemitonid Mavad Jabeja Konid!", hitElement, 255, 255, 255, true)
	end
		end
		end
	end
)

addEventHandler("onVehicleStartEnter", getRootElement(),
	function(player, seat)
		local data = getElementData(source, "cartheft:player")
		if data then
			if data == player then
				if isVehicleLocked(source) then
					triggerClientEvent(player, "cartheft:opencar", player)
					
					
					for k, v in ipairs (getElementsByType("player")) do
			        if getElementData(v, "loggedIn") == true then
				    local hisFac = tonumber(getElementData(accSys:getPlayerAcc(v), "pMember"))
				    if hisFac > 0 and hisFac < 4 then
					    setTimer(
			         	function()
					   outputChatBox("#ff0000✖️✖️ #1e47ffDP Warn #ff0000✖️✖️ #ffffffGozaresh Dade Shode Ke Mashin Hamle Aslahe 1 Dagige Pish Dozdide Shode!", v, 255, 255, 255, true)
				        end, 60000, 1)
				    end
			        end
		    end	
					
					cancelEvent()
				end
			else
				cancelEvent()
			end
		end
	end
)

addEvent("cartheft:getcar", true)
addEventHandler("cartheft:getcar", getRootElement(),
	function()
		-- FIX (bugfix pass 4): getCarList is drained by the table.remove below, so
		--   after enough carjacks it is empty and math.random(#getCarList) becomes
		--   math.random(0) -> "bad argument #2 to 'random' (interval is empty)",
		--   which killed the whole carjack event until a resource restart.
		if #getCarList == 0 or #carList == 0 then
			outputDebugString("Carjack: no spawn locations left, skipping", 2)
			return
		end
		local random = math.random(#getCarList)
		local cords = getCarList[random]
		table.remove(getCarList, random)
		local cars = carList[math.random(#carList)]
		local vehicle = createVehicle(cars[1], cords[2], cords[3], cords[4], 0, 0, cords[5])
		setElementData(vehicle, "cartheft:player", source)
		setElementData(source, "cartheft:vehicle", vehicle)
        setVehicleHandling(vehicle, "suspensionLowerLimit", -0.35)
        setVehicleHandling(vehicle, "suspensionFrontRearBias", 0.3)
		setElementFrozen(vehicle, true)
		setVehicleColor( vehicle, 0, 0, 0 )
		setVehicleLocked(vehicle, true)
		addVehicleUpgrade(vehicle, 1008)
		setVehicleDamageProof(vehicle, true)
		triggerClientEvent(source, "cartheft:getcar", source, cars[2], cars[3], cars[4], cords[1], cords[2], cords[3])
		getCarCreate[vehicle] = cords
	end
)

addEvent("cartheft:stop", true)
addEventHandler("cartheft:stop", getRootElement(),
	function(money)
		local vehicle = getElementData(source, "cartheft:vehicle")
		setElementData(source, "cartheft:vehicle", false)
		table.insert(getCarList, getCarCreate[vehicle])
		if money then
			local hp = math.ceil(getElementHealth(vehicle) / 10)
			local money = money / 100 * hp
			givePlayerMoney(source, money)
			outputChatBox("Mashin Shoma Ba Movafaghiat Be Maghsad Resid Dastmozd Shoma: $"..money.."", source, 25, 255, 25)
		else
			outputChatBox("Shoma Natavanestid Mashin Ra Be Maghsad Beresanid Va Poli Daryaft Nakardid.", source, 255, 255, 25)
		end
		getCarCreate[vehicle] = nil
		destroyElement(vehicle)
	end
)

addEvent("cartheft:opencar", true)
addEventHandler("cartheft:opencar", getRootElement(),
	function()
		local vehicle = getElementData(source, "cartheft:vehicle")
		if isElement(vehicle) then
			setElementFrozen(vehicle, false)
			setVehicleLocked(vehicle, false)
			setVehicleDamageProof(vehicle, false)
		end
	end
)

addEventHandler("onPlayerQuit", getRootElement(),
	function()
		local vehicle = getElementData(source, "cartheft:vehicle")
		if vehicle then
		table.insert(getCarList, getCarCreate[vehicle])
		getCarCreate[vehicle] = nil
		destroyElement(vehicle)
		end
	end
)




local b = createBlip ( 2154.712890625 ,-2297.5673828125 ,13.438338279724, 23 )
setElementData(b, 'blipName', 'CarJack')