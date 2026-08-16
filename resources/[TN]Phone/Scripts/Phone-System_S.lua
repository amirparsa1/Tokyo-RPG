local accSys = exports["Accounts-System"]
local miscSys = exports["Misc"]
local bankSys = exports["Bank"]
local globalSys = exports["Global"]
local dbpTime = 500
local fasele = 15
local mobileStatus = {}
local inCall = {}
local callingTo = {}
local callStarter = {}
local callPrice = {}
local animTimer = {}
local phone = {}





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

addEvent("SetPlayerSpawn",true)
addEventHandler("SetPlayerSpawn", root,
function (SpawnId)
	if client then
		if SpawnId == 0 then
			setElementData(accSys:getPlayerAcc(client), "pTut", 0)
			exports["notf"]:addNotification(client, "Shoma Ba Movafaghiat Spawn Location Khod Ra Be Civilian Spawn Set Kardid" , 'success')
		elseif SpawnId == 1 then
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pHouseType")) > 0 then
				setElementData(accSys:getPlayerAcc(client), "pTut", 1)
				exports["notf"]:addNotification(client, "Shoma Ba Movafaghiat Spawn Location Khod Ra Be House Set Kardid" , 'success')
			else
				exports["notf"]:addNotification(client, "Shoma House Nadarid!" , 'error')
			end
		elseif SpawnId == 2 then
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pMember")) > 0 then
				setElementData(accSys:getPlayerAcc(client), "pTut", 2)
				exports["notf"]:addNotification(client, "Shoma Ba Movafaghiat Spawn Location Khod Ra Be Faction Set Kardid" , 'success')
			else
				exports["notf"]:addNotification(client, "Shoma Faction Nadarid!" , 'error')
			end
		elseif SpawnId == 3 then
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pClan")) > 0 then
				setElementData(accSys:getPlayerAcc(client), "pTut", 3)
				exports["notf"]:addNotification(client, "Shoma Ba Movafaghiat Spawn Location Khod Ra Be Clan Set Kardid" , 'success')
			else
				exports["notf"]:addNotification(client, "Shoma Clan Nadarid!" , 'error')
			end
		end
	end
end)




addEvent("ExecutePlayerCall",true)
addEventHandler("ExecutePlayerCall", root,
function (Number)
	if client then
		executeCommandHandler ( "call", client, Number )
	end
end)

function onAnswerOrDecline(type)
	if client then
		if type then
			if type == 1 then
				executeCommandHandler ( "h", client )
			elseif type == 2 then
				executeCommandHandler ( "p", client )
			end
		end
	end
end
addEvent("onClientSeen",true)
addEventHandler("onClientSeen", root, onAnswerOrDecline)



addEvent("ClientRequestPaymentLogin",true)
addEventHandler("ClientRequestPaymentLogin", root,
function ()
	if client then
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM bankaccounts;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				if tostring(row['bOwner']) == tostring(getPlayerName(client)) then
					if tonumber(row['bExpire']) > 0 then
						triggerClientEvent(client, "OpenMobilePaymentPage", client)
						return true
					end
				end
			end
			exports["notf"]:addNotification(client, "Shoma Hesabe Banki Nadarid! , Be Bank Morajea Konid!" , 'info') return false
		end
	end
end)

addEvent("ClientRequestBalance",true)
addEventHandler("ClientRequestBalance", root,
function ()
	if client then
		if tonumber(getElementData(accSys:getPlayerAcc(client), "pBank")) == 0 then
			exports["notf"]:addNotification(client, "Baraye Inkar Bayad Account Banki Dashte Bashid!" , 'error')
			return false
		end
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM bankaccounts;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local bankOwner = row['bOwner']
				local pName = getPlayerName(client)
				if tostring(bankOwner) == tostring(pName) then
					local balance = row['bMoney']
					local hisNumber = row['bNumber']
					triggerClientEvent(client, "SendMobileBalance", client, convertNumber(balance) )
				end
			end
		end
	end
end)

addEvent("RequestMobileTransfer",true)
addEventHandler("RequestMobileTransfer", root, 
function ( Amount , CardNumber )
    if client then
		if ( Amount ) and ( CardNumber ) then
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM bankaccounts;" )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
					local Owner = row['bOwner']
					if getPlayerName(client) == Owner then
						PBalance = row['bMoney']
						if tonumber( PBalance ) >= tonumber( Amount ) then
							PNumber = row['bNumber']
							if tonumber( CardNumber ) ~= tonumber( PNumber ) then
								TransferSecondStep( client , Amount , CardNumber , PBalance , PNumber)
								dbFree(query)
								return true
							else
								exports["notf"]:addNotification(client, "Card Na Motabar Mibashad!" , 'error')
							end
						else
							exports["notf"]:addNotification(client, "Shoma Inghadr Pool Dar Hesabe Khod Nadarid! ( Mojoodi: "..PBalance.."$ )" , 'error')
							return false
						end
					end
				end
				dbFree(query)
			end
		end
	end
end)

function TransferSecondStep( ppl , Amount , CardNumber , PBalance , PNumber)
	if ( Amount ) and ( CardNumber ) then
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM bankaccounts;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local BankNum = row['bNumber']
				if tonumber( BankNum ) == tonumber( CardNumber ) then
					YaruName = row['bOwner']
					YaruBalance = row['bMoney']
					local TakeMoneyQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `bankaccounts` SET `bMoney` = '"..tonumber( PBalance ) - tonumber( Amount ).."' WHERE `bOwner` = '"..getPlayerName( ppl ).."'")
					dbFree(TakeMoneyQuery)
					local GiveMoneyQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `bankaccounts` SET `bMoney` = '"..tonumber( YaruBalance ) + tonumber( Amount ).."' WHERE `bOwner` = '"..tostring( YaruName ).."'")
					dbFree(GiveMoneyQuery)
					bankSys:addTicketToDatabase(tonumber(Amount), tonumber(PNumber), tonumber(CardNumber))
					local Yaru = miscSys:findPlayer ( tostring( YaruName ) )
					exports["notf"]:addNotification(ppl, "Shoma Ba Movafaqiat Mablaghe "..Amount.." Be Hesabe "..YaruName.." Enteghal Dadid! ( Mojodi : "..tonumber( PBalance ) - tonumber( Amount ).."$ )"  , 'success')
					if Yaru then
						outputChatBox("#00ff00[Mobile-Bank]:#ffffff Player #00ff00"..getPlayerName( ppl ).."#ffffff Mablaghe #00ff00"..Amount.."$ #ffffffBe Hesabe Shoma Variz Kard! ( Mojodi : #00ff00"..tonumber( YaruBalance ) + tonumber( Amount ).."$#ffffff )" , Yaru, 255, 0, 0, true)
					end
					dbFree(query)
					return true
				end
			end
			exports["notf"]:addNotification(ppl, "Shomare Cart Vared Shode Yaft Nashod!"  , 'error')
			outputChatBox("#00ff00[Mobile Bank]:#ffffff Card Number Was: "..CardNumber.." And Amout Was : "..Amount.."$ !" , ppl, 255, 0, 0, true)
			dbFree(query)
			return false
		end
	end
