local accSys = exports["Accounts-System"]
local miscSys = exports["Misc"]

function GetOnlineAdmins()
	local Admins = 0
	for index,modira in ipairs(getElementsByType("player")) do
		if getElementData(modira,"loggedIn") and getElementData(modira,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(modira),"pAdmin") >= 1 then
				Admins = tonumber( Admins ) + 1
			end
		end
	end
	return Admins
end

function ReportMessage(message)
	for index,OnlineAdmins in ipairs(getElementsByType("player")) do
		if getElementData(accSys:getPlayerAcc(OnlineAdmins),"pAdmin") >= 1 then
			outputChatBox(message, OnlineAdmins, 255, 255, 255, true )
		end
	end
end

function Report(thePlayer,command,...)
	local matn = table.concat({ ... }, " ")
	if getElementData(thePlayer,"ReportMessage") ~= nil then
		outputChatBox("#c5cfe0(Report-System):#ffffff Shoma Ghablan Report Dadid!", thePlayer, 212, 156, 49,true)
		return false
	end
	if #matn < 1 then
		outputChatBox("#ff0000Bezan: /"..command.." <Matn>", thePlayer, 212, 156, 49,true)
		return false
	end
	if #matn > 187 then
		outputChatBox("#ff0000Matn Shoma Toolani Ast!", thePlayer, 212, 156, 49,true)
		return false
	end
	if tonumber(GetOnlineAdmins()) < 1 then
		outputChatBox("#c5cfe0(Report-System):#ffffff Dar Hal Hazer Admin Online Dar Server Nist!", thePlayer, 212, 156, 49,true)
		return false
	end
	setElementData(thePlayer,"ReportMessage",matn)
	local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	local seconds = time.second
	if (hours < 10) then
		hours = "0"..hours
	end
	if (minutes < 10) then
		minutes = "0"..minutes
	end
	if (seconds < 10) then
		seconds = "0"..seconds
	end
	reportTime = "["..hours..":"..minutes..":"..seconds.."]"
	setElementData(thePlayer,"ReportTime",reportTime)
	exports["notf"]:addNotification(thePlayer, "Report Shoma Ersal Gardid!" , 'success')
	outputChatBox("#c5cfe0(Report-System):#ffffff Report Shoma Ersal Gardid! #c5cfe0[Matn: "..matn.." ]", thePlayer, 212, 156, 49,true)
	PlayerID = getElementData(thePlayer,"TarafID")
	ReportMessage("#c5cfe0(Report-System):#ffffff Player #c5cfe0"..getPlayerName(thePlayer).." ("..PlayerID..") #FFFFFFReport Jadidi Ersal Karde Ast!")
	ReportMessage("#c5cfe0(Report-System):#ffffff "..reportTime.." #c5cfe0"..matn.." ")
	exports["[EniX]Logs"]:CreateServerLog("Report-System","Player "..getPlayerName(thePlayer).." Report Jadidi Ersal Karde Ast!")
	exports["[EniX]Logs"]:CreateServerLog("Report-System","Matn Report: (( "..matn.." ))")
end
addCommandHandler("report", Report)

