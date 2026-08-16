local accSys = exports["Accounts-system"] -- Code By ExMohmD
local miscSys = exports["Misc"] -- Telegram: @ExMohmD
local nowLive = false

function GetCamera (thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 7 then
			outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		giveWeapon ( thePlayer, 43, 10000 )
		outputChatBox("#c25857(News Reporter):#FFFFFF Shoma #c25857Doorbin Akasi #FFFFFFGereftid!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("camera", GetCamera)

addCommandHandler("news",
function(thePlayer, cmd, ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 7 then
			outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		local theVehicle = getPedOccupiedVehicle (thePlayer)
		if theVehicle then
			local vehid = getElementID ( theVehicle )
			if (type(string.find(vehid,"SfNr")) == "number")
			or (type(string.find(vehid,"LsNr")) == "number") 
			or (type(string.find(vehid,"LvNr")) == "number") then
					local hooqoqesh = getElementData(accSys:getPlayerAcc(thePlayer), "pMozd")
					setElementData(accSys:getPlayerAcc(thePlayer), "pMozd", tonumber(hooqoqesh) + 8800)
				local message = table.concat({ ... }, " ")
				for k, hame_Playera	in ipairs (getElementsByType("player")) do	
					if #message > 0 then
						if getElementData(hame_Playera, "loggedIn") == true then
							outputChatBox("#c25857News Az Khabar-Negar " .. getPlayerName(thePlayer) .. ": #ffffff" .. message .."", hame_Playera, 255, 255, 255, true)
						end
					end
				end 
			else
				outputChatBox("#ff0000Error: Baraye Inkar Bayad Dakhel Mashin Haye News Reporter Bashid!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
)

addCommandHandler("startlive",
function(thePlayer, cmd, ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 7 then
			outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		if nowLive == true then
			outputChatBox("#ff0000Error: #ffffffDar Hal Hazer Yek Live Dar Hal Pakhsh Ast, Sabr Konid Ta Tamam Shavad!", thePlayer, 255, 255, 255, true)
			return false
		end
				local message = table.concat({ ... }, " ")
				nowLive = true
				outputChatBox("#c25857LIVE : #ffffffLive Az Khabar-Negar #c25857" .. getPlayerName(thePlayer) .. "#ffffff , Live Name: #c25857" .. message .."", hame_Playera, 255, 255, 255, true)
				outputChatBox("#c25857LIVE : #ffffffBa CMD [ /live ] Mitavanid Vared Live Shavid Va Ba CMD [ /liveoff ] Live Ra Off Konid!", hame_Playera, 255, 255, 255, true)
				setElementData(thePlayer,"inLive",true)
				setElementData(thePlayer, "GV",true)
			else
		end
	end
)

addCommandHandler("stoplive",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 7 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) == 0 then
		outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if nowLive == false then
		outputChatBox("#ff0000Error: Dar Hal Hazer Hich Live'e Darhal Pakhsh Nist!", thePlayer, 255, 255, 255, true)
		return false
	end
	nowLive = false
	outputChatBox("#c25857LIVE : #ffffffLive Tavasot #c25857"..getPlayerName(thePlayer).." #ffffffBe Payan Resid, Rooz Khoobi Dashte Bashid!", hame, 255, 255, 255, true)
	for k, hame_Playera	in ipairs (getElementsByType("player")) do	
		if getElementData(hame_Playera, "loggedIn") == true then
			setElementData(hame_Playera, "inLive", false, false)
			setElementData(hame_Playera, "GV",nil)
		end
	end
	
end
)

addEventHandler ( "onPlayerQuit", root, 
function(quitType)
	if getElementData(source, "inLive") == true then
		setElementData(source, "inLive", false, false)
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				if tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) == 7 then
					outputChatBox("#c25857LIVE : #ffffffKhabar-Negar #c25857"..getPlayerName(source).." #ffffffAz Server Kharej Shod! ( "..quitType.." ) Va Live Be Payan Resid.", hame_Playera, 255, 255, 255, true)
					nowLive = nil
				else
					outputChatBox("#c25857LIVE : #ffffffMehman #c25857"..getPlayerName(source).." #ffffffAz Server Kharej Shod! ( "..quitType.." )", hame_Playera, 255, 255, 255, true)
				end
			end
		end
	end
end
)

addCommandHandler("cl",
function(thePlayer, cmd, ...)
	if nowLive ~= true then
		outputChatBox("#ff0000Error: Dar Hal Hazer Hich Live'e Darhal Pakhsh Nist!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"inLive",nil)
		return false
	end
	if getElementData(thePlayer, "inLive") == true then

			local vehid = getElementID ( theVehicle )
				local message = table.concat({ ... }, " ")
				for k, hame_Playera	in ipairs (getElementsByType("player")) do	
					if getElementData(hame_Playera, "loggedIn") == true then
						if #message > 0 then
							if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 then
								outputChatBox("#c25857Khabar-Negar "..getPlayerName(thePlayer)..": #ffffff" .. message .."", hame_Playera, 255, 255, 255, true)
							else
								outputChatBox("#c25857Mehman "..getPlayerName(thePlayer)..": #ffffff" .. message .."", hame_Playera, 255, 255, 255, true)
							end
						end
					end
				end
	else
		outputChatBox("#ff0000Error: Shoma Dar LIVE Nistid!", thePlayer, 255, 255, 255, true)
	end
end
)

addCommandHandler("invitelive",
function(thePlayer, cmd, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 7 then
		outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end

	if nowLive == false then
		outputChatBox("#ff0000Error: Dar Hal Hazer Hich Live'e Darhal Pakhsh Nist!", thePlayer, 255, 255, 255, true)
		return false
	end

			local find = miscSys:findPlayer ( player )
			if find then
					setElementData(find, "GV",true)
					local targetPlayer = getPlayerName ( find )
					if getElementData( find, "inLive" ) ~= true then
						setElementData( find, "inLive", true )
						for k, hame_Playera	in ipairs (getElementsByType("player")) do
							if getElementData(hame_Playera, "loggedIn") == true then
								if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) == 7 then
									outputChatBox("#c25857LIVE : #ffffffKhabar-Negar #c25857"..getPlayerName(find).." #ffffffBe LIVE Vared Shod!", hame_Playera, 255, 255, 255, true)
								else
									outputChatBox("#c25857LIVE : #ffffffMehman #c25857"..getPlayerName(find).." #ffffffBe LIVE Vared Shod!", hame_Playera, 255, 255, 255, true)
								end
							end
						end
					else
						outputChatBox("#ff0000Error: In Player Khodesh Dakhel LIVE Ast!", thePlayer, 255, 255, 255, true)
					end
			else
				outputChatBox("#ff0000Error: Invite Anjam Nashod!", thePlayer, 0, 255, 0,true)
			end
end)

local TakenPic = {}

addCommandHandler("topic",
function( thePlayer, cmd )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 7 then
		outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if TakenPic[thePlayer] then
		triggerClientEvent ( thePlayer, "ShowTopic", thePlayer, TakenPic[thePlayer] )
	else
		outputChatBox("#ff0000Error: Baraye Inkar Bayad Ebteda Aks Bendazid!", thePlayer, 255, 255, 255, true)
	end
end)

addEventHandler( "onPlayerScreenShot", root,
function ( theResource, status, pixels, timestamp, tag )
	if tag then
		TakenPic[getPlayerFromName ( tag )] = pixels
		outputDebugString("Sent By: "..tag.."")
	end
	setTimer( function()
		if TakenPic[root] then
			destroyElement (TakenPic[root])
			TakenPic[root] = nil
		end
	end, 60000, 1)
end)

addEvent("TakeNrScreen",true)
addEventHandler("TakeNrScreen", root,
function (root)
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 7 then
		setTimer( function()
			takePlayerScreenShot( root, 320, 200, getPlayerName(root) )
			outputDebugString("Khabar-Negar : "..getPlayerName(root).." Yek Ax Baraye Server Ersal Kard!")
		end, 2000, 1)
	end
end)

addEvent("SendTopicToServer",true)
addEventHandler("SendTopicToServer", root,
function (root , SS , Matn)
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 7 then
		exports["notf"]:addNotification(root, "Topic Shoma Be Server Ersal Shod Va Be Zodi Namayesh Dade Mishavad!" , 'info')
		setTimer( function()
			triggerClientEvent ( "ShowNewsPaper", getRootElement(), getPlayerName(root) , SS , Matn )
		end, 2000, 1)
		local root = getElementData(accSys:getPlayerAcc(thePlayer), "pMozd")
		setElementData(accSys:getPlayerAcc(thePlayer), "pMozd", tonumber(root) + 8800)
	end
end)


newReportnrDuty = createPickup ( 785.80859375 ,-1338.8359375 ,13.69999980926, 3, 1275, 0)
function newReportnrDuty(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 then
		local x,y,z = getElementPosition(thePlayer)
		if getDistanceBetweenPoints3D(x,y,z,785.80859375 ,-1338.8359375 ,13.69999980926) < 5 then
			if not getElementData(thePlayer, "onDuty") then
				setElementData(thePlayer, "onDuty", true)
				takeAllWeapons ( thePlayer )
				setPedArmor(thePlayer, 100)
				setElementHealth(thePlayer, 100)
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then -- Leader
							setElementModel(thePlayer, 306)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then -- Sub-Leader
							setElementModel(thePlayer, 269)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then -- Rank5
							setElementModel(thePlayer, 188)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then -- Rank4
							setElementModel(thePlayer, 147)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then -- Rank3
							setElementModel(thePlayer, 55)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then -- Rank2
							setElementModel(thePlayer, 55)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then -- Rank1
							setElementModel(thePlayer, 55)
						end 
				outputChatBox("#ff7700(#00ff00Duty-System#ff7700): #00ff00 Shoma OnDuty Duty Shodid!", thePlayer, 255, 255, 255, true)
			else
				setElementData(thePlayer, "onDuty", nil)
				setPedArmor(thePlayer, 0)
				takeAllWeapons ( thePlayer )
				outputChatBox("#ff7700(#00ff00Duty-System#ff7700): #ff0000 Shoma Off Duty Shodid!", thePlayer, 255, 255, 255, true)
				setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")))
			end
			
		
			else
					outputChatBox("#ff7700(#ff0000Error#ff7700): #ffffffShoma Bayad dar Mahal Duty Bashid!", thePlayer, 255, 255, 255, true)
			end	
	end
	
end
function nrDutysBindKon( hitElement, matchingDimension )
if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 7 then
bindKey( hitElement, "Z", "down", newReportnrDuty )
else return false end
end
function nrDutysunBindKon( leaveElement, matchingDimension )
unbindKey( leaveElement, "Z", "down", newReportnrDuty )
end

addEventHandler ( "onPlayerWasted", getRootElement(), --Fixe (( Z )) Button
function ()
	if (isKeyBound ( source,"Z" , "down", newReportnrDuty )) then
		unbindKey( source, "Z", "down", newReportnrDuty )
	end
end)

local MarkersnrDutys = {}
local MarkernrDuty = {
	--{ X , Y , Z , Int , Dim },
	{ 1135.2451171875 ,-1343.427734375 ,13.7812 },
}

for i=1 , #MarkernrDuty do
	MarkersnrDutys[i] = createMarker(  MarkernrDuty[i][1], MarkernrDuty[i][2], MarkernrDuty[i][3], "cylinder", 3.0,0,246,255,0)
	addEventHandler( "onMarkerHit", MarkersnrDutys[i], nrDutysBindKon )
	addEventHandler( "onMarkerLeave", MarkersnrDutys[i], nrDutysunBindKon )
end