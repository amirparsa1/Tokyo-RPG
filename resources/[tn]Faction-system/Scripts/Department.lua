--Pishniaz
local accSys = exports["Accounts-system"] -- DarkCity For Ever
local miscSys = exports["Misc"] -- Telegram: @ExMohmD
local globalSys = exports["Global"]

local findTable = {
    posX = {},
    posY = {},
    posZ = {},
    players = {},
}

function getPlayerLocation(ppl)
    local answer = nil
    if ppl then
        if findTable.players[ppl] == true then
            answer = findTable.posX[ppl]..", "..findTable.posY[ppl]..", "..findTable.posZ[ppl]
        else
            answer = "MAP"
        end
    end
    return answer
end

function setPlayerLocation(ppl, posX, posY, posZ)
    if ppl then
        findTable.players[ppl] = true
        findTable.posX[ppl] = posX
        findTable.posY[ppl] = posY
        findTable.posZ[ppl] = posZ
    end
end

function removePlayerLocation(ppl)
    if ppl then
        findTable.players[ppl] = nil
        findTable.posX[ppl] = nil
        findTable.posY[ppl] = nil
        findTable.posZ[ppl] = nil
    end
end



addEventHandler ( "onPlayerQuit", root, function ()
    if findTable.players[source] then
        findTable.players[source] = nil
        findTable.posX[source] = nil
        findTable.posY[source] = nil
        findTable.posZ[source] = nil
	end
	for i, v in ipairs(getElementsByType("player")) do
		if getElementData(v, "whoImFinding") == source then
			if getElementData(v, "inDepartmentFind") == true then
				setElementData(v, "inDepartmentFind", nil, false)
				setElementData(v, "whoImFinding", nil, false)
				destroyElement(getElementData(v, "nowDepartmentFind"))
				outputChatBox("#ff0000[Find-System]: #ffffffPlayer Morede Nazar Az Server Kharej Shod!", v, 255, 255, 255, true)
			end
		end
	end
end)

function DepartmentMessage(Message)
	for k, Bisim in ipairs (getElementsByType("player")) do
		if getElementData(Bisim , "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) == 3 then
				outputChatBox("#97bbf4(( Bisim Markazi )) #4286f4(( "..Message.." ))", Bisim, 54, 181, 75,true)
				playSoundFrontEnd ( Bisim, 49 )
			end
		end
	end
end

function needBackup(root)
if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) > 4 then return false end
	
	for k, Bisim in ipairs (getElementsByType("player")) do
		if getElementData(Bisim , "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) < 4 then
				exports["spicialNotf"]:addWarning(Bisim, ""..getPlayerName(root).." Darkhast Poshtibani Kard!" , 'backup')
				outputChatBox("#97bbf4---=[[ Department-Warning ]]=---#4286f4 (Player #ffffff"..getPlayerName(root).." #4286f4Darkhast Poshtibani Kard!)",Bisim,255,255,255,true)
				local player = getPlayerName(root)
				setElementData(Bisim, "needBackup", player)
			end
		end
	end

end
addEvent("backupNeed",true)
addEventHandler("backupNeed", root, needBackup)


function acceptWarning(root)
if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) > 4 then return false end
	local name = getElementData(root, "needBackup")
	if name == false then return false end
	local find = miscSys:findPlayer(name)
	if find then
	local findblip = createBlipAttachedTo ( find, 56 , 255, 0, 255)
		outputChatBox("#00ff00[Mark-System]: #ffffffLocation "..name.." Ba Movafaqiat Baraye Shoma Mark Shod!", root, 255, 255, 255, true)
		setElementData(source, "needBackup", false)
	end
end
addEvent("acceptWarning",true)
addEventHandler("acceptWarning", root, acceptWarning)

addCommandHandler ( "cuff", 
    function ( thePlayer, cmd, player ) 
	local find = miscSys:findPlayer(player)
		if find then
local x,y,z = getElementPosition(thePlayer)
			local x1,y1,z1 = getElementPosition(find)
			if getDistanceBetweenPoints3D(x,y,z,x1,y1,z1) < 6.5 then 
			if getPedOccupiedVehicle(find) then removePedFromVehicle( find ) end
			if getPedOccupiedVehicle(thePlayer) then exports["notf"]:addNotification(thePlayer, "Baraye Cuff Kardan Player Bayad Az Mashin Pyade Shid!" , 'error') return false end
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 4 then exports["notf"]:addNotification(thePlayer, "Shoma Maghdor Be Chenin Kari Nistid!" , 'error') return false end
			if find == thePlayer then exports["notf"]:addNotification(thePlayer, "Shoma Khodeton Ro Nemitavanid Cuff Konid!" , 'error') return false end
			if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) == 3 then exports["notf"]:addNotification(thePlayer, "Hamkar Khode Ra Nemitavanid Cuff Konid!" , 'error') return false end
			
			if getElementData(find, "pCuffe") == nil then
				setElementData(find, "pCuffe", true)
				setElementData(find, "cuffer", getPlayerName(thePlayer))
				exports.bone_attach:attachElementToBone(find, thePlayer, 3, 0, 0.7, -0.3, 0, 0, 0)
				outputChatBox("#ff0000( Cuff )#ffffff Shoma Player #ff0000"..getPlayerName(find).."#ffffff Ra #00ff00Cuff #ffffffKardid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#ff0000( Cuff )#ffffff Shoma Tavasot Player #ff0000"..getPlayerName(thePlayer).."#ffffff #00ff00Cuff #ffffffShodid!", find, 255, 255, 255, true)
			else 
				setElementData(find, "pCuffe", nil)
				setElementData(find, "cuffer", nil)
				exports.bone_attach:detachElementFromBone(find, thePlayer)
				outputChatBox("#ff0000( Cuff )#ffffff Shoma Player #ff0000"..getPlayerName(find).."#ffffff Ra #00ff00UnCuff #ffffffKardid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#ff0000( Cuff )#ffffff Shoma Tavasot Player #ff0000"..getPlayerName(thePlayer).."#ffffff #00ff00UnCuff #ffffffShodid!", find, 255, 255, 255, true)
			end
			else
			exports["notf"]:addNotification(thePlayer, "in Player Kheili Az Shoma Dore!!" , 'error')
        end 
		
        end 
    end 
) 