function Reports(thePlayer,command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
	outputChatBox("#c5cfe0(Report-System):#ffffff List Report Haye Baz Dar Server", thePlayer, 212, 156, 49,true)
	for index,PlayersInServer in ipairs(getElementsByType("player")) do
		if getElementData(PlayersInServer,"loggedIn") and getElementData(PlayersInServer,"loggedIn") == true then
			if getElementData(PlayersInServer,"ReportMessage") ~= nil then
				PlayerName = getPlayerName(PlayersInServer)
				PlayerReportMessage = getElementData(PlayersInServer,"ReportMessage")
				PlayerReportTime = getElementData(PlayersInServer,"ReportTime")
				PlayerID = getElementData(PlayersInServer,"TarafID")
				outputChatBox("#c5cfe0(Report-System):#ffffff "..PlayerReportTime.." [ "..PlayerName.." ("..PlayerID..") ] #c5cfe0(( "..PlayerReportMessage.." ))", thePlayer, 212, 156, 49,true)
			end
		end
	end
	outputChatBox("#c5cfe0-----------------------------------------------------------------------", thePlayer, 212, 156, 49,true)
end
addCommandHandler("reports", Reports)

function CloseReport(thePlayer,command,taraf)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
	if taraf == nil then
		outputChatBox("#ff0000Bezan: /"..command.." <PartOfName/ID>", thePlayer, 212, 156, 49,true)
		return false
	end
	local find = miscSys:findPlayer ( taraf )
	if not find then
		outputChatBox("#ff0000Player Mored Nazar Yaft Nashod!", thePlayer, 212, 156, 49,true)
		return false
	end
	if getElementData(find,"ReportMessage") == nil then
		outputChatBox("#ff0000In Player Reporti Nadade Ast!", thePlayer, 212, 156, 49,true)
		return false
	end
	setElementData(find,"ReportMessage",nil)
	setElementData(find,"ReportTime",nil)
	outputChatBox("#c5cfe0(Report-System):#ffffff Report Player #c5cfe0"..getPlayerName(find).."#FFFFFF Baste Shod!", thePlayer, 212, 156, 49,true)
	outputChatBox("#c5cfe0(Report-System):#ffffff Report Shoma Tavast #c5cfe0"..getPlayerName(thePlayer).."#FFFFFF Baste Shod!", find, 212, 156, 49,true)
	exports["[EniX]Logs"]:CreateServerLog("Report-System","Report Player "..getPlayerName(find).." Tavasot "..getPlayerName(thePlayer).." Baste Shod!")
end
addCommandHandler("creport", CloseReport)
addCommandHandler("closereport", CloseReport)
addCommandHandler("rreport", CloseReport)

function OpenReport(thePlayer,command,taraf,...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
	local matn = table.concat({ ... }, " ")
	if taraf == nil then
		outputChatBox("#ff0000Bezan: /"..command.." <PartOfName/ID> <Pasokh>", thePlayer, 212, 156, 49,true)
		return false
	end
	if #matn < 1 then
		outputChatBox("#ff0000Bezan: /"..command.." <PartOfName/ID> <Pasokh>", thePlayer, 212, 156, 49,true)
		return false
	end
	local find = miscSys:findPlayer ( taraf )
	if not find then
		outputChatBox("#ff0000Player Mored Nazar Yaft Nashod!", thePlayer, 212, 156, 49,true)
		return false
	end
	if getElementData(find,"ReportMessage") == nil then
		outputChatBox("#ff0000In Player Reporti Nadade Ast!", thePlayer, 212, 156, 49,true)
		return false
	end
	setElementData(find,"ReportMessage",nil)
	setElementData(find,"ReportTime",nil)
	outputChatBox("#c5cfe0(Report-System):#ffffff Report Player #c5cfe0"..getPlayerName(find).."#FFFFFF Baste Shod!", thePlayer, 212, 156, 49,true)
	outputChatBox("#c5cfe0(Report-System):#ffffff Pasokh Shoma: #c5cfe0(( "..matn.." ))", thePlayer, 212, 156, 49,true)
	outputChatBox("#c5cfe0(Report-System):#ffffff Report Shoma Tavast #c5cfe0"..getPlayerName(thePlayer).." #FFFFFFBaste Shod!", find, 212, 156, 49,true)
	outputChatBox("#c5cfe0(Report-System):#ffffff Pasokh Admin: #c5cfe0(( "..matn.." ))", find, 212, 156, 49,true)
	exports["[EniX]Logs"]:CreateServerLog("Report-System","Report Player "..getPlayerName(find).." Tavasot "..getPlayerName(thePlayer).." Pasokh Dade Shod!")
	exports["[EniX]Logs"]:CreateServerLog("Report-System","Pasokh: (( "..matn.." ))")
end
addCommandHandler("oreport", OpenReport)
addCommandHandler("openreport", OpenReport)
addCommandHandler("areport", OpenReport)