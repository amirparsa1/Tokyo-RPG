local accSys = exports["Accounts-System"]

local mysqlhost1 = "127.0.0.1"
local mysqluser1 = "root"
local mysqlpassword1 = ""
local mysqldatabase1 = "thenightdb"

-- SECOND CONNECTION, OPTIONAL IF CONNECTION 1 DON'T WORK

local mysqlhost2 = "127.0.0.1"
local mysqluser2 = "root"
local mysqlpassword2 = ""
local mysqldatabase2 = "thenightdb"

local dbpTime = 500 -- How many Miliseconds will use the dbPoll function for waiting for a result

local max_player_houses = 1 -- Define the buyable houses per player
local sellhouse_value = 80 -- The ammount in percent that you get back if you sell a house
local open_key = "h" -- Define the key for the infomenue and the housepanel

-- I don't know whats the right time for that --

-----------------------------------------------------------------
-- IF YOU CAN'T WRITE IN LUA, DO NOT EDIT ANYTHING ABOVE HERE! --
-----------------------------------------------------------------

-- EVENTS --

addEvent("onHouseSystemHouseCreate", true)
addEvent("onHouseSystemHouseLock", true)
addEvent("onHouseSystemHouseDeposit", true)
addEvent("onHouseSystemHouseWithdraw", true)
addEvent("onHouseSystemWeaponDeposit", true)
addEvent("onHouseSystemWeaponWithdraw", true)
addEvent("onHouseSystemRentableSwitch", true)
addEvent("onHouseSystemRentalprice", true)
addEvent("onHouseSystemTenandRemove", true)
addEvent("onHouseSystemInfoBuy", true)
addEvent("onHouseSystemInfoRent", true)
addEvent("onHouseSystemInfoEnter", true)

local handler -- local only, we don't need a global handler

local saveableValues = {
	["MONEY"] = "MONEY",
	["WEAP1"] = "WEAP1",
	["WEAP2"] = "WEAP2",
	["WEAP3"] = "WEAP3",
	["LOCKED"] = "LOCKED",
	["OWNER"] = "OWNER",
	["RENTABLE"] = "RENTABLE",
	["RENTALPRICE"] = "RENTALPRICE",
	["RENT1"] = "RENT1",
	["RENT2"] = "RENT2",
	["RENT3"] = "RENT3",
	["RENT4"] = "RENT4",
	["RENT5"] = "RENT5",
	["Linked"] = "Linked",
}


local created = false -- DONT EDIT
local houseid = 0 -- Define the Houseid, 

local house = {} -- The House array
local houseData = {} -- The House Data arry
local houseInt = {} -- The House Interior array
local houseIntData = {} -- The House Interior Data Array xD

local buildStartTick
local buildEndTick

-- STARTUP EVENT HANDLER --

addEventHandler("onResourceStart", getResourceRootElement(), function()
	handler = dbConnect("mysql", "dbname="..mysqldatabase1..";host="..mysqlhost1, mysqluser1, mysqlpassword1, "autoreconnect=1")

	-- If the Handler 1 dont work
	if not(handler) then	
		outputServerLog("[HOUSESYSTEM]MySQL handler 1 not accepted! Trying secondary handler...")	
		handler = dbConnect("mysql", "dbname="..mysqldatabase2..";host="..mysqlhost2, mysqluser2, mysqlpassword2, "autoreconnect=1")
		if not(handler) then
			outputServerLog("[HOUSESYSTEM]MySQL handler 2 not accepted! Shutting down...")
			cancelEvent()
		else
			outputServerLog("[HOUSESYSTEM]MySQL handler 2 accepted!")
			housesys_startup()
		end
	else
		outputServerLog("[HOUSESYSTEM]MySQL handler 1 accepted!")
		housesys_startup()
	end
end)

-- SHUTDOWN EVENT HANDLER --
addEventHandler("onResourceStop", getResourceRootElement(), function()
	-- Free the arrays --
	for index, houses in pairs(house) do
		houses = nil
	end
	for index, houseDatas in pairs(houseData) do
		houseDatas = nil
	end
	for index, houseInts in pairs(houseInt) do
		houseInts = nil
	end
	for index, houseIntDatas in pairs(houseIntData) do
		houseIntDatas = nil
	end
	
	houseid = 0
	created = false
end)

--------------
-- COMMANDS --
--------------

-- /unrent --

addCommandHandler("unrent", function(thePlayer)
	if(getElementData(thePlayer, "house:lastvisit")) and (getElementData(thePlayer, "house:lastvisit") ~= false)  then
		local id = tonumber(getElementData(thePlayer, "house:lastvisit"))
		if(isPlayerRentedHouse(thePlayer, id) == false) then
			outputChatBox("Shoma Ozv in Khane Nistid!", thePlayer, 255, 0, 0)
			return
		end
		local sucess = removeHouseTenand(id, thePlayer)
		if(sucess == true) then
			outputChatBox("Shoma Ba Movafaghiyat Ejare Name Ra Laghv Kardid!", thePlayer, 0, 255, 0)
			setElementData(accSys:getPlayerAcc(thePlayer), "pRented", 0)
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pTut")) == 1 then
				setElementData(accSys:getPlayerAcc(thePlayer), "pTut", 0)
				exports["notf"]:addNotification(thePlayer, "Shoma Dige Khane Nadarid, Pas Az Civilian Spawn Mishavid!" , 'info')
			end
		else
			outputChatBox("An error occurred!", thePlayer, 255, 0, 0)
		end
	end
end)