function getplate( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "vehicle" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local distance = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if distance < 4 then
				for index,cuffshode in ipairs(getElementsByType("player")) do
				if getElementData(cuffshode,"loggedIn") and getElementData(cuffshode,"loggedIn") == true then
				if getElementData(cuffshode,"cuffer") == getPlayerName(player) then
				if getPedOccupiedVehicle(cuffshode) then return false end
					exports.bone_attach:detachElementFromBone(cuffshode, thePlayer)
					local seats = getVehicleMaxPassengers ( source ) + 1
					local i = 1
					while ( i < seats ) do
						if ( not getVehicleOccupant ( source, i ) ) then
							setTimer ( warpPedIntoVehicle, 500, 1, cuffshode, source, i )
							break
						end
						i = i + 1
					end
				end
				end
				end
				
            end
        end
    end
end
addEventHandler( "onElementClicked", root, getplate )

function setPlayerData ( )
	local player = getPlayerName(source)
	setElementData(source, "needBackup", player)
end
addEventHandler ( "onPlayerJoin", root, setPlayerData )


--Call Police
addEventHandler ( "onPlayerWasted", getRootElement(),
function ( ammo, attacker, weapon, bodypart )
	if getElementData(source, "inpaintball") == true then
		return
	end
	if getElementData(source, "inevente") == true then
		return
	end
	if ( attacker ) then
		if attacker ~= source then
			local attacker = attacker
			local MyAttackerType = getElementType ( attacker )
			if MyAttackerType ~= "vehicle" and MyAttackerType ~= "player" then
				return
			end
			if MyAttackerType == "vehicle" then
				attacker = getVehicleController ( attacker )
			end
			if ( getElementType ( attacker ) == "vehicle" ) then
				local attacker = getVehicleController ( attacker )
			end
			if attacker and isElement( attacker ) and ( getElementType ( attacker ) == "player" ) then
				if tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) == 1 and tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) == 18 and getElementData(source,"makeBomb") == true then
					givePlayerMoney(attacker, 100000)
					setElementData(source,"makeBomb", false)
					outputChatBox("#0000ff(Department-System)#00ff00 Shoma Amel Entehari Ra Koshtid Va +100,000K Daryaft Kardid!!", attacker, 54, 181, 75,true)
				end
				if tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) == 1 and tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) >= 0 then return false end
				if tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) == 1 and tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) == 18 and getElementData(source,"onDuty") == true then return end

				if tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) == 5 and tonumber(getElementData(accSys:getPlayerAcc(source), "pHeadValue")) > 0 then return end

				local AttackerName = getPlayerName ( attacker )
				outputChatBox("#ff0000Player "..AttackerName.." Shoma Ra Kosht!", source, 54, 181, 75,true)
				local wKill = tonumber(getElementData(accSys:getPlayerAcc(attacker), "wKill"))
				setElementData(accSys:getPlayerAcc(attacker), "wKill", wKill + 1)
				setElementData(accSys:getPlayerAcc(attacker), "pWanted", 1)
				


			end
		end
	end
end)




addEventHandler ( "onVehicleEnter", getRootElement(), function ( player, seat, jacked )
	if jacked then
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) > 3 then
			if tonumber(getElementData(accSys:getPlayerAcc(jacked), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(jacked), "pMember")) > 3 then
				outputChatBox("#ff0000Player "..getPlayerName(player).." Mashine Shoma Ra Dozdid!", jacked, 54, 181, 75,true)
				local wKill = tonumber(getElementData(accSys:getPlayerAcc(player), "wKill"))
				setElementData(accSys:getPlayerAcc(player), "wKill", wKill + 1)
			end
		end
	end
end)

--Department

--Department
DutyPD = createPickup ( 1571.154296875 ,-1683.5517578125 ,16.191499710083, 3, 1275, 0)
setElementInterior ( DutyPD, 0 )
OrderPD = createPickup ( 1561.419921875 ,-1684.115234375 ,16.191499710083, 3, 1242, 0)
setElementInterior ( OrderPD, 0 )

DutyFBI = createPickup ( 237.796875 ,122.16796875 ,1003.2187, 3, 1275, 0)
setElementInterior ( DutyFBI, 10 )
setElementDimension ( DutyFBI, 4527 )

OrderFBI = createPickup ( 233.7666015625 ,122.5908203125 ,1003.21875, 3, 1242, 0)
setElementInterior ( OrderFBI, 10 )
setElementDimension ( OrderFBI, 4527 )

CoverFBI = createPickup ( -57.235939025879 ,254.4111328125 ,962.06091308594 , 3, 1581, 0)
setElementInterior ( CoverFBI, 10 )
setElementDimension ( CoverFBI, 4527 )

DutyNG = createPickup ( 2008.6666259766 ,-1477.8674316406 ,1106.4000244141, 3, 1275, 0)
setElementInterior ( DutyNG, 5 )

OrderNG = createPickup ( 1984.9322509766 ,-1472.8771972656 ,1106.4000244141, 3, 1242, 0)
setElementInterior ( OrderNG, 5 )

