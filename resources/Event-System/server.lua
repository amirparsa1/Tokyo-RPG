local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

	isEvent = false
	eventorg = "Unknown"
	eventname = "Unknown"
	eventprize = "Unknown"
	eventdsc = "Unknown"

addEvent("eventBesazBaInEtelaat",true)
addEventHandler("eventBesazBaInEtelaat", root,
function (name, price, dsc)
	if getElementData(client, "wannaeventorganizer") ~= true then
		setElementData(client, "wannaeventorganizer", true, false)
		setElementData(client, "eventname", name, false)
		setElementData(client, "eventprize", price)
		setElementData(client, "eventdesc", dsc)
		
		outputChatBox("#00ff00☑️ #ffffffDarkhast Evente #6DC6C8"..name.." #ffffffBa Prize #6DC6C8"..price.." #ffffff Baraye Admin Ha Ersal Shod!", client, 255, 22, 22, true)
		for _, player in pairs( getElementsByType 'player' ) do
			if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) > 0 then
				
				outputChatBox(" #f8ba83New Request Event: /eventlist", player, 255, 22, 22, true)
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffShoma Yek Evente Accept Nashode Darid!", client, 255, 22, 22, true)
	end
end)

addCommandHandler("eventlist",
function ( thePlayer, command )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
	outputChatBox("#ffffff▬▬▬▬▬▬▬▬▬▬▬▬▬(#e87e12 Event List #ffffff)▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 22, 22, true)
	for _, player in pairs( getElementsByType 'player' ) do
		if getElementData(player,"wannaeventorganizer") == true then
			local eventname = getElementData(player,"eventname")
			outputChatBox("#ffffffOrganizer: #6DC6C8"..getPlayerName(player).."("..getElementData(player, "TarafID")..")".."#ffffff Event Name: #6DC6C8"..eventname.." #ffffffEvent Prize: #6DC6C8"..getElementData(player, "eventprize").." #ffffffEvent Description: #6DC6C8"..getElementData(player, "eventdesc").."", thePlayer, 255, 22, 22, true)
			outputChatBox("▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
		end
	end
 else
 	outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
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

addCommandHandler("aevent",
function ( thePlayer, command, player )
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then

	local yaru = miscSys:findPlayer ( player )
	if yaru then
	if isEvent ~= true then
	if getElementData(yaru,"wannaeventorganizer") == true then
	local eventorg = getPlayerName(yaru)
	local eventname = getElementData(yaru,"eventname")
	local eventprize = getElementData(yaru, "eventprize")
	local eventdsc = getElementData(yaru, "eventdesc")
	
	outputChatBox("#00ff00☑️ #ffffffShoma Event #00ff00"..getPlayerName(yaru).." #ffffffRa Accept Kardid!", thePlayer, 255, 255, 255, true)
	outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffff Evente Shoma Ra Accept Kard!", yaru, 255, 255, 255, true)
    exports.Logs:newLog("aevent","Admin "..getPlayerName(thePlayer).." Evente Player "..getPlayerName(yaru).." Ra Accept Kard Kard! ("..eventname..")")
	triggerClientEvent("shoroshod", root)
	triggerClientEvent("etelaateinfoPanel", root, eventorg, eventname, eventprize, eventdsc)
		for k, allplayer in ipairs (getElementsByType("player")) do	
			if getElementData(allplayer, "loggedIn") == true then
				outputChatBox("#FF3399 ╔═════════════◤ EVENT ◥═════════════╗", allplayer, 255, 255, 255, true)
				outputChatBox("Ba Salam Khedmat Player Haye Aziz #990099The Night MTA", allplayer, 255, 255, 255, true)
				outputChatBox("Ba Event #990099"..eventname.." #ffffff Dar Khedamt Shoma Hastim", allplayer, 255, 255, 255, true)
				outputChatBox("Prize Event  #33ff99"..convertNumber(eventprize).."$#ffffff  Mibashad", allplayer, 255, 255, 255, true)
				outputChatBox("Jahat Didan Moshakasat Az #FF3399/Event#ffffff Estefade Konid.", allplayer, 255, 255, 255, true)
				outputChatBox("#FF3399╚═══════════════◣   ◢═══════════════╝", allplayer, 255, 255, 255, true)
			end
		end
		setElementData(yaru,"eventname",nil,false)
		setElementData(yaru,"wannaeventorganizer",nil,false)
		setElementData(yaru,"eventorganizer", true,false)
		setElementData(yaru,"inevente", true,false)
		isEvent = true
	end
	else
		outputChatBox("#ff0000✖️ #ffffffDar Hale Hazer Event Dar Server Faal Mibashad!", thePlayer, 255, 22, 22, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /aevent <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end

end
end)

addCommandHandler("revent",
function ( thePlayer, command, player )
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
	local yaru = miscSys:findPlayer ( player )
	if yaru then
	if getElementData(yaru,"wannaeventorganizer") == true then
	setElementData(yaru,"eventname",nil,false)
	setElementData(yaru,"wannaeventorganizer",nil,false)
	setElementData(yaru,"eventprize",nil,false)
	setElementData(yaru,"eventdesc",nil,false)
	outputChatBox("#00ff00☑️ #ffffffShoma Event #00ff00"..getPlayerName(yaru).." #ffffffRa Reject Kardid!", thePlayer, 255, 255, 255, true)
	outputChatBox("#ff0000[Tavajoh]: #ffffffAdmin #ff0000"..getPlayerName(thePlayer).."#ffffff Evente Shoma Ra Reject Kard!", yaru, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /revent <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end

end
end)

addCommandHandler("e",
function(player, cmd, ...)
	if getElementData(player,"eventorganizer") == true then
    	local message = table.concat({ ... }, " ")
		if ... then
    		if #message > 0 then
    			outputChatBox("#FF3399[Organizer "..getPlayerName(player).."]:#ffffff" .. message, v, 255, 255, 255, true)
    		end
		else
			outputChatBox("#C0C0C0Bezan: /e <Matn>", player, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", player, 255, 255, 255, true)
	end
end)

addCommandHandler("esetpos",
function(player, cmd)
if getElementData(player,"eventorganizer") == true then
	ex,ey,ez = getElementPosition(player)
	edim = getElementDimension(player)
	eint = getElementInterior(player)
	x,y,erot = getElementRotation(player)
	setElementData(player,"eventpos",true,false)
	outputChatBox("#ff0000[Event Organizer]: #00f566In Makan Baraye Spawn Event Set Shod.", player, 255, 255, 255, true)
else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", player, 255, 255, 255, true)
end
end)

addCommandHandler("openevent",
function(player, cmd)
if getElementData(player,"eventorganizer") == true then
	if getElementData(player,"eventpos") == true then
	if getElementData(player,"eventopen") ~= true then
		setElementData(player,"eventopen",true,false)
		outputChatBox("#ff0000[Event Organizer]: #00f566Joine Event Baz Shod.", v, 255, 255, 255, true)
	else
		outputChatBox("#ff0000✖️ #ffffffDar Hale Hazer Event Baz Mibashad!", player, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Yek Makan Baraye Spawn Event Set Konid!", player, 255, 255, 255, true)
	end
else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", player, 255, 255, 255, true)
end
end)

addCommandHandler("closeevent",
function(player, cmd)
if getElementData(player,"eventorganizer") == true then
	if getElementData(player,"eventopen") ~= nil then
	if getElementData(player,"eventpos") == true then
		setElementData(player,"eventopen",nil,false)
		outputChatBox("#ff0000[Event Organizer]: #00f566Joine Event Baste Shod.", v, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffDar Hale Hazer Event Baste Mibashad!", player, 255, 255, 255, true)
	end
else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", player, 255, 255, 255, true)
end
end)

--> For Quit Organizer #VeCtoR <--
function quitPlayer ( quitType )
if getElementData(source,"eventorganizer") == true then
	for _, p in pairs( getElementsByType 'player' ) do
		if p then
			ex ,ey, ez, eint, edim, x, y, erot = nil
			setElementData(p,"eventopen",nil,false)
			setElementData(p,"inevente",nil,false)
			setElementFrozen(p, false)
			toggleAllControls ( p, true )
			takeAllWeapons ( p )
			if tonumber(getElementData(accSys:getPlayerAcc(p), "pMuteTime")) == 0 then
				exports.voice:setPlayerMuted( p, false )
			end
			
			isEvent = false
			triggerClientEvent("etelaateinfoPanel", root, eventorg, eventname, eventprize, eventdsc)
			if getElementData(p,"eventorganizer") == true then
				setElementData(p,"eventorganizer",nil,false)
			end
		end
	end
		for index, eventcars in ipairs(getElementsByType("vehicle")) do 
			local veh_event = getElementData(eventcars, "veh_event")
			if tostring(veh_event) == tostring(event_veh) then
				setVehicleEngineState(eventcars, false)
				setTimer(
				function ()
					destroyElement( eventcars )
				end , 100, 1)
			end
		end
	local chatRadius = 5000
	local posX, posY, posZ = getElementPosition( source )
	local myInt = getElementInterior(source)
	local myDim = getElementDimension(source)
	local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
	local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
	destroyElement( chatSphere )
		for _, p in pairs( getElementsByType 'player' ) do
			if getElementData(p, "loggedIn") == true then
				local yourInt = getElementInterior(p)
				local yourDim = getElementDimension(p)
				if tonumber(myInt) == tonumber(yourInt) and tonumber(myDim) == tonumber(yourDim) then
					local quittingPlayerName = getPlayerName ( source )
					outputChatBox( "#ff0000[Event]: #FFFF00Organizer "..quittingPlayerName .." Az Server Kharej Shod Va Event Over Shod! (" .. quitType .. ")", p, 255, 255, 255, true)
				end
			end
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), quitPlayer )


function FunctpToEvent (player, cmd)
	if isEvent == false then
		exports["notf"]:addNotification(player, "Evente Faali Vojod Nadarad!" , 'error')
		triggerClientEvent ( player, "PlayError", player, "Hello World!" )
		return false
	end
	for _, p in pairs( getElementsByType 'player' ) do
		if p then
			if getElementData(p,"eventorganizer") == true then
				if tonumber(getPlayerWantedLevel (player)) == 0 then
					if getElementData(accSys:getPlayerAcc(player), "pJailTime") == 0 then
						if getElementData(player, "inSleep") ~= true then
								if getElementData(p,"eventopen") == true then
									if ( getElementInterior(player) ~= 7 ) then
										if getElementData(player, "inpaintball") ~= true then
											--Hale Bug Job Ha--
											if getElementData(player, "onbusMarkAndBlip") == true then
												destroyElement(getElementData(player, "onbusMarkerMake"))
												destroyElement(getElementData(player, "onbusBlipMake"))
												setElementData(player,"busCheckPoint",0)
												setElementData(player, "onbusMarkAndBlip", false)
											end
											if getElementData(player, "onpilotMarkerAndBlip") == true then
												destroyElement(getElementData(player, "onpilotMarkerMake"))
												destroyElement(getElementData(player, "onpilotBlipMake"))
												setElementData(player,"pilotCheckPoint",0)
												setElementData(player, "onpilotMarkerAndBlip", false)
											end
											if getElementData(player, "onMarkAndBlip") == true then
												destroyElement(getElementData(player, "onMarkerMake"))
												destroyElement(getElementData(player, "onBlipMake"))
												setElementData(player,"sWCheckPoint",0)
												setElementData(player, "onMarkAndBlip", false)
											end
											if getElementData(player, "makedTrucker") == true then
												destroyElement(getElementData(player, "onMarkerTruckerMake"))
												destroyElement(getElementData(player, "onBlipTruckerMake"))
												setElementData(player,"truckerCheckPoint",0)
												setElementData(player, "makedTrucker", nil, false)
											end
											
												removePedFromVehicle(player)
												setElementData(player,"inevente",true,false)
												setElementPosition ( player, ex, ey, ez )
												setElementRotation(player,0,0,erot)
												setElementDimension ( player, edim )
												setElementInterior ( player, eint )
												takeAllWeapons ( player )
												setPedArmor(player, 0)
												setPedAnimation ( player )
												exports.voice:setPlayerMuted( player, true )
												
											
											outputChatBox("#00ff00Shoma Be Event Teleport Shodid!", player, 255, 255, 255, true)
										else
											outputChatBox("#ff0000✖️ #ffffffTo Game Net Nemishe Be Event Join Shod!", player, 255, 255, 255, true)
										end
									else
										outputChatBox("#ff0000✖️ #ffffffMoghe Tamrin Nemishe Be Event Join Shod!", player, 255, 255, 255, true)
									end
									return
								else
									exports["notf"]:addNotification(player, "Joine Event Baste Mibashad!" , 'error')
									triggerClientEvent ( player, "PlayError", player, "Hello World!" )
									return
								end
						else
							outputChatBox("#ff0000✖️ #ffffffShoma Sleep Hastid Va Nemitavanid Be Event Teleport Shavid!", player, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Jail Hastid Va Nemitonid Be Event Join Shid!", player, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffBa Wanted Ke Nemitoni Be Event Join Beshi!", player, 255, 255, 255, true)
				end
			end
		end
	end
end
addCommandHandler("gotoevent",FunctpToEvent)
addEvent("borotoevent",true)
addEventHandler("borotoevent", root, FunctpToEvent)

setTimer(
function ()
	for _, p in pairs( getElementsByType 'player' ) do
		if getElementData(p,"inevente") == true then
			--exports.voice:setPlayerMuted( p, true )
		end
	end
end, 2000, 0)

-- Fixe Buge Stop Event (Join Nabodan ham take Mishod Gon Moghe StopEvent) #VeCtoR
addCommandHandler("stopevent",
function(theplayer, cmd)
if getElementData(theplayer,"eventorganizer") == true or tonumber(getElementData(accSys:getPlayerAcc(theplayer), "pAdmin")) > 0 then
	for _, p in pairs( getElementsByType 'player' ) do
		if p then
			ex ,ey, ez, eint, edim, x, y, erot = nil
			if getElementData(p,"inevente") == true then
				takeAllWeapons (p)
				if tonumber(getElementData(accSys:getPlayerAcc(p), "pMuteTime")) == 0 then
					--exports.voice:setPlayerMuted( p, false )
				end
			end
		end
	end
end
end)


addCommandHandler("edv", --#VeCtoR
function(thePlayer, cmd)
	if getElementData(thePlayer,"eventorganizer") == true then
		local thePlayerVehicle = getPedOccupiedVehicle(thePlayer)
		local veh_owneri = getElementData(thePlayerVehicle, "veh_owner")
		local veh_event = getElementData(thePlayerVehicle, "veh_event")
		if thePlayerVehicle then
			if tostring(veh_event) == tostring(event_veh) then
				setVehicleEngineState(thePlayerVehicle, false)
				setTimer(
				function ()
					destroyElement( thePlayerVehicle )
					outputChatBox("#ff0000[Event Organizer]: #00f566In Mashin Tavasote Shoma Destroy Shod.", thePlayer, 255, 255, 255, true)
				end , 100, 1)
			else
				outputChatBox("#ff0000✖️ #ffffffIn Mashin, Mashine Event Nist!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Lazem Ast Savare Mashin Haye Event Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", thePlayer, 255, 255, 255, true)
	end
end
)

addCommandHandler("edvall", --#VeCtoR
function(theplayer, cmd)
	if getElementData(theplayer,"eventorganizer") == true then
					outputChatBox("#ff0000[Event Organizer]: #00f566Tamamiye Mashin Haye Event Destroy Shod.", theplayer, 255, 255, 255, true)

		for index, eventcars in ipairs(getElementsByType("vehicle")) do 
			local veh_event = getElementData(eventcars, "veh_event")
			if tostring(veh_event) == tostring(event_veh) then
				setVehicleEngineState(eventcars, false)
				setTimer(
				function ()
					destroyElement( eventcars )
				end , 100, 1)
				--outputChatBox("#ff0000[Event-System]: #00FA9ATamamiye Mashin Haye Event Destroy Shod.", theplayer, 255, 255, 255, true)
			end
		end
	else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", theplayer, 255, 255, 255, true)
	end
end)


addCommandHandler("stopevent",
function(theplayer, cmd)
if isEvent == true then
	if getElementData(theplayer,"eventorganizer") == true or tonumber(getElementData(accSys:getPlayerAcc(theplayer), "pAdmin")) > 0 then
		for _, p in pairs( getElementsByType 'player' ) do
			if p then
					ex ,ey, ez, eint, edim, x, y, erot = nil
					setElementData(p,"eventopen",nil,false)
					setElementData(p,"inevente",nil,false)
					setElementFrozen(p, false)
					toggleAllControls ( p, true )
					if tonumber(getElementData(accSys:getPlayerAcc(p), "pMuteTime")) == 0 then
						exports.voice:setPlayerMuted( p, false )
					end
					
					isEvent = false
					triggerClientEvent("etelaateinfoPanel", root, eventorg, eventname, eventprize, eventdsc)
				if getElementData(p,"eventorganizer") == true then
					setElementData(p,"eventorganizer",nil,false)
				end
			end
		end
		for index, eventcars in ipairs(getElementsByType("vehicle")) do 
			local veh_event = getElementData(eventcars, "veh_event")
			if tostring(veh_event) == tostring(event_veh) then
				setVehicleEngineState(eventcars, false)
				setTimer(
				function ()
					destroyElement( eventcars )
				end , 100, 1)
			end
		end
			outputChatBox("#ff0000[Event Organizer]: #FFFF00Event Over.", hameplayera, 255, 255, 255, true)
	else
		outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", theplayer, 255, 255, 255, true)
	end
end
end)

function createEventVehicle( thePlayer, command, IDMashin )
if getElementData(thePlayer,"eventorganizer") == true then
	local x, y, z = getElementPosition(thePlayer)
	local createdVehicle = createVehicle(tonumber(IDMashin), x + 2, y, z)
	local int = getElementInterior(thePlayer)
	local dem = getElementDimension(thePlayer)
	local vehname = getVehicleNameFromModel(tonumber(IDMashin))
	if tonumber(IDMashin) then
	setElementData(createdVehicle, "veh_event", tostring(event_veh))
	setVehiclePlateText(createdVehicle, "EventVeh")
	setElementInterior(createdVehicle, int)
	setElementDimension(createdVehicle, dem)
	outputChatBox("#ff0000[Event Organizer]: #00f566Shoma Yek Mashin "..vehname.." Sakhtid.", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#C0C0C0Bezan: /eveh <Vehicle-ID>", thePlayer, 320, 320, 320, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("eveh", createEventVehicle)

addCommandHandler("efreezecars",
function ( thePlayer, command )
	if getElementData(thePlayer,"eventorganizer") == true then
	for index, eventcar in ipairs(getElementsByType("vehicle")) do 
		local veh_event = getElementData(eventcar, "veh_event")
		if tostring(veh_event) == tostring(event_veh) then
			setElementFrozen(eventcar, true)
		end
	end
	outputChatBox("#ff0000[Event Organizer]: #00f566Tamamie Mashin Haye Dakhel Event Freeze Shodand.", thePlayer, 255, 255, 255, true)
	else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", thePlayer, 255, 255, 255, true)
	end
end
)

addCommandHandler("eunfreezecars",
function ( thePlayer, command )
	if getElementData(thePlayer,"eventorganizer") == true then
	for index, eventcar in ipairs(getElementsByType("vehicle")) do 
		local veh_event = getElementData(eventcar, "veh_event")
		if tostring(veh_event) == tostring(event_veh) then
			setElementFrozen(eventcar, false)
		end
	end
	outputChatBox("#ff0000[Event Organizer]: #00f566Tamamie Mashin Haye Dakhel Event UnFreeze Shodand.", player, 255, 255, 255, true)
	else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", thePlayer, 255, 255, 255, true)
	end
end
)

addCommandHandler("efreezeall",
function ( thePlayer, command )
	if getElementData(thePlayer,"eventorganizer") == true then
		for _, p in pairs( getElementsByType 'player' ) do
			if p then
				if getElementData(p,"eventorganizer") ~= true then
					if getElementData(p,"inevente") == true then
						setElementFrozen(p, true)
						toggleAllControls ( p, false, true, false)
					end
				end
				end
			end
			outputChatBox("#ff0000[Event Organizer]: #00f566Tamamie Player Haye Dakhel Event Freeze Shodand.", player, 255, 255, 255, true)
	else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", thePlayer, 255, 255, 255, true)
	end
end
)

addCommandHandler("eunfreezeall",
function ( thePlayer, command )
	if getElementData(thePlayer,"eventorganizer") == true then
		for _, p in pairs( getElementsByType 'player' ) do
			if p then
				if getElementData(p,"eventorganizer") ~= true then
					if getElementData(p,"inevente") == true then
						setElementFrozen(p, false)
						toggleAllControls ( p, true )
					end
				end
				end
			end
			outputChatBox("#ff0000[Event Organizer]: #00f566Tamamie Player Haye Dakhel Event UnFreeze Shodand.", player, 255, 255, 255, true)
	else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", thePlayer, 255, 255, 255, true)
	end
end
)

addCommandHandler("egg",
function ( thePlayer, command,yaru, gunid, tir )
	if getElementData(thePlayer, "loggedIn") == true then
		if getElementData(thePlayer,"eventorganizer") == true then
		if gunid then
		if tir then
			local gunid = tonumber(gunid)
			local gunname = getWeaponNameFromID(gunid)
			local tir = tonumber(tir)
			local taraf = miscSys:findPlayer(yaru)
			if gunid > 0 and gunid < 47 then
				if getElementData(taraf,"inevente") == true then
					giveWeapon ( taraf, gunid, tir )
					outputChatBox("#ff0000[Event Organizer]: #00f566Shoma Be Player "..getPlayerName(taraf).." "..gunname.." Ba Tir ("..tir..") Dadid.", thePlayer, 255, 255, 255, true)
					outputChatBox("#00ff00[Tavajoh]: #ffffffOrganizer #00ff00" .. getPlayerName(thePlayer) .. " #ffffffBe Shoma "..gunname.." ("..tir..") Tir Dad!", taraf, 255, 255, 255, true)
				else
					outputChatBox("#ff0000✖️ #ffffffIn Player Dakhel Event Nist!", thePlayer, 255, 255, 255, true)
				end
			end
			else
				outputChatBox("#ff0000✖️ #ffffffMeghdar Tir Ra Vared Konid!", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#C0C0C0Bezan: /egg <PartOfName/ID> <Gun-ID> <Tir>", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", thePlayer, 255, 255, 255, true)
		end
	end
end)

addCommandHandler("eggall",
function ( thePlayer, command, gunid, tir )
if getElementData(thePlayer,"eventorganizer") == true then
	local gunid = gunid
	local gunname = getWeaponNameFromID(gunid)
	local tir = tir
	if gunid then
	if tir then
	if tonumber(gunid) > 0 and tonumber(gunid) < 47 then
		for _, p in pairs( getElementsByType 'player' ) do
			if getElementData(p,"inevente") == true then
				giveWeapon ( p, gunid, tir )
			end
		end
		outputChatBox("#ff0000[Event Organizer]: #00f566Be Player Haye Dakhel Event "..gunname.." Dade Shod.", player, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffMeghdar Tir Ra Vared Konid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /eggall <Gun-ID> <Tir>", thePlayer, 255, 255, 255, true)
	end
else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", thePlayer, 255, 255, 255, true)
end
end)

addCommandHandler("efreeze",
function ( thePlayer, command, yaru )
if getElementData(thePlayer,"eventorganizer") == true then
if yaru then
	local taraf = miscSys:findPlayer ( yaru )
    if getElementData(taraf,"inevente") == true then
	setElementFrozen(taraf, true)
	toggleAllControls ( taraf, false, true, false)
	outputChatBox("#ff0000[Event Organizer]: #00f566Shoma Player "..getPlayerName(taraf).." Ra Freeze Kardid.", thePlayer, 255, 255, 255, true)
	outputChatBox("#00ff00[Tavajoh]: #ffffffOrganizer #00ff00" .. getPlayerName(thePlayer) .. " #ffffffShoma Ra Freeze Kard!", taraf, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /efreezep <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
	else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", thePlayer, 255, 255, 255, true)
	end
end
)

addCommandHandler("eunfreeze",
function ( thePlayer, command,yaru )
	if getElementData(thePlayer,"eventorganizer") == true then
	if yaru then
		local taraf = miscSys:findPlayer( yaru )
		if getElementData(taraf,"inevente") == true then
			setElementFrozen(taraf, false)
			toggleAllControls ( taraf,  true)
			outputChatBox("#ff0000[Event Organizer]: #00f566Shoma Player "..getPlayerName(taraf).." Ra UnFreeze Kardid.", thePlayer, 255, 255, 255, true)
			outputChatBox("#00ff00[Tavajoh]: #ffffffOrganizer #00ff00" .. getPlayerName(thePlayer) .. " #ffffffShoma Ra UnFreeze Kard!", taraf, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /eunfreezep <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", thePlayer, 255, 255, 255, true)
	end
end
)

addCommandHandler("esethpall",
function ( thePlayer, command, hp)
local hpnumber = hp
if getElementData(thePlayer,"eventorganizer") == true then
if hpnumber then
		for _, p in pairs( getElementsByType 'player' ) do
			if p then
					if getElementData(p,"inevente") == true then
					setElementHealth ( p, hpnumber )
					end
				end
			end
	outputChatBox("#ff0000[Event Organizer]: #00f566Healthe Tamami Player Haye Dakhel Event Be "..hpnumber.." Set Shod.", player, 255, 255, 255, true)
	else
		outputChatBox("#C0C0C0Bezan: /esethpall <Value>", thePlayer, 255, 255, 255, true)
	end
else
	outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", thePlayer, 255, 255, 255, true)
end
end)



-- fixe bug haye event
addEventHandler( "onPlayerWasted", getRootElement( ),
function()
setElementData(source, "pCuffe", 0)
	if getElementData(source, "inevente") == true then
		setElementData(source,"inevente",nil,false)
		setElementFrozen(source, false)
		toggleAllControls ( source, true )
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pMuteTime")) == 0 then
			exports.voice:setPlayerMuted( source, false )
		end
	end
end
)




addCommandHandler("event",
function (thePlayer,command)
	if isEvent == true then
		triggerClientEvent("infoPanel", thePlayer)
		
	else
		exports["notf"]:addNotification(thePlayer, "Evente Faali Vojod Nadarad!" , 'error')
		triggerClientEvent ( thePlayer, "PlayError", thePlayer, "Hello World!" )
	end
end
)