addCommandHandler("link", function(thePlayer)
	if(getElementData(thePlayer, "house:lastvisit")) and (getElementData(thePlayer, "house:lastvisit") ~= false)  then
		local house = getElementData(thePlayer, "house:lastvisit")
		if(house) then
			local id = house
			local owner = houseData[id]["OWNER"]
			if(owner ~= getPlayerName(thePlayer)) then
				outputChatBox("Shoma Nemitavanid In Khane Ra Link Konid!", thePlayer, 255, 0, 0)
			else
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
					local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys` WHERE `fID` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) )
					local result, numrows = dbPoll(query, 500)
					if (result and numrows > 0) then
						for index, row in pairs(result) do
							if row['fID'] == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) then
								if row['fActive'] == 1 then
									if houseData[id]["Linked"] ~= tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) then
										if houseData[id]["Linked"] ~= 0 then
											exports["notf"]:addNotification(thePlayer, "In Khane Baraye Yek Family Dige Link Shode." , 'error')
										else
											setHouseData(id, "Linked", getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
											exports["notf"]:addNotification(thePlayer, "House Shoma Ba Movafaghiat Link Shod." , 'success')
										end
									else
										exports["notf"]:addNotification(thePlayer, "In Khane Az Ghabl Be Family Shoma Lunk Shode." , 'error')
									end
								else
									exports["notf"]:addNotification(thePlayer, "Family Shoma Active Nist." , 'error')
								end
							end
						end
					end
				else
					exports["notf"]:addNotification(thePlayer, "Shoma Family Nadarid." , 'error')
				end
			end
		end
	end
end)

addCommandHandler("rent", function(thePlayer)
	if(getElementData(thePlayer, "house:lastvisit")) and (getElementData(thePlayer, "house:lastvisit") ~= false)  then
		local id = tonumber(getElementData(thePlayer, "house:lastvisit"))
		if(houseData[id]["OWNER"] == getPlayerName(thePlayer)) then
			outputChatBox("Shoma Nemitavanid Inja Ra Rent Konid! Inja Khane Shomast!", thePlayer, 255, 0, 0)
			return
		end
		if(tonumber(houseData[id]["RENTABLE"]) ~= 1) then
			outputChatBox("In Khane Baraye Ejare Nemibashad!", thePlayer, 255, 0, 0)
			return
		end
		if(getPlayerRentedHouse(thePlayer) ~= false) then
			outputChatBox("Shoma Az Ghabl Khane Ejare Kardid, (Use: /unrent)", thePlayer, 255, 0, 0)
			return
		end
		if(getElementData(accSys:getPlayerAcc(thePlayer), "pPhousekey") ~= 0 ) then
			outputChatBox("Shoma Yek Khane Az Qabl Kharidid!", thePlayer, 255, 0, 0)
			return
		end

		local owner = houseData[id]["OWNER"]
		local rentprice = tonumber(houseData[id]["RENTALPRICE"])
		local sucess = addHouseTenand(thePlayer, id)
		if(sucess == true) then
		if getPlayerMoney(thePlayer) >= rentprice then
		takePlayerMoney(thePlayer, rentprice) -- Takes the player money for the rent
		setHouseData(id, "MONEY", tonumber(houseData[id]["MONEY"])+rentprice)-- Gives the owner the rentalprice
		setElementData(accSys:getPlayerAcc(thePlayer), "pRented", 1)
		outputChatBox("Shoma Mablagh $"..rentprice.." Babat Ejare Khane Pardakhtid!", thePlayer, 255, 255, 0)
		else
			outputChatBox("Shoma Pool Kafi Nadarid! Baraye Ejare Be $"..rentprice.." Digar Niyaz Mandid!", thePlayer, 255, 0, 0)
		end
		else
			outputChatBox("Shoma Nemitavanid In Khane Ra Ejare Konid!", thePlayer, 255, 0, 0)
		end
	end
end)

-- /createhouse --

addCommandHandler("createhouse", function(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 12 then
		if(isPedInVehicle(thePlayer) == true) then
			outputChatBox("Lotfan Az Mashin Khod Kharej Shavid.", thePlayer, 255, 0, 0)
			return
		end
		-- INSERT SECURITY OPTIONS LIKE ADMINLEVEL HERE( if(adminlevel > shit) then ...)
		triggerClientEvent(thePlayer, "onClientHouseSystemGUIStart", thePlayer)
	else
		outputChatBox("Shoma Admin Nistid!", thePlayer, 255, 0, 0)
	end
end)

-- /in --

function vorodkhone(thePlayer)
	if(getElementData(thePlayer, "house:lastvisit")) and (getElementData(thePlayer, "house:lastvisit") ~= false)  then
		local house = getElementData(thePlayer, "house:lastvisit")
		if(house) then
			local id = tonumber(house)
			if(tonumber(houseData[id]["LOCKED"]) == 0) or (houseData[id]["OWNER"] == getPlayerName(thePlayer)) or (isPlayerRentedHouse(thePlayer, id) == true) then
				local int, intx, inty, intz, dim = houseIntData[id]["INT"], houseIntData[id]["X"], houseIntData[id]["Y"], houseIntData[id]["Z"], id
				setElementData(thePlayer, "house:in", true)
				setInPosition(thePlayer, intx, inty, intz, int, false, dim)
				unbindKey(thePlayer, open_key, "down", togglePlayerInfomenue, id)
				setElementData(thePlayer, "house:lastvisitINT", id)
				if(houseData[id]["OWNER"] == getPlayerName(thePlayer)) or (isPlayerRentedHouse(thePlayer, id) == true) then
					bindKey(thePlayer, open_key, "down", togglePlayerHousemenue, id)
				end
			else
				outputChatBox("Shoma Kelid Dar In Khane Ra Nadarid!", thePlayer, 255, 0, 0)
			end
		end
	end
end
addCommandHandler("in", vorodkhone)


-- /ram --

addCommandHandler("ram", function(thePlayer)
	if(getElementData(thePlayer, "house:lastvisit")) and (getElementData(thePlayer, "house:lastvisit") ~= false)  then
		local house = getElementData(thePlayer, "house:lastvisit")
		if(house) then
			if not (tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4) then
			outputChatBox("#ff0000Baraye Inkar Bayad Police Bashid!", thePlayer, 255, 255, 255, true)
			return false
			end
			local id = tonumber(house)
			local int, intx, inty, intz, dim = houseIntData[id]["INT"], houseIntData[id]["X"], houseIntData[id]["Y"], houseIntData[id]["Z"], id
			setElementData(thePlayer, "house:in", true)
			setInPosition(thePlayer, intx, inty, intz, int, false, dim)
			unbindKey(thePlayer, open_key, "down", togglePlayerInfomenue, id)
			setElementData(thePlayer, "house:lastvisitINT", id)
			if(houseData[id]["OWNER"] == getPlayerName(thePlayer)) or (isPlayerRentedHouse(thePlayer, id) == true) then
				bindKey(thePlayer, open_key, "down", togglePlayerHousemenue, id)
			end
		end
	end
end)

-- /out --


addCommandHandler("out", function(thePlayer)
	if(getElementData(thePlayer, "house:lastvisitINT")) and (getElementData(thePlayer, "house:lastvisitINT") ~= false) and getElementInterior( thePlayer ) ~= 0 and getElementDimension( thePlayer ) ~= 0 then
		local house = getElementData(thePlayer, "house:lastvisitINT")
		if (house) then
			if getElementData(thePlayer, "inSleep") ~= true then
					 if not getElementData(accSys:getPlayerAcc(thePlayer), "pJailTime") == 0 then
						 outputChatBox("#ff0000✖️ #ffffffShoma Dar Jail Hastid!", thePlayer, 255, 255, 255, true)
						 return false
					end
				local id = tonumber(house)
				local x, y, z = houseData[id]["X"], houseData[id]["Y"], houseData[id]["Z"]
				setElementData(thePlayer, "house:in", false)
				setElementData(thePlayer, "house:lastvisitINT",false)
				setInPosition(thePlayer, x, y, z, 0, false, 0)
				
				triggerClientEvent("BasteSheBadeoutZadan", thePlayer)
				setPedAnimation ( thePlayer )
			else
				outputChatBox("#ff0000✖️ #ffffffHengam Sleep Nemitavanid Az Khane Kharej Shavid!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end)

-- /buyhouse --

addCommandHandler("buyhouse", function(thePlayer)
	if(getElementData(thePlayer, "house:lastvisit")) and (getElementData(thePlayer, "house:lastvisit") ~= false)  then
		if getPlayerName(thePlayer) == "no-one" then
			outputChatBox("Shoma Nemitavanid In Khane Ra Bekharid!", thePlayer, 255, 0, 0)
			return false
		end
		local house = getElementData(thePlayer, "house:lastvisit")
		if(house) then
			local id = house
			local owner = houseData[id]["OWNER"]
			if getElementData(accSys:getPlayerAcc(thePlayer), "pRented") == 0 then

			if(owner ~= "no-one") then
				outputChatBox("Shoma In Khane Ra Nemitavanid Bekharid!", thePlayer, 255, 0, 0)
			else
				local houses = 0
				for index, col in pairs(getElementsByType("colshape")) do
					if(getElementData(col, "house") == true) and (houseData[getElementData(col, "ID")]["OWNER"] == getPlayerName(thePlayer)) then
						houses = houses+1
						if(houses == max_player_houses) then
							outputChatBox("Shoma Dar Hal Hazer "..max_player_houses.." Khane Darid, Khane Khod Ra Befrooshid Ta In Khane Ra Kharidari Konid.", thePlayer, 255, 0, 0)
							return
						end
					end
				end
				local money = getPlayerMoney(thePlayer)
				local price = houseData[id]["PRICE"]
				if(money < price) then outputChatBox("Shoma Pool Kafi Nadarid! Shoma Niyazmand $"..(price-money).." Digar Hastid!", thePlayer, 255, 0, 0) return end
				setHouseData(id, "OWNER", getPlayerName(thePlayer))
				givePlayerMoney(thePlayer, -price)
				outputChatBox("Mobarake! Khane Ba Movafaghiyat Kharidari Shod!", thePlayer, 0, 255, 0)
				setElementData(accSys:getPlayerAcc(thePlayer), "pPhousekey", 1)
				local x , y , z = getElementPosition(houseData[id]["PICKUP"])
				destroyElement(houseData[id]["PICKUP"])
				houseData[id]["PICKUP"] = createPickup ( x, y, z, 3, 1272, 0 )
			end

			else
				outputChatBox("Shoma Dar Hale Hazer Mostajer Yek Khane Hastid!", thePlayer, 255, 0, 0)
			end
		end
	end
end)

-- /sellhouse --

addCommandHandler("sellhouse", function(thePlayer)
	if(getElementData(thePlayer, "house:lastvisit")) and (getElementData(thePlayer, "house:lastvisit") ~= false)  then
		local house = getElementData(thePlayer, "house:lastvisit")
		if getPlayerName(thePlayer) == "no-one" then
			outputChatBox("Shoma Nemitavanid In Khane Ra Befrooshid!", thePlayer, 255, 0, 0)
			return false
		end
		if(house) then
			local id = house
			local owner = houseData[id]["OWNER"]
			if(owner ~= getPlayerName(thePlayer)) then
				outputChatBox("Shoma Nemitavanid In Khane Ra Befrooshid!", thePlayer, 255, 0, 0)
			else
				local linked = houseData[id]["Linked"] or 0
				if linked == 0 then
					local price = houseData[id]["PRICE"]
					setHouseData(id, "OWNER", "no-one")
					setHouseData(id, "RENTABLE", 0)
					setHouseData(id, "RENTALPRICE", 0)
					for i = 1, 5, 1 do
						setHouseData(id, "RENT"..i, "no-one")
					end
					givePlayerMoney(thePlayer, math.floor(price/100*sellhouse_value))
					outputChatBox("Shoma Khane Khod Ra Be Dolat Frookhtid Va $"..math.floor(price/100*sellhouse_value).." Daryaft Kardid!", thePlayer, 0, 255, 0)
					setElementData(accSys:getPlayerAcc(thePlayer), "pPhousekey", 0)
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pTut")) == 1 then
					setElementData(accSys:getPlayerAcc(thePlayer), "pTut", 0)
					exports["notf"]:addNotification(thePlayer, "Shoma Dige Khane Nadarid, Pas Az Civilian Spawn Mishavid!" , 'info')
					end
					local x , y , z = getElementPosition(houseData[id]["PICKUP"])
					destroyElement(houseData[id]["PICKUP"])
					houseData[id]["PICKUP"] = createPickup ( x, y, z, 3, 1273, 0 )
				else
					exports["notf"]:addNotification(thePlayer, "Khane Shoma Roye Yek Family Link Shode Ast (/unlink)." , 'error')
				end
			end
		end
	end
end)

-- /deletehouse --

addCommandHandler("deletehouse", function(thePlayer, cmd, id)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 12 then
		id = tonumber(id)
		if not(id) then return end
		if not(house[id]) then
			outputChatBox("Khane'i Ba ID "..id.." Peyda Nashod!", thePlayer, 255, 0, 0)
			return
		end
		local query = dbQuery(handler, "DELETE FROM houses WHERE ID = '"..id.."';")
		local result = dbPoll(query, dbpTime)
		if(result) then
			destroyElement(houseData[id]["PICKUP"])
			destroyElement(houseIntData[id]["PICKUP"])
			houseData[id] = nil
			houseIntData[id] = nil
			destroyElement(house[id])
			destroyElement(houseInt[id])
			outputChatBox("Khane Shomare "..id.." Ba Movafaghiyat Pak Shod!", thePlayer, 0, 255, 0)
			house[id] = false
		else
			error("Khane Shomare "..id.." Sakhte Shod, Vali Dar Database Sabt Nashod!")
		end
	else
		outputChatBox("Shoma Admin Nistid!", thePlayer, 255, 0, 0)
	end
end)

-- /househelp --

addCommandHandler("househelp", function(thePlayer)
	outputChatBox("/buyhouse, /sellhouse, /rent", thePlayer, 0, 255, 255)
	outputChatBox("/unrent, /in, /out", thePlayer, 0, 255, 255)
	outputChatBox("CMD Haye Admin: /createhouse, /deletehouse [id], /gotohouse [id]", thePlayer, 0, 255, 255)
end)

-- INSERT INTO dbs_housesystem.houses (X, Y, Z, INTERIOR, INTX, INTY, INTZ, MONEY, WEAP1, WEAP2, WEAP3) values("0.1", "0.1", "0.1", "5", "0.2", "0.2", "0.2", "2000", "46,1", "22,200", "25, 200")

--------------------
-- BIND FUNCTIONS --
--------------------

function togglePlayerInfomenue(thePlayer, id)
	if(id) then
		local locked = houseData[id]["LOCKED"]
		local rentable = houseData[id]["RENTABLE"]
		local rentalprice = houseData[id]["RENTALPRICE"]
		local owner = houseData[id]["OWNER"]
		local price = houseData[id]["PRICE"]
		local x, y, z = getElementPosition(house[id])
		local house = getPlayerRentedHouse(thePlayer)
		if(house ~= false) then house = true end
		local isrentedin = isPlayerRentedHouse(thePlayer, id)
		triggerClientEvent(thePlayer, "onClientHouseSystemInfoMenueOpen", thePlayer, owner, x, y, z, price, locked, rentable, rentalprice, id, house, isrentedin)
	end
end

function togglePlayerHousemenue(thePlayer,  id)
	if(id) then
		if(getElementInterior(thePlayer) ~= 0) then
			local locked = houseData[id]["LOCKED"] or 0
			local money = houseData[id]["MONEY"]
			local weap1 = houseData[id]["WEAPONS"][1]
			local weap2 = houseData[id]["WEAPONS"][2]
			local weap3 = houseData[id]["WEAPONS"][3]
			local rentable = houseData[id]["RENTABLE"]
			local rent = houseData[id]["RENTALPRICE"]
			local tenands = getHouseTenands(id)
			local owner = false
			if(getPlayerName(thePlayer) == houseData[id]["OWNER"]) then
				owner = true
			end
			local canadd = canAddHouseTenand(id)
			triggerClientEvent(thePlayer, "onClientHouseSystemMenueOpen", thePlayer, owner, locked, money, weap1, weap2, weap3, id, rentable, rent, tenands, canadd)
		end
	else
		triggerClientEvent(thePlayer, "onClientHouseSystemMenueOpen", thePlayer )
	end
end

-------------------------------
-- HOUSE CREATION ON STARTUP --
-------------------------------

-- BUILDHOUSE FUNCTION --

local function buildHouse(id, x, y, z, interior, intx, inty, intz, money, weapons, locked, price, owner, rentable, rentalprice, rent1, rent2, rent3, rent4, rent5 , Linked)
	if(id) and (x) and(y) and (z) and (interior) and (intx) and (inty) and (intz) and (money) and (weapons) then

		houseid = id
		house[id] = createColSphere(x, y, z, 1.5) -- This is the house, hell yeah
		houseData[id] = {} 
		local house = house[id] -- I'm too lazy...
		setElementData(house, "house", true) -- Just for client code only 
		--[[		
			local houseIntPickup = createPickup(intx, inty, intz, 3, 1318, 0)
			setElementInterior(houseIntPickup, interior)
			setElementDimension(houseIntPickup, id)
		]]--
		
		houseInt[id] = createColSphere(intx, inty, intz, 1.5) -- And this is the Exit
		setElementInterior(houseInt[id], interior)
		setElementDimension(houseInt[id], id) -- The House Dimension is the house ID
		setElementData(houseInt[id], "house", false)
		--------------------
		-- EVENT HANDLERS --
		--------------------
	
		-- IN --
		addEventHandler("onColShapeHit", house, function(hitElement)
			if(getElementType(hitElement) == "player") then
				if getElementInterior(hitElement) == 0 then
					setElementData(hitElement, "house:lastvisit", id)

					togglePlayerInfomenue(hitElement, id)
				end
				
			end
		end)
		
		addEventHandler("onColShapeLeave", house, function(hitElement)
			if(getElementType(hitElement) == "player") then

				setElementData(hitElement, "house:lastvisit", false)
			end
		end)
		
		-- OUT --
		
		
		addEventHandler("onColShapeHit", houseInt[id], function(hitElement, dim)
			if(dim == true) then
				if(getElementType(hitElement) == "player") then
					unbindKey(hitElement, open_key, "down", togglePlayerInfomenue, id)
					exports["notf"]:addNotification(hitElement, "Baraye Khoroj Az CMD /out Estefade Konid. Baraye Didan Panel House Az CMD /house Estefade Konid." , 'info')
					setElementData(hitElement, "house:lastvisitINT", id)
					if(houseData[id]["OWNER"] == getPlayerName(hitElement)) or (isPlayerRentedHouse(hitElement, id) == true) then
						bindKey(hitElement, open_key, "down", togglePlayerHousemenue, id)
					end
					--outputChatBox(id)
				end
			end
		end)
		
		addEventHandler("onColShapeLeave", houseInt[id], function(hitElement, dim)
			if(dim == true) then
				if(getElementType(hitElement) == "player") then
					setElementData(hitElement, "house:lastvisitINT", false)
					if(houseData[id]["OWNER"] == getPlayerName(hitElement)) or (isPlayerRentedHouse(hitElement, id) == true) then
						unbindKey(hitElement, open_key, "down", togglePlayerHousemenue, id)
					end
					--outputChatBox(id)
				end
			end
		end)

		addCommandHandler("house",
		function(hitElement,cmd)
			if getElementData(hitElement,"house:lastvisitINT") > 0 then
				local id = getElementData(hitElement,"house:lastvisitINT")
				if(houseData[id]["OWNER"] == getPlayerName(hitElement)) or (isPlayerRentedHouse(hitElement, id) == true) then

					togglePlayerHousemenue(hitElement,id)
				end
			end
			
		end)

		
		-- Set data for HOUSE --
		houseData[id]["HOUSE"] = house
		houseData[id]["DIM"] = id
		houseData[id]["MONEY"] = money
		houseData[id]["WEAPONS"] = weapons
		houseData[id]["INTHOUSE"] = houseInt[id]
		houseData[id]["LOCKED"] = locked
		houseData[id]["PRICE"] = price
		houseData[id]["OWNER"] = owner
		houseData[id]["X"] = x
		houseData[id]["Y"] = y
		houseData[id]["Z"] = z
		houseData[id]["RENTABLE"] = rentable
		houseData[id]["RENTALPRICE"] = rentalprice
		houseData[id]["RENT1"] = rent1
		houseData[id]["RENT2"] = rent2
		houseData[id]["RENT3"] = rent3
		houseData[id]["RENT4"] = rent4
		houseData[id]["RENT5"] = rent5
		houseData[id]["Linked"] = Linked

		housePickupOUT = createPickup(intx+0.4, inty-0.1, intz, 3, 1318, 100)
		setElementInterior(housePickupOUT, interior)
		setElementDimension(housePickupOUT, id)
		-- HOUSE PICKUP --
		local housePickup
		if(owner ~= "no-one") then
			housePickup = createPickup(x, y, z-0.5, 3, 1272, 100)
		else
			housePickup = createPickup(x, y, z-0.5, 3, 1273, 100)
		end
		-- SET THE DATA --
		houseData[id]["PICKUP"] = housePickup


		
		setElementData(house, "PRICE", price)
		setElementData(house, "OWNER", owner)
		setElementData(house, "LOCKED", locked)
		setElementData(house, "ID", id)
		setElementData(house, "RENTABLE", rentable)
		setElementData(house, "RENTALPRICE", rentalprice)
		
		-- SET DATA FOR HOUSEINTERIOR --
		houseIntData[id] = {}
		houseIntData[id]["OUTHOUSE"] = houseData[id]["HOUSE"]
		houseIntData[id]["INT"] = interior
		houseIntData[id]["X"] = intx
		houseIntData[id]["Y"] = inty
		houseIntData[id]["Z"] = intz
		houseIntData[id]["PICKUP"] = houseIntPickup
		outputServerLog("House with ID "..id.." created sucessfully!")
		buildEndTick = getTickCount()
		-- TRIGGER TO ALL CLIENTS THAT THE HOUSE HAS BEEN CREATEEEEEEEEEEEEEEEEEEEEEEED --
		setTimer(triggerClientEvent, 1000, 1, "onClientHouseSystemColshapeAdd", getRootElement(), house)
	else
		if not(id) then
			error("Arguments @buildHouse not valid! There is no Houseid!")
		else
			error("Arguments @buildHouse not valid! Houseid = "..id)
		end
	end	
end



-- HOUSE DATABASE EXECUTION --

function housesys_startup()
	if(created == true) then
		error("Houses Allready created!")
		return
	end
	buildStartTick = getTickCount()
	local query = dbQuery(handler, "SELECT * FROM houses;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local id = row['ID']
			local x, y, z = row['X'], row['Y'], row['Z']
			local int, intx, inty, intz = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
			local money, weap1, weap2, weap3 = row['MONEY'], row['WEAP1'], row['WEAP2'], row['WEAP3']
			local locked = row['LOCKED']
			local price = row['PRICE']
			local owner = row['OWNER']
			local rentable = row['RENTABLE']
			local rentalprice = row['RENTALPRICE']
			local rent1, rent2, rent3, rent4, rent5 = row['RENT1'],row['RENT2'], row['RENT3'], row['RENT4'], row['RENT5']
			local weapontable = {}
			local Linked = row['Linked']
			weapontable[1] = weap1
			weapontable[2] = weap2
			weapontable[3] = weap3

			buildHouse(id, x, y, z, int, intx, inty, intz, money, weapontable, locked, price, owner, rentable, rentalprice, rent1, rent2, rent3, rent4, rent5, Linked)
		end
		dbFree(query)
	else
		error("Houses Table not Found/empty!")
	end
	created = true
	setTimer(function()
		local elapsed = (buildEndTick-buildStartTick)
		outputServerLog("It took "..(elapsed/1000).." seconds to build all houses.")
	end, 1000, 1)
end

-- House Data array set --

function setHouseData(ID, typ, value)
	-- Security array -- 
	houseData[ID][typ] = value
	setElementData(house[ID], typ, value)
	if(saveableValues[typ]) then
		local query = dbQuery(handler, "UPDATE houses SET "..saveableValues[typ].." = '"..value.."' WHERE ID = '"..ID.."';" )
		local result = dbPoll(query, dbpTime)
		if(result) then
			dbFree(query)
			
		else
			error("Can't save Data: "..typ.." with the value: "..value.." for house ID "..ID.."!")
		end
	end
end


--------------------
-- EVENT HANDLERS --
--------------------

-- INFO RENT -

addEventHandler("onHouseSystemInfoRent", getRootElement(), function(id, value)
	if(houseData[id]) then
		if(value == true) then
			executeCommandHandler("rent", source)
		else
			executeCommandHandler("unrent", source)
		end
	end
end)


-- INFO ENTER --

addEventHandler("onHouseSystemInfoEnter", getRootElement(), function(id)
	if(houseData[id]) then
		executeCommandHandler("in", source)
	end
end)

-- INFO BUY --
addEventHandler("onHouseSystemInfoBuy", getRootElement(), function(id, value)
	if(houseData[id]) then
		if(value == true) then
			executeCommandHandler("buyhouse", source)
		else
			executeCommandHandler("sellhouse", source)
		end
	end
end)


-- TENAND REMOVE --

addEventHandler("onHouseSystemTenandRemove", getRootElement(), function(id, value)
	if(houseData[id]) then
		local sucess = removeHouseTenand(id, value)
		if(sucess == true) then
			outputChatBox("Shoma "..value.." Mostajer Khod Ra Laghv Ejare Name Kardid!", source, 0, 255, 0)
			triggerClientEvent(source, "onClientHouseSystemMenueUpdate", source, "TENANDS", getHouseTenands(id))
		end
	end
end)

-- SET RENTALPRICE --

addEventHandler("onHouseSystemRentalprice", getRootElement(), function(id, value)
	if(houseData[id]) then
		local oldvalue = tonumber(houseData[id]["RENTALPRICE"])
		if(oldvalue < value) then
			local tenands = getHouseTenands(id)
			local users = {}
			for i = 1, 5, 1 do
				if(tenands[i] ~= "no-one") then
					users[i] = tenands[i]
				end
			end
			if(#users > 0) then
				outputChatBox("Shoma Ghader Be Bala Bordan Mablagh Ejare Khane Nistid Zira Mostajer Darid!", source, 255, 0, 0)
				return
			end
		end
		setHouseData(id, "RENTALPRICE", value)
		outputChatBox("Mablagh Ejare Khane Shoma Be $"..value.." Taghir Yaft!", source, 0, 255, 0)
		triggerClientEvent(source, "onClientHouseSystemMenueUpdate", source, "RENTALPRICE", value)
	end
end)

-- RENTABLE SWITCH --
addEventHandler("onHouseSystemRentableSwitch", getRootElement(), function(id)
	if(houseData[id]) then
		local state = tonumber(houseData[id]["RENTABLE"])
		if(state == 0) then
			setHouseData(id, "RENTABLE", 1)
			triggerClientEvent(source, "onClientHouseSystemMenueUpdate", source, "RENTABLE", true)
			outputChatBox("Khane Shoma Ham Aknoon Ghader Be Mostajer Dashtan Ast!", source, 0, 255, 0)
		else
			setHouseData(id, "RENTABLE", 0)
			triggerClientEvent(source, "onClientHouseSystemMenueUpdate", source, "RENTABLE", false)
			outputChatBox("Khane Shoma Ham Aknoon Ghader Be Mostajer Dashtan Nist!", source, 0, 255, 0)
		end
	end
end)


-- CREATE HOUSE --

addEventHandler("onHouseSystemHouseCreate", getRootElement(), function(x, y, z, int, intx, inty, intz, price)
	local query = dbQuery(handler, "INSERT INTO houses (X, Y, Z, INTERIOR, INTX, INTY, INTZ, PRICE) values ('"..x.."', '"..y.."', '"..z.."', '"..int.."', '"..intx.."', '"..inty.."', '"..intz.."', '"..price.."');")
	local result, numrows = dbPoll(query, dbpTime)
	if(result) then
		local newid = houseid+1
		outputChatBox("Khane Shomare "..newid.." Ba Movafaghiyat Sakhte Shod!", source, 0, 255, 0)
		local weapontable = {}
		weapontable[1] = 0
		weapontable[2] = 0
		weapontable[3] = 0
		buildHouse(newid, x, y, z, int, intx, inty, intz, 0, weapontable, 0, price, "no-one", 0, 0, "no-one", "no-one", "no-one", "no-one", "no-one")
	else
		outputChatBox("Khata Dar Sakht Khane!", source, 255, 0, 0)
		error("House "..(houseid+1).." could not create!")
	end
end)

-- WITHDRAW WEAPON --

addEventHandler("onHouseSystemWeaponWithdraw", getRootElement(), function(id, value)
	local weapons = houseData[id]["WEAPONS"]
	if(gettok(weapons[value], 1, ",")) then
		local weapon, ammo = gettok(weapons[value], 1, ","), gettok(weapons[value], 2, ",")
		giveWeapon(source, weapon, ammo, true)
		outputChatBox("Shoma Aslahe Az Slot "..value.." Ra Az Weapon Box Bardashtid!", source, 0, 255, 0)
		weapons[value] = 0
		setHouseData(id, "WEAPONS", weapons)
		setHouseData(id, "WEAP1", weapons[1])
		setHouseData(id, "WEAP2", weapons[2])
		setHouseData(id, "WEAP3", weapons[3])
		triggerClientEvent(source, "onClientHouseSystemMenueUpdate", source, "WEAPON", value, 0)
	end
end)

-- DEPOSIT WEAPON --


addEventHandler("onHouseSystemWeaponDeposit", getRootElement(), function(id, value)
	local weapons = houseData[id]["WEAPONS"]
	if(tonumber(weapons[value]) == 0) then
		local weapon = getPedWeapon(source)
		local ammo = getPedTotalAmmo(source)
		if(weapon) and (ammo) and(weapon ~= 0) and (ammo ~= 0) then 
			weapons[value] = weapon..", "..ammo
			takeWeapon(source, weapon)
			outputChatBox("Shoma Aslahe "..getWeaponNameFromID(weapon).." Ra Dar Weapon Box Gozashtid!", source, 0, 255, 0)
			setHouseData(id, "WEAPONS", weapons)
			setHouseData(id, "WEAP1", weapons[1])
			setHouseData(id, "WEAP2", weapons[2])
			setHouseData(id, "WEAP3", weapons[3])
			triggerClientEvent(source, "onClientHouseSystemMenueUpdate", source, "WEAPON", value, weapons[value])
		else
			outputChatBox("Shoma Aslahe Nadarid!", source, 255, 0, 0)
		end
	else
		outputChatBox("Dar Hal Hazer Yek Aslahe Dar In Slot Voojod Darad!", source, 255, 0, 0)
	end
end)

-- LOCK HOUSE --

addEventHandler("onHouseSystemHouseLock", getRootElement(), function(id)
	local state = tonumber(houseData[id]["LOCKED"])
	if(state == 1) then
		setHouseData(id, "LOCKED", 0)
		outputChatBox("Dar Khane Shoma Baz Shod!", source, 0, 255, 0)
		triggerClientEvent(source, "onClientHouseSystemMenueUpdate", source, "LOCKED", 0)
	else
		setHouseData(id, "LOCKED", 1)
		outputChatBox("Dar Khane Shoma Ghofl Shod!", source, 0, 255, 255)
		triggerClientEvent(source, "onClientHouseSystemMenueUpdate", source, "LOCKED", 1)
	end
end)

-- DEPOSIT MONEY --

addEventHandler("onHouseSystemHouseDeposit", getRootElement(), function(id, value)
	if(value > getPlayerMoney(source)-1) then return end
	setHouseData(id, "MONEY", tonumber(houseData[id]["MONEY"])+value)
	outputChatBox("Shoma Mablagh "..value.."$ Dar Cash Box Gozashtid!", source, 0, 255, 0)
	triggerClientEvent(source, "onClientHouseSystemMenueUpdate", source, "MONEY", tonumber(houseData[id]["MONEY"]))
	givePlayerMoney(source, -value)
end)

-- WITHDRAW MONEY --

addEventHandler("onHouseSystemHouseWithdraw", getRootElement(), function(id, value)
	local money = tonumber(houseData[id]["MONEY"])
	if(money < value) then
		outputChatBox("Shoma In Meghdar Pool Dar Cash Box Nadarid!", source, 255, 0, 0)
		return
	end
	setHouseData(id, "MONEY", tonumber(houseData[id]["MONEY"])-value)
	outputChatBox("Shoma Mablagh "..value.."$ Az Cash Box Bardashtid!", source, 0, 255, 0)
	triggerClientEvent(source, "onClientHouseSystemMenueUpdate", source, "MONEY", money-value)
	givePlayerMoney(source, value)
end)


----------------------------
-- SETTINGS AND FUNCTIONS --
----------------------------


-- FADE PLAYERS POSITION --
local fadeP = {}
function setInPosition(thePlayer, x, y, z, interior, typ, dim)
	if not(thePlayer) then return end
	if (getElementType(thePlayer) == "vehicle") then return end
	if(isPedInVehicle(thePlayer)) then return end
	if not(x) or not(y) or not(z) then return end
	if not(interior) then interior = 0 end
	if(fadeP[thePlayer] == 1) then return end
	fadeP[thePlayer] = 1
	fadeCamera(thePlayer, false)
	setElementFrozen(thePlayer, true)
	setTimer(
		function()
		fadeP[thePlayer] = 0
		setElementPosition(thePlayer, x, y, z)
		setElementInterior(thePlayer, interior)
		if(dim) then setElementDimension(thePlayer, dim) end
		fadeCamera(thePlayer, true)
		if not(typ) then
			setElementFrozen(thePlayer, false)
		else
			if(typ == true)  then
				setTimer(setElementFrozen, 1000, 1, thePlayer, false)
			end
		end
	end, 1000, 1)
end


-- canAddHouseTenand
-- Checks if there is a free slot in the house

function canAddHouseTenand(id)
	if not(houseData[id]) then return false end
	for i = 1, 5, 1 do
		local name = houseData[id]["RENT"..i]
		if(name == "no-one") then
			return true, i
		end
	end
	return false;
end

-- addHouseTenand
-- Adds a player to a house as tenand

function addHouseTenand(player, id)
	if not(houseData[id]) then return false end
	for i = 1, 5, 1 do
		local name = houseData[id]["RENT"..i]
		if(name == "no-one") then
			setHouseData(id,"RENT"..i, getPlayerName(player))
			return true, i
		end
	end
	return false;
end

-- removeHouseTenand
-- Removes a player from a house

function removeHouseTenand(id, player)
	if not(houseData[id]) then return false end
	if(type(player) == "string") then
		for i = 1, 5, 1 do
			local name = houseData[id]["RENT"..i]
			if(name == player) then
				setHouseData(id,"RENT"..i,"no-one")
				return true
			end
		end
	else
		for i = 1, 5, 1 do
			local name = houseData[id]["RENT"..i]
			if(name == getPlayerName(player)) then
				setHouseData(id,"RENT"..i,"no-one")
				return true
			end
		end
	end
	return false;
end

-- getHouseTenands(houseid)
-- Returns a table within all tenands in this house 

function getHouseTenands(id)
	if not(houseData[id]) then return false end
	local rent = {}
	for i = 1, 5, 1 do
		rent[i] = houseData[id]["RENT"..i]
	end
	return rent;
end

-- getPlayerRentedHouse
-- Gets the House where a player is rented in --

function getPlayerRentedHouse(thePlayer)
	for index, house in pairs(getElementsByType("colshape")) do
		if(getElementData(house, "house") == true) and (getElementData(house, "ID")) then
			local id = tonumber(getElementData(house, "ID"))
			if not(id) then return false end
			local rent = {}
			for i = 1, 5, 1 do
				rent[i] = houseData[id]["RENT"..i]
			end
			for index, player in pairs(rent) do
				if(player == getPlayerName(thePlayer)) then
					return id;
				end
			end
		end
	end
	return false;
end

-- isPlayerRentedHouse
-- Checks if a player is rented in a specific house

function isPlayerRentedHouse(thePlayer, id)
	if not(houseData[id]) then return false end
	local rent = {}
	for i = 1, 5, 1 do
		rent[i] = houseData[id]["RENT"..i]
	end
	for index, player in pairs(rent) do
		if(player == getPlayerName(thePlayer)) then
			return true;
		end
	end
	return false;
end

-- Teleport Kardan Be House ID
function borobeHouse (thePlayer, command, id1)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
find = "nashod"
  local query = dbQuery(handler, "SELECT * FROM houses;" )
  local result, numrows = dbPoll(query, dbpTime)
  if id1 then
    for index, row in pairs(result) do
      id2 = row['ID']  
        if  tonumber(id1)==tonumber(id2) then  
		 local x,y,z = tonumber(row['X']), tonumber(row['Y']), tonumber(row['Z'])
			setElementPosition(thePlayer, x,y,z)
			outputChatBox("#00ff00Shoma Be House ID "..id1.." Teleport Shodid!", thePlayer, 255, 255, 255, true)
			find = "shod"
		end
	end
if find~= "shod" then
	outputChatBox("#ff0000[Error]: #ffffffHouse ID Peyda Nashod!", thePlayer, 255, 0, 0, true)
end
else
	outputChatBox("#C0C0C0Syntax: /gotohouse <House-ID>", thePlayer, 255, 255, 255, true)
end
end
addCommandHandler("gotohouse", borobeHouse)