function dpDuty(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		local x,y,z = getElementPosition(thePlayer)
		if getDistanceBetweenPoints3D(x,y,z,1571.154296875 ,-1683.5517578125 ,16.19149971008) < 5 or getDistanceBetweenPoints3D(x,y,z,237.796875 ,122.16796875 ,1003.2187) < 5 or getDistanceBetweenPoints3D(x,y,z,2008.6666259766 ,-1477.8674316406 ,1106.4000244141) < 5 then
			if not getElementData(thePlayer, "onDuty") then
				setElementData(thePlayer, "onDuty", true)
				
				setElementHealth(thePlayer, 100)
				outputChatBox("#ffff00Info: #ffffffShoma #00ff00On Duty #ffffffShodid!", thePlayer, 255, 255, 255, true)
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then -- Leader
							setElementModel(thePlayer, 281)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then -- Sub-Leader
							setElementModel(thePlayer, 265)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then -- Rank5
							setElementModel(thePlayer, 267)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then -- Rank4
							setElementModel(thePlayer, 267)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then -- Rank3
							setElementModel(thePlayer, 280)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then -- Rank2
							setElementModel(thePlayer, 298)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then -- Rank1
							setElementModel(thePlayer, 298)
						end 
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then -- Leader
							setElementModel(thePlayer, 80)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then -- Sub-Leader
							setElementModel(thePlayer, 285)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then -- Rank5
							setElementModel(thePlayer, 295)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then -- Rank4
							setElementModel(thePlayer, 287)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then -- Rank3
							setElementModel(thePlayer, 280)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then -- Rank2
							setElementModel(thePlayer, 280)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then -- Rank1
							setElementModel(thePlayer, 298)
						end
					end
			else
				setElementData(thePlayer, "onDuty", nil)
				takeAllWeapons ( thePlayer )
				setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "fSkin")))
				outputChatBox("#ffff00Info: #ffffffShoma #ff0000Off Duty #ffffffShodid!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Error: Baraye Inkar Bayad Dar Mahale Duty Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		--outputChatBox("#ff0000Error: Baraye Inkar Bayad Ozve Department Bashid!", thePlayer, 255, 255, 255, true)
	end
end

function pdDutysBindKon( hitElement, matchingDimension )
if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3 then
bindKey( hitElement, "Z", "down", dpDuty )
else return false end
end
function pdDutysunBindKon( leaveElement, matchingDimension )
unbindKey( leaveElement, "Z", "down", dpDuty )
end

addEventHandler ( "onPlayerWasted", getRootElement(), --Fixe (( Z )) Button
function ()
	if (isKeyBound ( source,"Z" , "down", dpDuty )) then
		unbindKey( source, "Z", "down", dpDuty )
	end
end)

local pdMarker = {}
local pdDutyMarker = {
	--{ X , Y , Z , Int , Dim },
	{ 1571.154296875 ,-1683.5517578125 ,16.19149971008 ,0 ,0},
	{237.796875 ,122.16796875 ,1003.2187, 10, 4527 },
	{ 2008.6666259766 ,-1477.8674316406 ,1106.4000244141, 5, 0 },
}

for i=1 , #pdDutyMarker do
	pdMarker[i] = createMarker(  pdDutyMarker[i][1], pdDutyMarker[i][2], pdDutyMarker[i][3], "cylinder", 3.0,0,246,255,0)
	setElementInterior(pdMarker[i], pdDutyMarker[i][4])
	setElementDimension(pdMarker[i], pdDutyMarker[i][5])
	addEventHandler( "onMarkerHit", pdMarker[i], pdDutysBindKon )
	addEventHandler( "onMarkerLeave", pdMarker[i], pdDutysunBindKon )
end
--=================[Close Duty]================--
function dpOrder(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if getElementData(thePlayer, "onDuty") then
				local x,y,z = getElementPosition(thePlayer)
				if getDistanceBetweenPoints3D(x,y,z,1561.419921875 ,-1684.115234375 ,16.191499710083) < 5 or getDistanceBetweenPoints3D(x,y,z,233.7666015625 ,122.5908203125 ,1003.21875) < 5 or getDistanceBetweenPoints3D(x,y,z,1984.9322509766 ,-1472.8771972656 ,1106.4000244141) < 5 then
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) < 2 then
							takeAllWeapons ( thePlayer )
							giveWeapon(thePlayer,23,1000)
							giveWeapon(thePlayer,29,1000)
							giveWeapon(thePlayer,30,1000)
							outputChatBox("#ffff00Info: #00ff00Order 1 Be Shoma Dade Shod!", thePlayer, 255, 255, 255, true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) < 3 then
								takeAllWeapons ( thePlayer )
								giveWeapon(thePlayer,23,1000)
								giveWeapon(thePlayer,29,2000)
								giveWeapon(thePlayer,31,2000)
								outputChatBox("#ffff00Info: #00ff00Order 2 Be Shoma Dade Shod!", thePlayer, 255, 255, 255, true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) < 8 then
								takeAllWeapons ( thePlayer )
								giveWeapon(thePlayer,23,1000)
								giveWeapon(thePlayer,17,5)
								giveWeapon(thePlayer,31,3000)
								giveWeapon(thePlayer,29,3000)
								giveWeapon(thePlayer,27,500)
								outputChatBox("#ffff00Info: #00ff00Order 3 Be Shoma Dade Shod!", thePlayer, 255, 255, 255, true)
					else
						outputChatBox("#ff0000Syntax: /order <1~3>", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000Error: Baraye Inkar Bayad Dar Mahale Duty Bashid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000Error: Baraye Inkar Bayad On Duty Bashid!", thePlayer, 255, 255, 255, true)
			end
		else
			--outputChatBox("#ff0000Error: Baraye Inkar Bayad Ozve Department Bashid!", thePlayer, 255, 255, 255, true)
		end
end

function pdOrdersBindKon( hitElement, matchingDimension )
if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3 then
bindKey( hitElement, "Z", "down", dpOrder )
else return false end
end
function pdOrdersunBindKon( leaveElement, matchingDimension )
unbindKey( leaveElement, "Z", "down", dpOrder )
end

addEventHandler ( "onPlayerWasted", getRootElement(), --Fixe (( Z )) Button
function ()
	if (isKeyBound ( source,"Z" , "down", dpOrder )) then
		unbindKey( source, "Z", "down", dpOrder )
	end
end)

local orderMarker = {}
local orderOrderMarker = {
	--{ X , Y , Z , Int , Dim },
	{ 1561.419921875 ,-1684.115234375 ,16.191499710083, 0, 0 },
	{ 233.7666015625 ,122.5908203125 ,1003.21875, 10 ,4527 },
	{ 1984.9322509766 ,-1472.8771972656 ,1106.4000244141, 5, 0},
}

for i=1 , #orderOrderMarker do
	orderMarker[i] = createMarker(  orderOrderMarker[i][1], orderOrderMarker[i][2], orderOrderMarker[i][3], "cylinder", 3.0,0,246,255,0)
	setElementInterior(orderMarker[i], orderOrderMarker[i][4])
	setElementDimension(orderMarker[i], orderOrderMarker[i][5])
	addEventHandler( "onMarkerHit", orderMarker[i], pdOrdersBindKon )
	addEventHandler( "onMarkerLeave", orderMarker[i], pdOrdersunBindKon )
end
--=================[Close Duty]================--
addCommandHandler("cover",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 then
		local x,y,z = getElementPosition(thePlayer)
		if getDistanceBetweenPoints3D(x,y,z,-57.235939025879 ,254.4111328125 ,962.06091308594) < 5 then
			if not getElementData(thePlayer,"incover") then
				setPlayerNametagColor ( thePlayer, 255, 255, 255 )
				outputChatBox("#ffff00[FBI]: #717171Shoma #00ff00Cover #717171Shodid!", thePlayer, 255, 255, 255, true)
				setElementData(thePlayer,"incover",true,false)
				local yeSkinShansi = math.random(1,8)
				--outputChatBox
				if tonumber(yeSkinShansi) == 1 then
					setElementModel(thePlayer,7)
				elseif tonumber(yeSkinShansi) == 2 then
					setElementModel(thePlayer, 14)
				elseif tonumber(yeSkinShansi) == 3 then
					setElementModel(thePlayer, 20)
				elseif tonumber(yeSkinShansi) == 4 then
					setElementModel(thePlayer, 23)
				elseif tonumber(yeSkinShansi) == 5 then
					setElementModel(thePlayer, 29)
				elseif tonumber(yeSkinShansi) == 6 then
					setElementModel(thePlayer, 59)
				elseif tonumber(yeSkinShansi) == 7 then
					setElementModel(thePlayer, 60 )
				elseif tonumber(yeSkinShansi) == 8 then
					setElementModel(thePlayer, 100)
				end
			else
				setPlayerNametagColor ( thePlayer, 0, 62, 170 )
				setElementData(thePlayer,"incover",nil)
				outputChatBox("#ffff00[FBI]: #ffffffShoma #ff0000UnCover #ffffffShodid!", thePlayer, 255, 255, 255, true)
				setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "fSkin")))
			end
		end
	end
