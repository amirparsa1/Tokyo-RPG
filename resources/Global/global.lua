local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
local dbpTime = 500

fasele = 6.5



function respawnExplodedVehicle()
	setTimer(respawnVehicle, 5000, 1, source)
end
addEventHandler("onVehicleExplode", getRootElement(), respawnExplodedVehicle)

--[[function resourceStart()
    local realtime = getRealTime()
    setTime(realtime.hour, realtime.minute)
    setMinuteDuration(60000)
end
addEventHandler("onResourceStart", getRootElement(), resourceStart)]]

addCommandHandler("myserial",
function(thePlayer, cmd)
	local serial = getPlayerSerial(thePlayer)
	outputChatBox("#00ff00Serial Shoma: "..serial, thePlayer, 255, 255, 255, true)
end)
--[[
addCommandHandler("addserial",
function(thePlayer, cmd, plSerial)
	local plSerial = tostring(plSerial)
	if getElementData(accSys:getPlayerAcc(thePlayer), "pSecoundSerial") == 0 then
		if plSerial ~= nil then
			setElementData(accSys:getPlayerAcc(thePlayer), "pSecoundSerial", plSerial)
			outputChatBox("#00ff00[Done]: #ffffffSerial "..plSerial.." Baraye Shoma Ezafe Shod!", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000[Error]: #ffffffLotfan Serial Ra Vared Konid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Ezafe Kardan Serial Ebteda Ba /delserial Serial Qabli Ra Pak Konid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("delserial",
function(thePlayer, cmd)
	if getElementData(accSys:getPlayerAcc(thePlayer), "pSecoundSerial") ~= 0 then
		setElementData(accSys:getPlayerAcc(thePlayer), "pSecoundSerial", 0)
		outputChatBox("#00ff00[Done]: #ffffffSerial Shoma Ba Movafaqiat Hazf Shod!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000[Error]: #ffffffSeriali Baraye In Account Sabt Nashode Ast!", thePlayer, 255, 255, 255, true)
	end
end)
--]]

addCommandHandler("reflist",
function(thePlayer, cmd)
local reffetaraf = getElementData(accSys:getPlayerAcc(thePlayer), "pID")
local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
local result, numrows = dbPoll(query, dbpTime)
outputChatBox("#00ff00[Moaref]:#ffffff Liste Kasani Ke ID Moaref Shoma Ra Vared Kardan:", thePlayer, 255, 255, 255, true)
	if (result and numrows > 0) then
	setElementData(thePlayer,"reffsnumber",1)
		for index, row in pairs(result) do
			local id = row['pReferral']
			if id == reffetaraf then
				local name = row['pName']
				outputChatBox("#ff0000["..getElementData(thePlayer,"reffsnumber").."]:#ffffff "..name, thePlayer, 255, 255, 255, true)
				local chanta = getElementData(thePlayer,"reffsnumber")
				local chantabadi = tonumber(chanta) + 1
				setElementData(thePlayer,"reffsnumber",chantabadi)
			end
		end
		setElementData(thePlayer,"reffsnumber",nil)
		dbFree(query)
	end
end
)

addCommandHandler("referrals",
function(thePlayer, cmd)
local reffetaraf = getElementData(accSys:getPlayerAcc(thePlayer), "pID")
local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
	setElementData(thePlayer,"reffsnumber",0)
		for index, row in pairs(result) do
			local id = row['pReferral']
			if id == reffetaraf then
				local chanta = getElementData(thePlayer,"reffsnumber")
				local chantabadi = tonumber(chanta) + 1
				setElementData(thePlayer,"reffsnumber",chantabadi)
			end
		end
		outputChatBox("#00ff00[Moaref]:#ffffff Tedad #00ff00"..getElementData(thePlayer,"reffsnumber").."#ffffff Player ID Moaref Shoma Ra Vared Kardan!", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00* Baraye Didan List Referral Haye Khod Az #ffffff/refferalslist #00ff00Estefade Konid!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"reffsnumber",nil)
		dbFree(query)
	end
end
)

function walkStyle (thePlayer, command, walkid)
	local walkid = tonumber(walkid)
	if walkid then
		setPedWalkingStyle(thePlayer, walkid)
		outputChatBox("#00ff00[Done]: #ffffffHalat'e Rah Raftan Shoma Be #00ff00"..walkid.." #ffffffSet Shod!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#C0C0C0Syntax: /walkstyle <ID>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("walkstyle", walkStyle)

addEventHandler("onPlayerCommand",root,
function()
	if getElementData(source, "loggedIn") ~= true then
		cancelEvent()
	end
end)

addEventHandler("onPlayerCommand",root,
    function(command)
	if (command == "msg") then
	    cancelEvent()
	end
end)







addCommandHandler("animlist", function(thePlayer)
	--if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pClanRank")) == 4 then
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬(#2BEC2B List Animation Ha #d5e3e3)▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
		outputChatBox("#757072Free: ", thePlayer, 0, 255, 255,true)
		outputChatBox("#ffffff/sit #757072⚫️ #ffffff/dance #757072⚫️ #ffffff/kiss #757072⚫️ #ffffff/lati ", thePlayer, 0, 255, 255,true)
		outputChatBox("#ffffff/gerye #757072⚫️ #ffffff/smoker #757072⚫️ #ffffff/tashvigh  ", thePlayer, 0, 255, 255,true)
		outputChatBox("#ffffff/camera #757072⚫️ #ffffff/strip #757072⚫️ #ffffff/rap #757072⚫️ #ffffff/salam", thePlayer, 0, 255, 255,true)
			outputChatBox(" ", thePlayer, 0, 255, 255,true)
		outputChatBox("#EBC212Premium: ", thePlayer, 0, 255, 255,true)
		outputChatBox("#ffffff/baile #EBC212⚫️ #ffffff/raghs #EBC212⚫️ #ffffff/varzesh #EBC212⚫️ #ffffff/parkour", thePlayer, 0, 255, 255,true)

		
		

		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	--else
		--outputChatBox ( "#ff0000✖️ Baraye Inkar Bayad Leader Clan Bashid!", thePlayer, 230,0,0 ,true)
	--end
end)




