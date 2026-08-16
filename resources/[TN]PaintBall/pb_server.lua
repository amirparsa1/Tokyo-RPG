local accSys = exports["Accounts-System"]
local paintball1 = createPickup(2694.052734375 ,-1708.833984375 ,11.847807884216, 3, 1313, 0)
MarkerP = createMarker (2694.052734375 ,-1708.833984375 ,11.847807884216 , "cylinder", 0.8,111,175,230,0 )

fasele = 1


addEventHandler("onMarkerHit",MarkerP,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		exports["notf"]:addNotification(hitElement, "Baraye Entekhabe Bazi Az Dastor /game Estefade Konid." , 'info')
		triggerClientEvent ( hitElement, "Playinfo", hitElement )
	end
end)


local avalinkill = nil
local joined = nil
local paintball = nil --matchi vojood nadare
local pbEnter = nil --default
local pbgetgun = nil --guni entekhab nashode
local winner = {}

addCommandHandler("game",
function(thePlayer, command)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(paintball1)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	if getElementData(thePlayer, "loggedIn") == true then
	if de < fasele then
	if getElementInterior(thePlayer) == 0 and getElementDimension(thePlayer) == 0 then
		
		
		triggerClientEvent("PaintBallRoBazKon", thePlayer, thePlayer)
	end
	end
	end
end)



function hudoff ()
	for _,p in ipairs (getElementsByType("player")) do
		if getElementData(p , "loggedIn") == true then
			setPlayerHudComponentVisible ( p, "radar", false )
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement(), hudoff )

function forwardedFunction()
	if getElementData(source, "inpaintball") == true then
		setPedAnimation(source, CRACK, crckdethl, 2500, true)
		
		setTimer(paintballspawn, 2500, 1, source)
	end
end
--addEventHandler("onPlayerWasted", root, forwardedFunction)

function topaintballbegaraft()
if getElementData(source, "inpaintball") == true then
	setPedAnimation(source, CRACK, crckdethl, 7000, true)
	
	setTimer(paintballspawn, 2000, 1, source)
end
end
addEventHandler("onPlayerWasted", root, topaintballbegaraft)