end)

addEventHandler("onPlayerWasted", root, 
function ()
	if getElementData(source, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) == 2 then
			if getElementData(source,"incover") then
				outputChatBox("#ffff00[FBI]: #ffffffShoma #ff0000UnCover #ffffffShodid!", source, 255, 255, 255, true)
				setElementData(source,"incover",nil)
			end
		end
	end
end)

addCommandHandler("frisk",
function(thePlayer, cmd, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 then
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				local x,y,z = getElementPosition(thePlayer)
				local mx,my,mz = getElementPosition(find)
				if getDistanceBetweenPoints3D(x,y,z,mx,my,mz) < 6.5 then
					local targetPlayer = getPlayerName ( find )
					local haveMat = getElementData(accSys:getPlayerAcc(find), "pMats")
					local haveDrug = getElementData(accSys:getPlayerAcc(find), "pDrugs")
					outputChatBox("#ffff00[Info]:#ffffff Natije Bazresi Badani Player: #ff0000 "..targetPlayer.."", thePlayer, 255, 255, 255, true)
					outputChatBox("#ffff00Mavad AslaheSazi: #ff0000"..haveMat.."gr", thePlayer, 255, 255, 255, true)
					outputChatBox("#ffff00Mavad Mokhader: #ff0000"..haveDrug.."gr", thePlayer, 255, 255, 255, true)
				else
					outputChatBox("#ff0000Error:In Player Az Shoma Fasele Darad!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000Error: Player Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Syntax: /frisk <PartOfName/ID>", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Error: Baraye Anjam Inkar Bayad Ozve Factione FBI Bashid", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("take",
function(thePlayer, cmd, player, arg)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 then
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				local x,y,z = getElementPosition(thePlayer)
				local mx,my,mz = getElementPosition(find)
				if getDistanceBetweenPoints3D(x,y,z,mx,my,mz) < 6.5 then
					if (arg) then
						if (arg) == "guns" then
							takeAllWeapons ( find )
							outputChatBox("#00ff00[Take]: #ffffffShoma Ba Movafaghiat Tamami Gun Haye Player "..getPlayerName( find ).." Ra Take Kardid!", thePlayer, 255, 255, 255, true)
							outputChatBox("#ff0000[Take]: #ffffffGun Haye Shoma Tavasote Police "..getPlayerName( thePlayer ).." Take Shod!", find, 255, 255, 255, true)
						elseif (arg) == "mats" then
							if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) < 4 then
								outputChatBox("#ff0000[Error]: #ffffffIn Player Khodesh Police Ast!", thePlayer, 255, 255, 255, true)
								return false
							else
								if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 2 then
									outputChatBox("#ff0000Error: Baraye Inkar Bayad Ozve FBI Bashid!", thePlayer, 255, 255, 255, true)
									return false
								end
								setElementData(accSys:getPlayerAcc(find), "pMats",0)
								outputChatBox("#00ff00[Take]: #ffffffShoma Ba Movafaghiat Tamami Mat Haye Player "..getPlayerName( find ).." Ra Take Kardid!", thePlayer, 255, 255, 255, true)
								outputChatBox("#ff0000[Take]: #ffffffMat Haye Shoma Tavasote Police "..getPlayerName( thePlayer ).." Take Shod!", find, 255, 255, 255, true)
							end
						elseif (arg) == "drugs" then
							local hisFac = getElementData(accSys:getPlayerAcc(find), "pMember")
							if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) < 4 then
								outputChatBox("#ff0000[Error]: #ffffffIn Player Khodesh Police Ast!", thePlayer, 255, 255, 255, true)
								return false
							else
								if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 2 then
									outputChatBox("#ff0000Error: Baraye Inkar Bayad Ozve FBI Bashid!", thePlayer, 255, 255, 255, true)
									return false
								end
								setElementData(accSys:getPlayerAcc(find), "pDrugs",0)
								outputChatBox("#00ff00[Take]: #ffffffShoma Ba Movafaghiat Tamami Drug Haye Player "..getPlayerName( find ).." Ra Take Kardid!", thePlayer, 255, 255, 255, true)
								outputChatBox("#ff0000[Take]: #ffffffDrug Haye Shoma Tavasote Police "..getPlayerName( thePlayer ).." Take Shod!", find, 255, 255, 255, true)
							end
						else
							outputChatBox("#ffff00Syntax: /take <PartOfName/ID> <Guns/Mats/Drugs>", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000Syntax: /take <PartOfName/ID> <Guns/Mats/Drugs>", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000Error: In Player Az Shoma Fasele Darad!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000Error: Player Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Syntax: /take <PartOfName/ID> <Guns/Mats/Drugs>", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Error: Baraye Anjam Chenin Kari Bayad Police Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("wanteds",
function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 then
		if getElementData(thePlayer, "onDuty") then					----
			outputChatBox("#97bbf4((________________Wanteds________________))", thePlayer, 255, 255, 255, true)
			for i, v in ipairs(getElementsByType("player")) do
				if getElementData(v, "loggedIn") == true then
					if tonumber(getElementData(accSys:getPlayerAcc(v), "pWanted")) > 0 then
						outputChatBox("#97bbf4Player : #ffffff"..getPlayerName(v).." (".. getElementData(v, "TarafID")..")", thePlayer, 255, 255, 255, true)
					end
				end
			end
		else
			outputChatBox("#ff0000Error: Baraye Inkar Bayad On Duty Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Error: Baraye Inkar Bayad Ozve Department Bashid!", thePlayer, 255, 255, 255, true)
	end
end)






function gateJailWarning(root)
	if getElementData(root, "loggedIn") == true then
		for k, v in ipairs (getElementsByType("player")) do
			if getElementData(v, "loggedIn") == true then
					local hisFac = tonumber(getElementData(accSys:getPlayerAcc(v), "pMember"))
					local hisAdmin = tonumber(getElementData(accSys:getPlayerAcc(v), "pAdmin"))
					if hisFac > 0 and hisFac < 4 and hisAdmin == 0 then
						outputChatBox("#1e47ffPolice "..getPlayerName(root).." Gate Jail PD Ra Baz Kard!", v, 255, 255, 255, true)
					end
					if hisAdmin > 2 then
						outputChatBox("#ff0000[PD-Admin-Log] #1e47ffPolice "..getPlayerName(root).." Gate Jail PD Ra Baz Kard!", v, 255, 255, 255, true)
					end
			end
		end
	end
end

local gatepd1 = createObject(2930, 1576.1 ,-1695 ,15.2, 0, 0, 90)
local gatepd2 = createObject(2930, 1580.7 ,-1695 ,15.2, 0, 0, 90)
addCommandHandler("jailgate",
function (thePlayer, cmd, jnumber)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then
		local jailID = tonumber(jnumber)
		if jnumber == "1" then
			moveObject(gatepd1, 3000, 1576.1 ,-1695 ,5)
			gateJailWarning(thePlayer)
			setTimer(function()
				moveObject(gatepd1, 3000, 1576.1 ,-1695 ,15.2)
			end, 5200, 1)
				
		elseif jnumber == "2" then
			moveObject(gatepd2,3000, 1580.7 ,-1695 ,5)
			gateJailWarning(thePlayer)
			setTimer(function()
				moveObject(gatepd2,3000, 1580.7 ,-1695 ,15.2)
			end, 5200, 1)
		
		end
	else 
		exports["notf"]:addNotification(thePlayer, "** Shoma Permession In Kar Ra Nadarid! **" , 'info')
	end
end)



---========[ Start System Jail Az in Jadida :D ]========---
--[[
local PdArrest = createMarker(1568.7294921875 ,-1689.970703125 ,6.2187 , "cylinder", 1.5, 0, 0, 0,0)
addEventHandler("onMarkerHit",PdArrest,
function(thePlayer)					
	if getElementData(thePlayer, "pCuffe") == nil or getElementData(thePlayer, "pCuffe") == false then
		takeAllWeapons ( thePlayer )
		exports["notf"]:addNotification(thePlayer, "** Gun Haye Shoma Tavasot Police Gerefte Shod **" , 'warning')
			local wKill = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "wKill"))*60 -- for SetJailTime
			local wKillMin = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "wKill"))*60/60 -- for PM
			local checkKill = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "wKill")) -- for PM
			exports["[Phoenix]Faction-system"]:DepartmentMessage("Mojrem "..getPlayerName(thePlayer).." Tavasot Police Ba Zaman "..wKillMin.."/Min Be Dalil Anjam "..checkKill.." Jorm Arrest Shodid.")
			setElementData(accSys:getPlayerAcc(thePlayer), "pJailTime", wKill)
			setElementData(accSys:getPlayerAcc(thePlayer), "pAJailed", 1)
			setElementData(accSys:getPlayerAcc(thePlayer), "pWanted", 0)
			setElementData(accSys:getPlayerAcc(thePlayer), "wKill", 0)
			local SelolID = math.random(1,2)
			if SelolID == 1 then
				spawnPlayer(thePlayer, 1576.017578125 ,-1693.072265625 ,13.589937210083, 180)
				setElementInterior(thePlayer, 0)
				setElementDimension(thePlayer, 0)
				if getElementData(accSys:getPlayerAcc(thePlayer),"pSex") == 1 then
					setElementModel(thePlayer, 184)
				else
					setElementModel(thePlayer, 195)
				end
				fadeCamera(thePlayer, true)
				setCameraTarget(thePlayer, thePlayer)
			elseif SelolID == 2 then
				spawnPlayer(thePlayer, 1580.59375 ,-1693.046875 ,13.58993721008, 180)
				setElementInterior(thePlayer, 0)
				setElementDimension(thePlayer, 0)
				if getElementData(accSys:getPlayerAcc(thePlayer),"pSex") == 1 then
					setElementModel(thePlayer, 184)
				else
					setElementModel(thePlayer, 195)
				end
				fadeCamera(thePlayer, true)
				setCameraTarget(thePlayer, thePlayer)
			end
	end