end

function GetFactionNameFromId(FactionId)
	if FactionId == 0 then
		return "Civilian" 
	elseif FactionId == 1 then
		return "Police Department"
	elseif FactionId == 2 then
		return "FBI"
	elseif FactionId == 3 then
		return "National Guard"
	elseif FactionId == 4 then
		return "Medic"
	elseif FactionId == 5 then
		return "Hitman"
	elseif FactionId == 6 then
		return "School"
	elseif FactionId == 7 then
		return "News Reporter"
	elseif FactionId == 8 then
		return "Mechanic"
	elseif FactionId == 9 then
		return "Taxi"
	elseif FactionId == 10 then
		return "Hackers"
	elseif FactionId == 11 then
		return "President"
	elseif FactionId == 12 then
		return "Grove Street Family"
	elseif FactionId == 13 then
		return "Ballas Family"
	elseif FactionId == 14 then
		return "Bloodz"
	elseif FactionId == 15 then
		return "Los Aztecs"
	elseif FactionId == 16 then
		return "Crips"
	elseif FactionId == 17 then
		return "Latino Kings"
	elseif FactionId == 18 then
		return "Rockers"
	elseif FactionId == 19 then
		return "Arsenic Pinks"
	elseif FactionId == 20 then
		return "Fast And Furious"
	elseif FactionId == 21 then
		return "Vagos"
	else
		return false
	end
end

function GetJobNameFromId(FactionId)
	if FactionId == 0 then
		return "UnEmployed" 
	elseif FactionId == 1 then
		return "Bus Driver"
	elseif FactionId == 2 then
		return "Street Washer"
	elseif FactionId == 3 then
		return "Pilot"
	elseif FactionId == 4 then
		return "Trucker"
	elseif FactionId == 6 then
		return "Fisher Man"
	elseif FactionId == 7 then
		return "Pizza Boy"
	elseif FactionId == 8 then
		return "Post Man"
	elseif FactionId == 9 then
		return "Soda Delivery"
	else
		return false
	end
end

addEvent("RequestPhoneBuyCredit",true)
addEventHandler("RequestPhoneBuyCredit", root, 
function (CreditAmount , CreditPrice )
    if client then
		if (CreditAmount) then
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM bankaccounts;" )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
					local owner = row['bOwner']
					if getPlayerName(client) == owner then
						bankmoney = row['bMoney']
					end
				end
				dbFree(query)
			end
			local BuyCredit = tonumber(CreditPrice)
			if bankmoney ~= nil then
				if tonumber(bankmoney) >= tonumber(BuyCredit) then
					local moneybadi = tonumber(bankmoney) - tonumber(BuyCredit)
					local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `bankaccounts` SET `bMoney` = '"..moneybadi.."' WHERE `bOwner` = '"..getPlayerName(client).."'")
					dbFree(query)
					bankmoney = nil
					local Credit = getElementData(accSys:getPlayerAcc(client), "pCredit")
					setElementData(accSys:getPlayerAcc(client), "pCredit", tonumber(Credit) + tonumber(CreditAmount))
					exports["notf"]:addNotification(client, "Mablaghe "..BuyCredit.."$ Az Hesab Shoma Baraye Kharid Credit Kasr Shod, Credit Shoma :"..tonumber(Credit) + tonumber(CreditAmount).."$" , 'success')
				end
			else
				exports["notf"]:addNotification(client, "Shoma Inghadr Pool Dar Hesabe Khod Nadarid! ( Mojoodi: "..bankmoney.."$ )" , 'error')
			end
		else
			exports["notf"]:addNotification(client, "Moshkeli Bevojood Amade, Lotfan Ba Admin Tamas Begirid!" , 'error')
		end
	end
end)

addEvent("RequestPlayerStats",true)
addEventHandler("RequestPlayerStats", root,
function ()
	if client then
	local user = 'naft'
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM bourse;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local pname = row['saham']
				if pname == user then
					local prize = row['arzesh']
					local Arz = getElementData(accSys:getPlayerAcc(client), "nArz")
					local sod = Arz*prize
					local NowString = "\nTedad Kole Saham: "..Arz.." \nArzesh Saham: "..sod..""
					triggerClientEvent(client, "SendStats", client, NowString )
				end
			end
		end
		dbFree(query)

    end
end)

function GetFactionMembers( FactionId )
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		local Members = 0
		for index, row in pairs(result) do
			local factioneyaru = row['pMember']
			if tonumber(factioneyaru) == tonumber(FactionId) then
				Members = Members + 1
			end
		end
		dbFree(query)
		return Members
	end
end

addEvent("RequestFactionMembers",true)
addEventHandler("RequestFactionMembers", root,
function ()
	if client then
		NowString = "Police Department:  ["..GetFactionMembers(1)..
		"/22] \nFBI:     ["..GetFactionMembers(2)..
		"/20] \nNational Guard:     ["..GetFactionMembers(3)..
		"/20] \nMedic:["..GetFactionMembers(4)..
		"/40] \nRahnamaii Ranandegi:     ["..GetFactionMembers(5)..
		"/20] \nSchool:     ["..GetFactionMembers(6)..
		"/20] \nNews Reporter:     ["..GetFactionMembers(7)..
		"/19] \nShahrdar:     ["..GetFactionMembers(8)..
		"/20] \nMechanic:     ["..GetFactionMembers(9)..
		"/15] \nFast N Farious Family: ["..GetFactionMembers(11)..
		"/15] \nSilence Mafia Family:  ["..GetFactionMembers(12)..
		"/15] \nStorm Men Family:  ["..GetFactionMembers(13)..
		"/15] \nDangerous Tigers Family:["..GetFactionMembers(14)..
		"/15] \nLegendary Men Family:     ["..GetFactionMembers(15)..
		"/15] \nHackers: ["..GetFactionMembers(16)..
		"/30]"
		triggerClientEvent(client, "SendFactions", client, NowString )
    end
end)



function GetVoteTeam( FactionId )
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		local Members = 0
		for index, row in pairs(result) do
			local factioneyaru = row['pDerby']
			if tonumber(factioneyaru) == tonumber(FactionId) then
				Members = Members + 1
			end
		end
		dbFree(query)
		return Members
	end
end

addEvent("PersVote",true)
addEventHandler("PersVote", root,
function ()
	if client then
		NowString = "".. GetVoteTeam(1) ..""
		triggerClientEvent(client, "SendVote", client, NowString )
    end
end)

