local accSys = exports["Accounts-system"] -- CodeBy ExMohmD
local miscSys = exports["misc"] -- Telegram: @ExMohmD

function ShowServicePanel( thePlayer )
triggerClientEvent("ShowServicePanel", thePlayer, thePlayer)
end
addCommandHandler("service",ShowServicePanel)

function GetOnlineMembers( factionID )
	local Members = 0
	local id = tonumber(factionID)
	for index,playerha in ipairs(getElementsByType("player")) do
		if getElementData(playerha, "loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(playerha),"pMember") == id then
				Members = tonumber( Members ) + 1
			end
		end
	end
	return Members
end
function GetOnlineService( factionID )
	local Members = 0
	local id = tonumber(factionID)
	if (id == 4) then
		data = "medic"
	elseif ( id == 8 ) then
		data = "mechanictrue"
	elseif ( ikd == 9 ) then
		data = "taxi"
	end
	for index,playerha in ipairs(getElementsByType("player")) do
		if getElementData(playerha,"inServiceReq") == data then
			Members = tonumber( Members ) + 1
		end
	end
	return Members
end

function FactionMessage ( message, factionID )
	local id = tonumber(factionID)
	for index,playerha in ipairs(getElementsByType("player")) do
		if getElementData(accSys:getPlayerAcc(playerha),"pMember") == id then
			outputChatBox(message, playerha, 255, 255, 255, true )
		end
	end
end

local ReqTable = {
	{ "Tow Vehicle" , 8 },--1
	{ "Repair Vehicle" , 8 },--2
	{ "Taxi" , 9 },--3
	{ "Helicopter" , 9 },--4
	{ "Limousine" , 9 },--5
	{ "MotorCycle" , 9 },--6
	{ "Heal" , 4 },--7
}
function CheatWarn(Message)
	for k, chatslog in ipairs (getElementsByType("player")) do
		if getElementData(chatslog , "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(chatslog), "pAdmin")) > 1 then
					outputChatBox( "#ff0000[Service-Warn] #ffffff"..Message.."", chatslog, 255, 255, 255, true)
			end
		end
	end
end

function RequestService ( thePlayer , button )
	local id = tonumber(button)
	if getElementData(thePlayer, "servicetrue") == true then return false end
	if GetOnlineMembers( ReqTable[id][2] ) > 0 then
		CheatWarn("Player "..getPlayerName(thePlayer).." Darkhast Service Kard!")	
		FactionMessage( "#649c9e(Services): #FFFFFFPlayer "..getPlayerName(thePlayer).." Darkhast #649c9e"..ReqTable[id][1].."#FFFFFF Dad!", ReqTable[id][2] )
		exports["notf"]:addNotification(thePlayer, "Darkhast Shoma Baraye Operator Haye In Service Ersal Shod!" , 'success')
		setElementData(thePlayer,"servicetrue",true)
		else
		exports["notf"]:addNotification(thePlayer, "Moteasefane, Operatori Baraye In Service Dar Dastres Nist!" , 'warning')
		CheatWarn("Player "..getPlayerName(thePlayer).." Darkhast Service Kard!")	
		setElementData(thePlayer,"servicetrue",true)

	end
end
addEvent( "RequestService", true )
addEventHandler( "RequestService", root, RequestService )

local ServiceMarker = {}
local ServiceBlip = {}

function DestroyMarked( HitElement, matchingDimension )
	if getElementType(HitElement) == "player" and ServiceMarker[HitElement] and ServiceMarker[HitElement] == source then
		destroyElement(ServiceMarker[HitElement])
		destroyElement(ServiceBlip[HitElement])
		ServiceMarker[HitElement] = nil
		ServiceBlip[HitElement] = nil
	end
end

function Mark( thePlayer, X , Y , Z )
	ServiceMarker[thePlayer] = createMarker( X , Y , Z ,"checkpoint",3,255, 255, 0,200, thePlayer)
	ServiceBlip[thePlayer] = createBlipAttachedTo(ServiceMarker[thePlayer], 56, 2, 255, 0, 0, 255,  0 , 65535,thePlayer)
	addEventHandler("onMarkerHit", ServiceMarker[thePlayer], DestroyMarked )
end



function openService(thePlayer, command, taraf)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 8 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 9 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 4 then
		outputChatBox("#33AA33Baraye inkar Bayad Ozv Taxi/Mechanic/Medic Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if ( taraf == nil) then
		outputChatBox("#ff0000Bezan: /aservice <PartOfName/ID>", thePlayer, 0, 255, 0,true)
	else
		local find = miscSys:findPlayer ( taraf )
		if find then
			local x , y , z = getElementPosition(find)
			local targetPlayer = getPlayerName ( find )
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then
				if getElementData(find,"inServiceReq") == "medic" then
					setElementData(find, "inServiceReq", "false")
					outputChatBox("#ff7700(Services):#FFFFFF Shoma Darkhast Player "..targetPlayer.." Ra Accept Kardid!", thePlayer, 255, 255, 255, true )
					outputChatBox("#ff7700(Services):#FFFFFF Darkhast Shoma Tavasot "..getPlayerName(thePlayer).." Accept Shod!", find, 255, 255, 255, true )
					outputChatBox("#ff7700(Services):#FFFFFF Lotfan Dar Makan Khod Montazer Bemanid!", find, 255, 255, 255, true )
					Mark(thePlayer,x,y,z)
					setElementData(find,"servicetrue",nil)
				else
					outputChatBox("#ff7700(Services):#FFFFFF in Player Darkhasti Ersal Nakarde!", thePlayer, 255, 255, 255, true )
				end
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 8 then
				if getElementData(find,"inServiceReq") == "mechanic" then
					setElementData(find, "inServiceReq", "false")
					outputChatBox("#649c9e(Services):#FFFFFF Shoma Darkhast Player "..targetPlayer.." Ra Accept Kardid!", thePlayer, 255, 255, 255, true )
					outputChatBox("#649c9e(Services):#FFFFFF Darkhast Shoma Tavasot "..getPlayerName(thePlayer).." Accept Shod!", find, 255, 255, 255, true )
					outputChatBox("#649c9e(Services):#FFFFFF Lotfan Dar Makan Khod Montazer Bemanid!", find, 255, 255, 255, true )
					Mark(thePlayer,x,y,z)
					setElementData(find,"servicetrue",nil)
				else
					outputChatBox("#649c9e(Services):#FFFFFF in Player Darkhasti Ersal Nakarde!", thePlayer, 255, 255, 255, true )
				end
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 9 then
				if getElementData(find,"inServiceReq") == "taxi" then
					setElementData(find, "inServiceReq", "false")
					outputChatBox("#ffed21(Services):#FFFFFF Shoma Darkhast Player "..targetPlayer.." Ra Accept Kardid!", thePlayer, 255, 255, 255, true )
					outputChatBox("#ffed21(Services):#FFFFFF Darkhast Shoma Tavasot "..getPlayerName(thePlayer).." Accept Shod!", find, 255, 255, 255, true )
					outputChatBox("#ffed21(Services):#FFFFFF Lotfan Dar Makan Khod Montazer Bemanid!", find, 255, 255, 255, true )
					Mark(thePlayer,x,y,z)
					setElementData(find,"servicetrue",nil)
				else
					outputChatBox("#ffed21(Services):#FFFFFF in Player Darkhasti Ersal Nakarde!", thePlayer, 255, 255, 255, true )
				end
			end
		else
			outputChatBox("#ff0000[Error]: #ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
	end
end
addCommandHandler("aservice", openService)



function CancelService()
	for index,playerha in ipairs(getElementsByType("player")) do
		if getElementData(playerha,"inServiceReq") == "taxi" or getElementData(playerha,"inServiceReq") == "mechanic" or getElementData(playerha,"inServiceReq") == "medic" then
			setElementData(playerha, "inServiceReq", "false")
		end
	end
	setTimer( CancelService, 300000, 1 )
end
CancelService()

function CancelServices()
	for index,playerha in ipairs(getElementsByType("player")) do
		if getElementData(playerha,"servicetrue") == true then
			setElementData(playerha, "servicetrue", false)
		end
	end
	setTimer( CancelServices, 10000, 1 )
end
CancelServices()

local ServiceDataTable = {
}
ServiceDataTable[4] = {"medic"}
ServiceDataTable[8] = {"mechanic"}
ServiceDataTable[9] = {"taxi"}

addCommandHandler("slist",
function(thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") == 8 then
			outputChatBox("#649c9e _____________ Service List _____________", thePlayer, 255, 255, 255, true)
			for k, v in ipairs (getElementsByType("player")) do
				if getElementData(v, "loggedIn") == true then
					if getElementData(v,"inServiceReq") == "mechanic" then
						outputChatBox("ــــــــــــــــــــــــــــــــــــــــــــــــ", thePlayer, 255, 255, 255, true)
						outputChatBox(" #ffffffName Moshtari : #649c9e"..getPlayerName(v).."", thePlayer, 255, 255, 255, true)
						outputChatBox(" #ffffffID Moshtari : #649c9e"..getElementData(v, "TarafID").." ", thePlayer, 255, 255, 255, true)
						outputChatBox(" #ffffff/aservice #649c9e"..getElementData(v, "TarafID").." ", thePlayer, 255, 255, 255, true)
						outputChatBox("ــــــــــــــــــــــــــــــــــــــــــــــــ", thePlayer, 255, 255, 255, true)
					end
				end
			end
								outputChatBox("#649c9e _____________________________________", thePlayer, 255, 255, 255, true)

		end
	end
end)

addCommandHandler("slist",
function(thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") == 4 then
			outputChatBox("#ff7700 _____________ Service List _____________", thePlayer, 255, 255, 255, true)
			for k, v in ipairs (getElementsByType("player")) do
				if getElementData(v, "loggedIn") == true then
					if getElementData(v,"inServiceReq") == "medic" then
						outputChatBox("ــــــــــــــــــــــــــــــــــــــــــــــــ", thePlayer, 255, 255, 255, true)
						outputChatBox(" #ffffffName Moshtari : #ff7700"..getPlayerName(v).."", thePlayer, 255, 255, 255, true)
						outputChatBox(" #ffffffID Moshtari : #ff7700"..getElementData(v, "TarafID").." ", thePlayer, 255, 255, 255, true)
						outputChatBox(" #ffffff/aservice #649c9e"..getElementData(v, "TarafID").." ", thePlayer, 255, 255, 255, true)
						outputChatBox("ــــــــــــــــــــــــــــــــــــــــــــــــ", thePlayer, 255, 255, 255, true)
					end
				end
			end
								outputChatBox("#ff7700 _____________________________________", thePlayer, 255, 255, 255, true)

		end
	end
end)

addCommandHandler("slist",
function(thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") == 9 then
			outputChatBox("#fff000 _____________ Service List _____________", thePlayer, 255, 255, 255, true)
			for k, v in ipairs (getElementsByType("player")) do
				if getElementData(v, "loggedIn") == true then
					if getElementData(v,"inServiceReq") == "taxi" then
						outputChatBox("ــــــــــــــــــــــــــــــــــــــــــــــــ", thePlayer, 255, 255, 255, true)
						outputChatBox(" #ffffffName Moshtari : #fff000"..getPlayerName(v).."", thePlayer, 255, 255, 255, true)
						outputChatBox(" #ffffffID Moshtari : #fff000"..getElementData(v, "TarafID").." ", thePlayer, 255, 255, 255, true)
						outputChatBox(" #ffffff/aservice #649c9e"..getElementData(v, "TarafID").." ", thePlayer, 255, 255, 255, true)
						outputChatBox("ــــــــــــــــــــــــــــــــــــــــــــــــ", thePlayer, 255, 255, 255, true)
					end
				end
			end
								outputChatBox("#fff000 _____________________________________", thePlayer, 255, 255, 255, true)

		end
	end
end)
