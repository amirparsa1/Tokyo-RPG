local accSys = exports["Accounts-System"] 
function AdminCMDWarN(Message)
	for k, source in ipairs (getElementsByType("player")) do
		if getElementData(source , "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(source), "pAdmin")) == 15 or tonumber(getElementData(accSys:getPlayerAcc(source), "pAdmin")) == 11 then
				outputChatBox( "#ff0000[Admin-Warn] "..Message.."", source, 255, 255, 255, true)
			end
		end
	end
end

crouchHandleded = {}
crouchHandleded2 = {}
function crouchhandler(thePlayer)
	if not crouchHandleded[thePlayer] then
		toggleControl(thePlayer,"crouch",false)
		
		crouchHandleded[thePlayer] = setTimer(function(thePlayer)
			toggleControl(thePlayer,"crouch",true)
			crouchHandleded[thePlayer] = nil
		end,800,1,thePlayer)
	end
	if not crouchHandleded2[thePlayer] then
		toggleControl(thePlayer,"fire",false)
		
		crouchHandleded2[thePlayer] = setTimer(function(thePlayer)
			toggleControl(thePlayer,"fire",true)
			crouchHandleded2[thePlayer] = nil
		end,400,1,thePlayer)
	end
end
addEvent("handleCrouch",true)
addEventHandler("handleCrouch",getRootElement(),crouchhandler)



PunchHandleded = {}
PunchhHandleded2 = {}
function aim_weaponhandler(thePlayer)
	if getPedWeaponSlot ( thePlayer ) == 0 then
		if not PunchHandleded[thePlayer] then
				
			toggleControl(thePlayer,"aim_weapon",false)

			setTimer(function(thePlayer)
				aim_weaponhandler(thePlayer)
			end,1100,1,thePlayer)
			PunchHandleded[thePlayer] = setTimer(function(thePlayer)
				toggleControl(thePlayer,"aim_weapon",true)
				PunchHandleded[thePlayer] = nil
			end,850,1,thePlayer)
			
		end
		if not PunchhHandleded2[thePlayer] then
			toggleControl(thePlayer,"aim_weapon",false)

			PunchhHandleded2[thePlayer] = setTimer(function(thePlayer)
				toggleControl(thePlayer,"aim_weapon",true)
				PunchhHandleded2[thePlayer] = nil
			end,1000,1,thePlayer)
		end
	end
end
addEvent("handleaim_weapon",true)
addEventHandler("handleaim_weapon",getRootElement(),aim_weaponhandler)






commandSpam = {}
function preventCommandSpam() 
	if getPlayerName(source) ~= "ExoPrim" then

    	if (not commandSpam[source]) then  
    	    commandSpam[source] = 1
    	elseif (commandSpam[source] == 3) then 
    	    cancelEvent() 
    	    outputChatBox("", source, 255, 0, 0) 

    	else 
    	    commandSpam[source] = commandSpam[source] + 1 
    	end 
	end

end 
addEventHandler("onPlayerCommand", root, preventCommandSpam) 
setTimer(function() commandSpam = {} end, 5000, 0) 

PunchHandleded = {}
PunchhHandleded2 = {}
function handlepunch_weapon(thePlayer)
	if getPedWeaponSlot ( thePlayer ) == 0 then
		if not PunchHandleded[thePlayer] then
			
			toggleControl(thePlayer,"fire",false)
			toggleControl(thePlayer,"aim_weapon",false)
			setTimer(function(thePlayer)
				handlepunch_weapon(thePlayer)
			end,1100,1,thePlayer)
			PunchHandleded[thePlayer] = setTimer(function(thePlayer)
				toggleControl(thePlayer,"aim_weapon",true)
				toggleControl(thePlayer,"fire",true)
				PunchHandleded[thePlayer] = nil
			end,850,1,thePlayer)
			
		end
		if not PunchhHandleded2[thePlayer] then
			toggleControl(thePlayer,"fire",false)
			toggleControl(thePlayer,"aim_weapon",false)
			PunchhHandleded2[thePlayer] = setTimer(function(thePlayer)
				toggleControl(thePlayer,"aim_weapon",true)
				toggleControl(thePlayer,"fire",true)
				PunchhHandleded2[thePlayer] = nil
			end,1000,1,thePlayer)
		end
	end
end
addEvent("handlepunch_weapon",true)
addEventHandler("handlepunch_weapon",getRootElement(),handlepunch_weapon)

local o_avpn = {}


o_avpn.onStartCheckup = true 

o_avpn.avoided = {
	"127.0.0.1",
}
--[[addEventHandler("onResourceStart", resourceRoot, function()
	outputDebugString("Anti-VPN by Overord started.")

	if o_avpn.onStartCheckup then
		for i, player in ipairs(getElementsByType("player")) do
			setTimer(function() o_avpn.check(player) end, i*100, 1)
		end
	end
end)

function o_avpn.check(player, requester)
	assert(getElementType(player)=="player", "VPN ERROR: No players were supplied")	
	local playerIP = getPlayerIP(player)
	
	for _, ip in ipairs(o_avpn.avoided) do
		if ip == playerIP then outputDebugString("IP avoided.", 2) return false end
	end
	
	fetchRemote("http://proxy.mind-media.com/block/proxycheck.php?ip="..playerIP, function(rdata, err)
		if err == 0 then
			if rdata == "Y" then
				if requester then 
					outputChatBox("The test results for the player "..getPlayerName(player).." #FFFFFFare #FF0000Positive. #FFFFFFThe player appears to be using a VPN.", requester, 255, 255, 255, true)
				else
					if string.lower(get("vpnwarn")) == "true" then
						outputDebugString("Player "..getPlayerName(player).." is using VPN.", 2)
						for _, adm in ipairs(getElementsByType("player")) do
							local admAcc = getPlayerAccount(adm)
							if not isGuestAccount(admAcc) and isObjectInACLGroup("user."..getAccountName(admAcc), aclGetGroup(get("vpnacl"))) then
								outputChatBox("Player "..getPlayerName(player).." is using VPN.", adm)
							end
						end
					end
					if string.lower(get("vpnkick")) == "true" then
						outputDebugString("Player "..getPlayerName(player).." has been kicked.")
						kickPlayer(player, "VPN Detected.")
					end
				end
			elseif rdata == "N" then
				if requester then 
					outputChatBox("The test results for the player "..getPlayerName(player).." #FFFFFFare #00FF00Negative. #FFFFFFThe player appears NOT to be using a VPN.", requester, 255, 255, 255, true)
				end
			elseif rdata == "X" then
				if requester then 
					outputChatBox("Something wrong with the player's IP player "..getPlayerName(player).." #FFFFFFIP: #00FF00"..playerIP, requester, 255, 255, 255, true)
				elseif string.lower(get("vpnwarn")) == "true" then
					for _, adm in ipairs(getElementsByType("player")) do
						local admAcc = getPlayerAccount(adm)
						if not isGuestAccount(admAcc) and isObjectInACLGroup("user."..getAccountName(admAcc), aclGetGroup(get("vpnacl"))) then
							outputChatBox("Something wrong with the player's IP player "..getPlayerName(player).." #FFFFFFIP: #00FF00"..playerIP, adm, 255, 255, 255, true)
						end
					end
				end
			else
				outputDebugString("UNKNOWN RESPONSE.. "..rdata, 1)
			end
		else
			if requester then 
				outputChatBox("[Anti-VPN]: Error while connecting to the server", requester)
			else
				outputDebugString("Connection Error while checking the player "..getPlayerName(player), 2)
			end	
		end
	end)
	return true
end
addEventHandler("onPlayerJoin", root, function()
	o_avpn.check(source, false)
end)]]



