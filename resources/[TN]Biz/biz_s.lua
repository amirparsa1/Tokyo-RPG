local accSys = exports["Accounts-System"]
local notfSys = exports["notf"]
local miscSys = exports["misc"]
local dbpTime = 500
local inventory = exports["[TN]Inventory"]

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

function sendPlayerMessage(Str,player)
	outputChatBox(tostring(Str),player,255,255,255,true)
end

businessCreated = false

Business = {}
BizElements = {}
BizID = {}
lastVisit = {}

TeleportTimer = {}

lastID = 0


function GetPlayerNameFromReferralID(ID)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			if tonumber(row["pID"]) == tonumber(ID) then
				if getPlayerFromName(row["pName"]) then
					return row["pName"],getPlayerFromName(row["pName"])
				else
					return row["pName"]
				end
			end
		end
	end
	return "no-one"
end


function buildBusiness(id, x, y, z, interior,dim, intx, inty, intz, money, locked, price, owner, enterprice, forsell,name)
	lastID = id
	
	Business[id] = {}
	Business[id]["bID"] = id
	Business[id]["bOwner"] = owner
	Business[id]["bName"] = name
	Business[id]["bOwnerName"] = GetPlayerNameFromReferralID(owner)
	Business[id]["bX"] = x
	Business[id]["bY"] = y
	Business[id]["bZ"] = z
	Business[id]["bInterior"] = interior
	Business[id]["bDimension"] = dim
	Business[id]["bIntX"] = intx
	Business[id]["bIntY"] = inty
	Business[id]["bIntZ"] = intz
	Business[id]["bMoney"] = money
	Business[id]["bLock"] = locked
	Business[id]["bPrice"] = price
	Business[id]["bEnter"] = enterprice
	Business[id]["bForSell"] = forsell
	
	BizElements[id] = {}
	BizElements[id]["OutsideMarker"] = createMarker(x,y,z,"cylinder",1.00,0,0,0,0)
	BizElements[id]["OutsidePickup"] = createPickup(x,y,z, 3, 1318, 0)
	
	BizElements[id]["InsideMarker"] = createMarker(intx,inty,intz,"cylinder",1.00,0,0,0,0)
	BizElements[id]["InsidePickup"] = createPickup(intx,inty,intz, 3, 1318, 0)
	setElementInterior(BizElements[id]["InsideMarker"],interior)
	setElementInterior(BizElements[id]["InsidePickup"],interior)
	setElementDimension(BizElements[id]["InsideMarker"],dim)
	setElementDimension(BizElements[id]["InsidePickup"],dim)

	BizID[BizElements[id]["OutsideMarker"]] = id
	BizID[BizElements[id]["InsideMarker"]] = id
	
	
	addEventHandler("onMarkerHit",BizElements[id]["OutsideMarker"],function(thePlayer)
		if isElement(thePlayer) then
			if getElementType(thePlayer) == "player" then
				if getElementInterior(thePlayer) == 0 then
					if getElementDimension(thePlayer) == 0 then
						if not isPedInVehicle(thePlayer) then
						local nowBizID = tonumber(BizID[source])
						if not TeleportTimer[thePlayer] then
							if lastVisit[thePlayer] then
								lastVisit[thePlayer] = nil
							end
							lastVisit[thePlayer] = tonumber(nowBizID)
							--if nowBizID ~= 4 and nowBizID ~= 5 and nowBizID ~= 9 then
								OpenHouseMenu(thePlayer)
							--end
						end
						end
					end
				end
			end
		end
	end)
	
	addEventHandler("onMarkerLeave",BizElements[id]["OutsideMarker"],function(thePlayer)
		if isElement(thePlayer) then
			if getElementType(thePlayer) == "player" then
				if lastVisit[thePlayer] then
					lastVisit[thePlayer] = nil
					triggerClientEvent("closeBizPage",thePlayer,thePlayer)
				end
			end
		end
	end)
	
	addEventHandler("onMarkerHit",BizElements[id]["InsideMarker"],function(thePlayer)
		if isElement(thePlayer) then
			if getElementType(thePlayer) == "player" then
				if getElementInterior(thePlayer) ~= 0 then
					--if getElementDimension(thePlayer) ~= 0 then
						if not isPedInVehicle(thePlayer) then
						local nowBizID = tonumber(BizID[source])
						if lastVisit[thePlayer] then
							lastVisit[thePlayer] = nil
						end
						lastVisit[thePlayer] = nowBizID
						if nowBizID ~= 4 or nowBizID ~= 5 or nowBizID ~= 9 or nowBizID ~= 13 or nowBizID ~= 14 or nowBizID ~= 15 then
							notfSys:addNotification(thePlayer,"Baraye Khoroj Az 'F' Estefade Konid!","info")
							bindKey(thePlayer,"F","down",ExitFromBiz)
							

						end
						end
					--end
				end
			end
		end
	end)
	
	
	addEventHandler("onMarkerLeave",BizElements[id]["InsideMarker"],function(thePlayer)
		if isElement(thePlayer) then
			if getElementType(thePlayer) == "player" then
				if lastVisit[thePlayer] then
					lastVisit[thePlayer] = nil
					--unbindKey(thePlayer,"Z","down",ExitFromBiz)
				end
			end
		end
	end)
	triggerClientEvent("streamBusinessDisplay",getRootElement(),id,Business[id])
end

addEvent("loadbizzesfromsv",true)
addEventHandler("loadbizzesfromsv",getRootElement(),function(thePlayer)
	for i=1,#Business do
		triggerClientEvent("streamBusinessDisplay",thePlayer,i,Business[i])
	end
end)


function ExitFromBiz(thePlayer)
	if lastVisit[thePlayer] then
		local ID = lastVisit[thePlayer]
		if not TeleportTimer[thePlayer] then
			triggerClientEvent("hideHousePage",thePlayer,thePlayer,1)
			fadeCamera(thePlayer,false,0.5)
			TeleportTimer[thePlayer] = setTimer(function()
				-- FIX (bugfix pass 4): the element can be gone by the time this timer
				--   fires (player quit / object destroyed). Without this guard MTA
				--   raises "Bad argument" and the rest of the callback never runs.
				if not isElement(thePlayer) then TeleportTimer[thePlayer] = nil return end -- FIX: also clear the slot, else the player is locked out after reconnect
				setElementPosition(thePlayer,Business[ID]["bX"],Business[ID]["bY"],Business[ID]["bZ"])
				setElementDimension(thePlayer,0)
				setElementInterior(thePlayer,0)
				fadeCamera(thePlayer,true,0.5)
				TeleportTimer[thePlayer] = nil
				unbindKey(thePlayer,"F","down",ExitFromBiz)
				--unbindKey(thePlayer,"Z","down",ExitFromBiz)
			end,1000,1)
		else
			notfSys:addNotification(thePlayer,"Lotfan Spam Nakonid!","warning")
		end
	else
		unbindKey(thePlayer,"F","down",ExitFromBiz)
	end
end


function SetupBusiness()
	if(businessCreated == true) then
		error("Business ha Az Ghabl Create Shode Boodand!")
		return
	end
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM business;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local id = row['bID']
			local x, y, z = row['bX'], row['bY'], row['bZ']
			local int, intx, inty, intz, dim = row['bInterior'], row['bIntX'], row['bIntY'], row['bIntZ'],row["bDimension"]
			local price = row['bPrice']
			local owner = row['bOwner']
			local lock = row['bLock']
			local enter = row['bEnter']
			local forsell = row['bForSell']
			local money = tonumber(row['bMoney'])

			buildBusiness(id, x, y, z, int,dim, intx, inty, intz, money, locked, price, owner, enter, forsell,row["bName"])
		end
		dbFree(query)
	else
		error("Houses Table not Found/empty!")
	end
	businessCreated = true
end