end)
--]]
setTimer(function()
	for k, Mojrems in ipairs (getElementsByType("player")) do
		if getElementData(Mojrems,"loggedIn") and getElementData(Mojrems,"loggedIn") == true then
			local x, y, z = getElementPosition( Mojrems )
			if getDistanceBetweenPoints3D( x, y, z, 1568.658203125 ,-1690.2255859375 ,5.890625 ) < 4 then
				if getElementData(Mojrems, "pCuffe") == nil or getElementData(Mojrems, "pCuffe") == false then
				local checkMojrem = tonumber(getElementData(accSys:getPlayerAcc(Mojrems), "wKill"))
					if checkMojrem == 0 then return false end
					takeAllWeapons ( Mojrems )
					exports["notf"]:addNotification(Mojrems, "** Gun Haye Shoma Tavasot Police Gerefte Shod **" , 'warning')
					local wKill = tonumber(getElementData(accSys:getPlayerAcc(Mojrems), "wKill"))*60 -- for SetJailTime
					local wKillMin = tonumber(getElementData(accSys:getPlayerAcc(Mojrems), "wKill"))*60/60 -- for PM
					local checkKill = tonumber(getElementData(accSys:getPlayerAcc(Mojrems), "wKill")) -- for PM
					exports["[Phoenix]Faction-system"]:DepartmentMessage("Mojrem "..getPlayerName(Mojrems).." Tavasot Police Ba Zaman "..wKillMin.."/Min Be Dalil Anjam "..checkKill.." Jorm Arrest Shodid.")
					setElementData(accSys:getPlayerAcc(Mojrems), "pJailTime", wKill)
					setElementData(accSys:getPlayerAcc(Mojrems), "pAJailed", 1)
					setElementData(accSys:getPlayerAcc(Mojrems), "pWanted", 0)
					setElementData(accSys:getPlayerAcc(Mojrems), "wKill", 0)
					local SelolID = math.random(1,2)
						if SelolID == 1 then
							spawnPlayer(Mojrems, 1576.017578125 ,-1693.072265625 ,13.589937210083, 180)
							setElementInterior(Mojrems, 0)
							setElementDimension(Mojrems, 0)
						if getElementData(accSys:getPlayerAcc(Mojrems),"pSex") == 1 then
							setElementModel(Mojrems, 184)
						else
							setElementModel(Mojrems, 195)
						end
							fadeCamera(Mojrems, true)
							setCameraTarget(Mojrems, Mojrems)
						elseif SelolID == 2 then
							spawnPlayer(Mojrems, 1580.59375 ,-1693.046875 ,13.58993721008, 180)
							setElementInterior(Mojrems, 0)
							setElementDimension(Mojrems, 0)
						if getElementData(accSys:getPlayerAcc(Mojrems),"pSex") == 1 then
							setElementModel(Mojrems, 184)
						else
							setElementModel(Mojrems, 195)
						end
						fadeCamera(Mojrems, true)
						setCameraTarget(Mojrems, Mojrems)
					end
				end
			end
		end
	end
end, 1000,0)