function paintballspawn(thePlayer)
	if getElementData(thePlayer, "inpaintball") == true then
		
		spawnPlayer(thePlayer, 0, 0, 0)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 0 then
			setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")))
		else
			setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "fSkin")))
		end
		if pbgetgun == 24 then
			giveWeapon(thePlayer,24,1000,true)
		elseif pbgetgun == 31 then
			giveWeapon(thePlayer,31,1000,true)
		elseif pbgetgun == 33 then
			giveWeapon(thePlayer,33,1000,true)
		elseif pbgetgun == 30 then
			giveWeapon(thePlayer,30,1000,true)
		elseif pbgetgun == 29 then
			giveWeapon(thePlayer,29,1000,true)
		elseif pbgetgun == 34 then
			giveWeapon(thePlayer,34,1000,true)
		elseif pbgetgun == 27 then
			giveWeapon(thePlayer,27,1000,true)
		elseif pbgetgun == 32 then
			giveWeapon(thePlayer,32,1000,true)
		end
		--setTimer( function()
			if paintball == 1 then
				local spawn = math.random(1,17)
				
				if tonumber(spawn) == 1 then
					setElementPosition (thePlayer, -333.572265625 ,2219.15625 ,42.488258361816)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 2 then
					setElementPosition (thePlayer, -356.158203125 ,2243.0361328125 ,42.484375)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 3 then
					setElementPosition (thePlayer, -365.232421875 ,2263.421875 ,42.484375)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 4 then
					setElementPosition (thePlayer, -376.333984375 ,2260.46875 ,43.06192779541)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 5 then
					setElementPosition (thePlayer, -377.5185546875 ,2242.173828125 ,42.618461608887)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 6 then
					setElementPosition (thePlayer, -363.1318359375 ,2221.884765625 ,42.911636352539)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 7 then
					setElementPosition (thePlayer, -367.2353515625 ,2206.44921875 ,42.484375)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 8 then
					setElementPosition (thePlayer, -384.39453125 ,2206.205078125 ,42.42350769043)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 9 then
					setElementPosition (thePlayer, -393.857421875 ,2196.1748046875 ,42.416893005371)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 10 then
					setElementPosition (thePlayer, -394.8046875 ,2214.720703125 ,42.425590515137)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 11 then
					setElementPosition (thePlayer, -401.13671875 ,2249.4619140625 ,42.4296875)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 12 then
					setElementPosition (thePlayer, -403.265625 ,2258.703125 ,42.4296875)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 13 then
					setElementPosition (thePlayer, -413.966796875 ,2230.0810546875 ,42.425819396973)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 14 then
					setElementPosition (thePlayer, -431.16796875 ,2239.9873046875 ,42.983383178711)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 15 then
					setElementPosition (thePlayer, -445.7724609375 ,2222.2900390625 ,42.4296875)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 16 then
					setElementPosition (thePlayer, -433.541015625 ,2252.21875 ,42.4296875)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 17 then
					setElementPosition (thePlayer, -339.837890625 ,2186.3994140625 ,45.405567169189)
					setElementDimension ( thePlayer, 2 )
				end
			elseif paintball == 2 then
				local spawn = math.random(1,15)
				if tonumber(spawn) == 1 then
					setElementPosition (thePlayer, -1447.41015625 ,-1448.3681640625 ,101.7578125)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 2 then
					setElementPosition (thePlayer, -1450.7099609375 ,-1481.693359375 ,101.7578125)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 3 then
					setElementPosition (thePlayer, -1431.369140625 ,-1468.306640625 ,101.69653320313)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 4 then
					setElementPosition (thePlayer, -1423.533203125 ,-1480.71484375 ,101.691875)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 5 then
					setElementPosition (thePlayer, -1447.3515625 ,-1500.2763671875 ,101.7578125)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 6 then
					setElementPosition (thePlayer, -1460.8583984375 ,-1511.275390625 ,101.75132751465)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 7 then
					setElementPosition (thePlayer, -1469.34765625 ,-1529.3427734375 ,101.7578125)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 8 then
					setElementPosition (thePlayer, -1447.6943359375 ,-1530.13671875 ,101.7578125)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 9 then
					setElementPosition (thePlayer, -1425.8486328125 ,-1528.234375 ,101.95904541016)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 10 then
					setElementPosition (thePlayer, -1424.5322265625 ,-1564.126953125 ,101.7578125)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 11 then
					setElementPosition (thePlayer, -1460.2158203125 ,-1537.607421875 ,104.765625)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 12 then
					setElementPosition (thePlayer, -1451.1826171875 ,-1564.662109375 ,102.7578125)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 13 then
					setElementPosition (thePlayer, -1444.4736328125 ,-1576.76171875 ,101.7578125)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 14 then
					setElementPosition (thePlayer, -1435.25 ,-1539.763671875 ,101.7578125)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 15 then
					setElementPosition (thePlayer, -1424.1865234375 ,-1479.263671875 ,105.03207397461)
					setElementDimension ( thePlayer, 2 )
				end
			elseif paintball == 3 then
				local spawn = math.random(1,15)
				if tonumber(spawn) == 1 then
					setElementPosition (thePlayer, -1130.947265625 ,1028.9736328125 ,1345.7268066406)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 2 then
					setElementPosition (thePlayer, -1136.2333984375 ,1066.7724609375 ,1345.79296875)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 3 then
					setElementPosition (thePlayer, -1133.064453125 ,1091.4111328125 ,1345.7955322266)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 4 then
					setElementPosition (thePlayer, -1111.1640625 ,1037.451171875 ,1342.8959960938)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 5 then
					setElementPosition (thePlayer, -1069.12890625 ,1091.017578125 ,1343.3898925781)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 6 then
					setElementPosition (thePlayer, -1066.123046875 ,1031.462890625 ,1343.1314697266)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 7 then
					setElementPosition (thePlayer, -1084.1630859375 ,1045.5927734375 ,1343.6318359375)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 8 then
					setElementPosition (thePlayer, -1068.298828125 ,1063.50390625 ,1343.8004150391)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 9 then
					setElementPosition (thePlayer, -1063.296875 ,1052.0302734375 ,1343.8684082031)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 10 then
					setElementPosition (thePlayer, -1055.6923828125 ,1046.69921875 ,1343.7010498047)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 11 then
					setElementPosition (thePlayer, -1018.9228515625 ,1077.1044921875 ,1343.9329833984)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 12 then
					setElementPosition (thePlayer, -989.419921875 ,1036.9697265625 ,1341.9594726563)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 13 then
					setElementPosition (thePlayer, -973.1572265625 ,1095.6591796875 ,1344.9859619141)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 14 then
					setElementPosition (thePlayer, -974.2646484375 ,1065.9560546875 ,1345)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 15 then
					setElementPosition (thePlayer, -971.29296875 ,1028.623046875 ,1345.0600585938)
					setElementInterior ( thePlayer, 10 )
					setElementDimension ( thePlayer, 2 )
				end
			elseif paintball == 4 then
				local spawn = math.random(1,17)
				if tonumber(spawn) == 1 then
					setElementPosition (thePlayer, -1318.2822265625 ,2565.5869140625 ,86.6083984375)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 2 then
					setElementPosition (thePlayer, -1303.3095703125 ,2546.5966796875 ,90.328125)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 3 then
					setElementPosition (thePlayer, -1320.375 ,2539.7119140625 ,87.435691833496)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 4 then
					setElementPosition (thePlayer, -1289.5400390625 ,2530.099609375 ,87.692977905273)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 5 then
					setElementPosition (thePlayer, -1301.3994140625 ,2524.044921875 ,87.454772949219)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 6 then
					setElementPosition (thePlayer, -1285.771484375 ,2516.7587890625 ,87.168098449707)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 7 then
					setElementPosition (thePlayer, -1306.55078125 ,2489.37109375 ,87.163444519043)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 8 then
					setElementPosition (thePlayer, -1342.662109375 ,2477.0029296875 ,87.046875)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 9 then
					setElementPosition (thePlayer, -1357.8369140625 ,2507.91015625 ,87.158126831055)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 10 then
					setElementPosition (thePlayer, -1321.42578125 ,2526.08984375 ,87.424346923828)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 11 then
					setElementPosition (thePlayer, -1325.1240234375 ,2506.6884765625 ,87.046875)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 12 then
					setElementPosition (thePlayer, -1337.0771484375 ,2524.9130859375 ,87.046875)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 13 then
					setElementPosition (thePlayer, -1270.119140625 ,2494.68359375 ,87.038024902344)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 14 then
					setElementPosition (thePlayer, -1300.6689453125 ,2523.8974609375 ,87.448944091797)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 15 then
					setElementPosition (thePlayer, -1247.7529296875 ,2518.623046875 ,107.9817199707)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 16 then
					setElementPosition (thePlayer, -1267.5166015625 ,2478.23046875 ,87.079040527344)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 17 then
					setElementPosition (thePlayer, -1258.712890625 ,2578.6044921875 ,95.373908996582)
					setElementDimension ( thePlayer, 2 )
				end
			elseif paintball == 5 then
				local spawn = math.random(1,16)
				if tonumber(spawn) == 1 then
					setElementPosition (thePlayer, 109.97202301025 ,2553.6213378906 ,209.67105102539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 2 then
					setElementPosition (thePlayer, 129.95834350586 ,2558.1271972656 ,209.67105102539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 3 then
					setElementPosition (thePlayer, 128.52377319336 ,2550.0100097656 ,207.07730102539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 4 then
					setElementPosition (thePlayer, 86.059913635254 ,2555.5549316406 ,203.96122741699)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 5 then
					setElementPosition (thePlayer, 57.493507385254 ,2559.7121582031 ,207.07730102539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 6 then
					setElementPosition (thePlayer, 47.083351135254 ,2560.2482910156 ,207.94448852539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 7 then
					setElementPosition (thePlayer, 49.736671447754 ,2526.2248535156 ,207.94448852539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 8 then
					setElementPosition (thePlayer, 72.825538635254 ,2528.5051269531 ,204.06094360352)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 9 then
					setElementPosition (thePlayer, 80.476905822754 ,2501.1047363281 ,207.07730102539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 10 then
					setElementPosition (thePlayer, 104.07944488525 ,2491.7043457031 ,207.07730102539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 11 then
					setElementPosition (thePlayer, 116.11850738525 ,2503.1516113281 ,207.07730102539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 12 then
					setElementPosition (thePlayer, 145.93881225586 ,2514.4572753906 ,208.79647827148)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 13 then
					setElementPosition (thePlayer, 69.268898010254 ,2480.1623535156 ,210.61335754395)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 14 then
					setElementPosition (thePlayer, 47.456398010254 ,2487.9338378906 ,207.07730102539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 15 then
					setElementPosition (thePlayer, 87.164405822754 ,2480.9865722656 ,207.07730102539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				elseif tonumber(spawn) == 16 then
					setElementPosition (thePlayer, 101.64878082275 ,2530.8088378906 ,207.07730102539)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 5 )
				end
			
			else
				setElementPosition (thePlayer, 2692.322265625 ,-1707.6337890625 ,11.847807884216)
				setElementInterior ( thePlayer, 0 )
				setElementDimension (thePlayer, 0 )
				takeAllWeapons (thePlayer)
			end
		--setPedHeadless(source, false)
	end
end

function killpaintball ( ammo, attacker, weapon, bodypart )
	if getElementData(source, "inpaintball") == true then
		if ( attacker ) then
		if tonumber(getElementData(attacker,"paintballkills")) == 1 then
			avalinkill = true
		end
		--if tonumber(getElementData(attacker,"paintballkills")) == 3 then
			--triggerClientEvent("dominatingsound", attacker, attacker)
		--elseif tonumber(getElementData(attacker,"paintballkills")) == 6 then
			--triggerClientEvent("godlikesound", attacker, attacker)
		--elseif tonumber(getElementData(attacker,"paintballkills")) == 10 then
			--triggerClientEvent("holyshiiitsound", attacker, attacker)
		--else
			local kojazad = getBodyPartName ( bodypart )
			if kojazad == "Head" then
				triggerClientEvent("headshotsound", attacker, attacker)
			end
		--end
		if ( bodypart == 9 ) then
			local score = getElementData(attacker,"paintscore")
			local score2 = getElementData(source,"paintscore")
			setElementData(attacker,"paintscore",tonumber(score)+5)

			if tonumber (score2) > 1 then
				
				setElementData(source,"paintscore",tonumber(score2)-2)
				triggerClientEvent("Mordansound", source, source)

			end
		 elseif ( bodypart ~= 9 ) then
			local score2 = getElementData(source,"paintscore")
			local score = getElementData(attacker,"paintscore")
			setElementData(attacker,"paintscore",tonumber(score)+3)
			if tonumber (score2) > 0 then
				setElementData(source,"paintscore",tonumber(score2)-1)
				triggerClientEvent("Mordansound", source, source)
			end
		end
		avalinkill = true
		--setElementData(source,"paintballkills",0)
		local killesh = getElementData(attacker,"paintballkills")
		setElementData(attacker,"paintballkills",tonumber(killesh)+1)
		end
	end
end
addEventHandler ( "onPlayerWasted", getRootElement(), killpaintball )

addCommandHandler("mysc",
function(thePlayer)
	local scoresh = getElementData(thePlayer,"paintscore")
	outputChatBox("Score Shoma: "..scoresh)


end)

function joinButtonClicked(root)
	if paintball ~= nil then
		local PlayerMoney = getPlayerMoney(root)
		if ( PlayerMoney >= 800) then
			if	pbEnter == true then
				joined = true
				takePlayerMoney(root,800)
				setElementData(root, "inpaintball", true, false)
				setElementData(root,"paintscore",0)
				paintballspawn(root)
				setElementFrozen(root, true)
				toggleAllControls ( root, false, true, false)
				exports["notf"]:addNotification(root, "Shoma Be In Match Join Shodid Ta Shoroe Match Sabor Bashi!" , 'success')
				triggerClientEvent ( root, "PlayMovafagh", root, "Hello World!" )
				setElementData(root, "paintballkills", 0, false)
				triggerClientEvent("pbJoinClose", root, root)
			else
				exports["notf"]:addNotification(root, "In Match Baste Shode Va Emkane Join Nist!" , 'error')
				triggerClientEvent("PlayError", root, root)
			end
		else
			exports["notf"]:addNotification(root, "Baraye Vorod Be Match Niaz Be $800 Darid!" , 'error')
			triggerClientEvent("PlayError", root, root)
		end
	else
		exports["notf"]:addNotification(root, "Dar Hale Hazer Matchi Sakhte Nashode Ast!" , 'error')
		triggerClientEvent("PlayError", root, root)
	end
end
addEvent("onClientClickedJoin",true)
addEventHandler("onClientClickedJoin", root,joinButtonClicked)

function sefrkon ( )
	for _,p in ipairs (getElementsByType("player")) do
		if getElementData(p, "loggedIn") == true then
			setElementData(p, "paintscore", nil)
			setElementData(root, "paintballkills",nil)
			setElementData(root, "inpaintball", nil)
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement(), sefrkon )


function createButtonClicked(root)
	if paintball == nil then
		if getElementData(root, "pbMap") > 0 then
			timesh = tonumber(getElementData(root, "pbTime"))
			local PlayerMoney = getPlayerMoney(root)
			if ( PlayerMoney >= 1500) then
				if getElementData(root, "pbGunSet") == 30 or getElementData(root, "pbGunSet") == 31 or getElementData(root, "pbGunSet") == 27 or getElementData(root, "pbGunSet") == 24 or getElementData(root, "pbGunSet") == 33 or getElementData(root, "pbGunSet") == 34 or getElementData(root, "pbGunSet") == 32 or getElementData(root, "pbGunSet") == 29 then
					takePlayerMoney(root,1500)
					setElementData(root, "inpaintball", true, false)
					paintball = tonumber(getElementData(root, "pbMap"))
					pbgetgun = tonumber(getElementData(root, "pbGunSet"))
					pbEnter = true
					paintballspawn(root)
					exports["notf"]:addNotification(root, "Match Paintball Sakhte Shod Va Pas Az 30 Saniye Shoro Khahad Shod." , 'success')
					setPedArmor(root, 0)
					triggerClientEvent ( root, "PlayMovafagh", root )
					setElementData(root, "pbMap", nil)
					setElementData(root, "pbGunSet", nil)
					setElementData(root, "paintballkills", 0, false)
					setElementData(root,"paintscore",0)
					setElementFrozen(root, true)
					toggleAllControls ( root, false, true, false)
					triggerClientEvent("pbForceClose", root, root)
					setTimer(
					function ()
						for _,p in ipairs (getElementsByType("player")) do
							if getElementData(p , "loggedIn") == true then
								if getElementData(p, "inpaintball") == true then
									if(joined == true) then
										exports["notf"]:addNotification(p, "Paintball Shoro Shod!" , 'success')
										triggerClientEvent ( p, "PlayMovafagh", p )
										setElementFrozen(p, false)
										toggleAllControls ( p, true )
									else
										exports["notf"]:addNotification(p, "Kasi join Nadad Va Paintball Be Etmam Resid!" , 'error')
										triggerClientEvent("PlayError", p, p)
										setElementPosition (p, 2692.322265625 ,-1707.6337890625 ,11.847807884216)
										setElementInterior ( p, 0 )
										setElementRotation ( p, 0,0,270)
										setElementDimension ( p, 0 )
										setElementFrozen(p, false)
										toggleAllControls ( p, true )
										takeAllWeapons (p)
										setElementData(p, "inpaintball", nil, false)
										setElementData(p, "paintballkills", nil, false)
										setElementData(p, "paintscore", 0)
										setElementData(p, "pbTime", 0)
										paintball = nil
										pbgetgun = nil
										pbEnter = nil
									end
								end
							end
						end
						pbEnter = nil
						setTimer(
							function ()
								
		
								winnersname = nil
								winnerscore = 0
								--pbmoney = 0
									for _,p in ipairs (getElementsByType("player")) do
										if getElementData(p , "loggedIn") == true then
											if getElementData(p, "inpaintball") == true then
												if(joined == true) then
													if tonumber(getElementData(p,"paintscore")) > winnerscore then
														winnerscore = getElementData(p,"paintscore")
														winnerKill = getElementData(p,"paintballkills")
														winnersname = getPlayerName(p)
														--pbmoney = tonumber(pbmoney) + 1000
													end
												end
											end
										end
									end
								for _,p in ipairs (getElementsByType("player")) do
									if getElementData(p , "loggedIn") == true then
										if getElementData(p, "inpaintball") == true then
											if(joined == true) then

												setElementPosition (p, 2692.322265625 ,-1707.6337890625 ,11.847807884216)
												setElementInterior ( p, 0 )
												setElementDimension ( p, 0 )
												takeAllWeapons (p)
												setPedHeadless(p, false)
												if(avalinkill == true) then
													exports["notf"]:addNotification(p, "Winner In Match "..winnersname.." Ba "..winnerscore.." Emtiaz Va "..winnerKill.." Kill Ast!" , 'info')
													if getPlayerName(p) == winnersname then
														triggerClientEvent ( p, "PlayPwinner", p )
													else
														triggerClientEvent ( p, "Playinfo", p )
													end
												else
													exports["notf"]:addNotification(p, "Paintball Be Etmam Resid Va Kasi Winer Nashod!" , 'info')
													triggerClientEvent ( p, "Playinfo", p )
													setElementFrozen(p, false)
												end
													if getElementHealth (p) == 0 then
														spawnPlayer(p, 2692.322265625 ,-1707.6337890625 ,11.847807884216)
														setElementInterior ( p, 0 )
														setElementDimension ( p, 0 )
														if tonumber(getElementData(accSys:getPlayerAcc(p), "pMember")) >= 1 then
															local fskinesh = tonumber(getElementData(accSys:getPlayerAcc(p), "fSkin"))
															setElementModel( p, fskinesh )
														else
															local Cskinesh = tonumber(getElementData(accSys:getPlayerAcc(p), "cSkin"))
															setElementModel( p, Cskinesh )
														end
													end
													setElementData(p, "inpaintball", nil, false)
													setElementData(p, "paintballkills", nil, false)
													setElementData(p, "paintballkills", 0)
													setElementData(p, "paintscore", 0)
													setElementData(p, "pbTime", 0)
													
											else
												exports["notf"]:addNotification(root, "koni!" , 'error')
												--if getPlayerName(p) == winnersname then
													--givePlayerMoney( p, tonumber(pbmoney) )
												--end
											end
										end
									end
								end
								paintball = nil
								pbgetgun = nil
								pbEnter = nil
								joined = false
								avalinkill = nil
						end, timesh, 1)
					end, 30000, 1)
				else
					exports["notf"]:addNotification(root, "Lotfan Yek Aslahe Entekhab Konid!" , 'error')
					triggerClientEvent("PlayError", root, root)
				end
			else
				exports["notf"]:addNotification(root, "Baraye Sakhte Match Niaz Be $1500 Darid!" , 'error')
				triggerClientEvent("PlayError", root, root)
			end
		else
			exports["notf"]:addNotification(root, "Lotfan Map Ra Moshakhas Konid!" , 'error')
			triggerClientEvent("PlayError", root, root)
		end	
	else
		exports["notf"]:addNotification(root, "Darhal Hazer Yek Match Vojood Darad!" , 'error')
		triggerClientEvent("PlayError", root, root)
	end
end
addEvent("onClientClickedCreate",true)
addEventHandler("onClientClickedCreate", root,createButtonClicked)
--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BbandPanelP", source)
end)