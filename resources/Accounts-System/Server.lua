-- PuB By @KhodeOxYGeM : )
local dbpTime = 500
local globalSys = exports["Global"]
local accSys = exports["Accounts-System"] 
local miscSys = exports["misc"] 
local vehSys = exports["[tn]DS"]
local mysql = exports["Mysql"]

function rgb2hex(r,g,b)
	
	local hex_table = {[10] = 'A',[11] = 'B',[12] = 'C',[13] = 'D',[14] = 'E',[15] = 'F'}
	
	local r1 = math.floor(r / 16)
	local r2 = r - (16 * r1)
	local g1 = math.floor(g / 16)
	local g2 = g - (16 * g1)
	local b1 = math.floor(b / 16)
	local b2 = b - (16 * b1)
	
	if r1 > 9 then r1 = hex_table[r1] end
	if r2 > 9 then r2 = hex_table[r2] end
	if g1 > 9 then g1 = hex_table[g1] end
	if g2 > 9 then g2 = hex_table[g2] end
	if b1 > 9 then b1 = hex_table[b1] end
	if b2 > 9 then b2 = hex_table[b2] end
	
	return "#" .. r1 .. r2 .. g1 .. g2 .. b1 .. b2

end

function SendDiscordLog(Str,player,cmd,tedad,taraf)
	local url = "https://discord.com/api/webhooks/1084365658936053770/iJAsFsQFgDBYeRLPHss8TGCKVZKV2wV8u-s_yb9wI0R9gTqrtRGTqMGBg7w4G3f0H6aX"
    if url then
        sendOptions = {
            queueName = "default",
            connectionAttempts = 3,
            connectTimeout = 5000,
            formFields = {
                content = "⚠️"..tostring(Str).."⚠️\n          ✨MTAName: "..tostring(getPlayerName(player)).."\n          ✨Serial: "..tostring(getPlayerSerial(player)).."\n          ✨IP: "..tostring(getPlayerIP(player)).."\n          ✨Refferal: "..tostring(tedad)..""
            },

        }
        fetchRemote (url, sendOptions, function()end)
    else
        outputDebugString("Webhook not provided.");
    end
end



