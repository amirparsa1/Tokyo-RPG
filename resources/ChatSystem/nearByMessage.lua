local isMessageFromAdmin = false

local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
local Chater = "PLAYER"
local chatRadius = 15
function sendMessageToNearbyPlayers( message, messageType )
	if getElementData(source, "loggedIn") == true then
		if not isPlayerMuted ( source ) then
			if messageType == 0 then
				local posX, posY, posZ = getElementPosition( source )
				local myInt = getElementInterior(source)
				local myDim = getElementDimension(source)
				local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
				destroyElement( chatSphere )
				if tonumber(getElementData(accSys:getPlayerAcc(source), "pMuteTime")) < 1 then
					for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
						if getElementData(nearbyPlayer, "loggedIn") == true then
							local yourInt = getElementInterior(nearbyPlayer)
							local yourDim = getElementDimension(nearbyPlayer)
							local colorname = getElementData(accSys:getPlayerAcc(source), "pColorName")
							if tonumber(myInt) == tonumber(yourInt) and tonumber(myDim) == tonumber(yourDim) then
								if getElementData(source,"NameTagIsShow?") == false then
									Chater = getPlayerName(source)
									if getElementData(source, "CallingTo") then
										outputChatBox( colorname..Chater.." #FFFFFF(On Phone): #FFFFFF".. message, nearbyPlayer, 255, 255, 255, true)
									else
										if tonumber(getElementData(accSys:getPlayerAcc(source), "pGoldPremium")) > 0 then
											outputChatBox("#00FFFF(TNM-Member) #FFFFFF"..colorname..Chater..": #FFFFFF".. message, nearbyPlayer, 255, 255, 255, true)
										else
											outputChatBox( colorname..Chater..": #FFFFFF".. message, nearbyPlayer, 255, 255, 255, true)
										end
									end
								else
									if tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) == 5 then
										Chater = "ICA-Agent"
										outputChatBox(Chater..": #FFFFFF".. message, nearbyPlayer, 255, 255, 255, true)
									elseif tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) == 6 then
										Chater = "CIA-Agent"
										outputChatBox(Chater..": #FFFFFF".. message, nearbyPlayer, 255, 255, 255, true)
									else
										outputChatBox("Namalom: #FFFFFF".. message, nearbyPlayer, 255, 255, 255, true)
									end
								end

							end
						end
					end
				else
					local cheghadMondMuteTime = tonumber(getElementData(accSys:getPlayerAcc(source), "pMuteTime"))				
					outputChatBox("#ff0000Shoma Ta "..cheghadMondMuteTime.." Daghighe Digar Mute Hastid!", source, 255, 255, 255, true)
					
				end
				if tonumber(getElementData(accSys:getPlayerAcc(source), "pMuteTime")) == 0 then		
					--triggerClientEvent("onChatIncome", source, message, messagetype)
					for _,p in ipairs (getElementsByType("player")) do

						if getElementData(p, "fzmode") == true then
							outputChatBox( "#fffa00[FZ] "..getPlayerName(source)..":#FFFFFF ".. message, p, 255, 255, 255, true)
						end

					end
				end
			end
		else
			outputChatBox("#ff0000[Error]: #ffffffMute Ke Bashi Nmitavanid Harf Bezanid!", source, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", source, 212, 156, 49,true)
	end
end
addEventHandler( "onPlayerChat", getRootElement(), sendMessageToNearbyPlayers )

function blockChatMessage()
	cancelEvent()
end 
addEventHandler( "onPlayerChat", getRootElement(), blockChatMessage )



--/s (faryad) 
local MetrazhDadZadan = 47
addCommandHandler("s",
function(thePlayer, cmd, ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if (...) then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMuteTime")) == 0 then	
				if not isPlayerMuted ( thePlayer ) then
					local posX, posY, posZ = getElementPosition( thePlayer )
					local myInt = getElementInterior(thePlayer)
					local myDim = getElementDimension(thePlayer)
					local chatSphere = createColSphere( posX, posY, posZ, MetrazhDadZadan )
					local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
					destroyElement( chatSphere )
					local message = table.concat({ ... }, " ")
					for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
						if #message > 0 then
							if getElementData(nearbyPlayer, "loggedIn") == true then


								
								local yourInt = getElementInterior(nearbyPlayer)
								local yourDim = getElementDimension(nearbyPlayer)
								if tonumber(myInt) == tonumber(yourInt) and tonumber(myDim) == tonumber(yourDim) then
									if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 and getElementData(thePlayer,"NameTagIsShow?") == true then
										Chater = "ICA-Agent"
										outputChatBox(Chater.." #50F0D9Dad zad : #FFFFFF" .. message .."", nearbyPlayer, 255, 255, 255, true)
									elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 and getElementData(thePlayer,"NameTagIsShow?") == true then
										Chater = "CIA-Agent"
										outputChatBox(Chater.." #50F0D9Dad zad : #FFFFFF" .. message .."", nearbyPlayer, 255, 255, 255, true)
									else
										outputChatBox("#FFFFFF" .. getPlayerName(thePlayer) .. " #50F0D9Dad zad : #FFFFFF" .. message .."", nearbyPlayer, 255, 255, 255, true)
									end
									

								end
							end
						end
					end
					for _,p in ipairs (getElementsByType("player")) do
						if getPlayerName(thePlayer) ~= "zezaw" then
							if getElementData(p, "fzmode") == true then
								outputChatBox( "#fffa00[FZ] "..getPlayerName(thePlayer)..": #50F0D9Dad zad :#FFFFFF".. message, p, 255, 255, 255, true)
							end
						end
					end
				else
					outputChatBox("#ff0000Shoma Mute Hastid!", thePlayer, 255, 255, 255, true)
				end
			else
				local cheghadMondMuteTime = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMuteTime"))				
				outputChatBox("#ff0000Shoma Ta "..cheghadMondMuteTime.." Daghighe Digar Mute Hastid!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /s [Matn]", thePlayer, 212, 156, 49, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)


local MetrazhWhisper = 3
addCommandHandler("w",
function(thePlayer, cmd, player, ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if (...) then
			if not isPlayerMuted ( thePlayer ) and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMuteTime")) == 0 then
				local find = miscSys:findPlayer(player)
				local x, y, z = getElementPosition( thePlayer )
				local mx, my, mz = getElementPosition( find )
				local myInt = getElementInterior(thePlayer)
				local myDim = getElementDimension(thePlayer)
				local yourInt = getElementInterior(find)
				local yourDim = getElementDimension(find)
				local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
				if find then
					if getElementData(find , "loggedIn") == true then
						if de < MetrazhWhisper then
							if tonumber(myInt) == tonumber(yourInt) and tonumber(myDim) == tonumber(yourDim) then
								local targetPlayer = getPlayerName ( find )
								local message = table.concat({ ... }, " ")
								if #message > 0 then
									outputChatBox("#b2ff00[Whisper] Az " .. getPlayerName(thePlayer) .. ": " .. message .."", find, 255, 255, 255, true)
									outputChatBox("#b2ff00[Whisper] Be " .. targetPlayer .. ": " .. message .."", thePlayer, 255, 255, 255, true)
									for _,p in ipairs (getElementsByType("player")) do
										if getElementData(p, "fzmode") == true then
											if getPlayerName(thePlayer) ~= "zezaw" then
												outputChatBox( "#fffa00[FZ] #b2ff00[Whisper] Az " .. getPlayerName(thePlayer) .. ": " .. message .."", p, 255, 255, 255, true)
											end
										end
									end
								end
							end
						else
							outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Player Be Shoma Nazdik Bashid!", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000[Error]: #ffffffIn Player Hanooz Login Nakarde!", thePlayer, 212, 156, 49)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffMute Ke Bashi Nmitavanid Harf Bezanid!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /w [PartOfName/ID] [Matn]", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

addCommandHandler("cw",
function(thePlayer, cmd, ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if (...) then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMuteTime")) == 0 then
				if not isPlayerMuted ( thePlayer ) then
					local thePlayerVehicle = getPedOccupiedVehicle(thePlayer)
					if thePlayerVehicle then
						for k, playeri_tomashin	in ipairs (getElementsByType("player")) do
							local playerVehicle = getPedOccupiedVehicle(playeri_tomashin)
							if thePlayerVehicle == playerVehicle then
								local message = table.concat({ ... }, " ")
								if #message > 0 then
									outputChatBox("#b2ff00[Car-Whisper] Az " .. getPlayerName(thePlayer) .. ": " .. message .."", playeri_tomashin, 255, 255, 255, true)
									for _,p in ipairs (getElementsByType("player")) do
										if getElementData(p, "fzmode") == true then
											if getPlayerName(thePlayer) ~= "zezaw" then 
												outputChatBox( "#fffa00[FZ] #b2ff00[Car-Whisper] Az " .. getPlayerName(thePlayer) .. ": " .. message .."", p, 255, 255, 255, true)
											end
										end
									end
								end
							end
						end
					else
						outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Dakhel Mashin Bashid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffMute Ke Bashi Nmitavanid Harf Bezanid!", thePlayer, 255, 255, 255, true)
				end
			else
				local cheghadMondMuteTime = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMuteTime"))				
				outputChatBox("#ff0000Shoma Ta "..cheghadMondMuteTime.." Daghighe Digar Mute Hastid!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /cw [Matn]", thePlayer, 212, 156, 49,true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

addCommandHandler("fz",
function ( thePlayer, command )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) >= 4 then
	if getElementData(thePlayer,"fzmode") == true then
		setElementData(thePlayer,"fzmode",nil)
		outputChatBox("#ff0000[ADM-System]: #ffffffShoma Ba Movafaghiat Halate Big Ears Ro Off Kardid!", thePlayer, 255, 255, 255, true)
	else
		setElementData(thePlayer,"fzmode",true)
		outputChatBox("#ff0000[ADM-System]: #ffffffShoma Ba Movafaghiat Halate Big Ears Ro On Kardid!", thePlayer, 255, 255, 255, true)
	end
 end
end)

function quitPlayer ( quitType )
local chatRadius = 15
local posX, posY, posZ = getElementPosition( source )
				local myInt = getElementInterior(source)
				local myDim = getElementDimension(source)
				local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
				destroyElement( chatSphere )
				for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					if getElementData(nearbyPlayer, "loggedIn") == true then
						local yourInt = getElementInterior(nearbyPlayer)
						local yourDim = getElementDimension(nearbyPlayer)
						if tonumber(myInt) == tonumber(yourInt) and tonumber(myDim) == tonumber(yourDim) then
	local quittingPlayerName = getPlayerName ( source )
	outputChatBox( "#ECAC7C"..quittingPlayerName .." Az Server Kharej Shod (" .. quitType .. ")", nearbyPlayer, 255, 255, 255, true)
end
end
end
end
addEventHandler ( "onPlayerQuit", getRootElement(), quitPlayer )