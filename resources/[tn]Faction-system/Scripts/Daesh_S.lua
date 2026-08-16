local accSys = exports["[Phoenix]Account"] -- Code By ExMohmD
local miscSys = exports["Misc"] -- Telegram: @ExMohmD
function playBackup() 
	for i, players in pairs(getElementsByType("player")) do 
	  if getElementData(players,"loggedIn") and getElementData(players,"loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(players), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(players), "pMember")) == 3 then 
			triggerClientEvent(players, "playBackup", players, 1)
		end 
	end 
	end
end 
function playEnfejar()
	for i, players in pairs(getElementsByType("player")) do 
		if getElementData(players,"loggedIn") and getElementData(players,"loggedIn") == true then
			triggerClientEvent(players, "playBackup", players, 2)
		end 
	end 
end 

local BombTime = createObject(980, -100,-100,-100)
setElementData(BombTime,"Active", true) -- change Stats!
setElementData(BombTime,"Locker", true) -- change Stats!


function dDaeshuty(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 18 then
	if getElementData(BombTime,"Locker") == false then outputChatBox("#ff0000Error: Dar Zaman War Shoma Nemitavanid Duty Konid!!", thePlayer, 255, 255, 255, true) return false end
		local x,y,z = getElementPosition(thePlayer)
		if getDistanceBetweenPoints3D(x,y,z,151.1572265625 ,1368.76171875 ,1083.859375) < 5  then
			if not getElementData(thePlayer, "onDuty") then
				setElementData(thePlayer, "onDuty", true)
				setPedArmor(thePlayer, 100)
				setElementHealth(thePlayer, 100)
				giveWeapon(thePlayer, 30,500)
				outputChatBox("#ffff00Info: #ffffffShoma #00ff00On Duty #ffffffShodid!", thePlayer, 255, 255, 255, true)
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then -- Leader
							setElementModel(thePlayer, 189)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) < 6 then -- Sub-Leader
							setElementModel(thePlayer, 112)
					end
			else
				setElementData(thePlayer, "onDuty", nil)
				setPedArmor(thePlayer, 0)
				takeAllWeapons ( thePlayer )
				outputChatBox("#ffff00Info: #ffffffShoma #ff0000Off Duty #ffffffShodid!", thePlayer, 255, 255, 255, true)
				setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")))
			end
		else
			outputChatBox("#ff0000Error: Baraye Inkar Bayad Dar Mahale Duty Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		--outputChatBox("#ff0000Error: Baraye Inkar Bayad Ozve Department Bashid!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("duty", dDaeshuty)

Daesh22 = createPickup ( 151.1572265625 ,1368.76171875 ,1083.859375, 3, 1242, 0)
setElementInterior ( Daesh22, 5 )
setElementDimension ( Daesh22, 345 )
function getPDOnline() -- EdarePolice Players
	local EdarePolice = 0
	for index,Playerash in ipairs(getElementsByType("player")) do
		if getElementData(Playerash,"loggedIn") and getElementData(Playerash,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(Playerash),"pMember") == 1 then
				EdarePolice = tonumber( EdarePolice ) + 1
			end
		end
	end
	return EdarePolice
end
function FireEffect(element) -- Fire Effect For Bomb
	setTimer(function()
		local x, y, z = getElementPosition(element)
		setTimer(function()
			createExplosion(x, y, z, 4)
		end, 4000, 1)
	end, 1*10*1000, 1)
end 

function createBomb(thePlayer)
local x,y,z = getElementPosition(thePlayer)

	if getElementData(accSys:getPlayerAcc(thePlayer),"pMember") == 18 then
	if tonumber(getDistanceBetweenPoints3D(x,y,z,1808.3818359375 ,-2054.703125 ,13.55769062042)) < 3 then
		if getPlayerMoney(thePlayer) < 100000 then outputChatBox("#ff0000✖️ #ffffffShoma Niaz Be 100,000K Baraye Create Bomb Darid!!", thePlayer, 255, 255, 255, true) return end
		if not getElementData(thePlayer, "onDuty") then outputChatBox("#ff0000✖️ #ffffffShoma Duty Nistid!!!", thePlayer, 255, 255, 255, true) return false end
		if tonumber(getPDOnline()) > 5 then
		for i, players in pairs(getElementsByType("player")) do 
			if getElementData(players,"loggedIn") and getElementData(players,"loggedIn") == true then
				if tonumber(getElementData(accSys:getPlayerAcc(players), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(players), "pMember")) == 3 then 
					triggerClientEvent(players, "playBackup", players, 1)
					outputChatBox("#00ff00(Warning)#ffffff Yek Daeshi Dar HQ Khod Dar Hal Create Bomb Hast! Name: "..getPlayerName(thePlayer).."", players, 255, 255, 255, true)

				end 
			end 
		end
			setElementData(thePlayer, "makeBomb", true)
			setElementFrozen(thePlayer, true)
			outputChatBox("#00ff00(Bomb-Creator)#ffffff Dar Hal Sakht Bomb! Momken Ast Kami Tool Bekeshad! [ 5Min ]", thePlayer, 255, 255, 255, true)
			takePlayerMoney(thePlayer, 100000)
			setElementData(thePlayer, "Bomb", true)
			setPedAnimation(thePlayer, "rob_bank", "cat_safe_rob", -1, false, false) -- Animation
			

			setTimer(function()
				if getElementData(thePlayer,"Bomb") == false then return false end
					setPedAnimation(thePlayer)
					setElementFrozen(thePlayer, false)
					outputChatBox("#00ff00(Bomb-Creator)#ffffff Bomb Ro Bebar Dar Edare Police Raha Kon va Jayeze Begir! Faqad 3 Min Vaght Darid! ", thePlayer, 255, 255, 255, true)
					local ObjectName = math.random(1,99999)
					local ObjectName = createMarker(1552.388671875 ,-1642.4658203125 ,15.04999923706,"corona",2.5,255,0,0,0)
					addEventHandler("onMarkerHit",ObjectName ,
							function (player)
								if getElementData(accSys:getPlayerAcc(player),"pMember") == 18 then
								if getElementData(player,"Bomb") == false then return false end
								FireEffect(player)
								givePlayerMoney(player, 150000)
								outputChatBox("#00ff00+150,000K", player, 255, 255, 255, true)
								destroyElement(ObjectName)
								setElementHealth(player, 0)
								end
							end
						)
						setTimer(function()
							if getElementData(player,"Bomb") == true then return false end
							destroyElement(ObjectName)
						end, 300000,1)
			end, 9000,1)
			
			
		else
						exports["notf"]:addNotification(thePlayer, "Edare Police Niroye Kafi Nadarad!!! +5 Niro!", 'error')

		end
	else
		outputChatBox("#ff0000Error: Bayad Joloye Coumputer Hayat HQ Daesh Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000Error: Shoma Daeshi Nistid!!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("makebomb",createBomb)


local destTimer = createObject(1577,-100,-100,-500) -- Bomb Object
setElementData(destTimer, "Bomb", false)


function activeBomb(thePlayer)
local x,y,z = getElementPosition(thePlayer)
	if getElementData(BombTime,"Active") == false then exports["notf"]:addNotification(thePlayer, "Dar In Zaman Shoma Nemitavanid Bomb Bekarid", 'warning') return false end
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 18 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
			if tonumber(getPDOnline()) > 3 then
				if tonumber(getDistanceBetweenPoints3D(x,y,z,1130.12890625 ,-1452.490234375 ,15.796875)) < 30 or tonumber(getDistanceBetweenPoints3D(x,y,z,1683.0986328125 ,-2252.7880859375 ,13.386207580566)) < 30 or tonumber(getDistanceBetweenPoints3D(x,y,z,2034.650390625 ,-1414.25 ,16.9921875)) < 30 or tonumber(getDistanceBetweenPoints3D(x,y,z,382.716796875 ,-2058.09765625 ,7.835937)) < 30 then
					if(isPedInVehicle(thePlayer) == true) then outputChatBox("#ff0000✖️ #ffffffLotfan Az Mashin Kharej Shavid.", thePlayer, 255, 255, 255, true) return	end
						local BombObject = createObject(1577,x, y+0.3 ,z-1) -- Bomb Object
						setElementFrozen(thePlayer, true)
						setPedAnimation( thePlayer, "rob_bank", "cat_safe_rob", -1, false, false ) -- Animation
						setElementData(destTimer,"Bomb",true)
						setElementData(BombTime,"Active", false) -- change Stats!
						setElementData(BombTime,"Locker", false) -- change Stats!
						Police = createMarker(x ,y ,z,"corona",2,255,0,0,255)
						
						addEventHandler("onMarkerHit",Police ,
							function (player)
							if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == 3 then
								setElementData(destTimer,"Bomb",false)
								destroyElement(BombObject)
								destroyElement(Police)
								setElementData(BombTime,"Locker", true) -- change Stats!
								for i, daeshi in pairs(getElementsByType("player")) do  
									if getElementData(daeshi , "loggedIn") == true then
										outputChatBox("#00ff00(Tabrik!):#fff000 Yek Police Be Name [ #ff0000"..getPlayerName(player).." #fff000] Shahr Ra Az Dast Daeshi Ha Nejat Dad!", daeshi, 255, 255, 255, true)
									end
								end
							end
							end
						)

						setTimer(function()
							for i, daeshi in pairs(getElementsByType("player")) do  
								if getElementData(daeshi , "loggedIn") == true then
								if tonumber(getElementData(accSys:getPlayerAcc(daeshi), "pMember")) == 18 then
									setPedAnimation(thePlayer)
									setElementFrozen(thePlayer, false)
									exports["notf"]:addNotification(daeshi, "Leader Bomb Dar Mantaghe Bomb Kasht Hala Mitonid Leader Ro Cover Konid [ 8 Min ]!!", 'info')
								end
								if tonumber(getElementData(accSys:getPlayerAcc(daeshi), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(daeshi), "pMember")) == 3 then
									playBackup()
									outputChatBox("#ff0000(Warning!):#fff000 Yek Fard Be Name [ #ff0000"..getPlayerName(thePlayer).." #fff000] Be Yek Mantaghe Az LosSantos Bomb Connect Kard!", daeshi, 255, 255, 255, true)
									outputChatBox("#ff0000(Warning!):#fff000 8Min Forsat Darid Bomb Ra Khonsa Konid!", daeshi, 255, 255, 255, true)
									exports["notf"]:addNotification(daeshi, "Be Shoma Yek Backup Dar Chat Ersal Shod!!", 'warning')
								end
								
								end
							end
						end, 3000,1)
						
						setTimer(function()
							if getElementData(destTimer,"Bomb") == false then return false end
								playEnfejar()
								for i, daeshi in pairs(getElementsByType("player")) do  
									if getElementData(daeshi , "loggedIn") == true then
										if tonumber(getElementData(accSys:getPlayerAcc(daeshi), "pMember")) == 18 then
											if getElementData(daeshi,"onDuty") == true then 
												givePlayerMoney(daeshi,100000)
												FireEffect(BombObject)
												destroyElement(BombObject)
												destroyElement(Police)
												setElementData(destTimer, "Bomb", false)
											end
										end
										if tonumber(getElementData(accSys:getPlayerAcc(daeshi), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(daeshi), "pMember")) == 3 then
											exports["notf"]:addNotification(daeshi, "Bomb Terekid Va Daesh Bar Shahr Tajavoz Kard!!", 'warning')
										end
									end
								end
						end, 540000, 1)
						setTimer(function()
							setElementData(BombTime,"Active", true) -- change Stats!
							setElementData(BombTime,"Locker", true) -- change Stats!
						end, 3600000, 1)
				else
					exports["notf"]:addNotification(thePlayer, "Az Mahdode BombZone Fasele darid!!", 'error')
				end
			else
				exports["notf"]:addNotification(thePlayer, "Edare Police Niroye Kafi Nadarad!!! +3 Niro!", 'error')
			end
		end
end




function bindAction(thePlayer) -- Bind Function
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 18 then
		bindKey(thePlayer,"b","down",activeBomb)
		exports["notf"]:addNotification(thePlayer, "Shoma Vared Bomb Zone Shodid!!!", 'warning')
	end
end
function unbindAction(thePlayer) -- Unbind Function
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 18 then
		unbindKey(thePlayer,"b","down",activeBomb)
		exports["notf"]:addNotification(thePlayer, "Shoma Vared Bomb Zone Shodid!!!", 'warning')
	end
end


 
local BombZone = { -- Location
    {382.716796875 ,-2058.09765625 ,7.835937},
    {2034.650390625 ,-1414.25 ,16.9921875},
    {1683.0986328125 ,-2252.7880859375 ,13.386207580566},
    {1130.12890625 ,-1452.490234375 ,15.796875},
}
local createZone = {	} -- Sqlite
function createBombZone ()
    for i=1 , #BombZone do
        local x,y,z = BombZone[i][1],BombZone[i][2],BombZone[i][3]
        createZone[i] = createMarker(x,y,z , "cylinder", 30, 0, 0, 0,0)
        addEventHandler("onMarkerHit",createZone[i], bindAction)
		addEventHandler("onMarkerLeave",createZone[i], unbindAction)

    end
end	
createBombZone()