function SetBusinessData(ID, Column, Value)
	Business[ID][Column] = Value
	local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE business SET `"..Column.."` = '"..Value.."' WHERE bID = '"..ID.."';" )
	dbFree(query)
	
	if Column == "bOwner" then
		Business[ID]["bOwnerName"] = GetPlayerNameFromReferralID(Value)
	end
	
	triggerClientEvent("streamBusinessDisplay",getRootElement(),ID,Business[ID])
end

addEvent("createNewBusiness",true)
addEventHandler("createNewBusiness", getRootElement(), function(x, y, z, int, intx, inty, intz, price)
	local query = dbQuery(exports.mysql:getMySQLC(), "INSERT INTO `business` SET  `bOwner` = ?, `bX` = ?, `bY` = ?, `bZ` = ?, `bInterior` = ?, `bDimension` = ?, `bIntX` = ?, `bIntY` = ?, `bIntZ` = ?, `bPrice` = ?",0, x, y, z, int, 0, intx, inty, intz, price)
	local result, numrows = dbPoll(query, dbpTime)
	if(result) then
		local newid = lastID+1
		sendPlayerMessage("CREATED", source, 0, 255, 0)
		buildBusiness(newid, x, y, z, int,0, intx, inty, intz, 0, 0, price, 0, 50, 0)
	end
end)

addCommandHandler("createbiz", function(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) >= 10 then
		if(getElementInterior(thePlayer) == 0) and not isPedInVehicle(thePlayer) then
			triggerClientEvent(thePlayer, "showCreateBizPage", thePlayer)
		end
	end
end)

setTimer(SetupBusiness,500,1)

local onpeneyana = {}
function OpenHouseMenu(thePlayer)
	if lastVisit[thePlayer] then
		local ID = lastVisit[thePlayer]
		if getElementInterior(thePlayer) == 0 then
			
			triggerClientEvent("showHousePage",thePlayer,thePlayer,0,ID,Business[ID]["bOwnerName"],getZoneName(Business[ID]["bX"],Business[ID]["bY"],Business[ID]["bZ"]),Business[ID]["bPrice"],Business[ID]["bLock"],Business[ID]["bForSell"],Business[ID]["bName"],Business[ID]["bEnter"])
		else
			triggerClientEvent("showHousePage",thePlayer,thePlayer,1,ID,Business[ID]["bOwnerName"],getZoneName(Business[ID]["bX"],Business[ID]["bY"],Business[ID]["bZ"]),Business[ID]["bPrice"],Business[ID]["bLock"],Business[ID]["bForSell"],Business[ID]["bName"],Business[ID]["bEnter"])
		end
		--unbindKey(thePlayer,HouseKey,"down",OpenHouseMenu)
	else
		unbindKey(thePlayer,HouseKey,"down",OpenHouseMenu)
	end
end



addEvent("requestTeleportToBiz",true)
addEventHandler("requestTeleportToBiz",getRootElement(),function(thePlayer,ID)
	local ID = tonumber(ID)
	if Business[ID] then
		local voroodi = tonumber(Business[ID]["bEnter"])
		if tonumber(Business[ID]["bOwner"]) >= 1 then
			if getPlayerMoney(thePlayer) < voroodi then
				notfSys:addNotification(thePlayer,"Baraye Vorood Be Biz Bayad $"..voroodi.." Dashte Bashid!","warning")
				return
			end
			takePlayerMoney(thePlayer,voroodi)
			outputChatBox("#ff0000-"..voroodi.."",thePlayer,255,255,255,true)
			local nowBox = tonumber(Business[ID]["bMoney"])
			local nextBox = tonumber(nowBox) + tonumber(voroodi)
			
			Business[ID]["bMoney"] = nextBox
			SetBusinessData(ID,"bMoney",nextBox)
		end
		if not TeleportTimer[thePlayer] then
			triggerClientEvent("hideHousePage",thePlayer,thePlayer,1)
			fadeCamera(thePlayer,false,0.5)
			TeleportTimer[thePlayer] = setTimer(function()
				-- FIX (bugfix pass 4): the element can be gone by the time this timer
				--   fires (player quit / object destroyed). Without this guard MTA
				--   raises "Bad argument" and the rest of the callback never runs.
				if not isElement(thePlayer) then TeleportTimer[thePlayer] = nil return end -- FIX: also clear the slot, else the player is locked out after reconnect
				setElementDimension(thePlayer,Business[ID]["bDimension"])
				setElementInterior(thePlayer,Business[ID]["bInterior"])
				setElementPosition(thePlayer,Business[ID]["bIntX"],Business[ID]["bIntY"]+1.5,Business[ID]["bIntZ"])
				fadeCamera(thePlayer,true,0.5)
				TeleportTimer[thePlayer] = nil
			end,1000,1)
		else
			notfSys:addNotification(thePlayer,"Lotfan Spam Nakonid!","warning")
		end
	end
end)

feeMin = 10
feeMax = 100