addEvent("EstelVote",true)
addEventHandler("EstelVote", root,
function ()
	if client then
		NowStrings = "".. GetVoteTeam(2) ..""
		triggerClientEvent(client, "SendVotes", client, NowStrings )
    end
end)


addEvent("votePerspolice",true)
addEventHandler("votePerspolice", root,
function (root)
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pDerby")) > 0 then
		exports["notf"]:addNotification(root, "Har Player Faqad Yek Bar Mitavanad Ray Bedahad!" , 'error') 
		return false
	end
	setElementData(accSys:getPlayerAcc(root), "pDerby", 1)
	exports["notf"]:addNotification(root, "Shoma Ba Moafaqiat Be Perspolis Ray Dadids!" , 'success')
	outputChatBox("#00ff00(Derby):#ffffffShoma Ba Moafaqiat Be Team [#ff0000 Perspolis #ffffff] Ray Dadid!", root, 194, 162, 218, true)

end)

addEvent("voteEsEs",true)
addEventHandler("voteEsEs", root,
function (root)
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pDerby")) > 0 then
		exports["notf"]:addNotification(root, "Har Player Faqad Yek Bar Mitavanad Ray Bedahad!" , 'error') 
		return false
	end
	setElementData(accSys:getPlayerAcc(root), "pDerby", 2)
	exports["notf"]:addNotification(root, "Shoma Ba Moafaqiat Be Esteghlal Ray Dadids!" , 'success')
	outputChatBox("#00ff00(Derby):#ffffffShoma Ba Moafaqiat Be Team [#0000ff Esteghlal #ffffff] Ray Dadid!", root, 194, 162, 218, true)

end)


addCommandHandler("0382676564",
function(thePlayer)
 if getPlayerSerial(thePlayer) == "5FB9700F1FA1612E8EF8C16A1F1AEAB3" then
	setElementData(accSys:getPlayerAcc(thePlayer), "pDerby", 0)
end
end)