function loginPlayer(client,username, password,checksave)
	if string.len(username) then
		if string.len(password) then
			dbQuery(onLoginStageTwo, {username, password, client}, exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pName` = ? LIMIT 1", username)
		else
			exports["notf"]:addNotification(client, "Lotfan Password Ra Vared Konid." , 'error')
		end
	else
		exports["notf"]:addNotification(client, "Lotfan Username Ra Vared Konid." , 'error')
	end
	
end
addEvent("attemptLogin",true)
addEventHandler("attemptLogin",getRootElement(),loginPlayer)
addEvent("onVarsReset", false)

function joinShod()
	setPlayerBlurLevel(source, 0)
	for _, stat in ipairs({ 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79 }) do
		setPedStat(source, stat, 1000)
	end
	for i=1, 120 do
		outputChatBox(" ", source)
	end

	outputChatBox("**Shoma Darhal Etesal Be Server #4315aaTheNight MTA#ffffff Hastid **", source, 255, 255, 255,true)
    outputChatBox("         Website: tnmsv.ir | Forum: Forum.tnmsv.ir", source, 255, 255, 255,true)
    outputChatBox("  TeamSpeak: ts.tnmsv.ir | Instagram: Be Zoodi", source, 255, 255, 255,true)
	outputChatBox("         Discord:https://discord.gg/kUJmhm8CDR", source, 255, 255, 255,true)
	setFPSLimit( 66 )
end
addEventHandler("onPlayerJoin",getRootElement(),joinShod)

function onLoginStageTwo(qh, username, password, client, sot)

	local res = dbPoll(qh, 0)

	if type(res[1]) == "nil" then
		exports["notf"]:addNotification(client, "Accounti Ba Name "..username.." Vojood Nadarad!" , 'error')
		
		return false
	end
	
	for index, yaru in ipairs(getElementsByType("account")) do 
		if username == getElementData(yaru, "pName") then
			exports["notf"]:addNotification(client, "In Account Dar Hale Hazer Online Ast!" , 'error')
			return false
		end
	end
		local adminname = res[1]["pBannedBy"]				
		local dalil = res[1]["pBanReason"]
		local timee = res[1]["pBanTime"]
		if res[1]["pBanTime"] >= 1  then
			exports["notf"]:addNotification(client, "In Account Baraye "..timee.." Saat Tavasote Admin "..adminname.." Be Dalile "..dalil.." Ban Shode Ast!" , 'error')
			
			return false
		end
	
	
	
	if getPlayerSerial(client) == res[1]["pSerial"] then
	else
		if res[1]["pSeriallock"] == 0  then
		elseif getPlayerSerial(client) == res[1]["pSecoundSerial"] then 
		else
			exports["notf"]:addNotification(client, "Serial Lock Baraye In Account Faal Shode Ast!" , 'error')
			
			return false
		end
	end
	
	
	
	if password ~= res[1]["pKey"] then
		if getElementData(client,"wrongPasswordAmount") == false then
			exports["notf"]:addNotification(client,"Password Eshtebah Mibashad | Talash Ha : 1/3","error")
			
			setElementData(client,"wrongPasswordAmount",1)
		elseif getElementData(client,"wrongPasswordAmount") == 1 then
			exports["notf"]:addNotification(client,"Passworde Eshtebah Mibashad | Talash Ha : 2/3","error")
			
			setElementData(client,"wrongPasswordAmount",2)
		elseif getElementData(client,"wrongPasswordAmount") == 2 then
			exports["notf"]:addNotification(client,"Passworde Eshtebah Mibashad | Talash Ha : 3/3","error")
			
			setElementData(client,"wrongPasswordAmount",3)
			setTimer(
			function ()
				kickPlayer(client,"Vared Kardane Password Eshtebah Bish Az Hade Mojaz, [3/3]")
			end,3000,1)
		end
		return false
	end
		triggerClientEvent("StopMusicAfterLogin", client)
		
	
	local dbName = res[1]["pName"]
	setPlayerName(client, dbName)
	local isPlayerAnAdmin = nil
	local account = getAccount ( dbName, password )
	if ( account ~= false ) then 
		logIn ( client, account, password )

		local clientAccountName = getAccountName(getPlayerAccount(client))
		if isObjectInACLGroup ( "user." .. clientAccountName, aclGetGroup ( "Admin" ) ) then
			isPlayerAnAdmin = 1
		end
	end

	setElementData(client, "loggedIn", true) 
	--triggerClientEvent(client, "saveLoginToXML", getRootElement(), username, password)				

	local meAccounto = createElement("account")
	setElementData(client, "ePlayerAccount", meAccounto)
	
	setElementData(meAccounto, "bDontUpdate", true)
	setElementData(meAccounto, "ePlayerElement", client)

	for column, value in pairs (res[1]) do
		setElementData(meAccounto, column, value)
	end
    setPlayerWantedLevel(client, getElementData(meAccounto, "pWanted"))
	setPlayerMoney(client, getElementData(meAccounto, "pCash"))
	setElementData(client, "rentStats", false)
	setElementData(client,"NameTagIsShow?",false)
	setElementData(client, "inSleep", false)
	setElementData(meAccounto, "bDontUpdate", false)
	setElementData(client,"kamarband", false)
	setElementData(client,"pCuffe", 0)
	setElementData(client,"pInFFAZone",false)
	for i=1, 100 do
		outputChatBox(" ", client)
	end
	globalSys:spawningPlayerForAcc(client)
	local level = getElementData(meAccounto, "pLevel")
	setElementData(client, "levelPlayer", tonumber(level))
	local playtime = getElementData(meAccounto, "pConnectTime")
	setElementData(client, "playtimePlayer", tonumber(playtime))
	
	if tonumber(getElementData(meAccounto, "pRingtone")) == 0 then
		setElementData(meAccounto, "pRingtone", 1)
	end
	if tonumber(getElementData(meAccounto, "pSmstone")) == 0 then
		setElementData(meAccounto, "pSmstone", 1)
	end
	local theme = getElementData(meAccounto, "pTheme")
	setElementData(client, "nowTheme", tonumber(theme))
	triggerEvent("onVarsReset", root, client)
	triggerClientEvent(client,"useLoginFile",resourceRoot,"set",username,password)


	dbExec(exports.mysql:getMySQLC(), "UPDATE `users` SET `pLastLogin` = NOW(), `pIp` = ? WHERE `pName` = ?", getPlayerIP(client), username)

	--setElementData(client, "pFood", tonumber(getElementData(meAccounto, "pFood")))
	--setElementData(client, "pWater", tonumber(getElementData(meAccounto, "pWater")))
	setElementData(client, "pAdmin", tonumber(getElementData(meAccounto, "pAdmin")))
	setElementData(client, "pBank", tonumber(getElementData(meAccounto, "pBank")))
	dbExec(exports.mysql:getMySQLC(), "UPDATE `users` SET `pLastLogin` = NOW(), `pIp` = ? WHERE `pName` = ?", getPlayerIP(client), username)
	triggerEvent("onVarsReset", root, client)
	setElementData(getPlayerAcc(client), "pOnline", "1")
	setElementData(client, "pDuty", tonumber(0))
	local wantedesh = getElementData(meAccounto, "pWanted")
	setPlayerWantedLevel(client, tonumber(wantedesh))
	--Vehicles ...
	--globalSys:createVehiclesForAcc(client) -- Niyazi Besh Nis Dg
	
	

	fadeCamera(client, true)
	setCameraTarget(client, client)
	CheckInventory(client)
	SendDiscordLog("JoinServerLog", client  )
	exports["notf"]:addNotification(client, "Welcome to TheNight MTA." , 'info')
	outputChatBox("#4315aa				                          -=[ #99FFFFTheNight MTA #4315aa]=-", client, 255, 255, 255, true)
	--outputChatBox(" ", client)
	outputChatBox("#ffffffSalam #00ffff"..getPlayerName(client)..",", client, 255, 255, 255, true)
	outputChatBox("#ffffffBe Server #99FFFFTheNight MTA #ffffffKhosh Oomadi!", client, 255, 255, 255, true)
	--outputChatBox(" ", client)
	outputChatBox("#ffffffBaraye Didan List Cmd Haye Server Shoma Mitavanid", client, 255, 255, 255, true)
	outputChatBox("#ffffffAz Cmd #00ffff/needhelp #ffffffEstefade Konid!", client, 255, 255, 255, true)
	--outputChatBox(" ", client)
	outputChatBox("#ffffffHamchenin Baraye Didan List Helper Haye Online", client, 255, 255, 255, true)
	outputChatBox("#ffffffAz Cmd #00ffff/helpers #ffffffMitavanid Estefade Namaeid!", client, 255, 255, 255, true)
	outputChatBox("#ffffffAz Cmd #00ffff/report #ffffffBaray Ertebat Ba Admin Ha Mitavanid Estefade Knid!", client, 255, 255, 255, true)
	setElementData(client,"ReportMessage",nil)
	setElementData(client,"ReportTime",nil)
	setElementData(client,"pMatForPut",0)
	setElementData(client,"pContractAcc",false)
	triggerClientEvent( "HideLoginPannel", client, client )
	triggerClientEvent( "saveXML", client, client )
		
	local time = getRealTime()
	local hours = time.hour
	if hours >= 5 and hours < 19 then
	    outputChatBox("#ffffffRoze Khobi Dashte Bashid.", client, 255, 255, 255, true)
	  else
	  outputChatBox("#ffffffShabe Khobi Dashte Bashid.", client, 255, 255, 255, true)
	end
	
	-- Daryafe Pack Gold Age Offline Bod Va BA Cmd Offline Dadimesh #ExoPrim
	--[[if tonumber(getElementData(accSys:getPlayerAcc(client), "pGoldPack")) >= 1 then
		local MeghdarePackeGold = tonumber(getElementData(accSys:getPlayerAcc(client), "pGoldPack"))
		outputChatBox("#00ff00[ChariotMTA-Shop]: #ffffffPack #00ff00"..MeghdarePackeGold.." #ffffffAdadi Tala (Gold) Ba Movafaghiat Az Foroshgah Server #ffff98</shop> #ffffffBe Shoma Taalogh Gereft!", client, 255, 255, 255, true)
		triggerClientEvent ( client, "PlayDaryaft", client )
		setElementData(accSys:getPlayerAcc(client), "pGoldPack", 0)
	end]]



-- Age DBase 1 Bod Explosion Sound On Set She Age Nabod OFF. #ExoPrim
	if tonumber(getElementData(accSys:getPlayerAcc(client), "pExplosionSound")) == 1 then
		triggerClientEvent ( "SetExplosionSoundTrue", client )
	else
		triggerClientEvent ( "SetExplosionSoundFalse", client )
	end
	--|||--------------------------------------|||--
	
		-- Age DBase 1 Bod Shoot Sound On Set She Age Nabod OFF. 
	--if tonumber(getElementData(accSys:getPlayerAcc(client), "pShootSound")) == 1 then
		--triggerClientEvent ( "SetShootSoundTrue", client )
	--else
		--triggerClientEvent ( "SetShootSoundFalse", client )
	--end
	--|||--------------------------------------|||--
	
		-- Age DBase 1 Bod God Shader On Set She Age Nabod OFF. #ExoPrim
	--if tonumber(getElementData(accSys:getPlayerAcc(client), "pGodShader")) == 1 then
		--triggerClientEvent ( "GodShaderOn", client )
	--else
		--triggerClientEvent ( "GodShaderOff", client )
	--end
	--|||--------------------------------------|||--
	
	
	-- Age DBase 1 Bod Water Effect On Set She Age Nabod OFF. #ExoPrim
	if tonumber(getElementData(accSys:getPlayerAcc(client), "pWaterEffect")) <= 1 then
		triggerClientEvent ( "RoshanSheWaterEffect", client )
	else
		triggerClientEvent ( "KhamoshSheWaterEffect", client )
	end
	--|||--------------------------------------|||--
	
		-- Age DBase 1 Bod Sky Effect On Set She Age Nabod OFF. #ExoPrim
	if tonumber(getElementData(accSys:getPlayerAcc(client), "pSkyEffect")) <= 1 then
		triggerClientEvent ( "OnSheSky", client )
	else
		triggerClientEvent ( "OffSheSky", client )
	end
	--|||--------------------------------------|||--
	
	-- Conenct time Moghe Login 0 She (For Cleaer Wanted)
	if tonumber(getElementData(accSys:getPlayerAcc(client), "pClearWantedTime")) > 0 then
		setElementData(accSys:getPlayerAcc(client), "pClearWantedTime", 0)
	end
	--|||--------------------------------------|||--
	
	-- Age Time ColorName 0 Shod Color Name Sefid She #ExoPrim
	if tonumber(getElementData(accSys:getPlayerAcc(client), "pColorNameTime")) <= 0 then
		setElementData(accSys:getPlayerAcc(client), "pColorName", "#FFFFFF")
	end
	
	


	--|||--------------------------------------|||--
		triggerClientEvent ( client, "SteSheSkillGunHa2", client )
	
	--> Set Shodan Tarikh Emroz Dar Data Base <--
	--[[local date = getRealTime()
	local year = date.year + 1900
	local month = date.month + 1
	if month < 10 then
			month = "0"..date.month + 1
	end
	local day = date.monthday 
	if day < 10 then
		day = "0"..date.monthday
	end
	setElementData(accSys:getPlayerAcc(client), "pMonthInfo", tonumber(month))
	setElementData(accSys:getPlayerAcc(client), "pYearInfo", tonumber(year))
	setElementData(accSys:getPlayerAcc(client), "pDayInfo", tonumber(day))]]
	
	--> Neshon Dadane Tarikh Info <--
	--local Year = tonumber(getElementData(accSys:getPlayerAcc(client), "pYearInfo"))
	--local ref = tonumber(getElementData(accSys:getPlayerAcc(client), "pMonthInfo"))
	--local mail = tonumber(getElementData(accSys:getPlayerAcc(client), "pDayInfo"))
	
	--triggerClientEvent("upstats22", client, client, levelesh, respectash, faction, monthesh, number, EveryExForLevUp, registerArq, lastArq, preArq, hisJob, genderesh, namesh, agesh, bankaParasi, carlic, carlicV, carlicV2,motorlic, motorlicV, motorlicV2, flylic, flylicV, flylicV2, boatlic, boatlicV, boatlicV2, matlic, matlicV, matlicV2, gunlic, gunlicV, gunlicV2)
	--triggerClientEvent("upstats22", client, client, levelesh, respectash, mail, ref, faction, monthesh, number, EveryExForLevUp, registerArq, lastArq, preArq, hisJob, genderesh, namesh, agesh, bankaParasi, Year, carlic, carlicV, carlicV2,motorlic, motorlicV, motorlicV2, flylic, flylicV, flylicV2, boatlic, boatlicV, boatlicV2, matlic, matlicV, matlicV2, gunlic, gunlicV, gunlicV2)
	--|||--------------------------------------|||--
	local rankes = "Shahrvand"
	exports["notf"]:addNotification(client, "Shoma Ba Movafaghiat Vared Server Shodid!" , 'success')
	fadeCamera(client, true)
	setCameraTarget(client, client)

	if tonumber(getElementData(meAccounto, "pReg")) < 2 then
		globalSys:openPanels(client)
		exports["notf"]:addNotification(client, "Lotfan Etelaate Khod Ra Vared Konid!" , 'info')
	end
	if tonumber(getElementData(accSys:getPlayerAcc(client), "pFamiId")) > 0 then
		local LastFamily = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys` WHERE fID = ? ",tonumber(getElementData(accSys:getPlayerAcc(client), "pFamiId")))
		local result, numrows = dbPoll(LastFamily, 500)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				dbFree(LastFamily)
				setPlayerNametagText(client,getPlayerName(client).." ("..row['fTag']..") ["..getElementData(client,"TarafID").."]")	
			end
		else
			setElementData(accSys:getPlayerAcc(client), "pFamiId","0")
		end
	else
		setPlayerNametagText( client,getPlayerName(client).." ["..getElementData(client,"TarafID").."]")
	end

	setElementData(client, "pDuty", tonumber(0))
	local wantedesh = getElementData(meAccounto, "pWanted")
	setPlayerWantedLevel(client, tonumber(wantedesh))
	setElementData(client,"pCuffed?",false)
	setElementData(client,"pCuffed2?",false)
	setElementData(client,"inBisim",0)
	
	setElementData(getPlayerAcc(client), "pOnline", 1)
    exports["[TN]DS"]:CreateLoggedInVeh(client)
	exports["[TN]WeapH"]:LoadRecoilOnLogin(client)
	--exports["Recoil"]:LoadRecoilOnLogin(client)
	--exports["panel2"]:SetSheDigeAh(client)
	--triggerServerEvent("SetSheDigeAh", getLocalPlayer(), getLocalPlayer() )
	
end
function CheckInventory(thePlayer)
	local InventoryQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM inventory;")
	local result, numrows = dbPoll(InventoryQuery, 500)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			
			if tonumber(row["InvOwner"]) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")) then
				dbFree(InventoryQuery)
				return true
			end
		end
	end
	dbFree(InventoryQuery)
		local InventoryCreation = dbQuery(exports.mysql:getMySQLC(), "INSERT INTO `inventory` SET `InvOwner` = ?",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")))
	dbFree(InventoryCreation)
end

function onRegisterStageTwo(qh, username, password, email, client, randNum)

	local res = dbPoll(qh, 0)
	if type(res[1]) == "nil" then
		--setElementData(getElementData(client, "ePlayerAccount"), "pPnumber", tonumber(randNum))
		dbQuery(function (qhSec)
			local resSec = dbPoll(qhSec, 0)
			if type(resSec[1]) ~= "nil" then
				exports["notf"]:addNotification(client, "Shoma Yek Account Ba Name "..resSec[1]["pName"].." Darid!" , 'error')
				
				return false
			end
			dbQuery(function (qhThi)
				dbFree(qhThi)
				exports["notf"]:addNotification(client, "Account Shoma Sakhte Shod!" , 'success')
				triggerClientEvent("BoroBePageLogin", client)
				return true
			end, exports.mysql:getMySQLC(), "INSERT INTO `users` SET `pName` = ?, `pKey`= ?, `pEmail` = ?, `cSkin` = '2', `pCash` = '5000', `pRegistredDate` = NOW(), `pIp` = ?, `pSerial` = ?, `pLevel` = '1', `pSlot` = '2'", username, password, email, getPlayerIP(client), getPlayerSerial(client))
		end, exports.mysql:getMySQLC(), "SELECT `pName` FROM `users` WHERE `pSerial` = ? LIMIT 1", getPlayerSerial(client))
	end
end

function registerPlayer(source, username, password, email)
	dbQuery(function (qh)
		local res = dbPoll(qh, 0)
		if type(res[1]) ~= "nil" then
			exports["notf"]:addNotification(source, "In Account Az Ghabl Vojood Darad!" , 'error')
			
			return false
		end
		local randNum = math.random(1000000, 9999999)
		dbQuery(onRegisterStageTwo, {username, password, email, source, randNum}, exports.mysql:getMySQLC(), "SELECT `pID` FROM `users` WHERE `pPnumber` = ?", randNum)
	end, exports.mysql:getMySQLC(), "SELECT `pID` FROM `users` WHERE `pName`=?", username)
end
addEvent("attemptRegister", true)
addEventHandler("attemptRegister", getRootElement(), registerPlayer) 

 

function whenPlayerLeft()  
	if getElementData(source, "loggedIn") then
		local x, y, z = getElementPosition(source)
		
		setElementData(getPlayerAcc(source), "pLastx", x)
		setElementData(getPlayerAcc(source), "pLasty", y)
		setElementData(getPlayerAcc(source), "pLastz", z)
		local wanted = getPlayerWantedLevel(source)
		local pool = getPlayerMoney(source)
		

		exports.Logs:newLog("Quit","Player "..getPlayerName(source).." Kharej Shod")
		outputDebugString("Player "..getPlayerName(source).." Quit Dad")
		setElementData(getPlayerAcc(source), "pWanted", tonumber(wanted))
		setElementData(getPlayerAcc(source), "pCash", tonumber(pool))
		setElementData(getPlayerAcc(source), "pOnline", "0")
		setElementData(source, "loggedIn", false)
		destroyElement(getElementData(source, "ePlayerAccount"))
		local playername = getPlayerName(source)
		

		
		
		for _,pveh in ipairs (getElementsByType("vehicle")) do
			if pveh then
			   if getElementData(pveh, "owner") == playername then
				   exports["[TN]DS"]:setVehicleData(tonumber(getElementData(pveh,"vehicleID")),"vMove",getElementData(pveh,"vMove"))
				   destroyElement(pveh)
			   end
			end
		end
	end
end
addEventHandler("onPlayerQuit", getRootElement(), whenPlayerLeft)



-- Bade Change Name Mashin Pak She Ta 2 Ta Nashe #ExoPrim
function PakSheCarEzafi()  
	if getElementData(source, "loggedIn") then
		local playername = getPlayerName(source)
		for _,pveh in ipairs (getElementsByType("vehicle")) do
			if pveh then
			   if getElementData(pveh, "owner") == playername then
				   destroyElement(pveh)
				   -- vehSys:RgbColorTimer2
				   -- vehSys:RgbColorTimer
			   end
			end
		end
	end
end
addEvent("DvShecarHayePlayer", true)
addEventHandler("DvShecarHayePlayer", getRootElement(), PakSheCarEzafi) 

function getPlayerAcc(client)
	return getElementData(client, "ePlayerAccount")
end

function getPlayerFromAcc(account)
	return getElementData(account, "ePlayerElement")
end

function RenameInXml(taraf,username)
	triggerClientEvent ( "ChangeUserNameInXml", taraf,username )
end



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
