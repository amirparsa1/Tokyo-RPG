local accSys = exports["Accounts-system"]
local notfSys = exports["notf"]
local miscSys = exports["misc"]

dbpTime = 500
function sendPlayerMessage(Str,player)
	outputChatBox(tostring(Str),player,255,255,255,true)
end
logs = {}
--

sendOptions = {}

EnableLog = true

function SendDiscordMessage(Message,CMD,style)
	if EnableLog == true then
		if style == 1 then
			sendOptions = {}
			sendOptions = {
				queueName = "dcg",
				connectionAttempts = 3,
				connectTimeout = 5000,
				formFields = {
					content = ""..Message..""
					},
			}
		else
			sendOptions = {}
			sendOptions = {
				queueName = "dcg",
				connectionAttempts = 3,
				connectTimeout = 5000,
				formFields = {
					content = "```css\n"..Message.."\n```"
					},
			}
		end
		fetchRemote(logs[CMD], sendOptions, callback)
	end
end

function callback()
	outputDebugString("Message ferestade shod!")
end

-- Inventory Tables
InvTimer = {}
InventoryData = {}

-- Other Tables
DropObjects = {}
DropMark = {}
MarkID = {}
MarkItem = {}
----- ITEM NAME
ItemsTable = {
	[0] = {"Nothing"},
	[1] = {"Kayk"},
	[2] = {"Cocaine"},
	[3] = {"Explosive Bullet"},
	[4] = {"Mahie Sefid"},
	[5] = {"Freezer Bullet"},
	[6] = {"Jerrycan"},
	[7] = {"Invisible"},
	[8] = {"Approval"},
	[9] = {"Kilid"},
	[10] = {"Med Kit"},
	[11] = {"JetPack"},
	[12] = {"Vehicle Nitro"},
	[13] = {"Pizza"},
	[14] = {"Cuff"},
	[15] = {"Random Box"},
	[16] = {"Repair Kit"},
	[17] = {"Suicide"},
	[18] = {"Water"},
	[19] = {"Marijuana"},
	[20] = {"Lighter"},
	[21] = {"Cigarettes"},
	[22] = {"SimCard"},
	[23] = {"Special Box"},
	[24] = {"Special Bullet"},
	[25] = {"Poison Bullet"},
	[26] = {"Fire Bullet"},
	[27] = {"Extra Jump"},
	[28] = {"Shild"},
	[29] = {"Fire Extinguisher"},
	[30] = {"Khaviar"},
	[31] = {"Mahie Ghermez"},
	[32] = {"Mahie Kapoor"},
	[33] = {"Ghezel Ala"},
	[34] = {"Mahie Oscar"},
	[35] = {"Meygoo"},
	[36] = {"Setare Daryaei"},
	[37] = {"Christmas Box"},
	[38] = {"Dildo"},
	[39] = {"DVD"},
	[40] = {"Gold"},
	[41] = {"Shamshir"},
	[42] = {"Einak"},
	[43] = {"Spray"},
	[44] = {"Khodkar"},
	[45] = {"Dampai"},
	[46] = {"ShisheShir"},
	[47] = {"Pich"},
	[48] = {"Achar"},
	[49] = {"Ahan"},
	[50] = {"Almas Sefid"},
	[51] = {"Almas Sabz"},
	[52] = {"Almas Abi"},
	[53] = {"Almas Banafsh"},
	[54] = {"Almas Ghermez"},
	[55] = {"Almas Zard"},
	[56] = {"Yaghot Sefid"},
	[57] = {"Yaghot Sabz"},
	[58] = {"Yaghot Abi"},
	[59] = {"Yaghot Banafsh"},
	[60] = {"Yaghot Ghermez"},
	[61] = {"Yaghot Zard"},
	[62] = {"C4"},
	[63] = {"Skin Arian"},
}