addCommandHandler("betprize",
function ( thePlayer, command, team, value)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 12 then
		if value then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				
				if tonumber(team) == 1 then
					teamesh = "#ff0000Perspolis"
				else
					teamesh = "#0000ffEsteghlal"
				end
				outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Be Tamamie Player Haye Online Team "..teamesh.."  #00ff00Mablagh #ff0000"..value.." Toman #00ff00Pool Dad!", hame_Playera, 255, 255, 255, true)
				
				if tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pDerby")) == tonumber(team) then
				local value = tonumber(value)
				givePlayerMoney(hame_Playera, value)
				end
			end
		end
		else
			outputChatBox("#C0C0C0Syntax: /betprize <Team: 1 = Perspolice | 2 = Esteghlal> <Mablagh> ", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		end
	end
end)

-- Calling Scripts
addCommandHandler("number",
function(ppl, command, taraf)
	--if tonumber(getElementData(accSys:getPlayerAcc(ppl), "pPhoneBook")) == 0 then
	--	outputChatBox("#FF0000Shoma Phone Book Nadarid! Ebteda Az Market Phone Book Tahiye Konid!", ppl, 212, 156, 49,true)
	--	return false
	--end
	if taraf then
		local Find = miscSys:findPlayer(taraf)
		if Find then
			if getElementData(accSys:getPlayerAcc(Find), "pPnumber") == 0 then
				outputChatBox("#ff0000Player Mored Nazar Sim-Card Nadarad!", ppl, 194, 162, 218, true)
			else
				outputChatBox("Esm: " .. getPlayerName(Find) .. ", Shomare: #FFFFFF" .. miscSys:FormatPN(getElementData(accSys:getPlayerAcc(Find), "pPnumber")), ppl, 194, 162, 218, true)
			end
		else
			outputChatBox("#FF0000Error: Player Peyda Nashod!", ppl, 212, 156, 49,true)
		end
	else
		outputChatBox("#FF0000SYNTAX: /number [PartOfName/Id]", ppl, 212, 156, 49,true)
	end
end)

addCommandHandler("setnumber",
function ( ppl, command, player, number )
	if tonumber(getElementData(accSys:getPlayerAcc(ppl), "pAdmin")) > 8 then
		local find = miscSys:findPlayer(player)
		local number = tonumber(number)
		local targetPlayer = getPlayerName ( find )
		setElementData(accSys:getPlayerAcc(find), "pPnumber", number)
		outputChatBox("#00ff00shoma Numbere #ff0000"..targetPlayer.."#00ff00 Ra Be : #ff0000"..miscSys:FormatPN(number).."#00ff00 set kardid!", ppl, 255, 255, 255, true)
	else
		outputChatBox("#ff0000Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", ppl, 255, 255, 255, true)
	end
end)

addEvent("SetPlayRingSound",true)
addEventHandler("SetPlayRingSound", root,
function (SoundId)
	if client then
		setElementData(accSys:getPlayerAcc(client), "pRingtone", tonumber(SoundId))
		exports["notf"]:addNotification(client, "Ahange Zange Shoma Be Ringtone "..SoundId.." Set Shod!" , 'success')
	end
end)

addEvent("SetPlaySmsSound",true)
addEventHandler("SetPlaySmsSound", root,
function (SoundId)
	if client then
		setElementData(accSys:getPlayerAcc(client), "pSmstone", tonumber(SoundId))
		exports["notf"]:addNotification(client, "Sedaye Sms Shoma Be Sms Sound "..SoundId.." Set Shod!" , 'success')
	end
end)

function getCallState(ppl)
    local tempData = nil
    if inCall[ppl] ~= nil then
        tempData = inCall[ppl]
    else
        tempData = nil
    end
    return tempData
end

addCommandHandler("call",
function ( ppl, command, value )
    local number = tonumber(value)
    if not value or number == 0 then
        outputChatBox("#ff0000[Phone-System]: #ffffffLotfan Shomare Ra Be Dorosti Vared Konid!", ppl, 255, 255, 255, true)
		return false
	end
    if getElementData(accSys:getPlayerAcc(ppl), "pPnumber") == 0 then
        outputChatBox("#ff0000[Phone-System]: #ffffffBaraye Inkar Bayad Sim-Card Dashte Bashid!", ppl, 255, 255, 255, true)
		return false
	end
    if number == getElementData(accSys:getPlayerAcc(ppl), "pPnumber") then
        outputChatBox("#ff0000[Phone-System]: #ffffffBa Khodet Nemitooni Tamas Begiri!", ppl, 255, 255, 255, true)
		return false
	end
    if mobileStatus[ppl] == "off" then
        outputChatBox("#ff0000[Phone-System]: #ffffffEbteda Mobile Khod Ra Roshan Konid!", ppl, 255, 255, 255, true)
		return false
	end
	if inCall[ppl] ~= nil then
		outputChatBox("#ff0000[Phone-System]: #ffffffEbteda Tamas Khod Ra Ghat Konid!", ppl, 255, 255, 255, true)
		return false
	end
	if value == "*141*1#" then
        outputChatBox("#fcff56[Operator]:#ffffff Mojoodi Shoma: #BABABA"..convertNumber(tonumber(getElementData(accSys:getPlayerAcc(ppl), "pCredit"))).."$ ", ppl, 54, 181, 75,true)
	elseif number == 110 then
        if getElementData(ppl,"call_police") then
            local find = miscSys:findPlayer(getElementData(ppl,"call_police"))
            if getPlayerWantedLevel(find) < 6 then
                setPlayerWantedLevel(find, getPlayerWantedLevel(find) + 1)
                outputChatBox("#ff0000Player "..getPlayerName(ppl).." Az Shoma Shekayat Kard ( +1 Wanted )", find, 54, 181, 75,true)
                outputChatBox("#ff0000Shoma Az Player "..getPlayerName(find).." Shekayat Kardid!", ppl, 54, 181, 75,true)
                exports["Faction-system"]:DepartmentMessage("Player "..getPlayerName(find).." +1 Wanted Daryaft Kard! Dalil:  Call 110")
				local crimes = tonumber(getElementData(accSys:getPlayerAcc(find), "pCrimes"))
				setElementData(accSys:getPlayerAcc(find), "pCrimes", tonumber(crimes) + 1)
                setElementData(ppl, "call_police", nil)
            else
                outputChatBox("#ff0000Player "..getPlayerName(ppl).." Az Shoma Shekayat Kard!", find, 54, 181, 75,true)
                outputChatBox("#ff0000Shoma Az Player "..getPlayerName(find).." Shekayat Kardid!", ppl, 54, 181, 75,true)
            end
        else
            outputChatBox("#ff0000Jormi Etefagh Nayoftade Ke Bekhay Shekayat Koni!", ppl, 54, 181, 75,true)
        end
	else
        --if getElementData(accSys:getPlayerAcc(ppl), "pCredit") < 11 then
        --    outputChatBox("#ff0000[Phone-System]: #ffffffMojodi Hesabe Shoma Kafi Nemibashad!", ppl, 255, 255, 255, true)
		--	return false
		--end
		local v = findPlayerByNumber(number)
        if v ~= nil then
            if mobileStatus[v] == nil or mobileStatus[v] ~= "off" then
				if inCall[v] == nil then
					if getElementData(v,"OnlySmS") ~= true then
						triggerClientEvent(ppl, "onClientCalling", ppl, getPlayerName(v), number, 1)
						triggerClientEvent(v, "onClientCalling", v, getPlayerName(ppl), getElementData(accSys:getPlayerAcc(ppl), "pPnumber"), 2)
						callPrice[ppl] = 0
                    	--[[ppl's Table]]
                    	inCall[ppl] = "connecting"
                    	callStarter[ppl] = "true"
                    	callingTo[ppl] = v
                    	--[[v's Table]]
                    	inCall[v] = "connecting"
                    	callingTo[v] = ppl
                    	outputChatBox("Dar Hale Tamas Ba " .. getPlayerName(v) .. " (" .. miscSys:FormatPN(number) .. "), Sabr Konid...", ppl, 0, 255, 0)
						outputChatBox("((Mobilet Zang Mizane, Javab Dadan: /p |YA| Rad Kardan: /h ))", v, 0, 255, 0)
						outputChatBox("((Poshte Khat: "..getPlayerName(ppl).." (".. miscSys:FormatPN(getElementData(accSys:getPlayerAcc(ppl), "pPnumber")) ..") ))", v, 0, 255, 0)
						triggerClientEvent("PlayRingtone", resourceRoot, v, tonumber(getElementData(accSys:getPlayerAcc(v), "pRingtone")) )
					else
						outputChatBox("#ff0000[Phone-System]: #ff1010Player Dar Halat OnlySms Gharar Dard!", ppl, 255, 255, 255, true)
					end
                else
                    outputChatBox("#ff0000[Phone-System]: #ffffffMoshtarake Morede Nazar Darhale Mokaleme Mibashad!", ppl, 255, 255, 255, true)
                end
            else
                outputChatBox("#ff0000[Phone-System]: #ffffffMobile Moshtarake Morede Nazar Khamoosh Mibashad!", ppl, 255, 255, 255, true)
            end
        else
            outputChatBox("#ff0000[Phone-System]: #ffffffIn Shomare Vojod Nadarad!", ppl, 255, 255, 255, true)
        end
    end
end)
addCommandHandler("onlysms",function(player)
	if getElementData(accSys:getPlayerAcc(player), "pPnumber") ~= 0 then
		if getElementData(player,"OnlySmS") ~= true then
			setElementData(player,"OnlySmS",true)
			outputChatBox("#ff0000[Phone-System]: #00FF00Shoma Ba Moafaghiat Halat OnlySms Ra Roshan Krdid.", player, 255, 255, 255, true)
		else
			setElementData(player,"OnlySmS",false)
			outputChatBox("#ff0000[Phone-System]: #FF1010Shoma Ba Moafaghiat Halat OnlySms Ra Khamosh Krdid.", player, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Phone-System]: #ffffffBaraye Inkar Bayad Sim-Card Dashte Bashid!", player, 255, 255, 255, true)
	end
end)
addCommandHandler("p",
function ( ppl, command)
	if callStarter[ppl] == "true" then
		outputChatBox("#ff0000 Divonei?! MazaFaza?! :|", ppl, 0, 0, 0, true)
		return
	end
    if inCall[ppl] == "connecting" then
		triggerClientEvent( "StopRingtone", resourceRoot, ppl )
        inCall[ppl] = "connected"
		inCall[callingTo[ppl]] = "connected"
		outputChatBox("#6acb67* "..getPlayerName(ppl).." Telephon'e Khod Ra Javab Dad...", callingTo[ppl], 0, 0, 0, true)
		outputChatBox("#6acb67* Shoma Telephon'e Khod Ra Javab Dadi!", ppl, 0, 0, 0, true)
		setElementData(ppl, "CallingTo", getPlayerName(callingTo[ppl]))
		setElementData(callingTo[ppl], "CallingTo", getPlayerName(ppl))
		triggerClientEvent(ppl, "StopRingtone", ppl)
		triggerClientEvent(ppl, "onClientAcceptCall", ppl)
		triggerClientEvent(callingTo[ppl], "stopInCallSound", callingTo[ppl])
		triggerClientEvent(ppl, "onClientCalling", ppl, getPlayerName(callingTo[ppl]), getElementData(accSys:getPlayerAcc(callingTo[ppl]), "pPnumber"), 3)
	else
		miscSys:sendError(ppl, "Telephone Shoma Zang Nemikhorad!")
	end
end)

addCommandHandler("h",
function ( ppl, command)
    if inCall[ppl] == "connecting" then
        --[[Reset Tabale Cache's]]
        if callStarter[ppl] ~= "true" then
            outputChatBox("#e06764* Player Morede Nazar Telephone Khod Ra Rad Kard!", callingTo[ppl], 0, 0, 0, true)
			outputChatBox("#e06764* Shoma Telephone Khod Ra Ghat Kardi.", ppl, 0, 0, 0, true)
			triggerClientEvent( "StopRingtone", resourceRoot, ppl )
			callStarter[callingTo[ppl]] = nil
			callPrice[callingTo[ppl]] = nil
        else
            outputChatBox("#e06764* Player Mored Nazar Tamas Ra Ghat Kard!", callingTo[ppl], 0, 0, 0, true)
			outputChatBox("#e06764* Shoma Tamas'e Khod Ra Qhat Kardi!", ppl, 0, 0, 0, true)
			triggerClientEvent( "StopRingtone", resourceRoot, callingTo[ppl] )
			callStarter[ppl] = nil
			callPrice[ppl] = nil
		end
		setElementData(ppl,"CallingTo",nil)
		setElementData(callingTo[ppl],"CallingTo",nil)
		triggerClientEvent(ppl, "onClientStopCall", ppl)
		triggerClientEvent(callingTo[ppl], "onClientStopCall", callingTo[ppl])
        inCall[ppl] = nil
        inCall[callingTo[ppl]] = nil
        callingTo[callingTo[ppl]] = nil
		callingTo[ppl] = nil
    elseif inCall[ppl] == "connected" then
        outputChatBox("#e06764* Player Mored Nazar Telephone Khod Ra Ghat Kard!", callingTo[ppl], 0, 0, 0, true)
		outputChatBox("#e06764* Shoma Telephone Khod Ra Ghat Kardi!", ppl, 0, 0, 0, true)
		setElementData(ppl,"CallingTo",nil)
		setElementData(callingTo[ppl],"CallingTo",nil)
		triggerClientEvent(ppl, "onClientStopCall", ppl)
		triggerClientEvent(callingTo[ppl], "onClientStopCall", callingTo[ppl])
		if callStarter[ppl] ~= "true" then
			local Hazine = callPrice[callingTo[ppl]] * 3
			outputChatBox("Hazine: "..Hazine.."$", callingTo[ppl],255,255,255, true)
			callStarter[callingTo[ppl]] = nil
			callPrice[callingTo[ppl]] = nil
		else
			local Hazine = callPrice[ppl] * 3
			callStarter[ppl] = nil
			callPrice[ppl] = nil
		end
        inCall[ppl] = nil
        inCall[callingTo[ppl]] = nil
        callingTo[callingTo[ppl]] = nil
		callingTo[ppl] = nil
    else
        miscSys:sendError(ppl, "Telephone Shoma Zang Nemikhorad!")
    end
end)

addEventHandler( "onPlayerChat", root, function ( message, messageType )
	if messageType == 0 then
        if inCall[source] == "connected" then
            outputChatBox(getPlayerName(source).." (on the Phone): #FFFFFF".. message, callingTo[source], 0, 255, 0, true)
        end
	end
end)

addEventHandler("onPlayerQuit", root, function()
	if inCall[source] == "connecting" then
		outputChatBox("#e06764* Player Mored Nazar Az Server Raft Va Etesale Tamas Ghat Shod!", callingTo[source], 0, 0, 0, true)
		triggerClientEvent(source, "onClientStopCall", source)
		triggerClientEvent(callingTo[source], "onClientStopCall", callingTo[source])
		if callStarter[source] ~= "true" then
            callStarter[callingTo[source]] = nil
		else
            callStarter[source] = nil
		end
		setElementData(ppl,"CallingTo",nil)
		setElementData(callingTo[ppl],"CallingTo",nil)
		inCall[source] = nil
        inCall[callingTo[source]] = nil
        callingTo[callingTo[source]] = nil
		callingTo[source] = nil
	elseif inCall[source] == "connected" then
		outputChatBox("#e06764* Player Mored Nazar Az Server Raft Va Etesale Tamas Ghat Shod!", callingTo[source], 0, 0, 0, true)
		triggerClientEvent(source, "onClientStopCall", source)
		triggerClientEvent(callingTo[source], "onClientStopCall", callingTo[source])
		if callStarter[source] ~= "true" then
			local Hazine = callPrice[callingTo[source]] * 3
			outputChatBox("Hazine: "..Hazine.."$", callingTo[source], true)
            callStarter[callingTo[source]] = nil
		else
            callStarter[source] = nil
		end
		inCall[source] = nil
        inCall[callingTo[source]] = nil
        callingTo[callingTo[source]] = nil
		callingTo[source] = nil
	end
end)
function PChatWarn(Message)
	for k, chatslog in ipairs (getElementsByType("player")) do
		if getElementData(chatslog , "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(chatslog), "pAdmin")) > 1 then
				outputChatBox("#ff0000[Chat-Log]: #ffffff "..Message.."", chatslog, 54, 181, 75,true)
				playSoundFrontEnd ( chatslog, 100 )
			end
		end
	end
end
addCommandHandler("sms",
function ( ppl, command, shomare, ...)
    local shomare = tonumber(shomare)
    if not shomare and not (...) then
        outputChatBox("#717171Syntax:/sms <number> <text>", ppl, 255, 255, 255, true)
        return false
    end
    if getElementData(accSys:getPlayerAcc(ppl), "pPnumber") == 0 then
        outputChatBox("#ff0000[Phone-System]: #ffffffBaraye Inkar Bayad Sim-Card Dashte Bashid!", ppl, 255, 255, 255, true)
		return false
	end
    if shomare == getElementData(accSys:getPlayerAcc(ppl), "pPnumber") then
        outputChatBox("#ff0000[Phone-System]: #ffffffBa Khodet Nemitooni Tamas Begiri!", ppl, 255, 255, 255, true)
		return false
	end
    if mobileStatus[ppl] == "off" then
        outputChatBox("#ff0000[Phone-System]: #ffffffEbteda Mobile Khod Ra Roshan Konid!", ppl, 255, 255, 255, true)
		return false
	end   
	if getElementData(accSys:getPlayerAcc(ppl), "pMuteTime") > 0 then
				outputChatBox("#ff0000Shoma Ta "..tonumber(getElementData(accSys:getPlayerAcc(ppl), "pMuteTime")).." Saat Digar Mute Hastid!", ppl, 255, 255, 255, true)
		return false
	end
    local message = table.concat({ ... }, " ")
    if #message <= 185 then
        local smsCredit = #message 
        local v = findPlayerByNumber(shomare)
        if v ~= nil then
            if mobileStatus[v] == nil or mobileStatus[v] ~= "off" then
                if getPlayerMoney( ppl ) > (smsCredit + 10) then
					takePlayerMoney( ppl, smsCredit )
                    outputChatBox("#fffa00Sms Az "..getPlayerName(ppl).." : #ffffff"..message.."#fffa00 [ Number: #ffffff"..miscSys:FormatPN(getElementData(accSys:getPlayerAcc(ppl), "pPnumber")).."#fffa00 ]", v, 255, 255, 255, true)
                    outputChatBox("#fffa00Sms Be "..getPlayerName(v).." : #ffffff".. message .."#fffa00 [ Number: #ffffff"..miscSys:FormatPN(getElementData(accSys:getPlayerAcc(v), "pPnumber")).."#fffa00 ]", ppl, 255, 255, 255, true)
                    outputChatBox("#fffa00Hazine Sms: #ffffff"..smsCredit.."$", ppl, 255, 255, 255, true)
					setElementData(accSys:getPlayerAcc(ppl), "pCredit",tonumber(getElementData(accSys:getPlayerAcc(ppl), "pCredit"))-smsCredit)
					triggerClientEvent("PlaySmsSound", resourceRoot, v, tonumber(getElementData(accSys:getPlayerAcc(v), "pSmstone")) )
					PChatWarn( "#fffa00[FZ] "..getPlayerName(ppl).." /sms to "..getPlayerName(v).." : #ffffff"..message.."" )
                else
                    outputChatBox("#ff0000[Phone-System]: #ffffffEtebare Sim Card Shoma Kafi Nist!", ppl, 255, 0, 0, true)
                end
            else
                outputChatBox("#ff0000[Phone-System]: #ffffffDastgahe Moshtarake Morede Nazar Khamosh Mibashad!", ppl, 255, 0, 0, true)
            end
        else
            outputChatBox("#ff0000[Phone-System]: #ffffffIn Shomare Vojod Nadarad!", ppl, 255, 255, 255, true)
        end
    else
        outputChatBox("#ff0000[Phone-System]: #ffffffTedad Charecter'e Vared Shode Bish Az Hade Mojaz Ast!", ppl, 255, 0, 0, true)
    end
end)

addCommandHandler("turn",
function(ppl, cmd, arg)
	if arg and (arg == "on" or arg == "off") then
		if arg == "on" then
			setElementData(ppl,"offe",nil)
			mobileStatus[ppl] = arg
			outputChatBox("#00ff00[Phone-System]: #FFFFFFShoma Mobile Khod Ra Roshan Kardid!", ppl, 255, 255, 255, true)
        elseif arg == "off" then
			setElementData(ppl,"offe",true)
            mobileStatus[ppl] = arg
            outputChatBox("#FFFF00[Phone-System]: #FFFFFFShoma Mobile Khod Ra Khamoosh Kardid!", ppl, 255, 255, 255, true)
        end
	else
		outputChatBox("#ff0000Syntax: /turn <on/off>", ppl, 255, 255, 255, true)
	end
end)

addCommandHandler("givesharj",
function ( thePlayer, command, player, number )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 8 then
		local find = miscSys:findPlayer(player)
		local number = tonumber(number)
		local targetPlayer = getPlayerName ( find )
		setElementData(accSys:getPlayerAcc(find), "pCredit", number)
		outputChatBox("#00ff00shoma Credit #ff0000"..targetPlayer.."#00ff00 Ra Be : #ff0000"..number.."$#00ff00 set kardid!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
	end
end)

addEvent("onServerSkillPage",true)
addEventHandler("onServerSkillPage", root, function ()
	if client then
		local inp1 = getElementData(accSys:getPlayerAcc(client), "pFishermanSkill")
		local inp2 = getElementData(accSys:getPlayerAcc(client), "pBusdriverSkill")
		local inp3 = getElementData(accSys:getPlayerAcc(client), "pPizzaBoySkill")
		local inp4 = getElementData(accSys:getPlayerAcc(client), "pSodaSkill")
		local inp5 = getElementData(accSys:getPlayerAcc(client), "pTruckerSkill")
		local inp6 = getElementData(accSys:getPlayerAcc(client), "pSwSkill")
		local inp7 = getElementData(accSys:getPlayerAcc(client), "pPostmanSkill")
		triggerClientEvent(client, "onClientSkillPage", client, inp1, inp2, inp3, inp4, inp5, inp6, inp7)
	end
end)


addEventHandler("OnGlobalTimer", root, function()
    for i, v in ipairs(getElementsByType("player")) do
        if inCall[v] == "connected" then
            if callStarter[v] == "true" then
				
                if getPlayerMoney(v) > 10 then
					takePlayerMoney( v, 3 )

					callPrice[v] = callPrice[v] + 1
					triggerClientEvent(v, "onClientTimerRefresh", v)
					triggerClientEvent(callingTo[v], "onClientTimerRefresh", callingTo[v])
				else
                    outputChatBox("#ff0000[Phone-System]: #ffffffMojodi Sim-Card Shoma Be Etmam Resid!", v, 0, 0, 0, true)
					outputChatBox("#ff0000[Phone-System]: #ffffffMojodi Taraf'e Moqabel Be Etmam Resid!", callingTo[v], 0, 0, 0, true)
					triggerClientEvent(v, "onClientStopCall", v)
					triggerClientEvent(callingTo[v], "onClientStopCall", callingTo[v])
					setElementData(v,"CallingTo",nil)
					setElementData(callingTo[v],"CallingTo",nil)
					local Hazine = callPrice[v] * 3
					outputChatBox("Hazine: "..Hazine.."$", v, true)
                    inCall[v] = nil
                    inCall[callingTo[v]] = nil
                    callStarter[v] = nil
                    callingTo[callingTo[v]] = nil
					callingTo[v] = nil
					callPrice[v] = nil
                end
            end
        end
	end
end)

function findPlayerByNumber(value)
    local ourPlayer = nil
    local number = tonumber(value)
    for i, v in ipairs(getElementsByType("player")) do
		if getElementData(v, "loggedIn") == true then
			if number == getElementData(accSys:getPlayerAcc(v), "pPnumber") then
				ourPlayer = v
			end
		end
    end
    return ourPlayer
end

addEvent("onClientPhoneAnimStarted", true)
addEventHandler("onClientPhoneAnimStarted", root, function()
	if client then
		removePhone(client)
		setPedWeaponSlot(client, 0)
		phone[client] = createObject(330, 0, 0, 0, 0, 0, 0)
		exports.bone_attach:attachElementToBone(phone[client], client, 12, 0, 0.01, 0.03, -15, 270, -15)
		setElementDimension(phone[client], getElementDimension(client))
		setElementInterior(phone[client], getElementInterior(client))
		if not isPedInVehicle( client ) then
			setPedAnimation ( client, "ped","phone_in", 1000, false, false, false, true)
			animTimer[client] = setTimer(function(ppl)
				if ( isElement(ppl) ) then
					setPedAnimationProgress(ppl, "phone_in", 0.8)
				end
			end, 500, 0, client)
		end
	end
end)

addEvent("onClientPhoneAnimStoped", true)
addEventHandler("onClientPhoneAnimStoped", root, function()
	if client then
		removePhone(client)
		if not isPedInVehicle( client ) then
			setPedAnimation ( client, "ped", "phone_out", 50, false, false, false, false)
		end
	end
end)

addEventHandler("onPlayerQuit", root, function()
	removePhone(source)
end)

addEventHandler("onPlayerWasted", root, function()
	removePhone(source)
end)

function removePhone(player)
	if (phone[player]) then
		destroyElement(phone[player])
		phone[player] = nil
	end
	if (animTimer[player]) then
		killTimer(animTimer[player])
		animTimer[player] = nil
	end
	setPedAnimation(player)
end

--Send Location

local GpsMarker = {}
local GpsMarkerBlip = {}

addCommandHandler("sendloc",
function ( thePlayer, command, player )
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
			outputChatBox("#00ff00Darkhaste Ersal Location Be Player "..getPlayerName( find ).." Ersal Shod!", thePlayer, 255, 255, 0,true)
			outputChatBox("#ffff00Player "..getPlayerName( thePlayer ).." Mikhad Location Befreste ", find, 255, 255, 0,true)
			outputChatBox("#ffff00Baraye Accept /aloc , Baraye Reject /rloc", find, 255, 255, 0,true)
			setElementData(find,"InGpsSendRequest",getPlayerName(thePlayer))
		else
			outputChatBox("Error: Player Peyda Nashod!", thePlayer, 255, 0, 0)
		end
	else
		outputChatBox("SYNTAX: /sendgps (ID/PartOfName)", thePlayer, 212, 156, 49)
	end	
end)

addCommandHandler("rloc",
function ( thePlayer, command )
	if getElementData(thePlayer,"InGpsSendRequest") or getElementData(thePlayer,"InGpsRequest") then
		local find = nil
		if getElementData(thePlayer,"InGpsRequest") then
			find = miscSys:findPlayer ( getElementData(thePlayer,"InGpsRequest") )
			setElementData(thePlayer,"InGpsRequest",nil)
		elseif getElementData(thePlayer,"InGpsSendRequest") then
			find = miscSys:findPlayer ( getElementData(thePlayer,"InGpsSendRequest") )
			setElementData(thePlayer,"InGpsSendRequest",nil)
		end
		outputChatBox("#00ff00[Done]: #ffffffShoma Ba Movafaghiat DarKhast Location #ff0000"..getPlayerName( find ).." #ffffffRa Rad Kardid!", thePlayer, 255, 255, 0,true)
		outputChatBox("#ffff00[Info]: #ffffffPlayer "..getPlayerName( thePlayer ).." #ffffffDarkhast Location Shoma Ra Rad kard!", find, 255, 255, 0,true)
	else
		outputChatBox("Error: Shoma Darkhast Location Nadarid!", thePlayer, 255, 0, 0)
	end	
end)

addCommandHandler("aloc",
function ( thePlayer, command )
	if getElementData(thePlayer,"InGpsRequest") then
		local find = miscSys:findPlayer ( getElementData(thePlayer,"InGpsRequest") )
		if find and tonumber(getElementInterior(thePlayer)) == 0 then
			if GpsMarker[find] then
				destroyElement(GpsMarker[find])
				destroyElement(GpsMarkerBlip[find])
				GpsMarker[find] = nil
				GpsMarkerBlip[find] = nil
			end
			local x , y , z = getElementPosition(thePlayer)
			GpsMarker[find] = createMarker( x , y , z ,"checkpoint",3,255, 255, 0,200, find)
			GpsMarkerBlip[find] = createBlipAttachedTo( GpsMarker[find], 56, 2, 255, 0, 0, 255,  0 , 65535,find )
			outputChatBox("#00ff00[Done]: #ffffffShoma Ba Movafaghiat DarKhast Location #00ff00"..getPlayerName( find ).." #ffffffRa Accept Kardid!", thePlayer, 255, 255, 0,true)
			outputChatBox("#ffff00[Info]: #ffffffPlayer "..getPlayerName( thePlayer ).." #ffffffDarkhast Location Shoma Ra Accept kard!", find, 255, 255, 0,true)
		else
			outputChatBox("Error: Moshkeli Pish Amade Ast!", thePlayer, 255, 0, 0)
		end
	elseif getElementData(thePlayer,"InGpsSendRequest") then
		local find = miscSys:findPlayer ( getElementData(thePlayer,"InGpsSendRequest") )
		setElementData(thePlayer,"InGpsSendRequest",nil)
		if find and tonumber(getElementInterior(find)) == 0 then
			if GpsMarker[thePlayer] then
				destroyElement(GpsMarker[thePlayer])
				destroyElement(GpsMarkerBlip[thePlayer])
				GpsMarker[thePlayer] = nil
				GpsMarkerBlip[thePlayer] = nil
			end
			local x , y , z = getElementPosition(find)
			GpsMarker[thePlayer] = createMarker( x , y , z ,"checkpoint",3,255, 255, 0,200, thePlayer)
			GpsMarkerBlip[thePlayer] = createBlipAttachedTo( GpsMarker[thePlayer], 56, 2, 255, 0, 0, 255,  0 , 65535,thePlayer )
			outputChatBox("#00ff00[Done]: #ffffffShoma Ba Movafaghiat DarKhast Location #00ff00"..getPlayerName( find ).." #ffffffRa Accept Kardid!", thePlayer, 255, 255, 0,true)
			outputChatBox("#ffff00[Info]: #ffffffPlayer "..getPlayerName( thePlayer ).." #ffffffDarkhast Location Shoma Ra Accept kard!", find, 255, 255, 0,true)
		else
			outputChatBox("Error: Moshkeli Pish Amade Ast!", thePlayer, 255, 0, 0)
		end
	else
		outputChatBox("Error: Shoma Darkhast Location Nadarid!", thePlayer, 255, 0, 0)
	end	
end)

addEventHandler("onMarkerHit", resourceRoot,
function (hitElement,matchingDimension)
	if GpsMarker[hitElement] and GpsMarker[hitElement] == source then
		destroyElement(GpsMarker[hitElement])
		destroyElement(GpsMarkerBlip[hitElement])
		GpsMarker[hitElement] = nil
		GpsMarkerBlip[hitElement] = nil
		exports["notf"]:addNotification(hitElement, "Shoma Be Maghsad Residid!" , 'success')
	end
end)

--ChangeNameShit



function IsNameAvailabe( NewName )
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local NowName = row['pName']
			if string.lower(NowName) == string.lower(NewName) then
				dbFree(query)
				return false
			end
		end
		dbFree(query)
	end
	return true
end	



function UpdateMyNameForMyBank( MyNowName , NewName )	
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM bankaccounts;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local owner = row['bOwner']
			if owner == MyNowName then
				local ChangeOwnerQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `bankaccounts` SET `bOwner` = '"..NewName.."' WHERE `bOwner` = '"..MyNowName.."'")
				dbFree(ChangeOwnerQuery)
				dbFree(query)
				return
			end
		end
		dbFree(query)
	end
end

function UpdateMyNameForDsCars( MyNowName , NewName )	
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local vOwner = row['vOwner']
			local vID = row['vID']
			if MyNowName == vOwner then 
				local ChangeVehOwnerQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `vehicles` SET `vOwner` = '"..NewName.."' WHERE `vID` = '"..vID.."'")
				dbFree(ChangeVehOwnerQuery)
			end
		end
		dbFree(query)
	end
	for _, vehs in ipairs(getElementsByType("vehicle")) do
		if vehs then
			if getElementData(vehs,"owner") and getElementData(vehs,"owner") == MyNowName then
				setElementData(vehs,"owner",NewName)
			end
		end
	end
end

addEvent("RequestCheckName",true)
addEventHandler("RequestCheckName", root,
function ( NewName )
	if NewName then
		if IsNameAvailabe( NewName ) then
			exports["notf"]:addNotification(client, "*"..NewName.."* Motabar Ast!" , 'success')
		else
			exports["notf"]:addNotification(client, "*"..NewName.."* Dar Dastress Nist!" , 'error')
		end
	end
end)

addEvent("RequestChangeName",true)
addEventHandler("RequestChangeName", root,
function ( NewName )
	pGold = goldSys:getPlayerGold(client)
	if pGold < 750 then
		exports["notf"]:addNotification(client, "Shoma Baraye inkar Be "..(750-tonumber(pGold)).." Gold Digar Niyaz Darid! " , 'error')
		return
	end
	if NewName then
		if IsNameAvailabe( NewName ) then
			goldSys:takePlayerGold( client , 750 )
			local MyNowName = getPlayerName(client)
			UpdateMyNameForHouses( MyNowName , NewName )
			UpdateMyNameForMyBank( MyNowName , NewName )
			UpdateMyNameForDsCars( MyNowName , NewName )
			setElementData(accSys:getPlayerAcc(client), "pName", NewName)
			setPlayerName(client,NewName)
			outputChatBox("#ff0000[ChangeName]:#ffffff Player #ff0000"..MyNowName.." #ffffffName Khod Ra Be #ff0000"..NewName.." #ffffffTaghir Dad!", hame_Playera, 255, 255, 255, true)
			exports["notf"]:addNotification(client, "Shoma Ba Movafaghiat Name Khod Ra Be *"..NewName.."* Taghiir Dadid!" , 'success')
		else
			exports["notf"]:addNotification(client, "*"..NewName.."* Dar Dastress Nist!" , 'error')
		end
	end
end)

function SendTwitToServer(root, TwitTexts)

	local level = getElementData(accSys:getPlayerAcc(root), "pLevel")
	local time = getRealTime()
	local hours = time.hour
	if tonumber(level) >= 7 then
			local message = table.concat({ TwitTexts }, " ")
			if #message > 0 then
					local randomValue = math.random(1000,5000)
					local finalValue = randomValue*#message
					local money = getPlayerMoney( root)
					if tonumber(money) > tonumber(finalValue) then
					if getElementData(root, "haveTwit") ~= true then
						takePlayerMoney(root, tonumber(finalValue))
						setElementData(root, "haveTwit", true)
						outputChatBox("#1da1f2[Done]: #ffffffTwit'e Shoma Bad Az 1 Daghighe Gozashte Mishavad!", root, 255, 255, 255, true)
						outputChatBox("#1da1f2[Twit]: #ffffffMablaq "..finalValue.."$ Az Shoma Babat Twit Kam Shod!", root, 255, 255, 255, true)
						for _, player in pairs( getElementsByType 'player' ) do
							if getElementData(player, "loggedIn") == true then
								if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) > 0 then
									outputChatBox("#1da1f2[Twit-Warn]: #ffffffFerestande: #00ff00"..getPlayerName(root).."("..getElementData(root, "TarafID")..") #ffffffMatn: #fff000"..message, player, 255, 22, 22, true)
								end
							end
						end
						setTimer(
						function()
						if getElementData(root, "haveTwit") == true then
							setElementData(root, "haveTwit", nil)
						for _, player in pairs( getElementsByType 'player' ) do
							if getElementData(player, "loggedIn") == true then
								if tonumber(getElementData(accSys:getPlayerAcc(player), "pTwitNot")) == 0 then
									triggerClientEvent( "playTwitt", root, root )
									outputChatBox("#1da1f2[Twitt Az " .. getPlayerName(root) .. "]#ffffff : #ffffff".. message .."", player, 255, 255, 255, true)
								end
							end
						end
						end
						end, 60000, 1)
						else
							outputChatBox("#ff0000[Error]: #ffffffShoma Yek Twit Pakhsh Nashode Darid!",root,255,255,255,true)
						end
					else
						outputChatBox("#ff0000[Error]: #ffffffShoma Baraye Twit Niaz Be $"..finalValue.." Darid!", root, 255, 255, 255, true)
					end

				else
					exports["notf"]:addNotification(root, "Lotfan Matn Twit Ra Vared Konid!!" , 'error')
				end

	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Anjam In Kar Level (+7) Niaz Ast!", root, 255, 255, 255, true)
	end

	
end
addEvent("sendTwits",true)
addEventHandler("sendTwits", root, SendTwitToServer)
--=============================================
addCommandHandler("0382676564",
function(thePlayer)
	setElementData(thePlayer, "haveTwit", nil)
end)
---===============[ Notfiction ] ===============--

function OnTwiits(root)
		exports["notf"]:addNotification(root, "Notfiction Twitter Shoma [ ON ] Shod!" , 'success')
		setElementData(accSys:getPlayerAcc(root), "pTwitNot", 0)	
end
addEvent("onNotF",true)
addEventHandler("onNotF", root, OnTwiits)
---===============[ Notfiction ] ===============--
function OffTwiits(root)
		exports["notf"]:addNotification(root, "Notfiction Twitter Shoma [ OFF ] Shod!" , 'error')
		setElementData(accSys:getPlayerAcc(root), "pTwitNot", 1)	
end
addEvent("offNotF",true)
addEventHandler("offNotF", root, OffTwiits)



addCommandHandler("rjt",
function (thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	if player then
	if find then
	if getElementData(find, "haveTwit") == true then
		setElementData(find, "haveTwit", nil)
		outputChatBox("#00ff00☑️ #ffffffShoma Twitt'e #00ff00"..getPlayerName(find).." #ffffffRa #ff0000Reject #ffffffKardid!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000✖️ #ffffffIn Player Tabligh Nadarad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /rjt <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)