addCommandHandler("ajail",
function ( thePlayer, command, player, Min, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				if Min then
					if tonumber(Min) > 0 then
						if ... then
							local Message = table.concat({ ... }, " ")
							if #Message > 0 then
								setElementData(accSys:getPlayerAcc(find), "pJailTime", tonumber(tonumber(Min)*60))
								setElementData(accSys:getPlayerAcc(find), "pAJailed", 4)
								globalSys:SendPlayerToJail( find , 4)
								outputChatBox("#ff0000[Punishment]: "..getPlayerName( find ).." Tavasot Admin "..getPlayerName( thePlayer ).." Be Modat "..Min.." Daghighe Admin Jail Shod! Reason: "..Message.."", getRootElement(), 255, 255, 255, true)
								exports["[Phoenix]Faction-System"]:DepartmentMessage("Player "..getPlayerName(find).." Tavasot Admin "..getPlayerName(thePlayer).." Dar Enferadi Bazdasht Shod!")
							end
						end
					else
						outputChatBox("#ff0000Error: Time Jail Hadaghal Bayad 1 Daghighe Bashad!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000Syntax: /ajail <PartOfName/ID> <Minutes> <Reason>", thePlayer, 0, 255, 0, true)
				end
			else
				outputChatBox("#ff0000Error: Player Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Syntax: /ajail <PartOfName/ID> <Minutes> <Reason>", thePlayer, 0, 255, 0, true)
		end
	else
		outputChatBox("#ff0000Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("jlist",
function(thePlayer)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
outputChatBox("#fff000ــــــــــــــــــــــــــــــــــ Jail Player Listــــــــــــــــــــــــــــــــــــــــــــ", thePlayer, 0, 255, 0, true)
for index,jailia in ipairs(getElementsByType("player")) do
		if getElementData(jailia,"loggedIn") and getElementData(jailia,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(jailia),"pJailTime") >= 1 then
					local timesh = getElementData(accSys:getPlayerAcc(jailia), "pJailTime")
					outputChatBox("#fff000 Name: #ff0000"..getPlayerName(jailia).." #fff000| Time: #ff0000"..timesh.." ", thePlayer, 0, 255, 0, true)
			end
		end
	end
outputChatBox("#fff000ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", thePlayer, 0, 255, 0, true)
else
	outputChatBox("#ff0000Error: Shoma Dastresi Be In CMD Ra Nadarid!!", thePlayer, 255, 255, 255, true)
end
end)



function timejailkamkon()
	setTimer ( function()
	for _,p in ipairs (getElementsByType("player")) do
		if getElementData(p , "loggedIn") == true then
		--local timeyaru = getElementData(accSys:getPlayerAcc(p),"pJailTime")
			if tonumber(getElementData(accSys:getPlayerAcc(p),"pJailTime")) ~= nil then
				if tonumber(getElementData(accSys:getPlayerAcc(p),"pJailTime")) > 0 then
					local timesh = getElementData(accSys:getPlayerAcc(p), "pJailTime")
					local timebadi = tonumber(timesh)-1
					setElementData(accSys:getPlayerAcc(p), "pJailTime", tonumber(timebadi))
					setElementData(p, "pJailTime", tonumber(timebadi))
					if getElementData(accSys:getPlayerAcc(p), "pJailTime") == 0 then
						local Kojas = getElementData(accSys:getPlayerAcc(p), "pAJailed")
						if not isPedInVehicle ( p ) then
							if Kojas == 4 then
								spawnPlayer(p, 2352.1552734375 ,-1169.861328125 ,28.03557968139)
								setElementInterior ( p, 0 )
								setElementDimension( p , 0 )
							else
								spawnPlayer(p, 1584.86328125 ,-1684.623046875 ,14.996187210083)
								setElementInterior ( p, 0 )
								setElementDimension( p , 0 )
							end
							fadeCamera(p, true, 1)
							if tonumber(getElementData(accSys:getPlayerAcc(p), "pMember")) == 0 then
								if tonumber(getElementData(accSys:getPlayerAcc(p), "cSkin")) == 0 then
									exports["[Phoenix]SkinEditor"]:setplayerSkins(p)
								else
									setElementModel(p, tonumber(getElementData(accSys:getPlayerAcc(p), "cSkin")))
								end
							else
								setElementModel(p, tonumber(getElementData(accSys:getPlayerAcc(p), "fSkin")))
							end
						end
						outputChatBox("#00ff00Shoma Az Zendan Azad Shodid.", p, 255, 255, 255, true) 
					end
				end
		   end
		end
	end
	end, 1000, 0 )
end
timejailkamkon()

addCommandHandler("seejt",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 3 then
		local find = miscSys:findPlayer ( player )
		local sjt = getElementData(accSys:getPlayerAcc(find), "pJailTime")
		local targetPlayer = getPlayerName ( find )
		outputChatBox("#00ff00Time Jaile #ff0000"..targetPlayer.."#00ff00: #ff0000"..sjt.."#00ff00 sanie ast!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("setjt",
function ( thePlayer, command, player, sec )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 14 then
    local find = miscSys:findPlayer ( player )
	local sec = tonumber(sec)
	local targetPlayer = getPlayerName ( find )
	setElementData(accSys:getPlayerAcc(find), "pJailTime", sec)
	outputChatBox("#00ff00shoma Time Jaile #ff0000"..targetPlayer.."#00ff00 Ra Be : #ff0000"..sec.."#00ff00 sanie set kardid!", thePlayer, 255, 255, 255, true)
 else
 outputChatBox("#ff0000Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
 end
end)



addCommandHandler("m",
function(thePlayer, cmd, taraf)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 then
			if getElementData(thePlayer, "onDuty") then
				if isPedInVehicle(thePlayer) then
						local vehid = getElementID(getPedOccupiedVehicle( thePlayer ))
						if (type(string.find(vehid,"SfFbi")) == "number") 
						or (type(string.find(vehid,"NG")) == "number") 
						or (type(string.find(vehid,"motofbi")) == "number") 
						or (type(string.find(vehid,"helifbi")) == "number") 
						or (type(string.find(vehid,"carfbi")) == "number") 
						or (type(string.find(vehid,"PD")) == "number") then
							if tonumber(getPedOccupiedVehicleSeat(thePlayer)) == 0 then
								if taraf then
									local find = miscSys:findPlayer ( taraf )
									if find then
										local posX, posY, posZ = getElementPosition( thePlayer )
										local myInt = getElementInterior(thePlayer)
										local myDim = getElementDimension(thePlayer)
										local chatSphere = createColSphere( posX, posY, posZ, 40 )
										local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
										destroyElement( chatSphere )
										triggerClientEvent("PlayMegaPhoneSound", resourceRoot, thePlayer)
										for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
											if getElementData(nearbyPlayer, "loggedIn") == true then
												local yourInt = getElementInterior(nearbyPlayer)
												local yourDim = getElementDimension(nearbyPlayer)
												if tonumber(myInt) == tonumber(yourInt) and tonumber(myDim) == tonumber(yourDim) then
													if tonumber(getElementData(accSys:getPlayerAcc(find), "pWanted")) == 0 then
														outputChatBox("#ff0000( M ) #97bbf4<< "..getPlayerName(thePlayer).." : #ffffff "..getPlayerName(find).."("..getElementData(find,"TarafID")..") Stop! #97bbf4 >> ", nearbyPlayer, 255, 255, 255, true)
													else
														outputChatBox("#ff0000( M ) #97bbf4<< "..getPlayerName(thePlayer).." : #ffffff "..getPlayerName(find).."("..getElementData(find,"TarafID")..") G or Wanted! #97bbf4 >> ", nearbyPlayer, 255, 255, 255, true)
													end
												end
											end
										end
									else
										outputChatBox("#ff0000Error: Player Peyda Nashod", thePlayer, 255, 255, 255, true)
									end
								else
									outputChatBox("SYNTAX: /m (PartOfName/ID)", thePlayer, 212, 156, 49)
								end
							else
								outputChatBox("#ff0000Error: Baraye Inkar Bayad Ranande Mashin Bashid!", thePlayer, 255, 255, 255, true)
							end
						else
							outputChatBox("#ff0000Error: Baraye Inkar Bayad Dakhel Mashin Haye Department Bashid!", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000Error: Baraye Inkar Bayad Dakhel Mashin Haye Department Bashid!", thePlayer, 255, 255, 255, true)
					end
			else
				outputChatBox("#ff0000Error: Baraye Inkar Bayad On Duty Bashid!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Error: Baraye Inkar Bayad Ozve Department Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

addCommandHandler("find",
function (thePlayer, cmd, name)
	local find = miscSys:findPlayer(name)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 
	or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
		if getElementData(thePlayer, "inDepartmentFind") ~= true then
			if find then
				if getElementData(find,"unfind") ~= true then
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 0 
						or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 3 
						and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 5 then
							if tonumber(getElementData(accSys:getPlayerAcc(find), "pLevel")) > 3 then
								outputChatBox("#00ff00[Find-System]: #ffffffBaraye Find Kardan Player Bayad Levelesh -3 Bashe!", thePlayer, 255, 255, 255, true)
								return
							end
						end
					end
					if getPlayerLocation(find) ~= "MAP" then
						local parsedLocation = tostring(getPlayerLocation(find))
						local locationTable = split(parsedLocation, ",")
						local findblip = createBlip(locationTable[1], locationTable[2], locationTable[3], 56, 255, 0, 255)
						setElementVisibleTo(findblip, getRootElement(), false)
						setElementVisibleTo(findblip, thePlayer, true)
						setElementData(thePlayer, "nowDepartmentFind", findblip)
						setElementData(thePlayer, "inDepartmentFind", true, false)
						setElementData(thePlayer, "whoImFinding", find, false)
					else
						local findblip = createBlipAttachedTo ( find, 56 , 255, 0, 255)
						setElementVisibleTo(findblip, getRootElement(), false)
						setElementVisibleTo(findblip, thePlayer, true)
						setElementData(thePlayer, "nowDepartmentFind", findblip)
						setElementData(thePlayer, "inDepartmentFind", true, false)
						setElementData(thePlayer, "whoImFinding", find, false)
						outputChatBox("#00ff00[Find-System]: #ffffffIn Player Ba Movafaqiat Find Shod!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Find-System]: #ffffffIn Player Unfind Ast!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000[Find-System]: #ffffffEbteda /cfind Konid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffShoma Mojaz Be Chenin Kari Nemibashid!", thePlayer, 255, 255, 255, true)
	end
end)

function refreshBlip(ppl)
	for i, v in ipairs(getElementsByType("player")) do
		if getElementData(v, "whoImFinding") == ppl then
			if getElementData(v, "inDepartmentFind") == true then
				if getPlayerLocation(ppl) ~= "MAP" then
					local parsedLocation = tostring(getPlayerLocation(ppl))
					local locationTable = split(parsedLocation, ",")
					destroyElement(getElementData(v, "nowDepartmentFind"))
					local blip = createBlip(locationTable[1], locationTable[2], locationTable[3], 56, 255, 0, 255)
					setElementVisibleTo(blip, getRootElement(), false)
					setElementVisibleTo(blip, v, true)
					setElementData(v, "nowDepartmentFind", blip, false)
				else
					destroyElement(getElementData(v, "nowDepartmentFind"))
					setTimer(function()
						local blip = createBlipAttachedTo ( ppl, 56 , 255, 0, 255)
						setElementVisibleTo(blip, getRootElement(), false)
						setElementVisibleTo(blip, v, true)
						setElementData(v, "nowDepartmentFind", blip, false)
					end, 1500, 1)
				end
			end
		end
	end
end

addCommandHandler("cfind",
function (thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 
	or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
		if getElementData(thePlayer, "inDepartmentFind") == true then
			destroyElement(getElementData(thePlayer, "nowDepartmentFind"))
			setElementData(thePlayer, "inDepartmentFind", nil, false)
			for i, v in ipairs(getElementsByType("player")) do
				if getElementData(thePlayer, "whoImFinding") == v then
					setElementData(thePlayer, "whoImFinding", nil, false)
				end
			end
			outputChatBox("#ff0000[Find-System]: #ffffffShoma Find Ra Cancel Kardid!", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000[Find-System]: #ffffffShoma Darhal Find Nistid!", thePlayer, 255, 255, 255, true)
		end
	end
end)


function CantExitWhileCuffed ( thePlayer, seat, jacked )
	if getElementData(thePlayer, "pCuffe") == true then
		cancelEvent()
	end
end
addEventHandler ( "onVehicleStartExit", getRootElement(), CantExitWhileCuffed)

addCommandHandler("pelak",
function ( thePlayer, command )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
	if getElementData(thePlayer,"ingetpelak") == true then
		setElementData(thePlayer,"ingetpelak",nil)
		outputChatBox("#ff0000[Pelak-System]: #ffffffShoma Ba Movafaghiat Halate Namayesh Pelak Ra Off Kardid!", thePlayer, 255, 255, 255, true)
	else
		setElementData(thePlayer,"ingetpelak",true)
		outputChatBox("#ff0000[Pelak-System]: #ffffffShoma Ba Movafaghiat Halate Namayesh Pelak Ra On Kardid!", thePlayer, 255, 255, 255, true)
	end
 else
	outputChatBox("#ff0000Error: Baraye Anjam Inkar Bayad Ozve Department Bashid", thePlayer, 255, 255, 255, true)
 end
end)

function getplate( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "vehicle" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local distance = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if distance < 4 then
				if getElementData(player,"ingetpelak") == true then
					local plate = getVehiclePlateText ( source )
					if getElementData(source,"owner") then
						outputChatBox("#F0F000Pelak Khodro: #FFFFFF["..plate.."]  #F0F000Malek Khodro: #FFFFFF["..getElementData(source,"owner").."]", player, 0, 255, 0,true)
					else
						outputChatBox("#F0F000Pelak Khodro: #FFFFFF["..plate.."]", player, 0, 255, 0,true)
					end
				end
            end
        end
    end
end
addEventHandler( "onElementClicked", root, getplate )