addEvent("RequestShowInventory",true)
addEventHandler("RequestShowInventory",getRootElement(),function(thePlayer)
	if not InvTimer[thePlayer] then
		if getElementData(thePlayer,"loggedIn") == true then
			-- Loading
			InventoryData[thePlayer] = {}
			for i=1,55 do
				InventoryData[thePlayer][i] = {}
				InventoryData[thePlayer][i]["Item"] = {}
				InventoryData[thePlayer][i]["Amount"] = {}
			end
			
			local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory WHERE `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")))
			local result, numrows = dbPoll(InventoryQuery, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
					for i=1,55 do
						InventoryData[thePlayer][i]["Item"] = row["Item"..i..""]
						InventoryData[thePlayer][i]["Amount"] = row["Amount"..i..""]
					end
				end
			end
			dbFree(InventoryQuery)
			
			-- Showing
			triggerClientEvent("ShowInventoryForPlayer",thePlayer,thePlayer,InventoryData)
			-- Anti Flood Timer
			InvTimer[thePlayer] = setTimer(function(thePlayer)
				InvTimer[thePlayer] = nil
			end,500,1,thePlayer)
		end
	else
		notfSys:addNotification(thePlayer,"Lotfan Spam Nakonid!","warning")
	end
end)

function ReLoadInventoryForPlayer(thePlayer)
	if InventoryData[thePlayer] then
		InventoryData[thePlayer] = nil
	end
	InventoryData[thePlayer] = {}
	for i=1,55 do
		InventoryData[thePlayer][i] = {}
		InventoryData[thePlayer][i]["Item"] = {}
		InventoryData[thePlayer][i]["Amount"] = {}
	end
	local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory WHERE `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")))
	local result, numrows = dbPoll(InventoryQuery, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			for i=1,55 do
				InventoryData[thePlayer][i]["Item"] = row["Item"..i..""]
				InventoryData[thePlayer][i]["Amount"] = row["Amount"..i..""]
			end
		end
	end
	dbFree(InventoryQuery)
	triggerClientEvent("ShowInventoryForPlayer",thePlayer,thePlayer,InventoryData,1)
end


addEvent("updateInventorySlot",true)
addEventHandler("updateInventorySlot",getRootElement(),function(thePlayer,PreviousSlot,NextSlot,PreviousItem,NextItem)
	local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory WHERE `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")) )
	local result, numrows = dbPoll(InventoryQuery, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local secQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Item"..tostring(PreviousSlot).."` = '0', `Item"..tostring(NextSlot).."` = '"..NextItem.."' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
			local SyncAmounts = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Amount"..tostring(PreviousSlot).."` = '0', `Amount"..tostring(NextSlot).."` = '"..row["Amount"..PreviousSlot].."' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer),"pID")).."'")
			
			dbFree(SyncAmounts)
			dbFree(secQuery)
		end
	end
	dbFree(InventoryQuery)
	ReLoadInventoryForPlayer(thePlayer)
end)

function TakePlayerItem(thePlayer,ItemSlot,Amounts)
	local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory WHERE `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))  )
	local result, numrows = dbPoll(InventoryQuery, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local TotalAmounts = row["Amount"..ItemSlot]
			--if TotalAmounts >= Amounts then
				local PreFinalAmount = TotalAmounts - Amounts
				if PreFinalAmount <= 0 then
					local secQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Item"..tostring(ItemSlot).."` = '0' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
					local SyncAmounts = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Amount"..tostring(ItemSlot).."` = '0' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
					dbFree(SyncAmounts)
					dbFree(secQuery)
				else
					local secQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Item"..tostring(ItemSlot).."` = '"..row["Item"..ItemSlot].."' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
					local SyncAmounts = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Amount"..tostring(ItemSlot).."` = '"..PreFinalAmount.."' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
					dbFree(SyncAmounts)
					dbFree(secQuery)
				end
			--end
			ReLoadInventoryForPlayer(thePlayer)
		end
	end
	dbFree(InventoryQuery)
end

function GetPlayerSlotInfo(thePlayer,ItemSlot)
	local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory WHERE `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")) )
	local result, numrows = dbPoll(InventoryQuery, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			--outputDebugString(
			return tonumber(row["Item"..ItemSlot]),tonumber(row["Amount"..ItemSlot])
			
		end
	end
	dbFree(InventoryQuery)
end

function RemovePlayerItem(thePlayer,ItemSlot)
	local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory WHERE `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")) )
	local result, numrows = dbPoll(InventoryQuery, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local secQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Item"..tostring(ItemSlot).."` = '0' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
			local SyncAmounts = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Amount"..tostring(ItemSlot).."` = '0' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
			
			dbFree(secQuery)
			dbFree(SyncAmounts)
		end
	end
	dbFree(InventoryQuery)
	
	ReLoadInventoryForPlayer(thePlayer)
end


function GivePlayerItem(thePlayer,ItemID,Amounts,ItemSlot)
	local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory WHERE `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")) )
	local result, numrows = dbPoll(InventoryQuery, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			for i=1,55 do
				if tonumber(row["Item"..i..""]) == tonumber(ItemID) then
					local nowslot = i
					local SyncAmounts = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Amount"..tostring(nowslot).."` = '"..tonumber(row["Amount"..nowslot]) + Amounts.."' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
					dbFree(SyncAmounts)
					ReLoadInventoryForPlayer(thePlayer)
					return true
				end
			end
			local secQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Item"..tostring(ItemSlot).."` = '"..ItemID.."' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
			local SyncAmounts = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Amount"..tostring(ItemSlot).."` = '"..Amounts.."' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
			dbFree(secQuery)
			dbFree(SyncAmounts)
			ReLoadInventoryForPlayer(thePlayer)
			return true
		end
	end
	dbFree(InventoryQuery)
	
	ReLoadInventoryForPlayer(thePlayer)
	return false
end

function GetPlayerFreeSlot(thePlayer,itemID)
	local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory WHERE `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")) )
	local result, numrows = dbPoll(InventoryQuery, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			for i=1,55 do
				if tonumber(row["Item"..i..""]) == 0 then
					return i
				end
			end
			for i=1,55 do
				if tonumber(row["Item"..i..""]) == tonumber(itemID) then
					return i
				end
			end
		end
	end
	dbFree(InventoryQuery)
	return 0
end


function isPlayerHaveThisItem(thePlayer,itemID)
	local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory WHERE `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")) )
	local result, numrows = dbPoll(InventoryQuery, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			for i=1,55 do
				if tonumber(row["Item"..i..""]) == tonumber(itemID) then
					return true
				end
			end
		end
	end
	dbFree(InventoryQuery)
	return false
end

function getPlayerItemSlotInfo(thePlayer,itemID)
	local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory WHERE `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")) )
	local result, numrows = dbPoll(InventoryQuery, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			for i=1,55 do
				if tonumber(row["Item"..i..""]) == tonumber(itemID) then
					return i,tonumber(row["Amount"..i..""])
				end
			end
		end
	end
	dbFree(InventoryQuery)
	return 0
end

function GetPlayerItemSlot(thePlayer,Item)
	local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory WHERE `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")) )
	local result, numrows = dbPoll(InventoryQuery, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			for i=1,55 do
				if tonumber(row["Item"..i..""]) == tonumber(Item) then
					return i,tonumber(row["Amount"..i..""])
				end
			end
		end
	end
	dbFree(InventoryQuery)
	return 0
end


addCommandHandler("takeme",function(thePlayer)
	if getPlayerName(thePlayer) == "ExoPrim" then
		for i=1,55 do
			TakePlayerItem(thePlayer,i,99999)
		end	
	end
end)

addEvent("RequestDropItem",true)
addEventHandler("RequestDropItem",getRootElement(),function(thePlayer,ItemSlot)
	local ItemID,ItemAmount = GetPlayerSlotInfo(thePlayer,ItemSlot)
	if tonumber(ItemID) >= 1 then
		if tonumber(ItemAmount) >= 1 then
			if not isPedInVehicle(thePlayer) then
				--if isPedOnGround(thePlayer) then
					local x , y , z = getElementPosition(thePlayer)
					local r = getPedRotation ( thePlayer )
					local x = x - math.sin ( math.rad ( r ) ) * 2
					local y = y + math.cos ( math.rad ( r ) ) * 2
					if InjaMisheDropKard(x,y,z) then
						TakePlayerItem(thePlayer,ItemSlot,1)
						sendPlayerMessage("#00ff00Dropped!",thePlayer)
						DropItem(thePlayer,x,y,z,ItemID)
					else
						sendPlayerMessage("#ff0000[Error]:#FFFFFF Inja Nemishe Item Drop Kard!",thePlayer)
					end
				--else
					--sendPlayerMessage("#ff0000[Error]:#FFFFFF Bayad Rooye Zamin Bashid!",thePlayer)
				--end
			else
				sendPlayerMessage("#ff0000[Error]:#FFFFFF Az Khodro Piade Shavid!",thePlayer)
			end
		else
			RemovePlayerItem(thePlayer,ItemSlot)
		end
	else
		ReLoadInventoryForPlayer(thePlayer)
	end
end)

useObject = {}
useTimer = {}

cashprizes = {
	[1] = 70000,
	[2] = 80000,
	[3] = 90000,
	[4] = 100000,
	[5] = 110000,
	[6] = 120000,
	[7] = 130000,
	[8] = 140000,
	[9] = 200000,
	[10] = 170000,
	[11] = 190000,
	[12] = 300000,
}

goldprizes = {
	[1] = 50,
	[2] = 55,
	[3] = 60,
	[4] = 65,
	[5] = 70,
	[6] = 75,
	[7] = 80,
	[8] = 85,
	[9] = 90,
	[10] = 95,
	[11] = 100,
	[12] = 45,
	[13] = 50,
	[14] = 50,
	[15] = 60,
	[16] = 50,
	[17] = 55,
	[18] = 70,
}


--
cashprizes2 = {
	[1] = 70000,
	[2] = 80000,
	[3] = 90000,
	[4] = 100000,
	[5] = 110000,
	[6] = 120000,
	[7] = 130000,
	[8] = 140000,
	[9] = 200000,
	[10] = 170000,
	[11] = 190000,
	[12] = 300000,
}

goldprizes2 = {
	[1] = 50,
	[2] = 55,
	[3] = 60,
	[4] = 65,
	[5] = 70,
	[6] = 75,
	[7] = 80,
	[8] = 85,
	[9] = 90,
	[10] = 95,
	[11] = 100,
	[12] = 45,
	[13] = 50,
	[14] = 50,
	[15] = 60,
	[16] = 50,
	[17] = 55,
	[18] = 70,
}


function getBoxPrize(thePlayer,types)
	if tostring(types) == "default" then
		local randomtype = math.random(1,5)
		if randomtype >= 1 and randomtype <= 4 then
			local randomcash = math.random(50000,200000)
			givePlayerMoney(thePlayer,randomcash)
			sendPlayerMessage("#ff66d3[Random-Box]:#FFFFFF Player #ff66d3"..getPlayerName(thePlayer).."#ffffff Az Random Box #ff66d3$"..convertNumber(randomcash).."#ffffff Daryaft Kard!",getRootElement())
		elseif randomtype == 5 then
			local randomrespect = math.random(1,5)
			local myRespects = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pExp"))
			setElementData(accSys:getPlayerAcc(thePlayer), "pExp", myRespects + tonumber(randomrespect))

			
			sendPlayerMessage("#ff66d3[Random-Box]:#FFFFFF Player #ff66d3"..getPlayerName(thePlayer).."#ffffff Az Random Box #ff66d3"..randomrespect.." Respect#ffffff Daryaft Kard!",getRootElement())
			
		end
	elseif tostring(types) == "special" then
		local s = math.random(1,10)
		if s >= 1 and s <= 5 then
			local randomcash = math.random(1,#cashprizes)
			
			givePlayerMoney(thePlayer,cashprizes[randomcash])
			
			sendPlayerMessage("#6c04f4[TN-Box]:#FFFFFF Player #6c04f4"..getPlayerName(thePlayer).."#ffffff Az TheNight Box #6c04f4$"..convertNumber(cashprizes[randomcash]).."#ffffff Daryaft Kard!",getRootElement())
			
		elseif s >= 6 and s <= 8 then
			local randomrespect = math.random(5,20)
			
			local myRespects = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pExp"))
			setElementData(accSys:getPlayerAcc(thePlayer), "pExp", myRespects + tonumber(randomrespect))
			
			sendPlayerMessage("#6c04f4[TN-Box]:#FFFFFF Player #6c04f4"..getPlayerName(thePlayer).."#ffffff Az TheNight Box #6c04f4"..randomrespect.." Respect#ffffff Daryaft Kard!",getRootElement())
		else
			local rand = math.random(1,#goldprizes)

			local golds = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGold"))
			setElementData(accSys:getPlayerAcc(thePlayer), "pGold", golds + tonumber(goldprizes[rand]))
			sendPlayerMessage("#6c04f4[TN-Box]:#FFFFFF Player #6c04f4"..getPlayerName(thePlayer).."#ffffff Az TN Box #6c04f4"..convertNumber(goldprizes[rand]).." Gold#ffffff Daryaft Kard!",getRootElement())

		end
	elseif tostring(types) == "xmas" then
		local s = math.random(1,10)
		if s >= 1 and s <= 5 then
			local randomcash = math.random(1,#cashprizes2)
			
			givePlayerMoney(thePlayer,cashprizes2[randomcash])
			
			sendPlayerMessage("#96ffcb[Christmas-Box]:#FFFFFF Player #96ffcb"..getPlayerName(thePlayer).."#ffffff Az Christmas Box #96ffcb$"..convertNumber(cashprizes2[randomcash]).."#ffffff Daryaft Kard!",getRootElement())
			
		elseif s >= 6 and s <= 8 then
			local randomrespect = math.random(5,20)
			local myRespects = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pExp"))
			setElementData(accSys:getPlayerAcc(thePlayer), "pExp", myRespects + tonumber(randomrespect))
			
			sendPlayerMessage("#96ffcb[Christmas-Box]:#FFFFFF Player #96ffcb"..getPlayerName(thePlayer).."#ffffff Az Christmas Box #96ffcb"..randomrespect.." Respect#ffffff Daryaft Kard!",getRootElement())
		else
			local golds = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGold"))
			setElementData(accSys:getPlayerAcc(thePlayer), "pGold", golds + tonumber(goldprizes2[rand]))
			sendPlayerMessage("#96ffcb[Christmas-Box]:#FFFFFF Player #96ffcb"..getPlayerName(thePlayer).."#ffffff Az Christmas Box #96ffcb"..convertNumber(goldprizes2[rand]).." Gold#ffffff Daryaft Kard!",getRootElement())

		end
	end
end

elementID = {}

addEvent("onItemUse",true)

addEventHandler("onItemUse",getRootElement(),function(thePlayer,ItemID,SlotID)
	if elementID[source] == 15 then
		local x , y , z = getElementPosition(thePlayer)
		local v,h,r = getElementRotation ( thePlayer )
		local x = x - math.sin ( math.rad ( r ) ) * 3
		local y = y + math.cos ( math.rad ( r ) ) * 3
		local z = z - 0.4
		useObject[thePlayer] = createObject(1856,x,y,z)
		--triggerClientEvent("playChest",thePlayer,thePlayer)
		moveObject(useObject[thePlayer],4000,x,y,z,360,360,360,"OutInElastic")
		
		useTimer[thePlayer] = setTimer(function(thePlayer)
			if useObject[thePlayer] then
				local x , y , z = getElementPosition(useObject[thePlayer])
				triggerClientEvent("createEffectForMe",thePlayer,thePlayer,x,y,z,"box")
				destroyElement(useObject[thePlayer])
				useObject[thePlayer] = nil
				useTimer[thePlayer] = nil
				getBoxPrize(thePlayer,"default")
			end
		end,3700,1,thePlayer)
		TakePlayerItem(thePlayer,SlotID,1)
	end
	
	if elementID[source] == 23 then
		local x , y , z = getElementPosition(thePlayer)
		local v,h,r = getElementRotation ( thePlayer )
		local x = x - math.sin ( math.rad ( r ) ) * 3
		local y = y + math.cos ( math.rad ( r ) ) * 3
		local z = z - 0.4
		useObject[thePlayer] = createObject(1856,x,y,z)
		--triggerClientEvent("playChest",thePlayer,thePlayer)
		moveObject(useObject[thePlayer],4000,x,y,z,360,360,360,"OutInElastic")
		
		useTimer[thePlayer] = setTimer(function(thePlayer)
			if useObject[thePlayer] then
				local x , y , z = getElementPosition(useObject[thePlayer])
				triggerClientEvent("createEffectForMe",thePlayer,thePlayer,x,y,z,"box")
				destroyElement(useObject[thePlayer])
				useObject[thePlayer] = nil
				useTimer[thePlayer] = nil
				getBoxPrize(thePlayer,"special")
			end
		end,3700,1,thePlayer)
		TakePlayerItem(thePlayer,SlotID,1)
	end
	
	if elementID[source] == 9 then
		exports["[TN]Prison"]:TheUseMile( thePlayer )
		exports["notf"]:addNotification(thePlayer, "Mile Shoma Use Shod! Tanha 5 Bar Forsat Darid!", 'success')
		TakePlayerItem(thePlayer,SlotID,1)
	end
	
	if elementID[source] == 37 then
		local x , y , z = getElementPosition(thePlayer)
		local v,h,r = getElementRotation ( thePlayer )
		local x = x - math.sin ( math.rad ( r ) ) * 3
		local y = y + math.cos ( math.rad ( r ) ) * 3
		local z = z - 0.4
		useObject[thePlayer] = createObject(1856,x,y,z)
		--triggerClientEvent("playChest",thePlayer,thePlayer)
		moveObject(useObject[thePlayer],4000,x,y,z,360,360,360,"OutInElastic")
		
		useTimer[thePlayer] = setTimer(function(thePlayer)
			if useObject[thePlayer] then
				local x , y , z = getElementPosition(useObject[thePlayer])
				triggerClientEvent("createEffectForMe",thePlayer,thePlayer,x,y,z,"box")
				destroyElement(useObject[thePlayer])
				useObject[thePlayer] = nil
				useTimer[thePlayer] = nil
				getBoxPrize(thePlayer,"xmas")
			end
		end,3700,1,thePlayer)
		TakePlayerItem(thePlayer,SlotID,1)
	end
end)

Gens = {
	[39] = {"DVD",2000},
	[40] = {"Gold",4000},
	[41] = {"Shamshir",950},
	[42] = {"Einak",1044},
	[43] = {"Spray",1500},
	[44] = {"Khodkar",1333},
	[45] = {"Dampai",700},
	[46] = {"Shishe Shir",1750},
	[47] = {"Pich",1900},
	[48] = {"Achar",1100},
	[49] = {"Ahan",850},
}


addEvent("RequestSpllitGens",true)
addEventHandler("RequestSpllitGens",getRootElement(),function(thePlayer,ItemSlot,tedadspliit)
	local ItemID,ItemAmount = GetPlayerSlotInfo(thePlayer,ItemSlot)
	if tonumber(ItemID) >= 1 then
		if tonumber(ItemAmount) > tonumber(tedadspliit) then
			local FreeSlot = GetPlayerFreeSlot(thePlayer,997377859669)
			if FreeSlot >= 1 then

				TakePlayerItem(thePlayer,ItemSlot,tedadspliit)

				local secQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Item"..tostring(FreeSlot).."` = '"..ItemID.."' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
				local SyncAmounts = dbQuery(exports.mysql:getMySQLC(), "UPDATE `inventory` SET `Amount"..tostring(FreeSlot).."` = '"..tedadspliit.."' WHERE `InvOwner` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."'")
				dbFree(secQuery)
				dbFree(SyncAmounts)
				ReLoadInventoryForPlayer(thePlayer)
				return true

			else
				notfSys:addNotification(thePlayer,"Shoma Slot Khali Nadarid.","error")
			end
		else
			notfSys:addNotification(thePlayer,"Shoma Az In Item Tanha Yek Addad Darid. Nemitavanid An Ra Be Doghestmat Taghsim Konid","error")
		end
	else
		ReLoadInventoryForPlayer(thePlayer)
	end
end)

addEvent("RequestDeleteGens",true)
addEventHandler("RequestDeleteGens",getRootElement(),function(thePlayer,ItemSlot)
	local ItemID,ItemAmount = GetPlayerSlotInfo(thePlayer,ItemSlot)
	if tonumber(ItemID) >= 1 then
		if tonumber(ItemAmount) >= 1 then

			if isPedOnGround(thePlayer) then
				if not useObject[thePlayer] and not useTimer[thePlayer] then
					if tonumber(ItemID) >= 1 then

						exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghit Item Ra Delete Kardid!.", 'error')

					
						TakePlayerItem(thePlayer,ItemSlot,ItemAmount)

					end
				end
			else
				sendPlayerMessage("#ff0000[Error]:#FFFFFF Baraye Inkar Bayad Rooye Zamin Bashid!",thePlayer)
			end

		else
			RemovePlayerItem(thePlayer,ItemSlot)
		end
	else
		ReLoadInventoryForPlayer(thePlayer)
	end
end)
addEvent("RequestSellGens",true)
addEventHandler("RequestSellGens",getRootElement(),function(thePlayer,ItemSlot)
	local ItemID,ItemAmount = GetPlayerSlotInfo(thePlayer,ItemSlot)
	if tonumber(ItemID) >= 1 then
		if tonumber(ItemAmount) >= 1 then
			if not isPedInVehicle(thePlayer) then
				if isPedOnGround(thePlayer) then
					if not useObject[thePlayer] and not useTimer[thePlayer] then
						if tonumber(ItemID) >= 1 then
							if getDistanceBetweenPoints3D(Vector3(getElementPosition(thePlayer)),-74.9912109375 ,-777.6943359375 ,9.9667482376099) <= 10 then
								local gheymat = Gens[tonumber(ItemID)][2]
								local price = math.floor(gheymat * ItemAmount)
							
								givePlayerMoney(thePlayer,tonumber(price))
							
								TakePlayerItem(thePlayer,ItemSlot,ItemAmount)
							
								sendPlayerMessage("[Semsari]:#FFFFFF Shoma #00FF00"..ItemAmount.." Adad "..Gens[tonumber(ItemID)][1].."#FFFFFF Be Gheymate #00FF00$"..convertNumber(price).."#FFFFFF Forookhtid!",thePlayer)
				
							else
								sendPlayerMessage("#fc3600[Error]:#FFFFFF Baraye Foroosh Bayad Dar Semsari Bashid!",thePlayer)
							end
						end
					end
				else
					sendPlayerMessage("#ff0000[Error]:#FFFFFF Baraye Inkar Bayad Rooye Zamin Bashid!",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000[Error]:#FFFFFF Baraye In Kar Bayad Az Khodro Piade Shavid!",thePlayer)
			end
		else
			RemovePlayerItem(thePlayer,ItemSlot)
		end
	else
		ReLoadInventoryForPlayer(thePlayer)
	end
end)




fishes = {
	[4] = {"Mahie Sefid",0.001,950},
	[30] = {"Khaviar",0.05,18000},
	[31] = {"Mahie Ghermez",0.008,750},
	[32] = {"Mahie Kapoor",0.001,900},
	[33] = {"Ghezel Ala",0.01,7000},
	[34] = {"Mahie Oscar",0.007,2000},
	[35] = {"Meygoo",0.03,14000},
	[36] = {"Setare Daryaei",0.008,5000},
	
}

addEvent("RequestSellItem",true)
addEventHandler("RequestSellItem",getRootElement(),function(thePlayer,ItemSlot)
	local ItemID,ItemAmount = GetPlayerSlotInfo(thePlayer,ItemSlot)
	if tonumber(ItemID) >= 1 then
		if tonumber(ItemAmount) >= 1 then
			if not isPedInVehicle(thePlayer) then
				if isPedOnGround(thePlayer) then
					if not useObject[thePlayer] and not useTimer[thePlayer] then
						if tonumber(ItemID) >= 1 then
							if getDistanceBetweenPoints3D(Vector3(getElementPosition(thePlayer)),820.03222,-1840.1650,13.584868431091) <= 10 then
								local gheymat = fishes[tonumber(ItemID)][3]
								local price = math.floor(gheymat * ItemAmount)
							
								givePlayerMoney(thePlayer,tonumber(price))
							
								TakePlayerItem(thePlayer,ItemSlot,ItemAmount)
							
								sendPlayerMessage("[Ghasab]:#FFFFFF Shoma #00FF00"..ItemAmount.." Adad "..fishes[tonumber(ItemID)][1].."#FFFFFF Be Gheymate #00FF00$"..convertNumber(price).."#FFFFFF Forookhtid!",thePlayer)
								if tonumber(accSys:GetPlayerData(thePlayer,"pEpic")) >= 1 then
									givePlayerMoney(thePlayer,(tonumber(price) * 2)/100)
									
									sendPlayerMessage("#00FF00[VIP-Account]:#FFFFFF Extra Money: #00FF00$"..(tonumber(price) * 2)/100 .."",thePlayer)
								end								
							else
								sendPlayerMessage("#fc3600[Error]:#FFFFFF Baraye Foroosh Bayad Dar Ghasabi Bashid!",thePlayer)
							end
						end
					end
				else
					sendPlayerMessage("#ff0000[Error]:#FFFFFF Bayad Rooye Zamin Bashid!",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000[Error]:#FFFFFF Az Khodro Piade Shavid!",thePlayer)
			end
		else
			RemovePlayerItem(thePlayer,ItemSlot)
		end
	else
		ReLoadInventoryForPlayer(thePlayer)
	end
end)

addEvent("RequestUseItem",true)
addEventHandler("RequestUseItem",getRootElement(),function(thePlayer,ItemSlot)
	if exports["[TN]Family"]:CanUseItem() == false then
		exports["notf"]:addNotification(thePlayer,"Dar Time Family Nemishe Item Use Dad.", 'error')
	else
		local ItemID,ItemAmount = GetPlayerSlotInfo(thePlayer,ItemSlot)
		if tonumber(ItemID) >= 1 then
			if tonumber(ItemAmount) >= 1 then
				--if not isPedInVehicle(thePlayer) then
					--if isPedOnGround(thePlayer) then
						if not useObject[thePlayer] and not useTimer[thePlayer] then
							if tonumber(ItemID) >= 1 then -- Random Box

								local temp = createElement("CustomItem")
								elementID[temp] = tonumber(ItemID)

								triggerEvent("onItemUse",temp,thePlayer,ItemID,ItemSlot)

								elementID[temp] = nil
								destroyElement(temp)
							end
						end
					--else
						--sendPlayerMessage("#ff0000[Error]:#FFFFFF Bayad Rooye Zamin Bashid!",thePlayer)
					--end
				--else
					--sendPlayerMessage("#ff0000[Error]:#FFFFFF Az Khodro Piade Shavid!",thePlayer)
				--end
			else
				RemovePlayerItem(thePlayer,ItemSlot)
			end
		else
			ReLoadInventoryForPlayer(thePlayer)
		end
	end
end)

function convertNumber( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1,%2' )    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

mileposs={
    [1] = {2204.7470703125 ,-1159.66796875 ,25.739095687866,359.76},
    [2] = {1805.5791015625 ,-1802.7802734375 ,3.984375,90},
    [3] = {2584.046875 ,-2188.9423828125 ,-0.21875,359.90},
    [4] = {2795.18359375 ,43.0390625 ,20.502010345459,90.03},
    [5] = {2407.2568359375 ,-2522.1611328125 ,13.650566101074,0},
    [6] = {2140.69921875 ,-2375.0361328125 ,13.546875,359.98},
    [7] = {1217.8642578125 ,-1806.1669921875 ,-4.0613775253296,47.42},
    [8] = {741.197265625 ,-1269.6640625 ,13.5546875,0},
    [9] = {484.4853515625 ,-1515.4541015625 ,20.27540397644,358.52},
    [10] = {1455.94140625 ,-2243.0068359375 ,-2.9921875,148},
    [11] = {1791.650390625 ,-2287.447265625 ,-2.6827735900879,90},
    [12] = {1682.49609375 ,-2282.4501953125 ,13.50937461853,359.68},
    [13] = {2827.0771484375 ,1249.794921875 ,10.768007278442,6.08},
    [14] = {1882.904296875 ,1812.2568359375 ,18.933877944946,0},
    [15] = {2289.765625 ,2452.6435546875 ,10.8203125,357.69},
    [16] = {2383.548828125 ,2811.46875 ,10.8203125,359.07},
    [17] = {1840.314453125 ,2803.900390625 ,10.8359375,0.19},
    [18] = {1636.0263671875 ,2377.6455078125 ,10.8203125},
    [19] = {2326.673828125 ,1353.29296875 ,7.1640625,89},--
    [20] = {1934.2216796875 ,710.73046875 ,10.8203125},
    [21] = {-701.3369140625 ,952.357421875 ,12.358784675598},
    [22] = {628.6953125 ,863.5009765625 ,-42.9609375},
    [23] = {1698.8134765625 ,698.833984375 ,10.8203125},
    [24] = {-1928.7666015625 ,2591.4990234375 ,41.988967895508},
    [25] = {-2262.271484375 ,2304.80859375 ,4.8202133178711},
}
IsMove = false
IsCreate = false
function createmile()
	if IsCreate == false then
		local c = math.random ( 1,25)
		for index,allpl in ipairs(getElementsByType("player")) do
            if getElementData(allpl, "loggedIn") == true then
                notfSys:addWarning(allpl,"(( Yek Kelid Dar Shahr Royat Shod ))","warning")
				outputChatBox("(Inventory-System):Yek Kelid Dar Map Royat Shod. Baraye Moshahede An 'F11' Bezanid.",allpl,255,255,255,true)
            end
        end
    	taraf2 = createObject ( 1271, mileposs[c][1]+2,  mileposs[c][2], mileposs[c][3] )
		PlayerMarker = createMarker(mileposs[c][1]+2,mileposs[c][2],mileposs[c][3]-1,"cylinder",2.00,255,255,255,255)
		blipemile = createBlipAttachedTo(PlayerMarker,17,2,255,0,0,255,0,99999.0)
		setElementData(blipemile, "exclusiveBlip", true)
    	IsCreate = true
		addEventHandler("onMarkerHit",PlayerMarker,InMarkerFind)
	else
		if isElement(taraf2) then
			destroyElement(taraf2)
		end
		if isElement(PlayerMarker) then
			destroyElement(PlayerMarker)
		end
		if isElement(blipemile) then
			destroyElement(blipemile)
		end
		IsCreate = false
		createmile()
	end
end
addCommandHandler("createmile",createmile)
addCommandHandler("findmile",function(thePlayer)
	if getElementData(thePlayer,"loggedIn") == true then
		if IsCreate == true then
		--ehicle1x, vehicle1y, vehicle1z = getElementPosition(thePlayer)
			
    
    
			triggerClientEvent("On",thePlayer,thePlayer,taraf2)
		else 
			outputChatBox("#ff0000Dar Hal Hazer Mile'e Create Nashode Ast!",thePlayer,255,255,255,true)
		end
	end
end)



TakeMile = false

function InMarkerFind(thePlayer)
	if (thePlayer and getElementType(thePlayer)) == "player" then
		if PlayerMarker then
			if IsCreate == true then
				local FreeSlot = GetPlayerFreeSlot(thePlayer,38)
				if FreeSlot >= 1 then
					destroyElement(blipemile)
					GivePlayerItem(thePlayer,9,1,FreeSlot)
					sendPlayerMessage("#ff0000[Tabrik]#00ff00Shoma Kilid Ra Zamin Bardashtid!",thePlayer)
					outputChatBox("#00FF00Kilid Bardashte Shod!",src,255,255,255,true)
					destroyElement(taraf2)
					destroyElement(PlayerMarker)
					for index,allplayers in ipairs(getElementsByType("player")) do
						if getElementData(allplayers,"loggedIn") == true then
							triggerClientEvent("Off",allplayers)
						end 
					end 
					IsCreate = false
				end
			end
		end
	end
end

addCommandHandler("offall",function()
	for index,allplayers in ipairs(getElementsByType("player")) do
		if getElementData(allplayers,"loggedIn") == true then
			triggerClientEvent("Off",allplayers)
		end 
	end 
end)
--Box System 



--local BoxMarker = createMarker(1361.005,-1017.9980,25.8626,"cylinder",1.3,0,150,170,150)


--[[[function makePed()
	--if accSys:GetPlayerData(thePlayer,"pAdmin") >= 1 then
		local thePed = createPed(1,1360.787109375+2,-1017.9375,26.762645721436, 180)
		setPedAnimation(thePed, "ped", "WOMAN_walknorm")
	--end
end
addCommandHandler("mk", makePed)]]
--[[
function GiveBox (thePlayer)
	if (thePlayer and getElementType(thePlayer)) == "player" then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJayizeBox")) > 1 then
			
			local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
			if FreeSlot >= 1 then
				pjayezash = tonumber(getElementData(accSys:getPlayerAcc(thePlayer),"pJayizeBox"))
				
				GivePlayerItem(thePlayer,23,1,FreeSlot)
				sendPlayerMessage("#ff0000[Tabrik]#00ff00Shoma Yek Box Daryaft Kardid , Mitavanid Az F4 An Ra Use Konid!",thePlayer)
				setElementData(accSys:getPlayerAcc(thePlayer), "pJayizeBox", pjayezash  - 2)
			else 
				notfSys:addNotification(thePlayer,"Shoma Dar Inventory Jaye Khali Nadarid!","error")
			end
		
		else 
			notfSys:addNotification(thePlayer,"Baraye Gereftan Box Be 2 Box Point Niaz Darid [/mypoint]!","error")
		end
		

		
	end
end
addEventHandler("onMarkerHit",BoxMarker, GiveBox)
]]
addCommandHandler("setbox",function(thePlayer)
	if accSys:GetPlayerData(thePlayer,"pAdmin") >= 12 then
		accSys:SetPlayerData(thePlayer,"pBoxPoint",2)
		outputChatBox("Set Shod",thePlayer,255,255,255,true)
	end 
end)



addCommandHandler("boxpoint",function(thePlayer)
	if getElementData(thePlayer, "loggedIn") == true then 
		local BoxPoint = accSys:GetPlayerData(thePlayer,"pBoxPoint")
		outputChatBox("#00ff00Box Point : #ff0000"..BoxPoint.."#ffffff/2",thePlayer,255,255,255,true)
	end
end)


addCommandHandler("giveitem",
function(thePlayer,cmd,target,item,tedad)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 9 then
		if target and tonumber(item) and tonumber(tedad) then
			local taraf = miscSys:findPlayer(target)
			local IDNum = tonumber(item)
			local TedadNum = tonumber(tedad)
			if taraf then
				local FreeSlot = GetPlayerFreeSlot(taraf,IDNum)
				if FreeSlot >= 1 then
					if ItemsTable[IDNum] then
						GivePlayerItem(taraf,IDNum,TedadNum,FreeSlot)
						sendPlayerMessage("#00FF00[Done]:#FFFFFF Shoma Be Player "..getPlayerName(taraf).." Az Iteme "..ItemsTable[IDNum][1].." Meghdare "..TedadNum.." Adad Dadid!",thePlayer)
						
						if thePlayer ~= taraf then
							sendPlayerMessage("#00FF00[ADM-WARN]:#FFFFFF Admin "..getPlayerName(thePlayer).." Be Shoma Az Iteme "..ItemsTable[IDNum][1].." Meghdare "..TedadNum.." Adad Dad!",taraf)
						end
						
						outputServerLog("#GiveItem - "..getPlayerName(thePlayer).." - "..getPlayerName(taraf).." - "..IDNum.." - "..TedadNum.."")
					else
						sendPlayerMessage("#FF0000[Error]:#FFFFFF In Item Vojood Nadarad ("..IDNum..")",thePlayer)
					end
				else
					sendPlayerMessage("#FF0000[Error]:#FFFFFF In Player Free Slot Nadare!",thePlayer)
				end
			else
				sendPlayerMessage("#FF0000[Error]:!",thePlayer)
			end
		else
			sendPlayerMessage("#cdcdcdSyntax: /giveitem <PartOfName/ID> <ItemID> <Amount>",thePlayer)
		end
	end
end)

addCommandHandler("itemall",
function(thePlayer,cmd,item,tedad)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 10 then
		if  tonumber(item) and tonumber(tedad) then
			local IDNum = tonumber(item)
			local TedadNum = tonumber(tedad)
			sendPlayerMessage("#00FF00[Done]:#FFFFFF Shoma Be Tamamiye Player Haye Online Az Iteme "..ItemsTable[IDNum][1].." Meghdare x"..TedadNum.." Dadid!",thePlayer)
			outputServerLog("#itemall - "..getPlayerName(thePlayer).." - AllPlayers - "..IDNum.." - "..TedadNum.."")
			for k, taraf in ipairs (getElementsByType("player")) do	
				if getElementData(taraf, "loggedIn") == true then
					local FreeSlot = GetPlayerFreeSlot(taraf,IDNum)
					if FreeSlot >= 1 then
						if ItemsTable[IDNum] then
							GivePlayerItem(taraf,IDNum,TedadNum,FreeSlot)
							if thePlayer ~= taraf then
								sendPlayerMessage("#00FF00[ADM-WARN]:#FFFFFF Admin "..getPlayerName(thePlayer).." Be Player Haye Online Az Iteme "..ItemsTable[IDNum][1].." Meghdare x"..TedadNum.." Dad!",taraf)
							end
						else
							sendPlayerMessage("#FF0000[Error]:#FFFFFF In Item Vojood Nadarad ("..IDNum..")",thePlayer)
						end
					else
						sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Nadashtid Va Jayeze Ra Daryaft Nakardid!",taraf)
					end
				end
			end

		else
			sendPlayerMessage("#cdcdcdSyntax: /itemall <ItemID> <Amount>",thePlayer)
		end
	end
end)
function InjaMisheDropKard(x,y,z)
	for i=1,#DropObjects do
		local xx,yy,zz = getElementPosition(DropObjects[i])
		if getDistanceBetweenPoints3D(xx,yy,zz,x,y,z) <= 2.5 then
			return false
		end
	end
	return true
end

function DropItem(thePlayer,x,y,z,ItemID)
	local KolID = #DropObjects + 2
	for i=1,KolID do
		if not DropObjects[i] then
			DropObjects[i] = createObject(2912,x,y,z-0.99)
			setElementCollisionsEnabled(DropObjects[i],false)
			DropMark[i] = createMarker(x,y,z,"cylinder",1.00,255,255,255,0)
			MarkID[DropMark[i]] = i
			MarkItem[DropMark[i]] = ItemID
			
			setElementInterior(DropObjects[i],getElementInterior(thePlayer))
			setElementDimension(DropObjects[i],getElementDimension(thePlayer))
			
			setElementInterior(DropMark[i],getElementInterior(thePlayer))
			setElementDimension(DropMark[i],getElementDimension(thePlayer))
			
			return true
		end
	end
end

addEventHandler("onMarkerHit",getRootElement(),function(hitElement,matchingDimension)
	if isElement(hitElement) then
		if getElementType(hitElement) == "player" then
			--if matchingDimension then
				if MarkID[source] then
					local FreeSlot = GetPlayerFreeSlot(hitElement,tonumber(MarkItem[source]))
					if FreeSlot >= 1 then
						--local ItemID,ItemAmount = GetPlayerSlotInfo(hitElement,FreeSlot)
						--if tonumber(ItemID) == 0 then
							--if tonumber(ItemAmount) == 0 then
								local DropID = MarkID[source]
								
								GivePlayerItem(hitElement,MarkItem[source],1,FreeSlot)
								
								MarkID[source] = nil
								MarkItem[source] = nil
								destroyElement(DropObjects[DropID])
								destroyElement(DropMark[DropID])
								DropMark[DropID] = nil
								DropObjects[DropID] = nil
								
								sendPlayerMessage("#00ff00Shoma In Object Ra Az Rooye Zamin Bardashtid!",hitElement)	
							--end
						--end
					end
				end
			--end
		end
	end
end)

function isFreePhoneNumber(Number)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, 500)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			if row["pNumber"] == Number then
				return false
			end
		end
	end
	dbFree(query)
	return true
end

function isAvailableNumber(Number)
	for index,allplayers in ipairs(getElementsByType("player")) do
		if getElementData(allplayers,"loggedIn") == true then
			if tonumber(accSys:GetPlayerData(allplayers,"pNumber")) == tonumber(Number) then
				return true
			end
		end
	end
	return false
end

function getPlayerFromNumber(Number)
	for index,allplayers in ipairs(getElementsByType("player")) do
		if getElementData(allplayers,"loggedIn") == true then
			if tonumber(accSys:GetPlayerData(allplayers,"pNumber")) == tonumber(Number) then
				return allplayers
			end
		end
	end
	return false
end

function strins(string, pos, whattoinsert)
    local t = {}
    local iPosPass = 0
    string:gsub(".", function(c)
        if iPosPass == pos then
            whattoinsert:gsub(".", function(w)
                table.insert(t, w)
            end)
        end
        table.insert(t, c)
        iPosPass = iPosPass+1
    end)
    local stringResult = ""
    for _, v in ipairs(t) do
        stringResult = stringResult .. tostring(v)
    end
    return stringResult
end

function FormatPN(number)
    return strins(tostring(number), 3, "-")
end

function DepartmentMessage(Message)
	for k, Bisim in ipairs (getElementsByType("player")) do
		if getElementData(Bisim , "loggedIn") == true then
			if accSys:GetPlayerData(Bisim,"pFaction") >= 1 and accSys:GetPlayerData(Bisim,"pFaction") <= 4 then
				sendPlayerMessage("#4286f4** [Dispatch]: #97bbf4"..Message.." #4286f4**", Bisim, 54, 181, 75,true)
			end
		end
	end
end


--[[addCommandHandler("number",function(thePlayer,cmd,target)
	if target then
		local taraf = miscSys:findPlayer(thePlayer,target)
		if taraf then
			local tarafNumber = tonumber(accSys:GetPlayerData(taraf,"pNumber"))
			if tarafNumber == 0 then
				sendPlayerMessage("#00ff00"..getPlayerName(taraf).."'s Number: Shomare Nadare",thePlayer)
			else
				sendPlayerMessage("#00ff00"..getPlayerName(taraf).."'s Number: "..FormatPN(tarafNumber).."",thePlayer)
			end
		end
	else
		sendPlayerMessage("#cdcdcdSyntax: /number <PartOfName/ID>",thePlayer)
	end
end,false,false)


addCommandHandler("sdsdsdsds5689898dsdsd",function(thePlayer,cmd)
	local taraf = thePlayer
	if taraf then
		local tarafNumber = tonumber(accSys:GetPlayerData(taraf,"pNumber"))
		if tarafNumber == 0 then
			sendPlayerMessage("#00ff00"..getPlayerName(taraf).."'s Number: Shomare Nadare",thePlayer)
		else
			sendPlayerMessage("#00ff00"..getPlayerName(taraf).."'s Number: "..FormatPN(tarafNumber).."",thePlayer)
		end
	end
end,false,false)

emstimer = {}

addCommandHandler("call",function(thePlayer,cmd,number)
	if tonumber(accSys:GetPlayerData(thePlayer,"pNumber")) >= 1 then
	if tonumber(number) then
		local pnumber = math.floor(tonumber(number))
		if pnumber then
			if pnumber == 110 then
				if canCall[thePlayer] then
					if getElementDimension(thePlayer) == 2 or getElementDimension(thePlayer) == 5 then
						return
					end
					if canCall[thePlayer] and isElement(canCall[thePlayer]) and getElementType(canCall[thePlayer]) == "player" then
						local Tarafe = canCall[thePlayer]
						local KolanWanteds = getPlayerWantedLevel(Tarafe) + 1
						if KolanWanteds <= 6 then
							setPlayerWantedLevel(Tarafe,KolanWanteds)
							accSys:SetPlayerData(Tarafe,"pWanted",KolanWanteds)
							sendPlayerMessage("#ff0000"..getPlayerName(thePlayer).." Az Shoma Shekayat Kard!",Tarafe,255,255,255,true)
							sendPlayerMessage("#ff0000Az "..getPlayerName(Tarafe).." Shekayat Kardid!",thePlayer,255,255,255,true)
							
							DepartmentMessage("Player "..getPlayerName(Tarafe).." Tedade 1 Wanted Daryaft Kard (Call 110)")
							if mytimer[thePlayer] then
								if isTimer(mytimer[thePlayer]) then
									killTimer(mytimer[thePlayer])
								end
								mytimer[thePlayer] = nil
							end
							
							if canCall[thePlayer] then
								canCall[thePlayer] = nil
							end
						else
							sendPlayerMessage("#ff0000In Player Wanted'esh 6 Hast!",thePlayer,255,255,255,true)
						end
					end
					
				else
					sendPlayerMessage("#ff0000[Error]:#FFFFFF Shoma Nemitavanid Az Kasi Shekayat Konid!",thePlayer,255,255,255,true)
				end
			
			else
				if getElementData(thePlayer,"mobileStatus") == true then
					if not getElementData(thePlayer,"inCall") and not getElementData(thePlayer,"pendingCall") then
						if isAvailableNumber(pnumber) then
							local taraf = getPlayerFromNumber(pnumber)
							if thePlayer ~= taraf then
								if getElementData(taraf,"mobileStatus") == true then
									if not getElementData(taraf,"inCall") and not getElementData(taraf,"pendingCall") then
										--local mysharj = tonumber(accSys:GetPlayerData(thePlayer,"pMoney"))
										if (getPlayerMoney(thePlayer)>= 6) then
											setElementData(thePlayer,"pendingCall",taraf)
											setElementData(taraf,"pendingCall",thePlayer)
											setElementData(thePlayer,"isCaller",true)
											sendPlayerMessage("#00ff00Dar Hale Zang Zadan Be "..getPlayerName(taraf).." , Lotfan Saboor Bashid!",thePlayer)
											sendPlayerMessage("#00ff00[Call]:#FFFFFF "..getPlayerName(thePlayer).." Ba Shoma Tamas Gerete , Baraye Pasokh: #ffffff/p#00ff00 Rad Kardan: #ffffff/h",taraf)
											triggerClientEvent("playRingtone",taraf,taraf,accSys:GetPlayerData(taraf,"pRingtone"))
										else
											sendPlayerMessage("#FF0000[Error] Baraye Inkar Niaz Be 6$ Darid!",thePlayer)
										end
									else
										sendPlayerMessage("#FF0000[Error] Moshtarake Morede Nazar Mashghool Mibashad!",thePlayer)
									end
								else
									sendPlayerMessage("#FF0000[Error] Dastgahe Moshtarake Morede Nazar Khamoosh Mibashad!",thePlayer)
								end
							else
								sendPlayerMessage("#FF0000[Error] Be Khodet Nemitooni call Bedi!",thePlayer)
							end
						else
							sendPlayerMessage("#FF0000[Error] Moshtarake Morede Nazar Dar Dastres Nemibashad!",thePlayer)
						end
					else
						sendPlayerMessage("#FF0000[Error] Shoma Alan Dar Tamas Hastid!",thePlayer)
					end
				else
					sendPlayerMessage("#FF0000[Error] Mobilet Khamooshe: [/turn on]",thePlayer)
				end
			end
		else
			sendPlayerMessage("#cdcdcdSyntax: /call <Phone-Number>",thePlayer)
		end
	else
		sendPlayerMessage("#cdcdcdSyntax: /call <Phone-Number>",thePlayer)
	end
	else
		sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Simcart nadari!",thePlayer)
	end
end,false,false)

kolankamshod = {}
sharjex = 3

function phoneCreditHandler()
	for i,v in ipairs(getElementsByType("player")) do
		if getElementData(v,"isCaller") then
			if getElementData(v,"inCall") then
				local hisSharj = tonumber(accSys:GetPlayerData(v,"pMoney"))
				local nextsharj = hisSharj - sharjex
				accSys:SetPlayerData(v,"pMoney",tonumber(nextsharj))
				if not kolankamshod[v] then
					kolankamshod[v] = sharjex
				else
					kolankamshod[v] = tonumber(kolankamshod[v]) + sharjex
				end
				
				if tonumber(accSys:GetPlayerData(v,"pMoney")) <= 1 then
					--accSys:SetPlayerData(v,"pMoney",tonumber(0))
					local taraf = getElementData(v,"inCall")
					setElementData(v,"inCall",nil)
					setElementData(taraf,"inCall",nil)
					
					setElementData(v,"isCaller",nil)
					setElementData(taraf,"isCaller",nil)
					
					setElementData(v,"pendingCall",nil)
					setElementData(taraf,"pendingCall",nil)
					sendPlayerMessage("#fc3600Tamas Ghat Shod!",v)
					sendPlayerMessage("#fc3600- $"..kolankamshod[v].."",v)
					takePlayerMoney(v,kolankamshod[v])
					sendPlayerMessage("#fc3600Tamas Ghat Shod!",taraf)
					triggerClientEvent("stopRingtone",v,v)
					triggerClientEvent("stopRingtone",taraf,taraf)
				end
			end
		end
	end
end

setTimer(phoneCreditHandler,5000,0)




function phoneDebugHandler()
	for i,v in ipairs(getElementsByType("player")) do
		if not getElementData(v,"inCall") then
			if not getElementData(v,"pendingCall") then
				setElementData(v,"isCaller",nil)
				if kolankamshod[v] then
					kolankamshod[v] = nil
				end
			end
		end
	end
end

setTimer(phoneDebugHandler,5000,0)

addCommandHandler("p",function(thePlayer,cmd)
	if not getElementData(thePlayer,"inCall") then
		if getElementData(thePlayer,"pendingCall") then
			if ( getElementData(thePlayer,"isCaller") ~= true ) then
				local taraf = getElementData(thePlayer,"pendingCall")
				setElementData(thePlayer,"inCall",taraf)
				setElementData(taraf,"inCall",thePlayer)
				
				setElementData(thePlayer,"pendingCall",nil)
				setElementData(taraf,"pendingCall",nil)
				sendPlayerMessage("#00ff00Javab Dadi...!",thePlayer)
				sendPlayerMessage("#00ff00Javab Dad...!",taraf)
				triggerClientEvent("stopRingtone",thePlayer,thePlayer)
				triggerClientEvent("stopRingtone",taraf,taraf)
				
				kolankamshod[taraf] = 2
				accSys:SetPlayerData(taraf,"pMoney",tonumber(accSys:GetPlayerData(taraf,"pMoney")) - 2)
			else
				sendPlayerMessage("#FF0000 Error ",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000 Dar Hale Hazer Kasi Ba Shoma Tamas Nagerefte Ast!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000 Dar Hale Hazer Shoma Dar Tamas Hastid!",thePlayer)
	end
end,false,false)

addCommandHandler("h",function(thePlayer,cmd)
	if getElementData(thePlayer,"inCall") then
		local taraf = getElementData(thePlayer,"inCall")
		setElementData(thePlayer,"inCall",nil)
		setElementData(taraf,"inCall",nil)
	
		
		setElementData(thePlayer,"pendingCall",nil)
		setElementData(taraf,"pendingCall",nil)
		sendPlayerMessage("#fc3600Ghat Kardi!",thePlayer)
		sendPlayerMessage("#fc3600Tamas Ghat Shod!",taraf)
		
		if getElementData(thePlayer,"isCaller") then
			sendPlayerMessage("#fc3600- $"..kolankamshod[thePlayer].."",thePlayer)
		else
			sendPlayerMessage("#fc3600- $"..kolankamshod[taraf].."",taraf)
		end
		
		triggerClientEvent("stopRingtone",thePlayer,thePlayer)
		triggerClientEvent("stopRingtone",taraf,taraf)
		
		setElementData(thePlayer,"isCaller",nil)
		setElementData(taraf,"isCaller",nil)
		
	elseif getElementData(thePlayer,"pendingCall") then
		local taraf = getElementData(thePlayer,"pendingCall")
		setElementData(thePlayer,"inCall",nil)
		setElementData(taraf,"inCall",nil)
		
		setElementData(thePlayer,"isCaller",nil)
		setElementData(taraf,"isCaller",nil)
		
		setElementData(thePlayer,"pendingCall",nil)
		setElementData(taraf,"pendingCall",nil)
		sendPlayerMessage("#fc3600Tamas Reject Shod!",thePlayer)
		sendPlayerMessage("#fc3600Taraf Tamas Ro Reject Kard!",taraf)
		triggerClientEvent("stopRingtone",thePlayer,thePlayer)
		triggerClientEvent("stopRingtone",taraf,taraf)
	else
		sendPlayerMessage("#FF0000Shoma Dar Tamas Nisti!",thePlayer)
	end
end,false,false)




addEventHandler("onPlayerQuit",getRootElement(),function(quitType)
	if getElementData(source,"pendingCall") then
		local taraf = getElementData(source,"pendingCall")
		setElementData(source,"inCall",nil)
		setElementData(taraf,"inCall",nil)
		setElementData(source,"pendingCall",nil)
		setElementData(taraf,"pendingCall",nil)
		sendPlayerMessage("#fc3600Tamas Ghat Shod!",taraf)
		triggerClientEvent("stopRingtone",source,source)
		triggerClientEvent("stopRingtone",taraf,taraf)
	end
	
	if getElementData(source,"inCall") then
		local taraf = getElementData(source,"inCall")
		setElementData(source,"inCall",nil)
		setElementData(taraf,"inCall",nil)
		setElementData(source,"pendingCall",nil)
		setElementData(taraf,"pendingCall",nil)
		sendPlayerMessage("#fc3600Tamas Ghat Shod!",taraf)
		triggerClientEvent("stopRingtone",source,source)
		triggerClientEvent("stopRingtone",taraf,taraf)
	end
end)



function ersalSohbatHa( message, messageType )
	if messageType == 0 then
		if getElementData(source,"inCall") then
			local taraf = getElementData(source, "inCall")
			if taraf then
				if getElementData(taraf, "inCall") == source then
					outputChatBox(getPlayerName(source).."#FFFFFF (on-Phone): #FFFFFF".. message, taraf, 0, 255, 0, true)
				end
		end
		end
	end
end
addEventHandler( "onPlayerChat", getRootElement(), ersalSohbatHa )


addCommandHandler("sms",function(thePlayer,cmd,number,...)
	if tonumber(accSys:GetPlayerData(thePlayer,"pNumber")) >= 1 then
	if tonumber(number) and ...then
		local pnumber = math.floor(tonumber(number))
		local txt = table.concat({...}," ")
		if pnumber and pnumber >= 1 then
			if getElementData(thePlayer,"mobileStatus") == true then
				if isAvailableNumber(pnumber) then
					local taraf = getPlayerFromNumber(pnumber)
					if thePlayer ~= taraf then
						if getElementData(taraf,"mobileStatus") == true then
							local hazine = #txt * 0.4
							local totalhazine = tonumber(math.floor(hazine))
							if (getPlayerMoney(thePlayer)>= 3) then
								--accSys:SetPlayerData(thePlayer,"pMoney", tonumber(accSys:GetPlayerData(thePlayer,"pMoney")) - tonumber(totalhazine))
								sendPlayerMessage("#FFF000**[SMS] Be "..getPlayerName(taraf).."("..FormatPN(pnumber).."): #FFFFFF"..txt.."#FFF000**",thePlayer)
								sendPlayerMessage("#FF0000- $3",thePlayer)
								takePlayerMoney(thePlayer, 3)
								sendPlayerMessage("#FFF000**[SMS] Az "..getPlayerName(thePlayer).."("..FormatPN(tonumber(accSys:GetPlayerData(thePlayer,"pNumber"))).."): #FFFFFF"..txt.."#FFF000**",taraf)
								
								--SendDiscordMessage("[SMS] From ["..getPlayerName(thePlayer).."] To ["..getPlayerName(taraf).."] Text: "..txt.."","sms",0)
								exports["[NV]Log"]:newLog("SMS Az "..getPlayerName(thePlayer).." Be "..getPlayerName(taraf)..": "..txt.." (Hazine: "..hazine..")","sms")
							
								--for index,admins in ipairs(getElementsByType("player")) do
									if getElementData(admins,"loggedIn") and getElementData(admins,"loggedIn") == true then
										if tonumber(accSys:GetPlayerData(admins,"pAdmin")) >= 1 then
											if getElementData(thePlayer,"inFZP") == true then
												sendPlayerMessage("#347dc6[SMS-WARN]:#34a5c6"..getPlayerName(thePlayer).."#ffffff To#34a5c6 "..getPlayerName(taraf)..": #34a5c6"..txt.."",thePlayer)
											end
										end
									end
								--end
							else
								sendPlayerMessage("#FF0000[Error]#ff0000 Baraye Sms Be 3$ Niaz Darid!",thePlayer)
							end
						else
							sendPlayerMessage("#FF0000[Error]#ff0000 Dastgahe Moshtarake Morede Nazar Khamoosh Mibashad!",thePlayer)
						end
					else
						sendPlayerMessage("#FF0000[Error]#ff0000 Be Khodet Ke Nemitooni Sms Bedi!",thePlayer)
					end
				else
					sendPlayerMessage("#FF0000[Error]#ff0000 Moshtarake Morede Nazar Dar Dastres Nemibashad!",thePlayer)
				end
			else
				sendPlayerMessage("#FF0000[Error]#ff0000 Mobile Shoma Khamoshe [/turn on]",thePlayer)
			end
		else
			sendPlayerMessage("#cdcdcdSyntax: /sms <Phone-Number> <Text>",thePlayer)
		end
	else
		sendPlayerMessage("#cdcdcdSyntax: /sms <Phone-Number> <Text>",thePlayer)
	end
	else
		sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Simcart Nadari!",thePlayer)
	end
end,false,false)


canCall = {}
mytimer = {}

addEventHandler("onPlayerWasted",getRootElement(),function(Ammo,Attacker,Weapon,Bodypart)
	if Attacker and isElement(Attacker) then
		if getElementDimension(source) == 65000 then
			return
		end
		
		if getElementDimension(Attacker) == 65000 then
			return
		end
		
		if getElementData(source,"eventMember") then
			if not getElementData(source,"organizer") then
				setElementData(source,"eventMember",nil)
				toggleAllControls(source,true)
				takeAllWeapons(source)
			end
			return
		end
		
		if getElementData(Attacker,"eventMember") then
			if not getElementData(source,"organizer") then
				setElementData(source,"eventMember",nil)
				toggleAllControls(source,true)
				takeAllWeapons(source)
			end
			return
		end
		
		if getElementType(Attacker) == "player" then
			if Attacker ~= source then
				if tonumber(accSys:GetPlayerData(source,"pJail")) >= 1 then
					return
				end
				if tonumber(accSys:GetPlayerData(Attacker,"pJail")) >= 1 then
					return
				end
				if accSys:GetPlayerData(Attacker,"pFaction") >= 11 and accSys:GetPlayerData(Attacker,"pFaction") <= 15 then
					if accSys:GetPlayerData(source,"pFaction") >= 11 and accSys:GetPlayerData(source,"pFaction") <= 15 then
						return false
					end
				end
				if accSys:GetPlayerData(Attacker,"pFaction") == 0 or accSys:GetPlayerData(Attacker,"pFaction") >= 4 then
					if accSys:GetPlayerData(source,"pFaction") == 0 or accSys:GetPlayerData(source,"pFaction") >= 4 then
						sendPlayerMessage("#ff0000[Call110]:#FC0000 Shoma Tavasote #ff0000"..getPlayerName(Attacker).."#FC0000 Koshte Shodid, Agar Shekayat Darid Az [/call 110] Estefade Konid!",source,255,255,255,true)
						canCall[source] = Attacker
						StartCallTimer(source)
					end
				end
			end
		elseif getElementType(Attacker) == "vehicle" then
			if isElement(getVehicleOccupant(Attacker),0) and getElementType(getVehicleOccupant(Attacker,0)) == "player" then
				local Killer = getVehicleOccupant(Attacker,0)
				if accSys:GetPlayerData(Killer,"pFaction") == 0 or accSys:GetPlayerData(Killer,"pFaction") >= 4 then
					if accSys:GetPlayerData(source,"pFaction") == 0 or accSys:GetPlayerData(source,"pFaction") >= 4 then
						sendPlayerMessage("#ff0000[Call110]:#FC0000 Shoma Tavasote #ff0000"..getPlayerName(Killer).."#FC0000 Koshte Shodid, Agar Shekayat Darid Az [/call 110] Estefade Konid!",source,255,255,255,true)
						canCall[source] = Killer
						StartCallTimer(source)
					end
				end
			end
		end
	end
end)

wantJack = {}

addEventHandler("onVehicleStartEnter",getRootElement(),function(thePlayer,seat,jacked)
	if jacked then
		if isElement(getVehicleOccupant(source),0) and getElementType(getVehicleOccupant(source,0)) == "player" then
			local Ranande = getVehicleOccupant(source,0)
			wantJack[thePlayer] = getPlayerName(Ranande)
		end
	end
end)

addEventHandler("onVehicleEnter",getRootElement(),function(thePlayer,Seat,Jacked)
	if Jacked then
		if wantJack[thePlayer] then
			local Ranande = getPlayerFromName(wantJack[thePlayer])
			if accSys:GetPlayerData(Ranande,"pFaction") == 0 or accSys:GetPlayerData(Ranande,"pFaction") >= 4 then
				sendPlayerMessage("#ff0000[Wasted]:#FC0000 Player #ff0000"..getPlayerName(thePlayer).."#FC0000 Khodro Shoma Ra Dozdid , Baraye Shekayat: /call 110",Ranande,255,255,255,true)
				canCall[Ranande] = thePlayer
				StartCallTimer(Ranande)
				wantJack[thePlayer] = nil
			end
		end
	end	
end)

function StartCallTimer(thePlayer)
	if mytimer[thePlayer] then
		if isTimer(mytimer[thePlayer]) then
			killTimer(mytimer[thePlayer])
		end
		mytimer[thePlayer] = nil
	end
	
	mytimer[thePlayer] = setTimer(function(thePlayer)
		if mytimer[thePlayer] then
			mytimer[thePlayer] = nil
		end
		
		if canCall[thePlayer] then
			canCall[thePlayer] = nil
		end
	end,60000,1,thePlayer)
end

addCommandHandler("turn",function(thePlayer,cmd,whatToDo)
	local myNumber = tonumber(accSys:GetPlayerData(thePlayer,"pNumber"))
	if myNumber >= 1 then
		local finalwhat = string.lower(tostring(whatToDo))
		if finalwhat == "on" then
			if getElementData(thePlayer,"mobileStatus") == true then
				sendPlayerMessage("#FF0000[Error]:#FFFFFF Dar Hale Hazer Mobile Shoma Roshane!",thePlayer)
			else
				setElementData(thePlayer,"mobileStatus",true)
				local posX, posY, posZ = getElementPosition( thePlayer )
				local myInt = getElementInterior(thePlayer)
				local myDim = getElementDimension(thePlayer)
				local chatSphere = createColSphere( posX, posY, posZ, 15 )
				local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
				destroyElement( chatSphere )
				for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					if myInt == getElementInterior(nearbyPlayer) and myDim == getElementDimension(nearbyPlayer) then
						sendPlayerMessage("#00ff00"..getPlayerName(thePlayer).." #ffffffMobile Khod Ra #00FF00Roshan#ffffff Kard!",nearbyPlayer)
					end
				end
			end
		elseif finalwhat == "off" then
			if getElementData(thePlayer,"mobileStatus") == true then
				setElementData(thePlayer,"mobileStatus",nil)
				local posX, posY, posZ = getElementPosition( thePlayer )
				local myInt = getElementInterior(thePlayer)
				local myDim = getElementDimension(thePlayer)
				local chatSphere = createColSphere( posX, posY, posZ, 15 )
				local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
				destroyElement( chatSphere )
				for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					if myInt == getElementInterior(nearbyPlayer) and myDim == getElementDimension(nearbyPlayer) then
						sendPlayerMessage("#00ff00"..getPlayerName(thePlayer).." #ffffffMobile Khod Ra #ff0000Khamosh#ffffff Kard!",nearbyPlayer)
					end
				end
			else
				sendPlayerMessage("#FF0000[Error]:#FFFFFF Dar Hale Hazer Mobile Shoma Khamoshe!",thePlayer)
			end
		else
			sendPlayerMessage("#cdcdcdSyntax: /"..cmd.." <on-off>",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Shomare Telephone Nadarid!",thePlayer)
	end
end,false,false)
]]

fishingAreas = {
	[1] = {852.1035,-2064.3974,11.5671},
	[2] = {852.1035,-2061.7474,11.5671},
	[3] = {820.32617,-2061.7474,11.5671},
	[4] = {820.325,-2064.3974,11.5671},
	--2,2526
	[5] = {852.1035,-2053.6328,11.5671},
	[6] = {852.1035,-2051.3802,11.5671},
	[7] = {820.32617,-2053.6328,11.5671},
	[8] = {820.325,-2051.3802,11.5671},
	

}

fishingArea = {}
isFishingArea = {}
canFishing = {}

areaData = {}

function setupFishingAreas()
	for i=1,#fishingAreas do
		--fishingArea[i] = createColRectangle(fishingAreas[i][1],fishingAreas[i][2],fishingAreas[i][3],fishingAreas[i][4])
		fishingArea[i] = createMarker(fishingAreas[i][1], fishingAreas[i][2], fishingAreas[i][3],"cylinder", 1.5, 0, 255, 0, 100)
		--createRadarArea(fishingAreas[i][1],fishingAreas[i][2],fishingAreas[i][3],fishingAreas[i][4],255,0,0,255)
		areaData[fishingArea[i]] = {}
		areaData[fishingArea[i]]["ID"] = tonumber(i)
		
		isFishingArea[fishingArea[i]] = true
	end
end

addEventHandler("onMarkerHit", getRootElement(),function(thePlayer)
	if isFishingArea[source] then
		sendPlayerMessage("#cdcdcd[GPS]:#FFFFFF GPS Neshon Mide Ke In Mantaghe Mahi Dare [/fish] ...",thePlayer)
		canFishing[thePlayer] = source
	end
end)

addEventHandler ( "onMarkerLeave", getRootElement(),function(thePlayer)
	if isFishingArea[source] then
		if canFishing[thePlayer] then
			canFishing[thePlayer] = nil
		end
	end
end)


function setPedFishAnim (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "fish1" or animation == "fish2" or animation == "fish3" or animation == "fish4" or animation == "fish5" 
		or animation == "fish6" or animation == "fish7" or animation == "fish8" or animation == "fish9" or animation == "fish10"
		or animation == "fish11" or animation == "fish12" or animation == "fish13" then
			for i = 1,3 do
				triggerClientEvent ( root, "setPedFishAnim", root, ped,animation,tiempo,repetir,mover,interrumpible )
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end

fishing = {}
fishingSpam = {}
fishingTimer = {}

function getRandomKey()
	randomKeys = {"K","J","K","O","N","B","H","G","R","U"}
	return randomKeys[math.random(1,#randomKeys)]
end
function table.random ( theTable )
    return theTable[math.random ( #theTable )]
end

randomDif = {1.5,2,2.5,3,5,6}
--4 = Ghermez , 6 = Kapoor ,8 

addCommandHandler("fish",function(thePlayer,cmd)
	if getElementInterior(thePlayer) == 0 then
	if canFishing[thePlayer] then
		if not isPedInVehicle(thePlayer) then
			if not fishing[thePlayer] then
				if not fishingSpam[thePlayer] then
					--if not isElementInWater(thePlayer) then
						
						--triggerClientEvent ( root, "setPedFishAnim", root, ped,animation,tiempo,repetir,mover,interrumpible )
						local Rod = createObject(2703, 0,0,0)
						exports["bone_attach"]:attachElementToBone(Rod,thePlayer,12,0,0,0,0,270,0)
						--triggerClientEvent("takeoffFishingRod", getRootElement(),thePlayer)
						
						fishing[thePlayer] = {Rod,tonumber(areaData[canFishing[thePlayer]]["ID"])}
						toggleAllControls ( thePlayer, false, true, false )   
						setPedFishAnim(thePlayer,"fish3",1,false,false,false,true)
						fishingTimer[thePlayer] = setTimer(function(thePlayer)
							if thePlayer then
								triggerClientEvent("Fish:getFish", resourceRoot, thePlayer)
								--setPlayerFishingAnimation(thePlayer,"fish5",-1,true,false,false,false)
								--[[local areaid = Fishes1[thePlayer][3]
								local shansFish = math.random(1,#Fishes1[areaid])]]
								--notfSys:addNotification(thePlayer,"Yechizi Be Gholabe Mahigiri Gir Karde!","info")
								local DifIDs = table.random(randomDif)
								setPedFishAnim(thePlayer,"fish5",-1,true,false,false,false)
								triggerClientEvent("Fish:StartRender",thePlayer,thePlayer,getRandomKey(),DifIDs)
								
							end
						end,math.random(15000,30000),1,thePlayer)
					--[[else
						sendPlayerMessage("#fc3600[Error]:#FFFFFF Shoma Dakhele Ab Hastid!",thePlayer) 
					end]]
				else
					sendPlayerMessage("#ff0000[FisherMan]:#FFFFFF Shoma Be Tazegi Mahi Gereftid , Saboor Bashid!",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000[FisherMan]:#FFFFFF Shoma Ham Aknoon Dar Hal Mahi Giri Mibashid!",thePlayer)
			end
		else
			sendPlayerMessage("#ff0000[FisherMan]:#FFFFFF Lotfan Az Vasile Naghlie Piade Shavid!",thePlayer)
		end
	else
		sendPlayerMessage("#ff0000[FisherMan]:#FFFFFF Inja Nemishe Mahi Gereft!",thePlayer)
	end
	end
end,false,false)

addEvent("onFishingLoose",true)
addEventHandler("onFishingLoose",getRootElement(),function(thePlayer)
	triggerClientEvent("Fish:StopRender",thePlayer,thePlayer)
	sendPlayerMessage("#ff0000[FisherMan]:#FFFFFF Motasefane Mahi Shoma Farar Kard!", thePlayer, 255, 255, 255, true)
	destroyElement (fishing[thePlayer][1])
	toggleAllControls ( thePlayer, true )   
	setPedAnimation(thePlayer)
	triggerClientEvent("Fish:deleteSound", resourceRoot, thePlayer)
	fishing[thePlayer] = nil
	toggleAllControls ( player, true )
	fishingSpam[thePlayer] = setTimer(function(thePlayer)
		fishingSpam[thePlayer] = nil
	end,3500,1,thePlayer)
	
end)

addEvent("onFishingWin",true)
addEventHandler("onFishingWin",getRootElement(),function(thePlayer,myFish)
	triggerClientEvent("Fish:StopRender",thePlayer,thePlayer)
	destroyElement (fishing[thePlayer][1])
	toggleAllControls ( thePlayer, true )   
	setPedAnimation(thePlayer)
	triggerClientEvent("Fish:deleteSound", resourceRoot, thePlayer)
	fishing[thePlayer] = nil
	toggleAllControls ( player, true )
	fishingSpam[thePlayer] = setTimer(function(thePlayer)
		fishingSpam[thePlayer] = nil
	end,3500,1,thePlayer)
	
	local FreeSlot = GetPlayerFreeSlot(thePlayer,tonumber(myFish))
	local itemslot,meghdar = GetPlayerItemSlot(thePlayer,tonumber(myFish))
	if FreeSlot >= 1 then
		GivePlayerItem(thePlayer,tonumber(myFish),1,FreeSlot)
		sendPlayerMessage("#00FF00[FisherMan]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Gereftid!", thePlayer, 255, 255, 255, true)
		
		outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
	else
		sendPlayerMessage("#FF0000[FisherMan]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
	end
end)
--[[function cancelFishingTables()
	if fishing[source] then
		sendPlayerMessage("#ff0000[FisherMan]:#FFFFFF Motasefane Mahi Shoma Farar Kard!", source, 255, 255, 255, true)
		destroyElement (fishing[source][1])
		setPedAnimation(source)
		toggleAllControls ( source, true )   
		triggerClientEvent("stopFishingSound", resourceRoot, source)
		fishing[source] = nil
		
		fishingSpam[source] = setTimer(function(source)
			fishingSpam[source] = nil
		end,3500,1,source)
	end
end
addEventHandler("onPlayerQuit",getRootElement(),cancelFishingTables)
addEventHandler("onPlayerWasted",getRootElement(),cancelFishingTables)]]


setupFishingAreas()


JetPack={}



--- Function Use All Itemas

addEventHandler("onItemUse",getRootElement(),function(thePlayer,ItemID,slot)
	if elementID[source] == 1 then
		local hp = getElementHealth(thePlayer)
		setElementHealth(thePlayer,hp+10)
		sendPlayerMessage("#00FF00* Shoma 1x Keyk Khordid! +10 HP",thePlayer)
		TakePlayerItem(thePlayer,slot,1)
	end

	if elementID[source] == 3 then
		setElementData(thePlayer,"explosiveBullet",true)
		TakePlayerItem(thePlayer,slot,1)
		sendPlayerMessage("#00FF00* Shoma Az Explosive Bullet Estefade Kardid!",thePlayer)
	end
	if elementID[source] == 5 then
		
		setElementData(thePlayer,"freezeBullet",true)
		TakePlayerItem(thePlayer,slot,1)
		sendPlayerMessage("#00FF00* Shoma Az Freezer Bullet Estefade Kardid!",thePlayer)
	end
	
	if elementID[source] == 6 then
		if isPedInVehicle(thePlayer) then
			setElementData(getPedOccupiedVehicle(thePlayer),"fuel",100)
			sendPlayerMessage("#00FF00* Benzine Khodro Ba Jerrycan Por Shod!",thePlayer)
			TakePlayerItem(thePlayer,slot,1)
		else
			sendPlayerMessage("#ff0000[Error]:#FFFFFF Bayad Dakhele Yek Mashin Bashid!",thePlayer)
		end
	end
	
	if elementID[source] == 7 then
		if not invis[thePlayer] then
			setElementAlpha(thePlayer,0)
			sendPlayerMessage("#00FF00* Shoma Baraye 30 Sanie Invisible Shodid!",thePlayer)
			invis[thePlayer] = setTimer(function(thePlayer)
				invis[thePlayer] = nil
				setElementAlpha(thePlayer,255)
			end,30000,1,thePlayer)
			TakePlayerItem(thePlayer,slot,1)
		end
	end
	if elementID[source] == 11 then
		if not JetPack[thePlayer] then
			givePedJetPack(thePlayer)
			sendPlayerMessage("#00FF00* Shoma Be Modate 30 Sanie JetPack Use Kardid!",thePlayer)
			JetPack[thePlayer] = setTimer(function(thePlayer)
				JetPack[thePlayer] = nil
				sendPlayerMessage("#FF1010* Mohlate JetPack Shoma Be Payan Resid!",thePlayer)
				removePedJetPack( thePlayer )
			end,30000,1,thePlayer)
			TakePlayerItem(thePlayer,slot,1)
		end
	end
	if elementID[source] == 8 then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJailTime")) > 1 then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAJailed")) ~= 4 then
				setElementData(accSys:getPlayerAcc(thePlayer), "pJailTime", tonumber(1))
				sendPlayerMessage("#00FF00* Shoma 1x Nitrogen Roye In Mashin Estefade Kardid! +Nitrogen 10x Power",thePlayer)
				TakePlayerItem(thePlayer,slot,1)
			end
		else
			notfSys:addNotification(thePlayer,"Shoma Dar Zandan Nistid","error")
		end
	end
	if elementID[source] == 10 then
		local hp = getElementHealth(thePlayer)
		setElementHealth(thePlayer,100)
		sendPlayerMessage("#00FF00* Shoma 1x Med Kit Estefade Kardid! +100 HP",thePlayer)
		TakePlayerItem(thePlayer,slot,1)
	end
	if elementID[source] == 12 then
		if isPedInVehicle(thePlayer) then
			addVehicleUpgrade ( getPedOccupiedVehicle(thePlayer), 1009 )
			setElementHealth(thePlayer,100)
			sendPlayerMessage("#00FF00* Shoma 1x Nitrogen Roye In Mashin Estefade Kardid! +Nitrogen 10x Power",thePlayer)
			TakePlayerItem(thePlayer,slot,1)
		else
			sendPlayerMessage("#ff0000[Error]:#FFFFFF Bayad Dakhele Yek Mashin Bashid!",thePlayer)
		end
	end
	if elementID[source] == 27 then
		if getPedGravity(thePlayer) > 0.007 then
			sendPlayerMessage("#00FF00* Shoma 1x Super Jump Estefade Kardid! +Super Jump",thePlayer)
			TakePlayerItem(thePlayer,slot,1)
			setPedGravity(thePlayer,0.001)
			setTimer(function(thePlayer)
				setPedGravity(thePlayer,0.0080000003799796)
			end,30000,1,thePlayer)
		else
			notfSys:addNotification(thePlayer,"Shoma Az Ghabl Yek Bar Item 'Super-Jump' Ra Use Kardid","error")
		end
	end
	if elementID[source] == 16 then
		if isPedInVehicle(thePlayer) then
			local hisVeh = getPedOccupiedVehicle(thePlayer)
			local x,y,z = getElementRotation ( hisVeh )
			fixVehicle(hisVeh)
			setElementRotation(hisVeh,0,0,z,"default",true)
			sendPlayerMessage("#00FF00* Khodro Ba Movafaghiat Fix Shod!",thePlayer)
			TakePlayerItem(thePlayer,slot,1)
		else
			sendPlayerMessage("#ff0000[Error]:#FFFFFF Bayad Dakhele Yek Mashin Bashid!",thePlayer)
		end
	end
	if elementID[source] == 18 then
		local hp = getElementHealth(thePlayer)
		setElementHealth(thePlayer,hp+5)
		sendPlayerMessage("#00FF00* Shoma 1x Ab Estefade Kardid! +5 HP",thePlayer)
		TakePlayerItem(thePlayer,slot,1)
	end
	if elementID[source] == 17 then
		killPed(thePlayer)
		sendPlayerMessage("#00FF00* Shoma Khodkoshi Kardi!",thePlayer)
		TakePlayerItem(thePlayer,slot,1)
	end
	
	if elementID[source] == 22 then
		local randomNumber = math.random(1000000,9999999)
		
		if isFreePhoneNumber(randomNumber) then
			setElementData(accSys:getPlayerAcc(thePlayer), "pPnumber", randomNumber)
			TakePlayerItem(thePlayer,slot,1)
			sendPlayerMessage("#00FF00[Done]:#FFFFFF Shoma Simcard Ro Estefade Kardid!",thePlayer)
			sendPlayerMessage("#00FF00[Done]:#FFFFFF Shomare Telephone Jadide Shoma: "..FormatPN(randomNumber),thePlayer)
		else
			local randomNumber2 = math.random(1000000,9999999)
			if isFreePhoneNumber(randomNumber2) then
				setElementData(accSys:getPlayerAcc(thePlayer), "pPnumber", randomNumber2)
				TakePlayerItem(thePlayer,slot,1)
				sendPlayerMessage("#00FF00[Done]:#FFFFFF Shoma Simcard Ro Estefade Kardid!",thePlayer)
				sendPlayerMessage("#00FF00[Done]:#FFFFFF Shomare Telephone Jadide Shoma: "..FormatPN(randomNumber2),thePlayer)
			else
				local randomNumber3 = math.random(1000000,9999999)
				if isFreePhoneNumber(randomNumber3) then
					setElementData(accSys:getPlayerAcc(thePlayer), "pPnumber", randomNumber3)
					TakePlayerItem(thePlayer,slot,1)
					sendPlayerMessage("#00FF00[Done]:#FFFFFF Shoma Simcard Ro Estefade Kardid!",thePlayer)
					sendPlayerMessage("#00FF00[Done]:#FFFFFF Shomare Telephone Jadide Shoma: "..FormatPN(randomNumber3),thePlayer)
				else
					local randomNumber4 = math.random(1000000,9999999)
					if isFreePhoneNumber(randomNumber4) then
						setElementData(accSys:getPlayerAcc(thePlayer), "pPnumber", randomNumber4)
						TakePlayerItem(thePlayer,slot,1)
						sendPlayerMessage("#00FF00[Done]:#FFFFFF Shoma Simcard Ro Estefade Kardid!",thePlayer)
						sendPlayerMessage("#00FF00[Done]:#FFFFFF Shomare Telephone Jadide Shoma: "..FormatPN(randomNumber4),thePlayer)
					else
						sendPlayerMessage("#ff0000[Error]:#FFFFFF Lotfan Dobare Talash Konid!",thePlayer)
					end
				end
			end
		end
	end
	
	if elementID[source] == 24 then
		
		setElementData(thePlayer,"specialBullet",true)
		TakePlayerItem(thePlayer,slot,1)
		sendPlayerMessage("#00FF00* Shoma Az Special Bullet Estefade Kardid!",thePlayer)
	end
	
	if elementID[source] == 25 then
		TakePlayerItem(thePlayer,slot,1)
		setElementData(thePlayer,"poisonBullet",true)
		
		sendPlayerMessage("#00FF00* Shoma Az Poison Bullet Estefade Kardid!",thePlayer)
	end
	if elementID[source] == 28 then
		TakePlayerItem(thePlayer,slot,1)
		setPedArmor(thePlayer,100)
		sendPlayerMessage("#00FF00* Shoma 1x Shild Estefade Kardid!. +100 Shild",thePlayer)
	end
	if elementID[source] == 21 then
		smokePlayer(thePlayer,slot)
	end



	if elementID[source] == 29 then
		TakePlayerItem(thePlayer,slot,1)
		giveWeapon(thePlayer,42,2000000,true)
	end
	if elementID[source] == 63 then
		if getElementModel(thePlayer) ~= 103 then
			setElementModel( thePlayer, 103 )
			setElementData(accSys:getPlayerAcc(thePlayer), "cSkin", 103)
		else
			notfSys:addNotification(thePlayer,"Shoma Hamaknon Skine 103 Ra Use Darid.","error")
		end
	end
end)

invis = {}
itemTimer = {}

poison = {}

addEvent("syncWeaponItem",true)
addEventHandler("syncWeaponItem",getRootElement(),function(thePlayer,weapon,x,y,z,hit)
	if not itemTimer[hit] then
		if getElementData(thePlayer,"explosiveBullet") == true then
			if x and y and z then
				createExplosion(x,y,z,10,thePlayer)
				setElementData(thePlayer,"explosiveBullet",nil)
			end
		end
		if hit then
			if getElementType(hit) == "player" or getElementType(hit) == "vehicle" then
				if getElementData(thePlayer,"freezeBullet") == true then
					setElementFrozen(hit,true)
					triggerClientEvent("playItemSound",thePlayer,thePlayer,5)
					itemTimer[hit] = setTimer(function(hit)
						setElementFrozen(hit,false)
						itemTimer[hit] = nil
					end,3000,1,hit)

					setElementData(thePlayer,"freezeBullet",nil)
				end
			end
		end
		if getElementType(hit) == "player" then
			if getElementData(thePlayer,"specialBullet") == true then
				setElementHealth(hit,math.random(5,10))
				setElementData(thePlayer,"specialBullet",nil)
			end
		end
		if getElementType(hit) == "player" then
			if getElementData(thePlayer,"poisonBullet") == true then
				if not poison[hit] then
					poison[hit] = setTimer(poisoning,1000,5,hit)
					setElementData(thePlayer,"poisonBullet",nil)
					sendPlayerMessage("#ff0000* Shoma Tire Zahr alood Khordid!",hit)
				end
			end
		end
		
	end
end)

addEventHandler ("onPlayerWeaponFire", root, function (weapon, endX, endY, endZ, hit, startX, startY, startZ)
	local thePlayer = source
	if not itemTimer[hit] then
		if hit then
		if getElementData(thePlayer,"explosiveBullet") == true then
			if endX and endY and endZ then
				createExplosion(endX, endY, endZ,10,thePlayer)
				setElementData(thePlayer,"explosiveBullet",nil)
			end
		end
		if getElementType(hit) == "player" or getElementType(hit) == "vehicle" then
			if getElementData(thePlayer,"freezeBullet") == true then
				setElementFrozen(hit,true)
				triggerClientEvent("playItemSound",thePlayer,thePlayer,5)
				itemTimer[hit] = setTimer(function(hit)
					setElementFrozen(hit,false)
					itemTimer[hit] = nil
				end,3000,1,hit)
				
				setElementData(thePlayer,"freezeBullet",nil)
			end
		end
		if getElementType(hit) == "player" then
			if getElementData(thePlayer,"specialBullet") == true then
				setElementHealth(hit,math.random(5,10))
				setElementData(thePlayer,"specialBullet",nil)
			end
		end
		if getElementType(hit) == "player" then
			if getElementData(thePlayer,"poisonBullet") == true then
				if poison[hit] then
					if isTimer(poison[hit]) then
						killTimer(poison[hit])
					end
					poison[hit] = nil
				end
				poison[hit] = setTimer(poisoning,1000,5,hit)
				setElementData(thePlayer,"poisonBullet",nil)
				sendPlayerMessage("#ff0000* Shoma Tire Zahr alood Khordid!",hit)
			end
		end
		end
	end
end)

function poisoning(thePlayer)
	local hp = getElementHealth(thePlayer)
	setElementHealth(thePlayer,hp-5)
end

smoking = {}
smokesyncer = {}
smokespam = {}
smokenumber = {}
function smokePlayer(thePlayer,slot)
	if not smokespam[thePlayer] then
		smokespam[thePlayer] = setTimer(function(thePlayer)
			smokespam[thePlayer] = nil
		end,2000,1,thePlayer)
		if not smoking[thePlayer] then
			if isPlayerHaveThisItem(thePlayer,20) then
				TakePlayerItem(thePlayer,slot,1)
				smoking[thePlayer] = createObject(1485,0,0,0)
				exports["bone_attach"]:attachElementToBone(smoking[thePlayer],thePlayer,11,0.15,0.1,0.15,0,180,30)

				smokesyncer[thePlayer] = setTimer(function(thePlayer)
					if thePlayer then
						if smoking[thePlayer] then
							setElementInterior( smoking[thePlayer], getElementInterior(thePlayer))
							setElementDimension( smoking[thePlayer], getElementDimension(thePlayer))
						end
					end
				end, 1000, 0,thePlayer)

				smokenumber[thePlayer] = 0
				
				setPedAnimation( thePlayer, "SMOKING", "M_smk_in", -1, false, false )
				
				sendPlayerMessage("#00FF00[Smoke]:#FFFFFF Shoma Cigar ro Dar Avardid va Shoro Be Keshidan Kardid!",thePlayer)
				sendPlayerMessage("#00FF00[Smoke]:#FFFFFF Baraye Keshidan:#00ff00 Dokme 'Z'#FFFFFF Baraye Endakhtane Cigar:#00ff00 Dokme 'D'",thePlayer)
				
				bindKey(thePlayer,"Z","down",smokecigar)
				bindKey(thePlayer,"D","down",takeoffcigar)
				
			else
				sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Lighter Be Hamrah nadarid!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Darhale Cigar Keshidan Hastid!",thePlayer)
		end
	end
end

addEventHandler("onPlayerWasted",getRootElement(),function()
	local thePlayer = source
	
	if smokesyncer[thePlayer] then
		killTimer(smokesyncer[thePlayer])
		smokesyncer[thePlayer] = nil
	end
	
	if smoking[thePlayer] then
		destroyElement(smoking[thePlayer])
	end
	
	setPedAnimation( thePlayer, "SMOKING", "M_smk_out", -1, false, false )
	
	smokespam[thePlayer] = setTimer(function(thePlayer)
		setPedAnimation(thePlayer)
		smokespam[thePlayer] = nil
	end,3000,1,thePlayer)
	
	unbindKey(thePlayer,"Z","down",smokecigar)
	unbindKey(thePlayer,"D","down",takeoffcigar)
end)

addEventHandler("onPlayerQuit",getRootElement(),function()
	local thePlayer = source
	
	if smokesyncer[thePlayer] then
		killTimer(smokesyncer[thePlayer])
		smokesyncer[thePlayer] = nil
	end
	
	if smoking[thePlayer] then
		destroyElement(smoking[thePlayer])
	end
	
	unbindKey(thePlayer,"Z","down",smokecigar)
	unbindKey(thePlayer,"D","down",takeoffcigar)
end)

function takeoffcigar(thePlayer)
	if not smokespam[thePlayer] then
		sendPlayerMessage("#FF0000Shoma Cigar ro Endakhtid!",thePlayer)
		
		if smokesyncer[thePlayer] then
			killTimer(smokesyncer[thePlayer])
			smokesyncer[thePlayer] = nil
		end
		
		if smoking[thePlayer] then
			destroyElement(smoking[thePlayer])
		end
		
		setPedAnimation( thePlayer, "SMOKING", "M_smk_out", -1, false, false )
		
		smokespam[thePlayer] = setTimer(function(thePlayer)
			setPedAnimation(thePlayer)
			smokespam[thePlayer] = nil
		end,3000,1,thePlayer)
		
		unbindKey(thePlayer,"Z","down",smokecigar)
		unbindKey(thePlayer,"D","down",takeoffcigar)
	end
end

function smokecigar(thePlayer)
	if not smokespam[thePlayer] then
		smokenumber[thePlayer] = smokenumber[thePlayer] + 1
		
		setPedAnimation( thePlayer, "SMOKING", "M_smkstnd_loop", -1, false, false )
	
		
		if smokenumber[thePlayer] >= 5 then
			sendPlayerMessage("#FF0000Cigaret Tamoom Shod",thePlayer)
			
			if smokesyncer[thePlayer] then
				killTimer(smokesyncer[thePlayer])
				smokesyncer[thePlayer] = nil
			end
			
			if smoking[thePlayer] then
				destroyElement(smoking[thePlayer])
			end
			
			setPedAnimation( thePlayer, "SMOKING", "M_smk_out", -1, false, false )
			
			smokespam[thePlayer] = setTimer(function(thePlayer)
				setPedAnimation(thePlayer)
				smokespam[thePlayer] = nil
			end,3000,1,thePlayer)
			
			unbindKey(thePlayer,"Z","down",smokecigar)
			unbindKey(thePlayer,"D","down",takeoffcigar)
		else
			smokespam[thePlayer] = setTimer(function(thePlayer)
				smokespam[thePlayer] = nil
			end,3000,1,thePlayer)
		end
	end
end

local mokhaberatmark = createMarker(754.90643310547,-74.266799926758,1007.6312255859,'cylinder',5,255,255,255,0)

setElementInterior(mokhaberatmark,3)

addEventHandler("onMarkerHit",mokhaberatmark,function(thePlayer,matchingDimension)
	if matchingDimension then
		if getElementType(thePlayer) == "player" then
			triggerClientEvent("toggleMokhaberatPage",thePlayer,thePlayer,true,tonumber(accSys:GetPlayerData(thePlayer,"pMoney")))
		end
	end
end)

addEvent("requestbuysharj",true)
addEventHandler("requestbuysharj",getRootElement(),function(thePlayer,sharj)
	local nsharj = tonumber(sharj)
	local qeymat = tonumber(sharj) + 1000
	
	if getPlayerMoney(thePlayer) >= qeymat then
		local mysharj = tonumber(accSys:GetPlayerData(thePlayer,"pMoney"))
		
		accSys:SetPlayerData(thePlayer,"pMoney",mysharj + nsharj)
		takePlayerMoney(thePlayer,qeymat)
		
		sendPlayerMessage("#00FF00[Done]:#FFFFFF Shoma Ba Movafaghiat Simcarte Khod ra #00FF00$"..nsharj.."#FFFFFF Sharj Kardid!",thePlayer)
		triggerClientEvent("toggleMokhaberatPage",thePlayer,thePlayer,true,tonumber(accSys:GetPlayerData(thePlayer,"pMoney")))
	else
		notfSys:addNotification(thePlayer,"Baraye Kharide In Sharj Be $"..qeymat.." Niaz Darid!","error")
	end
end)


function isFreeCreditCode(code)
	local creditQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM codes;" )
	local result, numrows = dbPoll(creditQuery, 500)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			if tonumber(row["cCode"]) == tonumber(code) then
				dbFree(creditQuery)
				return false
			end
		end
	end
	dbFree(creditQuery)
	return true
end

function convertCode( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1-%2' )    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

addEvent("requestsharjcode",true)
addEventHandler("requestsharjcode",getRootElement(),function(thePlayer,sharj)
	local nsharj = tonumber(sharj)
	local qeymat = tonumber(sharj) + 1000
	
	if getPlayerMoney(thePlayer) >= qeymat then
		local randomsharj = math.random(100000000,999999999)
		if isFreeCreditCode(randomsharj) then
			takePlayerMoney(thePlayer,qeymat)
			
			local creditCreationQuery = dbQuery(exports.mysql:getMySQLC(), "INSERT INTO `codes` SET `cCode` = ?, `cValue` = ?, `cUsed` = ? ",randomsharj,nsharj,0)
			dbFree(creditCreationQuery)
			
			sendPlayerMessage("#00FF00[Done]:#FFFFFF Sharj Kharidari Shod!",thePlayer)
			sendPlayerMessage("#00FF00[Done]:#FFFFFF Code: #00FF00"..convertCode(randomsharj).."",thePlayer)
			
			triggerClientEvent("toggleMokhaberatPage",thePlayer,thePlayer,true,tonumber(accSys:GetPlayerData(thePlayer,"pMoney")))
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Kharid Anjam Nashod , Lotfan Dobare Talash Konid!",thePlayer)
		end
	else
		notfSys:addNotification(thePlayer,"Baraye Kharide In Sharj Be $"..qeymat.." Niaz Darid!","error")
	end
end)

addCommandHandler("sharj",function(thePlayer,cmd)
	triggerClientEvent("togglesharjpanel",thePlayer,thePlayer,true)
end)

spamtimer2 = {}

addEvent("requestusesharj",true)
addEventHandler("requestusesharj",getRootElement(),function(thePlayer,code1)
	if not spamtimer2[thePlayer] then
		spamtimer2[thePlayer] = setTimer(function(thePlayer)
			spamtimer2[thePlayer] = nil
		end,5000,1,thePlayer)
		local nsharj = tostring(code1)
		local codewithoutlines = string.gsub(nsharj,"-","")
		outputDebugString(nsharj)
		outputDebugString(codewithoutlines)
		
		
		local creditQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM codes;" )
		local result, numrows = dbPoll(creditQuery, 500)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				if tonumber(row["cCode"]) == tonumber(codewithoutlines) then
					if tonumber(row["cUsed"]) == 0 then
						local mysharj = tonumber(accSys:GetPlayerData(thePlayer,"pMoney"))
			
						accSys:SetPlayerData(thePlayer,"pMoney",mysharj + tonumber(row["cValue"]))
						
						local tQ = dbQuery(exports.mysql:getMySQLC(), "UPDATE `codes` SET `cUsed` = '"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")).."' WHERE `cID` = '"..tonumber(row["cID"]).."'")
						dbFree(tQ)
						dbFree(creditQuery)
						
						triggerClientEvent("togglesharjpanel",thePlayer,thePlayer,false)
						
						sendPlayerMessage("#00FF00[Success]:#FFFFFF Meghdare #00FF00$"..row["cValue"].."#FFFFFF Be Mojoodie Simcarte Shoma Afzoode Shod!",thePlayer)
						
						--exports["[NV]Log"]:newLog("Player "..getPlayerName(thePlayer).." Az Code "..convertCode(tonumber(row["cCode"])).." Estefade Kard! (Sharj Az "..mysharj.." To "..tonumber(accSys:GetPlayerData(thePlayer,"pMoney"))..") (Code ID: "..row["cID"]..") (Code Value: "..row["cValue"]..")","credit_codes")
						return true
					else
						exports["notf"]:addNotification(thePlayer,"In Code Az Ghabl Estefade Shode Bood!","error")
						return
					end
				end
			end
		end
		dbFree(creditQuery)
		exports["notf"]:addNotification(thePlayer,"Code Vared Shode Dar Edare Mokhaberat Sabt Nashode!","error")
	end
end)




local accSys = exports["Accounts-system"]
local miscSys = exports["misc"]

local MarkerHit = createMarker(-67.679489135742,-767.53497314453,9.73281288146-1 , "cylinder", 2,255,255,255,0)
local pPickupStartJob = createPickup(-67.679489135742,-767.53497314453,9.73281288146, 3, 1275, 1, 1 )
local Ghavasi = false

addEventHandler("onMarkerHit",MarkerHit,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("ShowGhavasPanel", hitElement, hitElement)
		
	end
end)

function GhavasShoF()
    setElementModel(source, 301)
    --outputChatBox("Ghavas Shodi khkkhkh")
    Ghavasi = true

end

addEvent("GhavasSho",true)
addEventHandler("GhavasSho", root, GhavasShoF)

function GhavasNShoF()
    setElementModel(source, tonumber(getElementData(accSys:getPlayerAcc(source), "cSkin")))
	
    --outputChatBox("Ghavas Nisi Dige khkkhkh")
    Ghavasi = false

end

addEvent("GhavasNSho",true)
addEventHandler("GhavasNSho", root, GhavasNShoF)

Kapsol = 0
addEvent("Money",true)
addEventHandler("Money",root,function()

    if Ghavasi == true then 
        if Kapsol == 0 then
            triggerClientEvent("Capsol",thePlayer,thePlayer)
            exports["notf"]:addNotification(client, "In Account Dar Hale Hazer Online Ast!" , 'error')
            Kapsol = 1
        else 
            exports["notf"]:addNotification(client, "Isssss Ast!" , 'error')
        end 
    end



end)


Shift = false 
Shift2 = false
Shift3 = false 
Shift4 = false 
Shift5 = false 
Shift6 = false 
Shift7 = false 
Shift8 = false 
Shift9 = false 
Shift10 = false 
Shift11 = false 
Shift12 = false 
Shift13 = false 
Shift14 = false 
Shift15 = false 
Shift16 = false 
Shift17 = false 
Shift18 = false 
Shift19 = false 
Shift20 = false 
Shift21 = false 
Shift22 = false 
Shift23 = false 
Shift24 = false 
Shift25 = false 
Shift26 = false 
Shift27 = false 
Shift28 = false 
Shift29 = false 
Shift30 = false 
Shift31 = false 
Shift32 = false 
Shift33 = false 
Shift34 = false 
Shift35 = false 
Shift36 = false 
Shift37 = false 
Shift38 = false 
Shift39 = false 
Shift40 = false 
Shift41 = false 
Shift42 = false 
Shift43 = false 
Shift44 = false 
Shift45 = false 
Shift46 = false 
Shift47 = false 
Shift48 = false 
Shift49 = false 
Shift50 = false 
Shift51 = false 


createBlip(2532.3671875,-2099.6748046875,13.584868431091, 28)
local blipghavasi = createBlip(-67.658004760742 ,-767.47052001953 ,9.7328128814697,59)
setElementData(blipghavasi,'blipName',"Ghavasi")
--local Semsar = createPed(48,1693.73828125 ,-1520.47265625 ,13.546875,270)








local pObject1 = createObject( 1271, -179.533203125 ,-807.7978515625 ,-2.8237457275391 )
local pObject2 = createObject( 1271, -183.7275390625 ,-800.9482421875 ,-2.6481628417969 )
local pObject3 = createObject( 1271, -214.744140625 ,-777.900390625 ,-2.9642696380615 )
local pObject4 = createObject( 1271, -206.537109375 ,-785.140625 ,-2.100399017334 )
local pObject5 = createObject( 1271, -198.041015625 ,-789.7275390625 ,-2.0292358398438 )
local pObject6 = createObject( 1271, -186.8583984375 ,-795.9189453125 ,-3.5907135009766 )
local pObject7 = createObject( 1271, -179.3369140625 ,-790.24609375 ,-9.5204238891602 )
local pObject8 = createObject( 1271, -182.837890625 ,-776.416015625 ,-12.836738586426 )
local pObject9 = createObject( 1271, -189.7490234375 ,-766.876953125 ,-12.786731719971 )
local pObject10 = createObject( 1271, -202.5068359375 ,-750.900390625 ,-12.437637329102 )
local pObject11 = createObject( 1271, -210.4140625 ,-738.513671875 ,-11.194400787354 )
local pObject12 = createObject( 1271, -213.2509765625 ,-719.74609375 ,-13.340503692627 )
local pObject13 = createObject( 1271, -229.232421875 ,-718.5400390625 ,-11.976440429688 )
local pObject14 = createObject( 1271, -253.083984375 ,-721.3681640625 ,-8.6816158294678 )
local pObject15 = createObject( 1271, -271.9716796875 ,-739.0419921875 ,-11.562982559204 )
--Samt KHod Khone Ghavas
local pObject16 = createObject( 1271, -143.615234375 ,-800.111328125 ,-9.5020771026611 )
local pObject17 = createObject( 1271, -135.8740234375 ,-789.83203125 ,-7.5873403549194 )
local pObject18 = createObject( 1271, -135.9599609375 ,-782.8369140625 ,-10.923352241516 )
local pObject19 = createObject( 1271, -132.224609375 ,-774.44140625 ,-11.554767608643 )
local pObject20 = createObject( 1271, -124.9365234375 ,-771.4306640625 ,-5.3756351470947 )
local pObject21 = createObject( 1271, -117.515625 ,-764.060546875 ,-3.339150428772 )
local pObject22 = createObject( 1271, -119.8603515625 ,-748.310546875 ,-7.550329208374 )
local pObject23 = createObject( 1271, -116.81640625 ,-734.3310546875 ,-8.8893985748291 )
local pObject24 = createObject( 1271, -105.6201171875 ,-729.953125 ,-3.9721412658691 )
local pObject25 = createObject( 1271, -106.97265625 ,-718.498046875 ,-7.1271343231201 )
local pObject26 = createObject( 1271, -101.6669921875 ,-714.7138671875 ,-5.2045564651489 )
local pObject27 = createObject( 1271, -69.6162109375 ,-653.359375 ,-4.1404228210449 )
local pObject28 = createObject( 1271, -89.2626953125 ,-679.9873046875 ,-4.6807737350464 )
local pObject29 = createObject( 1271, -81.873046875 ,-660.0517578125 ,-6.9214515686035 )
local pObject30 = createObject( 1271, -90.60546875 ,-666.8642578125 ,-8.9798498153687 )
--Samt Jelo
local pObject31 = createObject( 1271, -101.3876953125 ,-556.54296875 ,-2.5490646362305 )
local pObject32 = createObject( 1271, -95.0341796875 ,-563.5732421875 ,-2.1173248291016 )
local pObject33 = createObject( 1271, -90.2958984375 ,-569.533203125 ,-1.9729804992676 )
local pObject34 = createObject( 1271, -82.58203125 ,-579.1259765625 ,-1.7106151580811 )
local pObject35 = createObject( 1271, -74.1787109375 ,-591.208984375 ,-2.0192451477051 )
local pObject36 = createObject( 1271, -65.8984375 ,-592.4931640625 ,-1.9702568054199 )
local pObject37 = createObject( 1271, -49.5126953125 ,-586.591796875 ,-3.3350009918213 )
local pObject38 = createObject( 1271, -42.0029296875 ,-580.142578125 ,-2.4932823181152 )
local pObject39 = createObject( 1271, -33.0087890625 ,-573.046875 ,-2.7675113677979 )
local pObject40 = createObject( 1271, -153.873046875 ,-724.29296875 ,-13.722379684448 )
--Baghal
local pObject41 = createObject( 1271, 27.513671875 ,-574.7431640625 ,-6.2122917175293 )
local pObject42 = createObject( 1271, 21.1640625 ,-582.3798828125 ,-5.5039267539978 )
local pObject43 = createObject( 1271, 21.0966796875 ,-583.724609375 ,-3.494793176651 )
local pObject44 = createObject( 1271, 15.3134765625 ,-587.037109375 ,-6.5495223999023 )
local pObject45 = createObject( 1271, 14.791015625 ,-589.537109375 ,-3.5559892654419 )
local pObject46 = createObject( 1271, 11.6494140625 ,-595.427734375 ,1.3067798614502 )
local pObject47 = createObject( 1271, 4.1962890625 ,-597.751953125 ,-3.9719867706299 )
local pObject48 = createObject( 1271, 0.1015625 ,-600.19140625 ,-4.6964597702026 )
local pObject49 = createObject( 1271, -0.185546875 ,-602.72265625 ,-1.6017684936523 )
local pObject50 = createObject( 1271, -8.0908203125 ,-609.5224609375 ,-3.8183469772339 )
local pObject51 = createObject( 1271, -8.1689453125 ,-614.6259765625 ,0.090291023254395 )


--setWaterLevel(-20)




Marker1 = createMarker(-179.533203125 ,-807.7978515625 ,-2.8237457275391 , "corona", 2,255,215,0,70)
Marker2 = createMarker(-183.7275390625 ,-800.9482421875 ,-2.6481628417969 , "corona", 2,255,215,0,70)
Marker3 = createMarker(-214.744140625 ,-777.900390625 ,-2.9642696380615, "corona", 2,255,215,0,70)
Marker4 = createMarker(-206.537109375 ,-785.140625 ,-2.100399017334  , "corona", 2,255,215,0,70)

Marker5 = createMarker(-198.041015625 ,-789.7275390625 ,-2.0292358398438 , "corona", 2,255,215,0,70)
Marker6 = createMarker(-186.8583984375 ,-795.9189453125 ,-3.5907135009766 , "corona", 2,255,215,0,70)

Marker7 = createMarker(-179.3369140625 ,-790.24609375 ,-9.5204238891602 , "corona", 2,255,215,0,70)
Marker8 = createMarker(-182.837890625 ,-776.416015625 ,-12.836738586426 , "corona", 2,255,215,0,70)

Marker9 = createMarker(-189.7490234375 ,-766.876953125 ,-12.786731719971 , "corona", 2,255,215,0,70)
Marker10 = createMarker(-202.5068359375 ,-750.900390625 ,-12.437637329102 , "corona", 2,255,215,0,70)

Marker11 = createMarker(-210.4140625 ,-738.513671875 ,-11.194400787354 , "corona", 2,255,215,0,70)
Marker12 = createMarker(-213.2509765625 ,-719.74609375 ,-13.340503692627 , "corona", 2,255,215,0,70)
Marker13 = createMarker(-229.232421875 ,-718.5400390625 ,-11.976440429688 , "corona", 2,255,215,0,70)
Marker14 = createMarker(-253.083984375 ,-721.3681640625 ,-8.6816158294678  , "corona", 2,255,215,0,70)
Marker15 = createMarker(-271.9716796875 ,-739.0419921875 ,-11.562982559204 , "corona", 2,255,215,0,70)
Marker16 = createMarker(-143.615234375 ,-800.111328125 ,-9.5020771026611 , "corona", 2,255,215,0,70)
Marker17 = createMarker(-135.8740234375 ,-789.83203125 ,-7.5873403549194 , "corona", 2,255,215,0,70)
Marker18 = createMarker(-135.9599609375 ,-782.8369140625 ,-10.923352241516 , "corona", 2,255,215,0,70)
Marker19 = createMarker(-132.224609375 ,-774.44140625 ,-11.554767608643 , "corona", 2,255,215,0,70)
Marker20 = createMarker(-124.9365234375 ,-771.4306640625 ,-5.3756351470947 , "corona", 2,255,215,0,70)
Marker21 = createMarker(-117.515625 ,-764.060546875 ,-3.33915042877 , "corona", 2,255,215,0,70)
Marker22 = createMarker(-119.8603515625 ,-748.310546875 ,-7.550329208374 , "corona", 2,255,215,0,70)
Marker23 = createMarker(-116.81640625 ,-734.3310546875 ,-8.8893985748291 , "corona", 2,255,215,0,70)
Marker24 = createMarker(-105.6201171875 ,-729.953125 ,-3.9721412658691 , "corona", 2,255,215,0,70)
Marker25 = createMarker(-106.97265625 ,-718.498046875 ,-7.1271343231201 , "corona", 2,255,215,0,70)
Marker26 = createMarker(-101.6669921875 ,-714.7138671875 ,-5.2045564651489 , "corona", 2,255,215,0,70)
Marker27 = createMarker(-69.6162109375 ,-653.359375 ,-4.1404228210449 , "corona", 2,255,215,0,70)
Marker28 = createMarker(-89.2626953125 ,-679.9873046875 ,-4.6807737350464 , "corona", 2,255,215,0,70)
Marker29 = createMarker(-81.873046875 ,-660.0517578125 ,-6.9214515686035 , "corona", 2,255,215,0,70)
Marker30 = createMarker(-90.60546875 ,-666.8642578125 ,-8.9798498153687 , "corona", 2,255,215,0,70)
Marker31 = createMarker(-101.3876953125 ,-556.54296875 ,-2.5490646362305 , "corona", 2,255,215,0,70)
Marker32 = createMarker(-95.0341796875 ,-563.5732421875 ,-2.117324829101 , "corona", 2,255,215,0,70)
Marker33 = createMarker(-90.2958984375 ,-569.533203125 ,-1.9729804992676 , "corona", 2,255,215,0,70)
Marker34 = createMarker(-82.58203125 ,-579.1259765625 ,-1.7106151580811 , "corona", 2,255,215,0,70)
Marker35 = createMarker(-74.1787109375 ,-591.208984375 ,-2.0192451477051 , "corona", 2,255,215,0,70)
Marker36 = createMarker(-65.8984375 ,-592.4931640625 ,-1.9702568054199 , "corona", 2,255,215,0,70)
Marker37 = createMarker(-49.5126953125 ,-586.591796875 ,-3.3350009918213  , "corona", 2,255,215,0,70)
Marker38 = createMarker(-42.0029296875 ,-580.142578125 ,-2.4932823181152 , "corona", 2,255,215,0,70)
Marker39 = createMarker(-33.0087890625 ,-573.046875 ,-2.7675113677979 , "corona", 2,255,215,0,70)
Marker40 = createMarker(-153.873046875 ,-724.29296875 ,-13.722379684448 , "corona", 2,255,215,0,70)

Marker41 = createMarker(27.513671875 ,-574.7431640625 ,-6.2122917175293 , "corona", 2,255,215,0,70)
Marker42 = createMarker(21.1640625 ,-582.3798828125 ,-5.5039267539978 , "corona", 2,255,215,0,70)

Marker43 = createMarker(21.0966796875 ,-583.724609375 ,-3.494793176651 , "corona", 2,255,215,0,70)
Marker44 = createMarker(15.3134765625 ,-587.037109375 ,-6.5495223999023 , "corona", 2,255,215,0,70)

Marker45 = createMarker(14.791015625 ,-589.537109375 ,-3.5559892654419 , "corona", 2,255,215,0,70)
Marker46 = createMarker(11.6494140625 ,-595.427734375 ,1.3067798614502 , "corona", 2,255,215,0,70)

Marker47 = createMarker(4.1962890625 ,-597.751953125 ,-3.9719867706299 , "corona", 2,255,215,0,70)
Marker48 = createMarker(0.1015625 ,-600.19140625 ,-4.6964597702026 , "corona", 2,255,215,0,70)
Marker49 = createMarker(-0.185546875 ,-602.72265625 ,-1.6017684936523  , "corona", 2,255,215,0,70)
Marker50 = createMarker(-8.0908203125 ,-609.5224609375 ,-3.8183469772339  , "corona", 2,255,215,0,70)
Marker51 = createMarker(-8.1689453125 ,-614.6259765625 ,0.090291023254395 , "corona", 2,255,215,0,70)






--Login Car---------------------
--[[addEventHandler("onVehicleStartEnter",root,
	function (theVehicle)
        --local id = getElementModel ( thePlayer ) 
        if GhavasBodan == true then
		    if (getVehicleType(theVehicle) == "Boat") then
                outputChatBox("#ff0000Zamani Ke Ghavas Hastid Nemitavanid Ranandegi Konid!",thePlayer,255,0,0,true)
                cancelEvent()
            else 
                
			    
            end
		end
	end
)]]
-----------------------------
Ghayegh = { [473]=true,[493]=true,[452]=true,[595]=true }


--[[function enterVehicle ( player ) --when a player enters a vehicle
    if Ghavasi == true then
        if ( Ghayegh[getElementModel(thePlayer)] ) then --if the vehicle is one of 4 police cars, and the skin is not a police skin
         --and tell the player why
    
        else
            cancelEvent()
            outputChatBox("#ff0000Zamani Ke Ghavas Hastid Nemitavanid Ranandegi Konid!",player,255,0,0,true)
        end
    end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterVehicle )]]



addEventHandler("onMarkerHit",Marker1,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker1", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker1,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker1", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker2,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker2", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker2,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker2", hitElement, hitElement)
		
	end


end)
----------------------------------
addEventHandler("onMarkerHit",Marker3,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker3", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker3,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker3", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker4,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker4", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker4,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker4", hitElement, hitElement)
		
	end


end)
--------------------
addEventHandler("onMarkerHit",Marker5,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker5", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker5,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker5", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker6,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker6", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker6,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker6", hitElement, hitElement)
		
	end


end)
-------------------
addEventHandler("onMarkerHit",Marker7,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker7", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker7,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker7", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker8,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker8", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker8,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker8", hitElement, hitElement)
		
	end


end)
-----------
addEventHandler("onMarkerHit",Marker9,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker9", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker9,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker9", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker10,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker10", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker10,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker10", hitElement, hitElement)
		
	end


end)
---------------------
addEventHandler("onMarkerHit",Marker11,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker11", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker11,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker11", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker12,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker12", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker12,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker12", hitElement, hitElement)
		
	end


end)
----------------------
addEventHandler("onMarkerHit",Marker13,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker13", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker13,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker13", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker14,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker14", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker14,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker14", hitElement, hitElement)
		
	end


end)
-------------------
addEventHandler("onMarkerHit",Marker15,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker15", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker15,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker15", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker16,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker16", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker16,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker16", hitElement, hitElement)
		
	end


end)
--------------
addEventHandler("onMarkerHit",Marker17,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker17", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker17,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker17", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker18,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker18", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker18,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker18", hitElement, hitElement)
		
	end


end)
-------
addEventHandler("onMarkerHit",Marker19,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker19", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker19,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker19", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker20,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker20", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker20,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker20", hitElement, hitElement)
		
	end


end)
-------------
addEventHandler("onMarkerHit",Marker21,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker21", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker21,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker21", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker22,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker22", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker22,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker22", hitElement, hitElement)
		
	end


end)
--------
addEventHandler("onMarkerHit",Marker23,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker23", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker23,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker23", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker24,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker24", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker24,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker24", hitElement, hitElement)
		
	end


end)
-------
addEventHandler("onMarkerHit",Marker25,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker25", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker25,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker25", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker26,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker26", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker26,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker26", hitElement, hitElement)
		
	end


end)
----------
addEventHandler("onMarkerHit",Marker27,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker27", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker27,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker27", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker28,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker28", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker28,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker28", hitElement, hitElement)
		
	end


end)
----------
addEventHandler("onMarkerHit",Marker29,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker29", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker29,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker29", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker30,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker30", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker30,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker30", hitElement, hitElement)
		
	end


end)
---------
addEventHandler("onMarkerHit",Marker31,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker31", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker31,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker31", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker32,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker32", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker32,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker32", hitElement, hitElement)
		
	end


end)
--------
addEventHandler("onMarkerHit",Marker33,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker33", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker33,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker33", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker34,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker34", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker34,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker34", hitElement, hitElement)
		
	end


end)
--------
addEventHandler("onMarkerHit",Marker35,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker35", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker35,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker35", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker36,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker36", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker36,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker36", hitElement, hitElement)
		
	end


end)
-------
addEventHandler("onMarkerHit",Marker37,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker37", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker37,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker37", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker38,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker38", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker38,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker38", hitElement, hitElement)
		
	end


end)
----------
addEventHandler("onMarkerHit",Marker39,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker39", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker39,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker39", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker40,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker40", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker40,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker40", hitElement, hitElement)
		
	end


end)
-------
addEventHandler("onMarkerHit",Marker41,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker41", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker41,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker41", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker42,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker42", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker42,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker42", hitElement, hitElement)
		
	end


end)
---------
addEventHandler("onMarkerHit",Marker43,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker43", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker43,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker43", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker44,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker44", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker44,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker44", hitElement, hitElement)
		
	end


end)
---------
addEventHandler("onMarkerHit",Marker45,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker45", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker45,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker45", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker46,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker46", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker46,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker46", hitElement, hitElement)
		
	end


end)
------------
addEventHandler("onMarkerHit",Marker47,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker47", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker47,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker47", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker48,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker48", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker48,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker48", hitElement, hitElement)
		
	end


end)
-----------
addEventHandler("onMarkerHit",Marker49,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker49", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker49,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker49", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker50,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker50", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker50,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker50", hitElement, hitElement)
		
	end


end)
----------
addEventHandler("onMarkerHit",Marker51,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LoginMarker51", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker51,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("LeaveMarker51", hitElement, hitElement)
		
	end


end)




-------------------------------------------------------






-------------------------------------------------------






function Give1F(thePlayer)
    if Shift == false then
        
		--outputChatBox("#a5acefShoma Yek Shey'e Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
        destroyElement(pObject1)
        Shift = true
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end

    end
    if Shift == true then 
        setTimer(function()
            pcreateObject( 1271, -179.533203125 ,-807.7978515625 ,-2.8237457275391 )
            Shift = false 
        end, 40000, 1)
    end
end
addEvent("Give1", true)
addEventHandler("Give1", root, Give1F)

function Give2F(thePlayer)
    if Shift2 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject2)
        Shift2 = true
    end
    if Shift2 == true then 
        setTimer(function()
            createObject( 1271, -183.7275390625 ,-800.9482421875 ,-2.6481628417969 )
            Shift2 = false
        end, 40000, 1)
    end
end
addEvent("Give2", true)
addEventHandler("Give2", root, Give2F)

function Give3F(thePlayer)
    if Shift3 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject3)
        Shift3 = true
    end
    if Shift3 == true then 
        setTimer(function()
            pObject3 = createObject( 1271, -214.744140625 ,-777.900390625 ,-2.9642696380615 )
            Shift3 = false 
        end, 40000, 1)
    end
end
addEvent("Give3", true)
addEventHandler("Give3", root, Give3F)

function Give4F(thePlayer)
    if Shift4 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject4)
        Shift4 = true
    end
    if Shift4 == true then 
        setTimer(function()
            pObject4 = createObject( 1271, -206.537109375 ,-785.140625 ,-2.100399017334 )
            Shift4 = false
        end, 40000, 1)
    end
end
addEvent("Give4", true)
addEventHandler("Give4", root, Give4F)
------------------------------

function Give5F(thePlayer)
    if Shift5 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject5)
        Shift5 = true
    end
    if Shift5 == true then 
        setTimer(function()
            pObject5 = createObject( 1271, -198.041015625 ,-789.7275390625 ,-2.0292358398438 )
            Shift5 = false 
        end, 40000, 1)
    end
end
addEvent("Give5", true)
addEventHandler("Give5", root, Give5F)

function Give6F(thePlayer)
    if Shift6 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject6)
        Shift6 = true
    end
    if Shift6 == true then 
        setTimer(function()
            pObject6 = createObject( 1271, -186.8583984375 ,-795.9189453125 ,-3.5907135009766 )
            Shift2 = false
        end, 40000, 1)
    end
end
addEvent("Give6", true)
addEventHandler("Give6", root, Give6F)

function Give7F(thePlayer)
    if Shift7 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject7)
        Shift7 = true
    end
    if Shift7 == true then 
        setTimer(function()
            pObject7 = createObject( 1271, -179.3369140625 ,-790.24609375 ,-9.5204238891602 )
            Shift7 = false 
        end, 40000, 1)
    end
end
addEvent("Give7", true)
addEventHandler("Give7", root, Give7F)

function Give8F(thePlayer)
    if Shift8 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject8)
        Shift8 = true
    end
    if Shift8 == true then 
        setTimer(function()
            pObject8 = createObject( 1271, -182.837890625 ,-776.416015625 ,-12.836738586426 )
            Shift8 = false
        end, 40000, 1)
    end
end
addEvent("Give8", true)
addEventHandler("Give8", root, Give8F)

---------------------------

function Give9F(thePlayer)
    if Shift9 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject9)
        Shift9 = true
    end
    if Shift9 == true then 
        setTimer(function()
            pObject9 = createObject( 1271, -189.7490234375 ,-766.876953125 ,-12.786731719971 )
            Shift9 = false 
        end, 40000, 1)
    end
end
addEvent("Give9", true)
addEventHandler("Give9", root, Give9F)

function Give10F(thePlayer)
    if Shift10 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject10)
        Shift10 = true
    end
    if Shift10 == true then 
        setTimer(function()
            pObject10 = createObject( 1271, -202.5068359375 ,-750.900390625 ,-12.437637329102 )
            Shift10 = false
        end, 40000, 1)
    end
end
addEvent("Give10", true)
addEventHandler("Give10", root, Give10F)

function Give11F(thePlayer)
    if Shift11 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject11)
        Shift11 = true
    end
    if Shift11 == true then 
        setTimer(function()
            pObject11 = createObject( 1271, -210.4140625 ,-738.513671875 ,-11.194400787354 )
            Shift11 = false 
        end, 40000, 1)
    end
end
addEvent("Give11", true)
addEventHandler("Give11", root, Give11F)

function Give12F(thePlayer)
    if Shift12 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject2)
        Shift12 = true
    end
    if Shift12 == true then 
        setTimer(function()
            pObject12 = createObject( 1271, -213.2509765625 ,-719.74609375 ,-13.340503692627 )
            Shift12 = false
        end, 40000, 1)
    end
end
addEvent("Give12", true)
addEventHandler("Give12", root, Give12F)

--------------------------

function Give13F(thePlayer)
    if Shift13 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject13)
        Shift13 = true
    end
    if Shift13 == true then 
        setTimer(function()
            pObject13 = createObject( 1271, -229.232421875 ,-718.5400390625 ,-11.976440429688 )
            Shift13 = false 
        end, 40000, 1)
    end
end
addEvent("Give13", true)
addEventHandler("Give13", root, Give13F)

function Give14F(thePlayer)
    if Shift14 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject14)
        Shift14 = true
    end
    if Shift14 == true then 
        setTimer(function()
            pObject14 = createObject( 1271, -253.083984375 ,-721.3681640625 ,-8.6816158294678 )
            Shift14 = false
        end, 40000, 1)
    end
end
addEvent("Give14", true)
addEventHandler("Give14", root, Give14F)

function Give15F(thePlayer)
    if Shift15 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject15)
        Shift15 = true
    end
    if Shift15 == true then 
        setTimer(function()
            pObject15 = createObject( 1271, -271.9716796875 ,-739.0419921875 ,-11.562982559204 )
            Shift15 = false 
        end, 40000, 1)
    end
end
addEvent("Give15", true)
addEventHandler("Give15", root, Give15F)

function Give16F(thePlayer)
    if Shift16 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject16)
        Shift16 = true
    end
    if Shift16 == true then 
        setTimer(function()
            pObject16 = createObject( 1271, -143.615234375 ,-800.111328125 ,-9.5020771026611 )
            Shift16 = false
        end, 40000, 1)
    end
end
addEvent("Give16", true)
addEventHandler("Give16", root, Give16F)

----------------------------------

function Give17F(thePlayer)
    if Shift17 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject17)
        Shift17 = true
    end
    if Shift17 == true then 
        setTimer(function()
            pObject17 = createObject( 1271, -135.8740234375 ,-789.83203125 ,-7.5873403549194 )
            Shift17 = false 
        end, 40000, 1)
    end
end
addEvent("Give17", true)
addEventHandler("Give17", root, Give17F)

function Give18F(thePlayer)
    if Shift18 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject18)
        Shift18 = true
    end
    if Shift18 == true then 
        setTimer(function()
            pObject18 = createObject( 1271, -135.9599609375 ,-782.8369140625 ,-10.923352241516 )
            Shift18 = false
        end, 40000, 1)
    end
end
addEvent("Give18", true)
addEventHandler("Give18", root, Give18F)

function Give19F(thePlayer)
    if Shift == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject19)
        Shift19 = true
    end
    if Shift19 == true then 
        setTimer(function()
            pObject19 = createObject( 1271, -132.224609375 ,-774.44140625 ,-11.554767608643 )
            Shift19 = false 
        end, 40000, 1)
    end
end
addEvent("Give19", true)
addEventHandler("Give19", root, Give19F)

function Give20F(thePlayer)
    if Shift20 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject20)
        Shift20 = true
    end
    if Shift20 == true then 
        setTimer(function()
            pObject20 = createObject( 1271, -124.9365234375 ,-771.4306640625 ,-5.3756351470947 )
            Shift20 = false
        end, 40000, 1)
    end
end
addEvent("Give20", true)
addEventHandler("Give20", root, Give20F)

----------------------------------------

function Give21F(thePlayer)
    if Shift21 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject21)
        Shift21 = true
    end
    if Shift21 == true then 
        setTimer(function()
            pObject21 = createObject( 1271, -117.515625 ,-764.060546875 ,-3.339150428772 )
            Shift21 = false 
        end, 40000, 1)
    end
end
addEvent("Give21", true)
addEventHandler("Give21", root, Give21F)

function Give22F(thePlayer)
    if Shift22 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject22)
        Shift22 = true
    end
    if Shift22 == true then 
        setTimer(function()
            pObject22 = createObject( 1271, -119.8603515625 ,-748.310546875 ,-7.550329208374 )
            Shift22 = false
        end, 40000, 1)
    end
end
addEvent("Give22", true)
addEventHandler("Give22", root, Give2F)

function Give23F(thePlayer)
    if Shift23 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject23)
        Shift23 = true
    end
    if Shift23 == true then 
        setTimer(function()
            pObject23 = createObject( 1271, -116.81640625 ,-734.3310546875 ,-8.8893985748291 )
            Shift23 = false 
        end, 40000, 1)
    end
end
addEvent("Give23", true)
addEventHandler("Give23", root, Give23F)

function Give24F(thePlayer)
    if Shift24 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject24)
        Shift24 = true
    end
    if Shift24 == true then 
        setTimer(function()
            pObject24 = createObject( 1271, -105.6201171875 ,-729.953125 ,-3.9721412658691 )
            Shift24 = false
        end, 40000, 1)
    end
end
addEvent("Give24", true)
addEventHandler("Give24", root, Give24F)

------------------------------------------

function Give25F(thePlayer)
    if Shift25 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject25)
        Shift25 = true
    end
    if Shift25 == true then 
        setTimer(function()
            pObject25 = createObject( 1271, -106.97265625 ,-718.498046875 ,-7.1271343231201 )
            Shift25 = false 
        end, 40000, 1)
    end
end
addEvent("Give25", true)
addEventHandler("Give25", root, Give25F)

function Give26F(thePlayer)
    if Shift26 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject26)
        Shift26 = true
    end
    if Shift26 == true then 
        setTimer(function()
            pObject26 = createObject( 1271, -101.6669921875 ,-714.7138671875 ,-5.2045564651489 )
            Shift26 = false
        end, 40000, 1)
    end
end
addEvent("Give26", true)
addEventHandler("Give26", root, Give26F)

function Give27F(thePlayer)
    if Shift27 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject27)
        Shift27 = true
    end
    if Shift27 == true then 
        setTimer(function()
            pObject27 = createObject( 1271, -69.6162109375 ,-653.359375 ,-4.1404228210449 )
            Shift27 = false 
        end, 40000, 1)
    end
end
addEvent("Give27", true)
addEventHandler("Give27", root, Give27F)

function Give28F(thePlayer)
    if Shift28 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject28)
        Shift28 = true
    end
    if Shift28 == true then 
        setTimer(function()
            pObject28 = createObject( 1271, -89.2626953125 ,-679.9873046875 ,-4.6807737350464 )
            Shift28 = false
        end, 40000, 1)
    end
end
addEvent("Give28", true)
addEventHandler("Give28", root, Give28F)

-------------------------------------

function Give29F(thePlayer)
    if Shift29 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject29)
        Shift29 = true
    end
    if Shift29 == true then 
        setTimer(function()
            pObject29 = createObject( 1271, -81.873046875 ,-660.0517578125 ,-6.9214515686035 )
            Shift29 = false 
        end, 40000, 1)
    end
end
addEvent("Give29", true)
addEventHandler("Give29", root, Give29F)

function Give30F(thePlayer)
    if Shift30 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject30)
        Shift30 = true
    end
    if Shift30 == true then 
        setTimer(function()
            pObject30 = createObject( 1271, -90.60546875 ,-666.8642578125 ,-8.9798498153687 )
            Shift30 = false
        end, 40000, 1)
    end
end
addEvent("Give30", true)
addEventHandler("Give30", root, Give30F)

function Give31F(thePlayer)
    if Shift31 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject31)
        Shift31 = true
    end
    if Shift31 == true then 
        setTimer(function()
            pObject31 = createObject( 1271, -101.3876953125 ,-556.54296875 ,-2.5490646362305 )
            Shift31 = false 
        end, 40000, 1)
    end
end
addEvent("Give31", true)
addEventHandler("Give31", root, Give31F)

function Give32F(thePlayer)
    if Shift32 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject32)
        Shift32 = true
    end
    if Shift32 == true then 
        setTimer(function()
            pObject32 = createObject( 1271, -95.0341796875 ,-563.5732421875 ,-2.1173248291016 )
            Shift32 = false
        end, 40000, 1)
    end
end
addEvent("Give32", true)
addEventHandler("Give32", root, Give32F)

------------------------------------
function Give33F(thePlayer)
    if Shift33 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject33)
        Shift33 = true
    end
    if Shift33 == true then 
        setTimer(function()
            pObject33 = createObject( 1271, -90.2958984375 ,-569.533203125 ,-1.9729804992676 )
            Shift33 = false 
        end, 40000, 1)
    end
end
addEvent("Give33", true)
addEventHandler("Give33", root, Give33F)

function Give34F(thePlayer)
    if Shift34 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject34)
        Shift34 = true
    end
    if Shift34 == true then 
        setTimer(function()
            pObject34 = createObject( 1271, -82.58203125 ,-579.1259765625 ,-1.7106151580811 )
            Shift34 = false
        end, 40000, 1)
    end
end
addEvent("Give34", true)
addEventHandler("Give34", root, Give34F)

function Give35F(thePlayer)
    if Shift35 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject35)
        Shift35 = true
    end
    if Shift35 == true then 
        setTimer(function()
            pObject35 = createObject( 1271, -74.1787109375 ,-591.208984375 ,-2.0192451477051 )
            Shift35 = false 
        end, 40000, 1)
    end
end
addEvent("Give35", true)
addEventHandler("Give35", root, Give35F)

function Give36F(thePlayer)
    if Shift36 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject36)
        Shift36 = true
    end
    if Shift36 == true then 
        setTimer(function()
            pObject36 = createObject( 1271, -65.8984375 ,-592.4931640625 ,-1.9702568054199 )
            Shift36 = false
        end, 40000, 1)
    end
end
addEvent("Give36", true)
addEventHandler("Give36", root, Give36F)

--------------------------------------

function Give37F(thePlayer)
    if Shift37 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject37)
        Shift37 = true
    end
    if Shift37 == true then 
        setTimer(function()
            pObject37 = createObject( 1271, -49.5126953125 ,-586.591796875 ,-3.3350009918213 )
            Shift37 = false 
        end, 40000, 1)
    end
end
addEvent("Give37", true)
addEventHandler("Give37", root, Give37F)

function Give38F(thePlayer)
    if Shift38 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject38)
        Shift38 = true
    end
    if Shift38 == true then 
        setTimer(function()
            pObject38 = createObject( 1271, -42.0029296875 ,-580.142578125 ,-2.4932823181152 )
            Shift38 = false
        end, 40000, 1)
    end
end
addEvent("Give38", true)
addEventHandler("Give38", root, Give38F)

function Give39F(thePlayer)
    if Shift39 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject39)
        Shift39 = true
    end
    if Shift39 == true then 
        setTimer(function()
            pObject39 = createObject( 1271, -33.0087890625 ,-573.046875 ,-2.7675113677979 )
            Shift39 = false 
        end, 40000, 1)
    end
end
addEvent("Give39", true)
addEventHandler("Give39", root, Give39F)

function Give40F(thePlayer)
    if Shift40 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject40)
        Shift40 = true
    end
    if Shift40 == true then 
        setTimer(function()
            pObject40 = createObject( 1271, -153.873046875 ,-724.29296875 ,-13.722379684448 )
            Shift40 = false
        end, 40000, 1)
    end
end
addEvent("Give40", true)
addEventHandler("Give40", root, Give40F)

------------------------------------

function Give41F(thePlayer)
    if Shift41 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject41)
        Shift41 = true
    end
    if Shift41 == true then 
        setTimer(function()
            pObject41 = createObject( 1271, 27.513671875 ,-574.7431640625 ,-6.2122917175293 )
            Shift41 = false 
        end, 40000, 1)
    end
end
addEvent("Give41", true)
addEventHandler("Give41", root, Give41F)

function Give42F(thePlayer)
    if Shift42 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject42)
        Shift42 = true
    end
    if Shift42 == true then 
        setTimer(function()
            pObject42 = createObject( 1271, 21.1640625 ,-582.3798828125 ,-5.5039267539978 )
            Shift42 = false
        end, 40000, 1)
    end
end
addEvent("Give42", true)
addEventHandler("Give42", root, Give42F)
function Give43F(thePlayer)
    if Shift43 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject43)
        Shift43 = true
    end
    if Shift43 == true then 
        setTimer(function()
            pObject43 = createObject( 1271, 21.0966796875 ,-583.724609375 ,-3.494793176651 )
            Shift43 = false 
        end, 40000, 1)
    end
end
addEvent("Give43", true)
addEventHandler("Give43", root, Give43F)
function Give44F(thePlayer)
    if Shift44 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject44)
        Shift44 = true
    end
    if Shift44 == true then 
        setTimer(function()
            pObject44 = createObject( 1271, 15.3134765625 ,-587.037109375 ,-6.5495223999023 )
            Shift44 = false
        end, 40000, 1)
    end
end
addEvent("Give44", true)
addEventHandler("Give44", root, Give44F)
-----------------------------------------
function Give45F(thePlayer)
    if Shift45 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject45)
        Shift45 = true
    end
    if Shif45t == true then 
        setTimer(function()
            pObject45 = createObject( 1271, 14.791015625 ,-589.537109375 ,-3.5559892654419 )
            Shift45 = false 
        end, 40000, 1)
    end
end
addEvent("Give45", true)
addEventHandler("Give45", root, Give45F)
function Give46F(thePlayer)
    if Shift2 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject2)
        Shift46 = true
    end
    if Shift46 == true then 
        setTimer(function()
            pObject46 = createObject( 1271, 11.6494140625 ,-595.427734375 ,1.3067798614502 )
            Shift46 = false
        end, 40000, 1)
    end
end
addEvent("Give46", true)
addEventHandler("Give46", root, Give46F)
function Give47F(thePlayer)
    if Shift47 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject47)
        Shift47 = true
    end
    if Shift47 == true then 
        setTimer(function()
            pObject47 = createObject( 1271, 4.1962890625 ,-597.751953125 ,-3.9719867706299 )
            Shift47 = false 
        end, 40000, 1)
    end
end
addEvent("Give47", true)
addEventHandler("Give47", root, Give47F)
function Give48F(thePlayer)
    if Shift48 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject48)
        Shift48 = true
    end
    if Shift48 == true then 
        setTimer(function()
            pObject48 = createObject( 1271, 0.1015625 ,-600.19140625 ,-4.6964597702026 )
            Shift48 = false
        end, 40000, 1)
    end
end
addEvent("Give48", true)
addEventHandler("Give48", root, Give48F)
----------------------------------
function Give49F(thePlayer)
    if Shift == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject49)
        Shift49 = true
    end
    if Shift49 == true then 
        setTimer(function()
            pObject49 = createObject( 1271, -0.185546875 ,-602.72265625 ,-1.6017684936523 )
            Shift49 = false 
        end, 40000, 1)
    end
end
addEvent("Give49", true)
addEventHandler("Give49", root, Give49F)

function Give50F(thePlayer)
    if Shift50 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			--sendPlayerMessage("#00FF00[Ghavasi]:#FFFFFF Shoma Ba Movafaghiat Yek #00ff00"..ItemsTable[myFish][1].."#FFFFFF Seyd Kardid!", thePlayer, 255, 255, 255, true)
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject50)
        Shift50 = true
    end
    if Shift50 == true then 
        setTimer(function()
            pObject50 = createObject( 1271, -8.0908203125 ,-609.5224609375 ,-3.8183469772339 )
            Shift50 = false
        end, 40000, 1)
    end
end
addEvent("Give50", true)
addEventHandler("Give50", root, Give50F)
function Give51F(thePlayer)
    if Shift51 == false then
		local RandomItem = math.random(39,49)
		local FreeSlot = GetPlayerFreeSlot(thePlayer,1)
		local itemslot,meghdar = GetPlayerItemSlot(thePlayer,1)
		if FreeSlot >= 1 then
			GivePlayerItem(thePlayer,RandomItem,1,FreeSlot)
			if RandomItem == 39 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((DVD)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 40 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe Gold)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 41 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shamshir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 42 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Einak)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RnadomItem == 43 then
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Spray)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 44 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Khodkar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 45 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Dampai)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 46 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((ShisheShir)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 47 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Pich)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true)
			elseif RandomItem == 48 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Achar)) #FFDD00Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			elseif RandomItem == 49 then 
				outputChatBox("#FFDD00Shoma Yek#2e82b2 ((Shemshe)) #FFDD00Ahan Az Zire Ab Peyda Kardid",thePlayer,255,255,255,true) 
			
			end
			--outputServerLog("#Fishing - "..getPlayerName(thePlayer).." - "..myFish.."")
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Slot Kafi Dar Inventory Nadarid!",thePlayer)
		end
        destroyElement(pObject51)
        Shift51 = true
    end
    if Shift51 == true then 
        setTimer(function()
            pObject51 = createObject( 1271, -8.1689453125 ,-614.6259765625 ,0.090291023254395 )
            Shift51 = false 
        end, 40000, 1)
    end
end
addEvent("Give51", true)
addEventHandler("Give51", root, Give51F)
---More Oxygen
addEvent("setStat", true)
addEventHandler("setStat", root, 
function()
    setPedStat(source, 225, 1000)
end)
function cancelStatF()
    setPedStat(source, 225, 1)
end
addEvent("cancelStat", true)
addEventHandler("cancelStat", root, cancelStatF)
--objects id , x , y , z , itemid , Def used or no , Rang Text Item
rocks = {
	--Sefid
	[2] = {2936 , -1849.9140625 , -2093.9306640625 , 58.972846984863 , 50 , 0 ,"#FFFFFF"},
	[3] = {2936 , -1856.6357421875 , -2093.05078125 , 58.984336853027 , 50 , 0,"#FFFFFF"},
	[4] = {2936 , -1855.0771484375 , -2092.423828125 , 59.189834594727 , 50 , 0,"#FFFFFF"},
	[5] = {2936 , -1851.189453125 , -2095.2587890625 , 58.97241973877 , 50 , 0, "#FFFFFF"},
	--Abi
	[6] = {2936 , -240.0263671875 , -1588.8369140625 , 9.2637729644775 , 52 , 0, "#66B2FF"},
	[7] = {2936 , -244.8349609375 , -1599.4501953125 , 9.148099899292 , 52 , 0, "#66B2FF"},
	[8] = {2936 , -244.8349609375 , -1599.4501953125 , 9.148099899292 , 52 , 0, "#66B2FF"},
	[9] = {2936 , -253.6455078125 , -1611.2099609375 , 7.2993993759155 , 52 , 0, "#66B2FF"},
	--Ghermez
	[10] = {2936 , -1433.087890625 , -964.2685546875 , 200.97294616699 , 54 , 0, "#FF1010"},
	[11] = {2936 , -1428.181640625 , -964.3203125 , 200.88307189941 , 54 , 0, "#FF1010"},
	[12] = {2936 , -1432.876953125 , -956.8369140625 , 200.97271728516 , 54 , 0, "#FF1010"},
	[13] = {2936 , -1427.2294921875 , -956.126953125 , 200.86962890625 , 54 , 0, "#FF1010"},
	--Sabz
	[14] = {2936 , -1997.396484375 , -1571.0087890625 , 85.917686462402 , 51 , 0, "#99FF99"},
	[15] = {2936 , -1997.763671875 , -1565.1826171875 , 85.812515258789 , 51 , 0, "#99FF99"},
	[1] = {2936,-1997.896484375 ,-1575.189453125 ,85.812515258789,51,0,"#99FF99"},
	[16] = {2936 , -1997.7470703125 , -1567.890625 , 85.862632751465 , 51 , 0, "#99FF99"},
	--Banafsh
	[17] = {2936 , -1584.296875 ,1334.8359375 ,7.0200691223145 , 53 , 0, "#CC99FF"},
	[18] = {2936 , -1574.5546875 , 1329.826171875 , 6.2309713363647 , 53 , 0, "#CC99FF"},
	[19] = {2936 , -1564.3642578125 , 1328.7412109375 , 3.6491365432739 , 53 , 0, "#CC99FF"},
	[20] = {2936 , -1557.61328125 , 1331.0703125 , 4.0513639450073 , 53 , 0, "#CC99FF"},
	--Zard
	[21] = {2936 , -2895.1611328125 , 76.283203125 , 4.7383689880371 , 55 , 0, "#FFFF66"},
	[22] = {2936 , -2896.14453125 , 94.7236328125 , 4.602659702301 , 55 , 0, "#FFFF66"},
	[23] = {2936 , -2896.53125 , 100.111328125 , 4.5558352470398 , 55 , 0, "#FFFF66"},
	[24] = {2936 , -2896.7265625 , 104.6064453125 , 4.5252633094788 , 55 , 0, "#FFFF66"},
	--Abi
	[25] = {2936 , 2628.5009765625 , -2043.296875 , 13.550000190735 , 52 , 0, "#66B2FF"},
	[26] = {2936 , 2621.9775390625 ,-2045.9052734375 ,13.550000190735 , 52 , 0, "#66B2FF"},
	[27] = {2936 , 2627.4814453125 ,-2045.9658203125 ,13.550000190735 , 52 , 0, "#66B2FF"},
	[28] = {2936 , 2627.19140625 ,-2053.3076171875 ,13.550000190735 , 52 , 0, "#66B2FF"},
	--Ghermez
	[29] = {2936 , 1971.33203125 ,-787.044921875 ,130.40077209473 , 50 , 0 ,"#FFFFFF"},
	[30] = {2936 , 1976.353515625 ,-792.140625 ,131.72891235352 , 50 , 0,"#FFFFFF"},
	[31] = {2936 , 1981.7763671875 ,-794.4892578125 ,132.88468933105 , 50 , 0,"#FFFFFF"},
	[32] = {2936 , 1988.3466796875 ,-796.9560546875 ,133.11932373047 , 50 , 0, "#FFFFFF"},
	--Zard LS
	[33] = {2936 , 1029.5341796875 ,-2139.01953125 ,40.261409759521 , 55 , 0, "#FFFF66"},
	[34] = {2936 , 1029.326171875 ,-2144.03125 ,40.43070602417 , 55 , 0, "#FFFF66"},
	[35] = {2936 , 1027.7939453125 ,-2152.51953125 ,40.657894134521 , 55 , 0, "#FFFF66"},
	[36] = {2936 , 1028.65234375 ,-2156.73828125 ,40.834205627441 , 55 , 0, "#FFFF66"},
	--Ghermez LS 
	[37] = {2936 , 512.4599609375 , -831.4912109375 , 90.10676574707 , 54 , 0, "#FF1010"},
	[38] = {2936 , 515.7353515625 , -829.9775390625 , 91.187507629395 , 54 , 0, "#FF1010"},
	[39] = {2936 , 519.05078125 , -828.4169921875 , 92.088943481445 , 54 , 0, "#FF1010"},
	[40] = {2936 , 521.833984375 , -826.7548828125 , 92.877365112305 , 54 , 0, "#FF1010"},
	--Banafsh LS
	[41] = {2936 , 1412.0537109375 , -2743.9619140625 , 6.3283596038818 , 53 , 0, "#CC99FF"},
	[42] = {2936 , 1415.8203125 , -2743.8056640625 , 6.5546979904175 , 53 , 0, "#CC99FF"},
	[43] = {2936 , 1420.228515625 , -2743.6240234375 , 6.6891670227051 , 53 , 0, "#CC99FF"},
	[44] = {2936 , 1424.5927734375 , -2743.576171875 , 6.7769184112549 , 53 , 0, "#CC99FF"},
	--Sefid
	[45] = {2936 , 2654.1865234375 , 2731.578125 , 10.8203125 , 50 , 0 ,"#FFFFFF"},
	[46] = {2936 , 2650.6044921875 , 2731.6357421875 , 10.8203125 , 50 , 0,"#FFFFFF"},
	[47] = {2936 , 2650.23828125 ,2734.91015625 ,10.8203125 , 50 , 0,"#FFFFFF"},
	[48] = {2936 , 2654.1962890625 ,2735.59765625 ,10.8203125 , 50 , 0, "#FFFFFF"},
	--Abi
	[49] = {2936 , 2654.24609375 , 2739.2431640625 , 10.8203125 , 52 , 0, "#66B2FF"},
	[50] = {2936 , 2654.24609375 , 2739.2431640625 , 10.8203125, 52 , 0, "#66B2FF"},
	[51] = {2936 , 2649.9560546875 ,2739.3818359375 ,10.8203125 , 52 , 0, "#66B2FF"},
	[52] = {2936 , 2649.7890625 ,2742.4833984375 ,10.8203125 , 52 , 0, "#66B2FF"},
	--Ghermez
	[53] = {2936 , 2649.7314453125 , 2745.1572265625 , 10.8203125 , 54 , 0, "#FF1010"},
	[54] = {2936 , 2653.912109375 , 2745.2451171875 , 10.8203125 , 54 , 0, "#FF1010"},
	[55] = {2936 , 2653.796875 , 2751.9521484375 , 10.8203125 , 54 , 0, "#FF1010"},
	[56] = {2936 , 2649.369140625 , 2753.0302734375 , 10.8203125 , 54 , 0, "#FF1010"},
	--Sabz
	[57] = {2936 , 2649.310546875 , 2756.2685546875 , 10.8203125 , 51 , 0, "#99FF99"},
	[58] = {2936 , 2654.271484375 , 2756.60546875 , 10.8203125 , 51 , 0, "#99FF99"},
	[59] = {2936 , 2654.2080078125 , 2759.04296875 , 10.8203125 , 51 , 0, "#99FF99"},
	[60] = {2936 , 2649.7265625 , 2759.0693359375 , 10.8203125 , 51 , 0, "#99FF99"},
	--Banafsh
	[61] = {2936 , 2649.775390625 , 2762.7568359375 , 10.8203125 , 53 , 0, "#CC99FF"},
	[62] = {2936 , 2654.1162109375 , 2762.7548828125 , 10.8203125 , 53 , 0, "#CC99FF"},
	[63] = {2936 , 2654.1572265625 , 2765.8271484375 , 10.8203125 , 53 , 0, "#CC99FF"},
	[64] = {2936 , 2648.7939453125 , 2766.341796875 , 10.8203125 , 53 , 0, "#CC99FF"},
	--Zard
	[65] = {2936 , 2648.66796875 , 2769.9853515625 , 10.8203125 , 55 , 0, "#FFFF66"},
	[66] = {2936 , 2653.9208984375 , 2770.7900390625 , 10.8203125 , 55 , 0, "#FFFF66"},
	[67] = {2936 , 2653.6435546875 , 2774.287109375 , 10.8203125 , 55 , 0, "#FFFF66"},
	[68] = {2936 , 2649.3193359375 , 2774.53125 , 10.8203125 , 55 , 0, "#FFFF66"},
	--Sefid
	[69] = {2936 , 2975.6962890625 , 1399.4794921875 , 30.591117858887 , 50 , 0 ,"#FFFFFF"},
	[70] = {2936 , 2975.62109375 , 1392.7080078125 , 30.430200576782 , 50 , 0,"#FFFFFF"},
	[71] = {2936 , 2975.5390625 , 1385.337890625 , 29.746967315674 , 50 , 0,"#FFFFFF"},
	[72] = {2936 , 2975.466796875 , 1378.8642578125 , 28.992191314697 , 50 , 0, "#FFFFFF"},
	--Abi
	[73] = {2936 , 847.6826171875 , 2907.361328125 , 5.9461002349854 , 52 , 0, "#66B2FF"},
	[74] = {2936 , 840.611328125 , 2906.2421875 , 4.5875492095947, 52 , 0, "#66B2FF"},
	[75] = {2936 , 837.7890625 , 2905.7958984375 , 3.9965972900391 , 52 , 0, "#66B2FF"},
	[76] = {2936 , 832.65234375 , 2904.984375 , 3.578971862793 , 52 , 0, "#66B2FF"},
	--Ghermez
	[77] = {2936 , 563.3251953125 , 1476.3505859375 , 4.1094670295715 , 54 , 0, "#FF1010"},
	[78] = {2936 , 561.4052734375 , 1481.732421875 , 2.9189286231995 , 54 , 0, "#FF1010"},
	[79] = {2936 , 559.0205078125 , 1488.4169921875 , 2.0592050552368 , 54 , 0, "#FF1010"},
	[80] = {2936 , 557.4384765625 , 1492.8505859375 , 1.8705902099609 , 54 , 0, "#FF1010"},
	--Sabz
	[81] = {2936 , -203.205078125 , 1791.4794921875 , 99.134429931641 , 51 , 0, "#99FF99"},
	[82] = {2936 , -203.56640625 , 1784.7353515625 , 99.26936340332 , 51 , 0, "#99FF99"},
	[83] = {2936 , -203.232421875 , 1782.0400390625 , 99.32511138916 , 51 , 0, "#99FF99"},
	[84] = {2936 , -202.7294921875 , 1775.3818359375 , 99.77099609375 , 51 , 0, "#99FF99"},
	--Banafsh
	[85] = {2936 , -853.642578125 , 1763 , 87.684661865234 , 53 , 0, "#CC99FF"},
	[86] = {2936 , -857.0869140625 , 1762.8798828125 , 87.763175964355 , 53 , 0, "#CC99FF"},
	[87] = {2936 , -860.421875 , 1762.7626953125 , 87.839256286621 , 53 , 0, "#CC99FF"},
	[88] = {2936 , -865.2099609375 , 1762.298828125 , 87.957427978516 , 53 , 0, "#CC99FF"},
	--Zard
	[89] = {2936 , -787.015625 , 2254.5126953125 , 59.722595214844 , 55 , 0, "#FFFF66"},
	[90] = {2936 , -790.1083984375 , 2255.1201171875 , 59.485271453857 , 55 , 0, "#FFFF66"},
	[91] = {2936 , -793.7021484375 , 2255.8896484375 , 59.190605163574 , 55 , 0, "#FFFF66"},
	[92] = {2936 , -797.041015625 , 2256.6044921875 , 58.9765625 , 55 , 0, "#FFFF66"},
}
rockmarker = {}
for i=1, #rocks do
	rockforalmas = createObject(rocks[i][1] , rocks[i][2], rocks[i][3], rocks[i][4]-0.8 )
	setElementFrozen( rockforalmas , true )
	rockmarker[i] = createMarker(rocks[i][2], rocks[i][3], rocks[i][4]  , "cylinder", 2,255,215,0,70)
	setElementAlpha(rockmarker[i],0)
	addEventHandler("onMarkerHit",rockmarker[i],function(thePlayer)
		local weapon = getPedWeapon(thePlayer)
		if tonumber(weapon) == 6 then
			if rocks[i][6] == 0 then
				local FreeSlot = GetPlayerFreeSlot(thePlayer,rocks[i][5])
				if FreeSlot >= 1 then
					setPedAnimation(thePlayer,"DILDO","DILDO_G",-1,false, false, false, false)
					GivePlayerItem(thePlayer,rocks[i][5],1,FreeSlot)
					sendPlayerMessage("#CCE5FF[Farm-System]:#FFFFFF Shoma (("..rocks[i][7].."1x "..ItemsTable[rocks[i][5]][1].."#FFFFFF)) Ra Bardashtid",thePlayer)
					rocks[i][6] = 5
					setTimer(function() rocks[i][6] = 4 end, 60000, 1)
					setTimer(function() rocks[i][6] = 3 end, 120000, 1)	
					setTimer(function() rocks[i][6] = 2 end, 180000, 1)
					setTimer(function() rocks[i][6] = 1 end, 240000, 1)
					setTimer(function() rocks[i][6] = 0 end, 300000, 1)
				else
					sendPlayerMessage("#CCE5FF[Farm-System]:#FFFFFF Shoma Slot Khali Nadarid!",thePlayer)
				end
			else
				sendPlayerMessage("#CCE5FF[Farm-System]:#FFFFFF In Sang Hodod "..rocks[i][6].." Daghighe Pish Farm Shode Ast!",thePlayer)
			end
		else
			sendPlayerMessage("#CCE5FF[Farm-System]:#CCCC00 * Braye Farm Kardan In Sang Niaz Be Bil Darid!!",thePlayer)
		end
	end)
end
bilpickup = createPickup( 414.76837158203 ,2511.5456542969 ,-11.39218711853, 2, 6, 1, 1 )
setElementInterior(bilpickup,85)
setElementDimension(bilpickup,69)
------------------------------------------------FORG FOR---------------------------------------
yaghots = {
	[50] = {"Yaghot Sefid",56,"#FFFFFF"},
	[51] = {"Yaghot Sabz",57,"#99FF99"},
	[52] = {"Yaghot Abi",58,"#66B2FF"},
	[53] = {"Yaghot Banafsh",59,"#CC99FF"},
	[54] = {"Yaghot Ghermez",60,"#FF1010"},
	[55] = {"Yaghot Zard",61,"#FFFF66"},
}
local blipcore = createBlip( 2361.3994140625 ,-1339.6298828125 ,24.0078125,43)
setElementData( blipcore, 'blipName',"Koore")
addEvent("RequestForgItem",true)
addEventHandler("RequestForgItem",getRootElement(),function(thePlayer,ItemSlot)
	local ItemID,ItemAmount = GetPlayerSlotInfo(thePlayer,ItemSlot)
	if tonumber(ItemID) >= 1 then
		if tonumber(ItemAmount) >= 1 then
			if not isPedInVehicle(thePlayer) then
				if isPedOnGround(thePlayer) then
					if not useObject[thePlayer] and not useTimer[thePlayer] then
						if tonumber(ItemID) >= 1 then
							if getDistanceBetweenPoints3D(Vector3(getElementPosition(thePlayer)),394.85430908203 ,2508.3073730469 ,-4.8885006904602) <= 25  and getElementInterior(thePlayer) == 85 and getElementDimension(thePlayer) == 69 then
								local FreeSlot = GetPlayerFreeSlot(thePlayer,yaghots[ItemID][2])
								if FreeSlot >= 1 then
									TakePlayerItem(thePlayer,ItemSlot,ItemAmount)
									GivePlayerItem(thePlayer,yaghots[ItemID][2],ItemAmount,FreeSlot)
									sendPlayerMessage("[Farm-System]:#FFFFFF Shoma Ba Movafaghiat Almas Khod Ra Be Yaghot Tabdil Kardid!!",thePlayer)
								else
									sendPlayerMessage("#CCE5FF[Farm-System]:#FFFFFF Shoma Slot Khali Nadarid!",thePlayer)
								end
						
							else
								sendPlayerMessage("#fc3600[Error]:#FFFFFF Baraye Forg Bayad Dar Koore Bashid!",thePlayer)
							end
						end
					end
				else
					sendPlayerMessage("#ff0000[Error]:#FFFFFF Bayad Rooye Zamin Bashid!",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000[Error]:#FFFFFF Az Khodro Piade Shavid!",thePlayer)
			end
		else
			RemovePlayerItem(thePlayer,ItemSlot)
		end
	else
		ReLoadInventoryForPlayer(thePlayer)
	end
end)
local formols = {
	["606156"] = {3},
	["575961"] = {5},
	["566159"] = {7},
	["586057"] = {8},
	["566059"] = {10},
	["615658"] = {11},
	["585661"] = {12},
	["565759"] = {16},
	["596156"] = {17},
	["605659"] = {24},
	["575659"] = {25},
	["585960"] = {27},
	["615859"] = {28},
}
addEvent("RequestKooreItem",true)
addEventHandler("RequestKooreItem",getRootElement(),function(thePlayer,ItemSlot1,ItemSlot2,ItemSlot3)
	local ItemID,ItemAmount = GetPlayerSlotInfo(thePlayer,ItemSlot1)
	local ItemID2,ItemAmount2 = GetPlayerSlotInfo(thePlayer,ItemSlot2)
	local ItemID3,ItemAmount3 = GetPlayerSlotInfo(thePlayer,ItemSlot3)

	if tonumber(ItemID) >= 1 and tonumber(ItemID2) >= 1 and tonumber(ItemID3) >= 1  then
		if tonumber(ItemAmount) >= 1 and tonumber(ItemAmount2) >= 1 and tonumber(ItemAmount3) >= 1 then
			if not isPedInVehicle(thePlayer) then
				if isPedOnGround(thePlayer) then
					if not useObject[thePlayer] and not useTimer[thePlayer] then
						if tonumber(ItemID) >= 1 then
							if getDistanceBetweenPoints3D(Vector3(getElementPosition(thePlayer)),394.85430908203 ,2508.3073730469 ,-4.8885006904602) <= 25  and getElementInterior(thePlayer) == 85 and getElementDimension(thePlayer) == 69 then
								if formols[ItemID..""..ItemID2..""..ItemID3] then
									local FreeSlot = GetPlayerFreeSlot(thePlayer,formols[ItemID..""..ItemID2..""..ItemID3][1])
									if FreeSlot >= 1 then

										TakePlayerItem(thePlayer,ItemSlot1,1)
										TakePlayerItem(thePlayer,ItemSlot2,1)
										TakePlayerItem(thePlayer,ItemSlot3,1)
										GivePlayerItem(thePlayer,formols[ItemID..""..ItemID2..""..ItemID3][1],1,FreeSlot)
										sendPlayerMessage("[Farm-System]:#FFFFFF Ok Shod!!",thePlayer)
									else
										sendPlayerMessage("#CCE5FF[Farm-System]:#FFFFFF Shoma Slot Khali Nadarid!",thePlayer)
									end
								else
									notfSys:addNotification(thePlayer,"In Formol Vojod Nadarad.S","error")
								end
							else
								sendPlayerMessage("#fc3600[Error]:#FFFFFF Baraye Craft Bayad Dar Koore Bashid!",thePlayer)
							end
						end
					end
				else
					sendPlayerMessage("#ff0000[Error]:#FFFFFF Bayad Rooye Zamin Bashid!",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000[Error]:#FFFFFF Az Khodro Piade Shavid!",thePlayer)
			end
		else
			RemovePlayerItem(thePlayer,ItemSlot)
		end
	else
		ReLoadInventoryForPlayer(thePlayer)
	end
end)