addCommandHandler("bizfee",function(thePlayer,cmd,meghdar)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			local myID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
			if myID == tonumber(Business[ID]["bOwner"]) then
				if meghdar then
					local meqdar = math.floor(tonumber(meghdar))
					if meqdar then
						if meqdar >= feeMin and meqdar <= feeMax then
							Business[ID]["bEnter"] = meqdar
							SetBusinessData(ID,"bEnter",meqdar)
							
							sendPlayerMessage("#00ff00Hazine Vorood Be Biz Ba Movafaghiat Be "..meqdar.." Set Shod!",thePlayer)
						else
							sendPlayerMessage("#ff0000Meghdare Fee Bayad Beyne "..feeMin.." ta "..feeMax.." Bashad!",thePlayer)
						end
					else
						sendPlayerMessage("#cdcdcdBezan /bizfee <Meghdar>",thePlayer)
					end
				else
					sendPlayerMessage("#cdcdcdBezan /bizfee <Meghdar>",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000Bayad Sahebe Business Bashid!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)

addCommandHandler("bizwithdraw",function(thePlayer,cmd,meghdar)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			local myID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
			if myID == tonumber(Business[ID]["bOwner"]) then
				if meghdar then
					local meqdar = math.floor(tonumber(meghdar))
					if meqdar then
						if meqdar >= 1 then
							local boxcash = tonumber(Business[ID]["bMoney"])
							if boxcash >= meqdar then
								local nextcash = boxcash - meqdar
								Business[ID]["bMoney"] = nextcash
								SetBusinessData(ID,"bMoney",nextcash)
								
								givePlayerMoney(thePlayer,meqdar)
								
								sendPlayerMessage("#00ff00Shoma Az Biz $"..meqdar.." Pool Bardashtid!",thePlayer)
							else
								sendPlayerMessage("#FF0000In Meghdar Pool Dar Cash Box'e Biz Nist!",thePlayer)
							end
						else
							sendPlayerMessage("#ff0000Lotfan Yek Meghdare Dorost Pool Bardarid!",thePlayer)
						end
					else
						sendPlayerMessage("#cdcdcdBezan /bizwithdraw <Meghdar>",thePlayer)
					end
				else
					sendPlayerMessage("#cdcdcdBezan /bizwithdraw <Meghdar>",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000Bayad Sahebe Business Bashid!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)


addCommandHandler("bizcash",function(thePlayer,cmd,meghdar)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			local myID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
			if myID == tonumber(Business[ID]["bOwner"]) then
				sendPlayerMessage("#00ff00Business Cash Box: $"..Business[ID]["bMoney"].."",thePlayer)
			else
				sendPlayerMessage("#ff0000Bayad Sahebe Business Bashid!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)


addCommandHandler("bizforsell",function(thePlayer,cmd,meghdar)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			local myID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
			if myID == tonumber(Business[ID]["bOwner"]) then
				if meghdar then
					local meqdar = math.floor(tonumber(meghdar))
					if meqdar then
						if meqdar >= 0 then
							local state = tonumber(Business[ID]["bForSell"])
							if meqdar == 0 then
								if state >= 1 then
									Business[ID]["bForSell"] = 0
									SetBusinessData(ID,"bForSell",0)
									
									sendPlayerMessage("#00ff00Shoma In Biz ro Az Foroosh Bardashtid!",thePlayer)
								else
									sendPlayerMessage("#FF0000In Biz Baraye Foroosh Naboode!",thePlayer)
								end
							elseif meqdar >= 1 then
								if state >= 0 then
									local bizprice = tonumber(tonumber(Business[ID]["bPrice"]) * 55) / 100
									local bizpricekol = tonumber(Business[ID]["bPrice"])
									if meqdar >= bizprice and meqdar == bizpricekol then
										Business[ID]["bForSell"] = meqdar
										SetBusinessData(ID,"bForSell",meqdar)

										sendPlayerMessage("#00ff00[Done]:#FFFFFF Shoma In Biz ro Baraye Foroosh Gozashtid!",thePlayer)
										sendPlayerMessage("#00ff00Gheymat: #ffffff$"..meqdar.."",thePlayer)
									else
										sendPlayerMessage("#FF0000Shoma Ejazeye Forooshe Biz Be In Gheymat ra Nadarid!",thePlayer)
									end
								else
									sendPlayerMessage("#FF0000In Biz Baraye Foroosh Hast Alan!",thePlayer)
								end
							end
						else
							sendPlayerMessage("#ff0000Lotfan Yek Meghdare Dorost Vared Konid!",thePlayer)
						end
					else
						sendPlayerMessage("#cdcdcdBezan /bizforsell <Meghdar>",thePlayer)
					end
				else
					sendPlayerMessage("#cdcdcdBezan /bizforsell <Meghdar>",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000Bayad Sahebe Business Bashid!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)

addCommandHandler("bizlock",function(thePlayer,cmd,meghdar)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			local myID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
			if myID == tonumber(Business[ID]["bOwner"]) then
				local state = tonumber(Business[ID]["bLock"])
				if state == 1 then
					Business[ID]["bLock"] = 0
					SetBusinessData(ID,"bLock",0)
					
					sendPlayerMessage("#00FF00Biz Baz Shod!",thePlayer)
				else
					Business[ID]["bLock"] = 1
					SetBusinessData(ID,"bLock",1)
					
					sendPlayerMessage("#FF0000Biz Ghofl Shod!",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000Bayad Sahebe Business Bashid!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)


function IsAccountAvailable(ReferralID)
	if tonumber(ReferralID) then
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				if tonumber(row["pBankPass"]) > 0  then
					local meghdar = row["pBank"]
					dbFree(query)
					return meghdar
				end
			end
		end
		dbFree(query)
	end
	return false
end

addEvent("requestBuyBiz",true)
addEventHandler("requestBuyBiz",getRootElement(),function(thePlayer,ID)
	local ID = tonumber(ID)
	if Business[ID] then
		if tonumber(Business[ID]["bOwner"]) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")) then
			notfSys:addNotification(thePlayer,"In Biz Male Shomast!","warning")
		else
			if Business[ID]["bOwner"] == 0 then
				local bizprice = tonumber(Business[ID]["bPrice"])
				if getPlayerMoney(thePlayer) >= tonumber(bizprice) then
					triggerClientEvent("hideHousePage",thePlayer,thePlayer,0)
					
					SetBusinessData(ID,"bOwner",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")))
					
					Business[ID]["bOwner"] = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
					Business[ID]["bOwnerName"] = tostring(getPlayerName(thePlayer))
					
					Business[ID]["bLock"] = 0
					SetBusinessData(ID,"bLock",0)
					
					Business[ID]["bForSell"] = 0
					SetBusinessData(ID,"bForSell",0)
					
					Business[ID]["bEnter"] = 50
					SetBusinessData(ID,"bEnter",50)
					
					takePlayerMoney(thePlayer,bizprice)
					
					sendPlayerMessage("#00ff00Mobarake , Shoma In Business ro kharidari Kardid!",thePlayer)
					
				else
					notfSys:addNotification(thePlayer,"Shoma Poole Kafi Baraye Kharide In Biz Nadarid!","warning")
				end
			else
				local forsell = tonumber(Business[ID]["bForSell"])
				if forsell == 0 then
					notfSys:addNotification(thePlayer,"In Biz Saheb Dare!","warning")
				else
					if getPlayerMoney(thePlayer) >= forsell then

						local nowOwner = tonumber(Business[ID]["bOwner"])
						local nowName = tostring(Business[ID]["bOwnerName"])
				
						triggerClientEvent("hideHousePage",thePlayer,thePlayer,0)
					
						SetBusinessData(ID,"bOwner",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")))
						
						Business[ID]["bOwner"] = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
						Business[ID]["bOwnerName"] = tostring(getPlayerName(thePlayer))
						
						Business[ID]["bLock"] = 0
						SetBusinessData(ID,"bLock",0)
						
						Business[ID]["bForSell"] = 0
						SetBusinessData(ID,"bForSell",0)
						
						Business[ID]["bEnter"] = 50
						SetBusinessData(ID,"bEnter",50)
						
						takePlayerMoney(thePlayer,forsell)
						
						local CashBox = tonumber(Business[ID]["bMoney"])
						local FinalCash = tonumber(forsell) + tonumber(CashBox)
						Business[ID]["bMoney"] = 0
						SetBusinessData(ID,"bMoney",0)
						
						-- add cash
						local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
						local result, numrows = dbPoll(query, 500)
						if (result and numrows > 0) then
							for index, row in pairs(result) do
								if tonumber(row["pID"]) == tonumber(nowOwner) then
									local kolanCash = tonumber(row["pBank"]) + FinalCash
									local query2 = dbQuery(exports.mysql:getMySQLC(), "UPDATE users SET `pBank` = '"..tonumber(kolanCash).."' WHERE pID = '"..tonumber(nowOwner).."';" )
									dbFree(query2)
								end
							end
						end
						dbFree(query)
						
						sendPlayerMessage("#00ff00Mobarake , Shoma In Business ro Az Sahebesh("..nowName..") kharidari Kardid!",thePlayer)
						
						if getPlayerFromName(nowName) then
							sendPlayerMessage("#00ff00[Info]:#FFFFFF Business("..ID..") Shoma Tavasote "..getPlayerName(thePlayer).." Kharide Shod!",getPlayerFromName(nowName))
							sendPlayerMessage("#00ff00+ $"..forsell.." ( Bank )",getPlayerFromName(nowName))
							sendPlayerMessage("#00ff00+ $"..CashBox.." ( Bank )",getPlayerFromName(nowName))
							
						end

					else
						notfSys:addNotification(thePlayer,"Shoma Poole Kafi Baraye Kharide In Biz Nadarid!","warning")
					end
				end
			end
		end
	end
end)

addCommandHandler("sellbiz",function(thePlayer,cmd,meghdar)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			local myID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
			if tonumber(Business[ID]["bOwner"]) == tonumber(myID) then
				local bizprice = tonumber(tonumber(Business[ID]["bPrice"]) * 55) / 100
				if bizprice >= 1 then
					triggerClientEvent("hideHousePage",thePlayer,thePlayer,0)
					triggerClientEvent("closeBizPage",thePlayer,thePlayer)
					SetBusinessData(ID,"bOwner",0)
					
					Business[ID]["bOwner"] = 0
					Business[ID]["bOwnerName"] = "no-one"
					
					givePlayerMoney(thePlayer,bizprice)
					
					sendPlayerMessage("#ff0000Shoma In Biz ro Be Server Forookhti!",thePlayer)
				end
			else
				notfSys:addNotification(thePlayer,"Shoma Nemitooni Biz ro Sell Bedi!","warning")
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)


-- Markets

marketPeds = {
-- {SkinID,X,Y,Z,RotZ,Dim,Int}
{40,-23.3818359375,-57.3271484375,1003.546875,358,0,6}
}

markets = {
-- {X,Y,Z,Dim,Int},
{-23.41015625,-55.3330078125,1002.6,0,6}
}

market = {
	ped = {
	
	},
	
	marker = {
	
	},
}

ismarket = {}

for i=1,#marketPeds do
	market.ped[i] = createPed(marketPeds[i][1],marketPeds[i][2],marketPeds[i][3],marketPeds[i][4])
	setElementRotation(market.ped[i],0,0,marketPeds[i][5])
	setElementInterior(market.ped[i],marketPeds[i][7])
	setElementDimension(market.ped[i],marketPeds[i][6])
	setElementData(market.ped[i],"PedGM",true)
	setElementFrozen(market.ped[i],true)
end

for i=1,#markets do
	market.marker[i] = createMarker(markets[i][1],markets[i][2],markets[i][3],"cylinder",1.00,0,50,180,110)
	setElementInterior(market.marker[i],markets[i][5])
	setElementDimension(market.marker[i],markets[i][4])
	ismarket[market.marker[i]] = true
end

addEventHandler("onMarkerHit",getRootElement(),function(thePlayer,mc)
	if mc == true then
		if getElementType(thePlayer) == "player" then
			if ismarket[source] then
			triggerClientEvent("iwantmarket",thePlayer,thePlayer,"show")
			end
		end
	end
end)

addEventHandler("onMarkerLeave",getRootElement(),function(thePlayer,mc)
	if mc == true then
		if getElementType(thePlayer) == "player" then
			triggerClientEvent("iwantmarket",thePlayer,thePlayer,"hide")
		end
	end
end)

addEvent("requestBuyFromMarket",true)
addEventHandler("requestBuyFromMarket",getRootElement(),function(thePlayer,item)
	if item == 1 then
		local FreeSlot = inventory:GetPlayerFreeSlot(thePlayer)
		if FreeSlot >= 1 then
			if getPlayerMoney(thePlayer) >= 500 then
				inventory:GivePlayerItem(thePlayer,21,1,FreeSlot)
				takePlayerMoney(thePlayer,500)
				sendPlayerMessage("#38ff7e[Market]#FFFFFF Shoma #38ff7e1 Adad#FFFFFF Cigar Kharidari Kardid!",thePlayer)
				sendPlayerMessage("#38ff7e[Market]#FFFFFF Baraye Estefade Az #38ff7eF2#FFFFFF Estefade Konid!",thePlayer)
			else
				sendPlayerMessage("#fc3600[Error] Poole Shoma Kafi Nemibashad!",thePlayer)
			end
		else
			sendPlayerMessage("#fc3600[Error] Shoma Dar Inventory'e Khod Fazaye Khali Nadarid!",thePlayer)
		end
	elseif item == 2 then
		local FreeSlot = inventory:GetPlayerFreeSlot(thePlayer)
		if FreeSlot >= 1 then
			if getPlayerMoney(thePlayer) >= 100 then
				inventory:GivePlayerItem(thePlayer,20,1,FreeSlot)
				takePlayerMoney(thePlayer,100)
				sendPlayerMessage("#38ff7e[Market]#FFFFFF Shoma #38ff7e1 Adad#FFFFFF Fandak Kharidari Kardid!",thePlayer)
				sendPlayerMessage("#38ff7e[Market]#FFFFFF Baraye Estefade Az #38ff7eF2#FFFFFF Estefade Konid!",thePlayer)
			else
				sendPlayerMessage("#fc3600[Error] Poole Shoma Kafi Nemibashad!",thePlayer)
			end
		else
			sendPlayerMessage("#fc3600[Error] Shoma Dar Inventory'e Khod Fazaye Khali Nadarid!",thePlayer)
		end
	elseif item == 3 then
		local FreeSlot = inventory:GetPlayerFreeSlot(thePlayer)
		if FreeSlot >= 1 then
			if getPlayerMoney(thePlayer) >= 200 then
				inventory:GivePlayerItem(thePlayer,22,1,FreeSlot)
				takePlayerMoney(thePlayer,200)
				sendPlayerMessage("#38ff7e[Market]#FFFFFF Shoma #38ff7e1 Adad#FFFFFF SimCard Kharidari Kardid!",thePlayer)
				sendPlayerMessage("#38ff7e[Market]#FFFFFF Baraye Estefade Az #38ff7eF2#FFFFFF Estefade Konid!",thePlayer)
			else
				sendPlayerMessage("#fc3600[Error] Poole Shoma Kafi Nemibashad!",thePlayer)
			end
		else
			sendPlayerMessage("#fc3600[Error] Shoma Dar Inventory'e Khod Fazaye Khali Nadarid!",thePlayer)
		end
	end
end)

local IsBicycle = {
	[509] = true , [481] = true , [510] = true ,
}


--[[sprayTimer = {}

createPickup(1025.11328125,-1032.4716796875,31.908157348633,3,1239,0)
createPickup(488.4306640625,-1732.5341796875,11.196106910706,3,1239,0)
createPickup(-2714.4072265625,217.4013671875,4.2899112701416,3,1239,0)
createPickup(-1906.3349609375,275.5234375,41.039070129395,3,1239,0) -- sana land
createPickup(2074.62109375,-1831.486328125,13.546875,3,1239,0)


createPickup(2393.3134765625,1481.955078125,10.8203125,3,1239,0)
createPickup(1965.9580078125,2162.5791015625,10.8203125,3,1239,0)
createPickup(-99.8720703125,1109.17578125,19.7421875,3,1239,0)

SprayPrice = 100


addCommandHandler("spray",function(thePlayer,cmd)
	local x,y,z = getElementPosition(thePlayer)
	if getDistanceBetweenPoints3D(x,y,z,1025.11328125,-1032.4716796875,31.908157348633) <= 5 then
		if isPedInVehicle(thePlayer) then
			local Veh = getPedOccupiedVehicle(thePlayer)
			if not sprayTimer[Veh] then
				local VehID = getElementModel(Veh)
				if not IsBicycle[VehID] then
					local nID = 4
					local voroodi = tonumber(Business[nID]["bEnter"])
					if getPlayerMoney(thePlayer) >= tonumber(Business[nID]["bEnter"]) then
						if tonumber(Business[nID]["bOwner"]) >= 1 then
							local nowBox = tonumber(Business[nID]["bMoney"])
							local nextBox = tonumber(nowBox) + tonumber(voroodi)
							
							Business[nID]["bMoney"] = nextBox
							SetBusinessData(nID,"bMoney",nextBox)
						end
						setElementAlpha(Veh,100)
						takePlayerMoney(thePlayer,voroodi)
						sprayTimer[Veh] = setTimer(function(thePlayer,Vehicle)
							if thePlayer then
								setElementAlpha(Vehicle,255)
								fixVehicle(Vehicle)
								
								sendPlayerMessage("#00FF00Khodro Tamir Shod!",thePlayer)
							end
							sprayTimer[Vehicle] = nil
						end,1500,1,thePlayer,Veh)
					else
						sendPlayerMessage("#fc3600[Error]:#FFFFFFPoole shoma Kafi Nemibashad!",thePlayer)
					end
				else
					sendPlayerMessage("#fc3600[Error]:#FFFFFFDocharkhe ro Nemishe Spray Kard!",thePlayer)
				end
			end
		else
			sendPlayerMessage("#fc3600[Error]:#FFFFFFBayad Savare Yek Khodro Bashid!",thePlayer)
		end
	elseif getDistanceBetweenPoints3D(x,y,z,488.4306640625,-1732.5341796875,11.196106910706) <= 5 then
		if isPedInVehicle(thePlayer) then
			local Veh = getPedOccupiedVehicle(thePlayer)
			if not sprayTimer[Veh] then
				local VehID = getElementModel(Veh)
				if not IsBicycle[VehID] then
					local nID = 5
					local voroodi = tonumber(Business[nID]["bEnter"])
					if getPlayerMoney(thePlayer) >= tonumber(Business[nID]["bEnter"]) then
						if tonumber(Business[nID]["bOwner"]) >= 1 then
							local nowBox = tonumber(Business[nID]["bMoney"])
							local nextBox = tonumber(nowBox) + tonumber(voroodi)
							
							Business[nID]["bMoney"] = nextBox
							SetBusinessData(nID,"bMoney",nextBox)
						end
						setElementAlpha(Veh,100)
						takePlayerMoney(thePlayer,voroodi)
						sprayTimer[Veh] = setTimer(function(thePlayer,Vehicle)
							if thePlayer then
								setElementAlpha(Vehicle,255)
								fixVehicle(Vehicle)
								
								sendPlayerMessage("#00FF00Khodro Tamir Shod!",thePlayer)
							end
							sprayTimer[Vehicle] = nil
						end,1500,1,thePlayer,Veh)
					else
						sendPlayerMessage("#fc3600[Error]:#FFFFFFPoole shoma Kafi Nemibashad!",thePlayer)
					end
				else
					sendPlayerMessage("#fc3600[Error]:#FFFFFFDocharkhe ro Nemishe Spray Kard!",thePlayer)
				end
			end
		else
			sendPlayerMessage("#fc3600[Error]:#FFFFFFBayad Savare Yek Khodro Bashid!",thePlayer)
		end
	elseif getDistanceBetweenPoints3D(x,y,z,2074.62109375,-1831.486328125,13.546875) <= 5 then
		if isPedInVehicle(thePlayer) then
			local Veh = getPedOccupiedVehicle(thePlayer)
			if not sprayTimer[Veh] then
				local VehID = getElementModel(Veh)
				if not IsBicycle[VehID] then
					local nID = 15
					local voroodi = tonumber(Business[nID]["bEnter"])
					if getPlayerMoney(thePlayer) >= tonumber(Business[nID]["bEnter"]) then
						if tonumber(Business[nID]["bOwner"]) >= 1 then
							local nowBox = tonumber(Business[nID]["bMoney"])
							local nextBox = tonumber(nowBox) + tonumber(voroodi)
							
							Business[nID]["bMoney"] = nextBox
							SetBusinessData(nID,"bMoney",nextBox)
						end
						setElementAlpha(Veh,100)
						takePlayerMoney(thePlayer,voroodi)
						sprayTimer[Veh] = setTimer(function(thePlayer,Vehicle)
							if thePlayer then
								setElementAlpha(Vehicle,255)
								fixVehicle(Vehicle)
								
								sendPlayerMessage("#00FF00Khodro Tamir Shod!",thePlayer)
							end
							sprayTimer[Vehicle] = nil
						end,1500,1,thePlayer,Veh)
					else
						sendPlayerMessage("#fc3600[Error]:#FFFFFFPoole shoma Kafi Nemibashad!",thePlayer)
					end
				else
					sendPlayerMessage("#fc3600[Error]:#FFFFFFDocharkhe ro Nemishe Spray Kard!",thePlayer)
				end
			end
		else
			sendPlayerMessage("#fc3600[Error]:#FFFFFFBayad Savare Yek Khodro Bashid!",thePlayer)
		end
	elseif getDistanceBetweenPoints3D(x,y,z,-2714.4072265625,217.4013671875,4.2899112701416,14) <= 5 then 
		if isPedInVehicle(thePlayer) then
			local Veh = getPedOccupiedVehicle(thePlayer)
			if not sprayTimer[Veh] then
				local VehID = getElementModel(Veh)
				if not IsBicycle[VehID] then
					if getPlayerMoney(thePlayer) >= SprayPrice then
						setElementAlpha(Veh,100)
						takePlayerMoney(thePlayer,SprayPrice)
						sprayTimer[Veh] = setTimer(function(thePlayer,Vehicle)
							if thePlayer then
								setElementAlpha(Vehicle,255)
								fixVehicle(Vehicle)
								
								sendPlayerMessage("#00FF00Khodro Tamir Shod!",thePlayer)
							end
							sprayTimer[Vehicle] = nil
						end,1500,1,thePlayer,Veh)
					else
						sendPlayerMessage("#fc3600[Error]:#FFFFFFPoole shoma Kafi Nemibashad!",thePlayer)
					end
				else
					sendPlayerMessage("#fc3600[Error]:#FFFFFFDocharkhe ro Nemishe Spray Kard!",thePlayer)
				end
			end
		else
			sendPlayerMessage("#fc3600[Error]:#FFFFFFBayad Savare Yek Khodro Bashid!",thePlayer)
		end
	elseif getDistanceBetweenPoints3D(x,y,z,2393.3134765625,1481.955078125,10.8203125,14) <= 5 then 
		if isPedInVehicle(thePlayer) then
			local Veh = getPedOccupiedVehicle(thePlayer)
			if not sprayTimer[Veh] then
				local VehID = getElementModel(Veh)
				if not IsBicycle[VehID] then
					if getPlayerMoney(thePlayer) >= SprayPrice then
						setElementAlpha(Veh,100)
						takePlayerMoney(thePlayer,SprayPrice)
						sprayTimer[Veh] = setTimer(function(thePlayer,Vehicle)
							if thePlayer then
								setElementAlpha(Vehicle,255)
								fixVehicle(Vehicle)
								
								sendPlayerMessage("#00FF00Khodro Tamir Shod!",thePlayer)
							end
							sprayTimer[Vehicle] = nil
						end,1500,1,thePlayer,Veh)
					else
						sendPlayerMessage("#fc3600[Error]:#FFFFFFPoole shoma Kafi Nemibashad!",thePlayer)
					end
				else
					sendPlayerMessage("#fc3600[Error]:#FFFFFFDocharkhe ro Nemishe Spray Kard!",thePlayer)
				end
			end
		else
			sendPlayerMessage("#fc3600[Error]:#FFFFFFBayad Savare Yek Khodro Bashid!",thePlayer)
		end
		elseif getDistanceBetweenPoints3D(x,y,z,1965.9580078125,2162.5791015625,10.8203125,14) <= 5 then 
		if isPedInVehicle(thePlayer) then
			local Veh = getPedOccupiedVehicle(thePlayer)
			if not sprayTimer[Veh] then
				local VehID = getElementModel(Veh)
				if not IsBicycle[VehID] then
					if getPlayerMoney(thePlayer) >= SprayPrice then
						setElementAlpha(Veh,100)
						takePlayerMoney(thePlayer,SprayPrice)
						sprayTimer[Veh] = setTimer(function(thePlayer,Vehicle)
							if thePlayer then
								setElementAlpha(Vehicle,255)
								fixVehicle(Vehicle)
								
								sendPlayerMessage("#00FF00Khodro Tamir Shod!",thePlayer)
							end
							sprayTimer[Vehicle] = nil
						end,1500,1,thePlayer,Veh)
					else
						sendPlayerMessage("#fc3600[Error]:#FFFFFFPoole shoma Kafi Nemibashad!",thePlayer)
					end
				else
					sendPlayerMessage("#fc3600[Error]:#FFFFFFDocharkhe ro Nemishe Spray Kard!",thePlayer)
				end
			end
		else
			sendPlayerMessage("#fc3600[Error]:#FFFFFFBayad Savare Yek Khodro Bashid!",thePlayer)
		end
	elseif getDistanceBetweenPoints3D(x,y,z,-99.8720703125,1109.17578125,19.7421875,14) <= 5 then 
		if isPedInVehicle(thePlayer) then
			local Veh = getPedOccupiedVehicle(thePlayer)
			if not sprayTimer[Veh] then
				local VehID = getElementModel(Veh)
				if not IsBicycle[VehID] then
					if getPlayerMoney(thePlayer) >= SprayPrice then
						setElementAlpha(Veh,100)
						takePlayerMoney(thePlayer,SprayPrice)
						sprayTimer[Veh] = setTimer(function(thePlayer,Vehicle)
							if thePlayer then
								setElementAlpha(Vehicle,255)
								fixVehicle(Vehicle)
								
								sendPlayerMessage("#00FF00Khodro Tamir Shod!",thePlayer)
							end
							sprayTimer[Vehicle] = nil
						end,1500,1,thePlayer,Veh)
					else
						sendPlayerMessage("#fc3600[Error]:#FFFFFFPoole shoma Kafi Nemibashad!",thePlayer)
					end
				else
					sendPlayerMessage("#fc3600[Error]:#FFFFFFDocharkhe ro Nemishe Spray Kard!",thePlayer)
				end
			end
		else
			sendPlayerMessage("#fc3600[Error]:#FFFFFFBayad Savare Yek Khodro Bashid!",thePlayer)
		end
	elseif getDistanceBetweenPoints3D(x,y,z,-1906.3349609375,275.5234375,41.039070129395) <= 5 then -- Sana Land
		if isPedInVehicle(thePlayer) then
			local Veh = getPedOccupiedVehicle(thePlayer)
			if not sprayTimer[Veh] then
				local VehID = getElementModel(Veh)
				if not IsBicycle[VehID] then
					local nID = 9
					local voroodi = tonumber(Business[nID]["bEnter"])
					if getPlayerMoney(thePlayer) >= tonumber(Business[nID]["bEnter"]) then
						if tonumber(Business[nID]["bOwner"]) >= 1 then
							local nowBox = tonumber(Business[nID]["bMoney"])
							local nextBox = tonumber(nowBox) + tonumber(voroodi)
							
							Business[nID]["bMoney"] = nextBox
							SetBusinessData(nID,"bMoney",nextBox)
						end
						setElementAlpha(Veh,100)
						takePlayerMoney(thePlayer,voroodi)
						sprayTimer[Veh] = setTimer(function(thePlayer,Vehicle)
							if thePlayer then
								setElementAlpha(Vehicle,255)
								fixVehicle(Vehicle)
								
								sendPlayerMessage("#00FF00Khodro Tamir Shod!",thePlayer)
							end
							sprayTimer[Vehicle] = nil
						end,1500,1,thePlayer,Veh)
					else
						sendPlayerMessage("#fc3600[Error]:#FFFFFFPoole shoma Kafi Nemibashad!",thePlayer)
					end
				else
					sendPlayerMessage("#fc3600[Error]:#FFFFFFDocharkhe ro Nemishe Spray Kard!",thePlayer)
				end
			end
		else
			sendPlayerMessage("#fc3600[Error]:#FFFFFFBayad Savare Yek Khodro Bashid!",thePlayer)
		end
	end
end,false,false)]]--


local gunshopMarker = createMarker(294.8935546875,-37.9775390625,1000.57,"cylinder",1.20,20,85,150,100)
setElementInterior(gunshopMarker,1)
setElementDimension(gunshopMarker,0)

addEventHandler("onMarkerHit",gunshopMarker,function(thePlayer,matchingDimension)
	if matchingDimension then
		if getElementType(thePlayer) == "player" then
			triggerClientEvent("showWeapons",thePlayer,thePlayer)
		end
	end
end)

addEventHandler("onMarkerLeave",gunshopMarker,function(thePlayer,matchingDimension)
	if matchingDimension then
		if getElementType(thePlayer) == "player" then
			triggerClientEvent("hideWeapons",thePlayer,thePlayer)
		end
	end
end)

DefaultAmmo = 100

addEvent("clientWantBuyGun",true)
addEventHandler("clientWantBuyGun",getRootElement(),function(thePlayer,ID,Price)
	local ID = tonumber(ID)
	local Price = tonumber(Price)
	if tonumber(getPlayerMoney(thePlayer)) >= Price then
		giveWeapon(thePlayer,ID,DefaultAmmo,true)
		takePlayerMoney(thePlayer,Price)
		sendPlayerMessage("#ffa700[Weapons]:#FFFFFF Shoma #ffa700"..getWeaponNameFromID(ID).."#FFFFFF Ba #ffa700"..DefaultAmmo.." Tir#FFFFFF Kharidari Kardid!",thePlayer)
		sendPlayerMessage("#ff0000- $"..convertNumber(Price).."",thePlayer)
	else
		exports["notf"]:addNotification(thePlayer,"Poole Shoma Kafi Nemibashad!","error")
	end
end)

addCommandHandler("bizhelp",function(thePlayer,cmd)
	local adminLevel = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
	
	sendPlayerMessage("#00FF00[Business-Help]:#FFFFFF CMD: #00FF00/bizfee#FFFFFF Help:#00ff00 Taein Kardane Voroodie Biz!",thePlayer)
	sendPlayerMessage("#00FF00[Business-Help]:#FFFFFF CMD: #00FF00/bizlock#FFFFFF Help:#00ff00 Ghofl/Baz Kardane Biz!",thePlayer)
	sendPlayerMessage("#00FF00[Business-Help]:#FFFFFF CMD: #00FF00/bizforsell#FFFFFF Help:#00ff00 Taeine Gheymate Forooshe Biz!",thePlayer)
	sendPlayerMessage("#00FF00[Business-Help]:#FFFFFF CMD: #00FF00/bizwithdraw#FFFFFF Help:#00ff00 Bardashte Pool Az Cash Box'e Biz!",thePlayer)
	
	if adminLevel >= 10 then
		sendPlayerMessage("#FF0000[Business-Help]:#FFFFFF CMD: #FF0000/abizfee#FFFFFF Help:#FF0000 Taein Kardane Voroodie Biz!",thePlayer)
		sendPlayerMessage("#FF0000[Business-Help]:#FFFFFF CMD: #FF0000/abizlock#FFFFFF Help:#FF0000 Ghofl/Baz Kardane Biz!",thePlayer)
		sendPlayerMessage("#FF0000[Business-Help]:#FFFFFF CMD: #FF0000/abizforsell#FFFFFF Help:#FF0000 Taeine Gheymate Forooshe Biz!",thePlayer)
		sendPlayerMessage("#FF0000[Business-Help]:#FFFFFF CMD: #FF0000/abizwithdraw#FFFFFF Help:#FF0000 Bardashte Pool Az Cash Box'e Biz!",thePlayer)
		sendPlayerMessage("#FF0000[Business-Help]:#FFFFFF CMD: #FF0000/abizowner#FFFFFF Help:#FF0000 Bardashte Pool Az Cash Box'e Biz!",thePlayer)
	end
end)


addCommandHandler("rahnama",function(thePlayer,cmd,whattohelp)
	if whattohelp then
		local helpn = string.lower(whattohelp)
		if helpn == "helper" then
			
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) >= 1 then
				sendPlayerMessage("#00FF00[Helper-Help]:#FFFFFF CMD: #00FF00/hgoto#FFFFFF Help:#00ff00 Goto Kardan Be Player!",thePlayer)
				sendPlayerMessage("#00FF00[Helper-Help]:#FFFFFF CMD: #00FF00/hback#FFFFFF Help:#00ff00 Bazgasht Be Makane Ghabli",thePlayer)
				sendPlayerMessage("#00FF00[Helper-Help]:#FFFFFF CMD: #00FF00/hv#FFFFFF Help:#00ff00 Spawn Kardane Mashine Helperi!",thePlayer)
				sendPlayerMessage("#00FF00[Helper-Help]:#FFFFFF CMD: #00FF00/dhv#FFFFFF Help:#00ff00 Delete Kardane Mashine Helperi!",thePlayer)
				sendPlayerMessage("#00FF00[Helper-Help]:#FFFFFF CMD: #00FF00/hr#FFFFFF Help:#00ff00 Chat Kardan Ba Playeri Ke Helpesho Baz Kardid!",thePlayer)
				sendPlayerMessage("#00FF00[Helper-Help]:#FFFFFF CMD: #00FF00/hc#FFFFFF Help:#00ff00 Chat Kardan Ba Helper Haye Digar!",thePlayer)
				sendPlayerMessage("#00FF00[Helper-Help]:#FFFFFF CMD: #00FF00/cmh#FFFFFF Help:#00ff00 Bastane Help!",thePlayer)
			else
				sendPlayerMessage("#FF0000Shoma Helper Nisti!",thePlayer)
			end
		elseif helpn == "leader" then
			
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) >= 6 then
				sendPlayerMessage("#00FF00[Leader-Help]:#FFFFFF CMD: #00FF00/lc#FFFFFF Help:#00ff00 Chat Kardan Ba Baghie Leadera!",thePlayer)
				sendPlayerMessage("#00FF00[Leader-Help]:#FFFFFF CMD: #00FF00/rv#FFFFFF Help:#00ff00 Respawn Kardane Mashin Haye Faction",thePlayer)
				sendPlayerMessage("#00FF00[Leader-Help]:#FFFFFF CMD: #00FF00/gov#FFFFFF Help:#00ff00 Ersale Government (Department)",thePlayer)
				sendPlayerMessage("#00FF00[Leader-Help]:#FFFFFF CMD: #00FF00/fkick#FFFFFF Help:#00ff00 Kick Kardane Player Az Faction!",thePlayer)
				sendPlayerMessage("#00FF00[Leader-Help]:#FFFFFF CMD: #00FF00/finvite#FFFFFF Help:#00ff00 Invite Kardane Player Be Faction!",thePlayer)
				sendPlayerMessage("#00FF00[Leader-Help]:#FFFFFF CMD: #00FF00/fskin#FFFFFF Help:#00ff00 Taghire Skine Player Haye Faction!",thePlayer)
				sendPlayerMessage("#00FF00[Leader-Help]:#FFFFFF CMD: #00FF00/setfrank#FFFFFF Help:#00ff00 Set Kardane Ranke Member Haye Faction!",thePlayer)
				sendPlayerMessage("#00FF00[Leader-Help]:#FFFFFF CMD: #00FF00/faction#FFFFFF Help:#00ff00 Panele Modiriate Faction!",thePlayer)
			else
				sendPlayerMessage("#FF0000Shoma Leader Nisti!",thePlayer)
			end
		end
	else
		sendPlayerMessage("#cdcdcdBezan /rahnama <Helper-Leader-Clan>",thePlayer)
	end
end)

-- Admin CMDS

feeMin = 10
feeMax = 100

addCommandHandler("abizfee",function(thePlayer,cmd,meghdar)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			
			local myID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
			
	if getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin") >= 10 then
				if meghdar then
					local meqdar = math.floor(tonumber(meghdar))
					if meqdar then
						if meqdar >= feeMin and meqdar <= feeMax then
							Business[ID]["bEnter"] = meqdar
							SetBusinessData(ID,"bEnter",meqdar)
							
							sendPlayerMessage("#00ff00Hazine Vorood Be Biz Ba Movafaghiat Be "..meqdar.." Set Shod!",thePlayer)
						else
							sendPlayerMessage("#ff0000Meghdare Fee Bayad Beyne "..feeMin.." ta "..feeMax.." Bashad!",thePlayer)
						end
					else
						sendPlayerMessage("#cdcdcdBezan /abizfee <Meghdar>",thePlayer)
					end
				else
					sendPlayerMessage("#cdcdcdBezan /abizfee <Meghdar>",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000Shoma Nemitooni Az In CMD Estefade Koni!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)

addCommandHandler("abizwithdraw",function(thePlayer,cmd,meghdar)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			
			local myID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
	if getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin") >= 10 then
				if meghdar then
					local meqdar = math.floor(tonumber(meghdar))
					if meqdar then
						if meqdar >= 1 then
							local boxcash = tonumber(Business[ID]["bMoney"])
							if boxcash >= meqdar then
								local nextcash = boxcash - meqdar
								Business[ID]["bMoney"] = nextcash
								SetBusinessData(ID,"bMoney",nextcash)
								
								givePlayerMoney(thePlayer,meqdar)
								
								sendPlayerMessage("#00ff00Shoma Az Biz $"..meqdar.." Pool Bardashtid!",thePlayer)
							else
								sendPlayerMessage("#FF0000In Meghdar Pool Dar Cash Box'e Biz Nist!",thePlayer)
							end
						else
							sendPlayerMessage("#ff0000Lotfan Yek Meghdare Dorost Pool Bardarid!",thePlayer)
						end
					else
						sendPlayerMessage("#cdcdcdBezan /abizwithdraw <Meghdar>",thePlayer)
					end
				else
					sendPlayerMessage("#cdcdcdBezan /abizwithdraw <Meghdar>",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000Shoma Nemitooni Az In CMD Estefade Koni!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)


addCommandHandler("abizforsell",function(thePlayer,cmd,meghdar)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			local myID = tonumber(accSys:GetPlayerData(thePlayer,"pID"))
	if getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin") >= 10 then
				if meghdar then
					local meqdar = math.floor(tonumber(meghdar))
					if meqdar then
						if meqdar >= 0 then
							local state = tonumber(Business[ID]["bForSell"])
							if meqdar == 0 then
								if state >= 1 then
									Business[ID]["bForSell"] = 0
									SetBusinessData(ID,"bForSell",0)
									
									sendPlayerMessage("#00ff00Shoma In Biz ro Az Foroosh Bardashtid!",thePlayer)
								else
									sendPlayerMessage("#FF0000In Biz Baraye Foroosh Naboode!",thePlayer)
								end
							elseif meqdar >= 1 then
								if state >= 0 then
									local bizprice = tonumber(tonumber(Business[ID]["bPrice"]) * 55) / 100
									if meqdar >= bizprice then
										Business[ID]["bForSell"] = meqdar
										SetBusinessData(ID,"bForSell",meqdar)

										sendPlayerMessage("#00ff00[Done]:#FFFFFF Shoma In Biz ro Baraye Foroosh Gozashtid!",thePlayer)
										sendPlayerMessage("#00ff00Gheymat: #ffffff$"..meqdar.."",thePlayer)
									else
										sendPlayerMessage("#FF0000Shoma Ejazeye Forooshe Biz Be In Gheymat ra Nadarid!",thePlayer)
									end
								else
									sendPlayerMessage("#FF0000In Biz Baraye Foroosh Hast Alan!",thePlayer)
								end
							end
						else
							sendPlayerMessage("#ff0000Lotfan Yek Meghdare Dorost Vared Konid!",thePlayer)
						end
					else
						sendPlayerMessage("#cdcdcdBezan /abizforsell <Meghdar>",thePlayer)
					end
				else
					sendPlayerMessage("#cdcdcdBezan /abizforsell <Meghdar>",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000Shoma Nemitooni Az In CMD Estefade Koni!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)

addCommandHandler("abizlock",function(thePlayer,cmd,meghdar)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			local myID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
	if getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin") >= 10 then
				local state = tonumber(Business[ID]["bLock"])
				if state == 1 then
					Business[ID]["bLock"] = 0
					SetBusinessData(ID,"bLock",0)
					
					sendPlayerMessage("#00FF00Biz Baz Shod!",thePlayer)
				else
					Business[ID]["bLock"] = 1
					SetBusinessData(ID,"bLock",1)
					
					sendPlayerMessage("#FF0000Biz Ghofl Shod!",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000Shoma Nemitooni Az In CMD Estefade Koni!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)


addCommandHandler("abizowner",function(thePlayer,cmd,target)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			
			local myID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
	        if getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin") >= 10 then
				if target then
					local taraf = miscSys:findPlayer(thePlayer,target)
					if taraf then
						
						local tarafID = tonumber(getElementData(accSys:getPlayerAcc(taraf), "pID"))
						SetBusinessData(ID,"bOwner",getElementData(accSys:getPlayerAcc(taraf), "pID"))
						
						Business[ID]["bOwner"] = tonumber(getElementData(accSys:getPlayerAcc(taraf), "pID"))
						Business[ID]["bOwnerName"] = tostring(getPlayerName(taraf))
						
						Business[ID]["bLock"] = 0
						SetBusinessData(ID,"bLock",0)
						
						Business[ID]["bForSell"] = 0
						SetBusinessData(ID,"bForSell",0)
						
						Business[ID]["bEnter"] = 50
						SetBusinessData(ID,"bEnter",50)
						
						sendPlayerMessage("#00FF00In Business Be "..getPlayerName(thePlayer).." Dade Shod!",thePlayer)
					else
						SetBusinessData(ID,"bOwner",0)
						
						Business[ID]["bOwner"] = 0
						Business[ID]["bOwnerName"] = "no-one"
						
						Business[ID]["bLock"] = 0
						SetBusinessData(ID,"bLock",0)
						
						Business[ID]["bForSell"] = 0
						SetBusinessData(ID,"bForSell",0)
						
						Business[ID]["bEnter"] = 50
						SetBusinessData(ID,"bEnter",50)
						
						sendPlayerMessage("#00FF00In Business Dige Owner Nadare!",thePlayer)
					end
				else
					sendPlayerMessage("#cdcdcdBezan /abizowner <Partofname/ID>",thePlayer)
				end
			else
				sendPlayerMessage("#ff0000Shoma Nemitooni Az In CMD Estefade Koni!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)


addCommandHandler("abizcash",function(thePlayer,cmd,meghdar)
	if lastVisit[thePlayer] then
		local ID = tonumber(lastVisit[thePlayer])
		if Business[ID] then
			
			local myID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
	if getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin") >= 10 then
				sendPlayerMessage("#00ff00Business Cash Box: $"..Business[ID]["bMoney"].."",thePlayer)
			else
				sendPlayerMessage("#ff0000Bayad Sahebe Business Bashid!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000Moshkeli Pish Oomade Lotfan /Report Bedid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000Bayad Jeloye Business Bashid!",thePlayer)
	end
end)

local skinshopkeeper = createPed(1,207.078125 ,-127.806640625 ,1003.5078125)
setElementRotation(skinshopkeeper,0,0,180)
setElementInterior(skinshopkeeper,3)
setElementData(skinshopkeeper,"PedGM",true)
setElementFrozen(skinshopkeeper,true)

local manmarer = createMarker(207.8310546875 ,-129.5,1002.607812,"cylinder",1.00,51,153,255,255)
local womanmarer = createMarker(206.35937 ,-129.5 ,1002.607812,"cylinder",1.00,255,51,255,255)
setElementInterior( manmarer, 3 )
setElementDimension( manmarer, 0 )
setElementInterior( womanmarer, 3 )
setElementDimension( womanmarer, 0 )

addEventHandler("onMarkerHit",manmarer,function(thePlayer)
	if isElement(thePlayer) then
		if getElementType(thePlayer) == "player" then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pSex")) == 1 then
				local x,y,z = getElementPosition(thePlayer)
				if getDistanceBetweenPoints3D(x,y,z,207.078125 ,-127.806640625 ,1003.5078125) <= 15 and getElementInterior(thePlayer) == 3 and getElementDimension(thePlayer) == 0 and not isPedInVehicle(thePlayer) then
					triggerClientEvent("toggleskinshop",thePlayer,thePlayer,true,tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGoldPremium")),tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pSex")))
					setElementPosition(thePlayer,204.853515625,-7.826171875,1015.2109375)

				end
			end
		end
	end
end)

addEventHandler("onMarkerHit",womanmarer,function(thePlayer)
	if isElement(thePlayer) then
		if getElementType(thePlayer) == "player" then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pSex")) == 2 then
				local x,y,z = getElementPosition(thePlayer)
				if getDistanceBetweenPoints3D(x,y,z,207.078125 ,-127.806640625 ,1003.5078125) <= 15 and getElementInterior(thePlayer) == 3 and getElementDimension(thePlayer) == 0 and not isPedInVehicle(thePlayer) then
					triggerClientEvent("toggleskinshop",thePlayer,thePlayer,true,tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGoldPremium")),tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pSex")))
					setElementPosition(thePlayer,204.853515625,-7.826171875,1015.2109375)

				end
			end
		end
	end
end)
addEvent("buyskin",true)
addEventHandler("buyskin",getRootElement(),function(thePlayer,skinid)
	setCameraTarget(thePlayer,thePlayer)
	setElementPosition(thePlayer,199.1884765625 ,-134.92578125 ,1003.5078125)
	setElementRotation(thePlayer,0,0,358)
	setElementInterior(thePlayer,3)
	setElementModel(thePlayer,tonumber(skinid))
	setElementData(accSys:getPlayerAcc(thePlayer), "cSkin", skinid)

	outputChatBox("#00ff00Shoma Ba Movafaghiat Skin ID "..tonumber(skinid).." Ra Kharidari Kardid",thePlayer,255,255,255,true)
end)

addEvent("cancelskin",true)
addEventHandler("cancelskin",getRootElement(),function(thePlayer)
	setCameraTarget(thePlayer,thePlayer)
	setElementPosition(thePlayer,199.1884765625 ,-134.92578125 ,1003.5078125)
	setElementRotation(thePlayer,0,0,358)
	setElementInterior(thePlayer,3)
end)


addEventHandler("onPlayerWasted",getRootElement(),function()
	triggerClientEvent("checkskinshop",source,source)
end)



function checkBizToFee(nID,nPrice)
	local ID = tonumber(nID)
	local Price = tonumber(nPrice)
	if tonumber(Business[ID]["bOwner"]) >= 1 then
		local nowBox = tonumber(Business[ID]["bMoney"])
		local nextBox = tonumber(nowBox) + tonumber(Price)
		
		Business[ID]["bMoney"] = nextBox
		SetBusinessData(ID,"bMoney",nextBox)
	end
end
createBlip ( 1833.78, -1842.6, 13.5781 , 42 )
createBlip ( 1369.0009765625 ,-1279.705078125 ,13.546875 , 18 ) -- Gun Shop Blip

local skinshopblip = createBlip ( 461.7177734375 ,-1500.8740234375 ,31.044410705566 , 45 )
setElementData( skinshopblip, 'blipName',"SkinShop")

-- =============================================================================
--  FIX (bugfix pass 4): [TN]Biz kept per-player state in TeleportTimer and
--  lastVisit but never cleaned it up when a player left. Two consequences:
--    * the tables grew for the lifetime of the server (keys are player
--      elements, so the entries also kept dead elements referenced), and
--    * a player who disconnected mid-teleport came back with
--      TeleportTimer[them] still set, and every entry point checks
--      `if not TeleportTimer[thePlayer]` -- so business teleports were dead
--      for that player until the resource restarted.
-- =============================================================================
addEventHandler("onPlayerQuit", root, function()
	if TeleportTimer and TeleportTimer[source] then
		if isTimer(TeleportTimer[source]) then killTimer(TeleportTimer[source]) end
		TeleportTimer[source] = nil
	end
	if lastVisit then lastVisit[source] = nil end
end)
