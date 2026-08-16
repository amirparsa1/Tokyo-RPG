-- =============================================================================
--  SECURITY FIX (bugfix pass 4) -- GUN SHOP
--
--  Every handler in this file used `source` as the buyer. In a server-side
--  handler for an allowRemoteTrigger event, `source` is whatever element the
--  client passed to triggerServerEvent, so it is attacker-controlled: a cheater
--  could charge ANOTHER player for a gun and receive nothing themselves, or
--  more usefully charge a victim repeatedly.
--
--  There was also no location check at all. The shop GUI only opens on the
--  marker at (296.03, -38.51, 1001.51) in interior 1, but the events could be
--  fired from anywhere on the map at any time -- so the marker was decoration,
--  not a gate.
--
--  verifyGunShopBuyer() below pins the buyer to the real caller (`client`,
--  which cannot be forged) and requires them to actually be at the counter.
-- =============================================================================

local SHOP_X, SHOP_Y, SHOP_Z = 296.03515625, -38.5146484375, 1001.515625
local SHOP_INTERIOR = 1
local SHOP_RADIUS = 8

local function verifyGunShopBuyer()
	if not client or not isElement(client) or getElementType(client) ~= "player" then
		return false
	end
	if source ~= client then
		outputDebugString(("GunShop: rejected spoofed source from %s"):format(getPlayerName(client)), 2)
		return false
	end
	if getElementInterior(client) ~= SHOP_INTERIOR then return false end
	local x, y, z = getElementPosition(client)
	if getDistanceBetweenPoints3D(x, y, z, SHOP_X, SHOP_Y, SHOP_Z) > SHOP_RADIUS then
		outputDebugString(("GunShop: %s tried to buy from outside the shop"):format(getPlayerName(client)), 2)
		return false
	end
	return true
end

addEvent("Pistol", true)
addEventHandler("Pistol",root,
function()
	if not verifyGunShopBuyer() then return end -- FIX: pin buyer to real caller + require presence at the shop
	local source = client
local PlayerMoney = getPlayerMoney(source)
 if ( PlayerMoney >= 8000) then
    takePlayerMoney(source,8000)
    giveWeapon ( source ,  22,68, true  )
    outputChatBox ( "#00FF00Teymur: #ffffffShoma #00ff00Pistol #ffffffBe Mablaghe #00ff00$8000 #ffffffKharidid!", source, 255, 0, 0, true )
else
    outputChatBox ( "#ff0000Teymur: #ffffffShoma Be #ff0000$800 #ffffffPool Baraye Kharid In Aslahe Niaz Darid!", source, 255, 0, 0, true )
end
end)
addEvent("Deagle", true)
addEventHandler("Deagle",root,
function()
	if not verifyGunShopBuyer() then return end -- FIX: pin buyer to real caller + require presence at the shop
	local source = client
local PlayerMoney = getPlayerMoney(source)
 if ( PlayerMoney >= 10000) then
    takePlayerMoney(source,10000)
    giveWeapon ( source ,  24,63, true )
    outputChatBox ( "#00ff00Teymur: #ffffffShoma #00ff00Deagle #ffffffBe Mablaghe #00ff00$10000 #ffffffKharidid!", source, 255, 0, 0, true )
else
    outputChatBox ( "#ff0000Teymur: #ffffffShoma Be #ff0000$10,000 #ffffffPool Baraye Kharid In Aslahe Niaz Darid!", source, 255, 0, 0, true )
end
end)
addEvent("Sawn-Off", true)
addEventHandler("Sawn-Off",root,
function()
	if not verifyGunShopBuyer() then return end -- FIX: pin buyer to real caller + require presence at the shop
	local source = client
local PlayerMoney = getPlayerMoney(source)
 if ( PlayerMoney >= 13000) then
    takePlayerMoney(source,13000)
    giveWeapon ( source ,  26,30 , true )
    outputChatBox ( "#00ff00Teymur: #ffffffShoma #00ff00Sawed-Off #ffffffBe Mablaghe #00ff00$13000 #ffffffKharidid!", source, 255, 0, 0, true )
else
    outputChatBox ( "#ff0000Teymur: #ffffffShoma Be #ff0000$13,000 #ffffffPool Baraye Kharid In Aslahe Niaz Darid!", source, 255, 0, 0, true )
end
end)
addEvent("Shotgun", true)
addEventHandler("Shotgun",root,
function()
	if not verifyGunShopBuyer() then return end -- FIX: pin buyer to real caller + require presence at the shop
	local source = client
local PlayerMoney = getPlayerMoney(source)
 if ( PlayerMoney >= 15000) then
    takePlayerMoney(source,15000)
    giveWeapon ( source ,  25,30, true  )
    outputChatBox ( "#00ff00Teymur: #ffffffShoma #00ff00Shotgun #ffffffBe Mablaghe #00ff00$15000 #ffffffKharidid!", source, 255, 0, 0, true )
else
    outputChatBox ( "#ff0000Teymur: #ffffffShoma Be #ff0000$15,000 #ffffffPool Baraye Kharid In Aslahe Niaz Darid!", source, 255, 0, 0, true )
end
end)
addEvent("Spaz", true)
addEventHandler("Spaz",root,
function()
	if not verifyGunShopBuyer() then return end -- FIX: pin buyer to real caller + require presence at the shop
	local source = client
local PlayerMoney = getPlayerMoney(source)
 if ( PlayerMoney >= 15000) then
    takePlayerMoney(source,15000)
    giveWeapon ( source ,  27,35 , true )
    outputChatBox ( "#00ff00Teymur: #ffffffShoma #00ff00Spaz-12 #ffffffBe Mablaghe #00ff00$15000 #ffffffKharidid!", source, 255, 0, 0, true )
else
    outputChatBox ( "#ff0000Teymur: #ffffffShoma Be #ff0000$15,000 #ffffffPool Baraye Kharid In Aslahe Niaz Darid!", source, 255, 0, 0, true )
end
end)
addEvent("Mp5", true)
addEventHandler("Mp5",root,
function()
	if not verifyGunShopBuyer() then return end -- FIX: pin buyer to real caller + require presence at the shop
	local source = client
local PlayerMoney = getPlayerMoney(source)
 if ( PlayerMoney >= 13000) then
    takePlayerMoney(source,13000)
    giveWeapon ( source ,  29,90, true  )
    outputChatBox ( "#00ff00Teymur: #ffffffShoma #00ff00MP5 #ffffffBe Mablaghe #00ff00$13000 #ffffffKharidid!", source, 255, 0, 0, true )
else
    outputChatBox ( "#ff0000Teymur: #ffffffShoma Be #ff0000$13,000 #ffffffPool Baraye Kharid In Aslahe Niaz Darid!", source, 255, 0, 0, true )
end
end)
addEvent("Tec", true)
addEventHandler("Tec",root,
function()
	if not verifyGunShopBuyer() then return end -- FIX: pin buyer to real caller + require presence at the shop
	local source = client
local PlayerMoney = getPlayerMoney(source)
 if ( PlayerMoney >= 12000) then
    takePlayerMoney(source,12000)
    giveWeapon ( source ,  32,150 , true )
    outputChatBox ( "#00ff00Teymur: #ffffffShoma #00ff00Tec-9 #ffffffBe Mablaghe #00ff00$12,000 #ffffffKharidid!", source, 255, 0, 0, true )
else
    outputChatBox ( "#ff0000Teymur: #ffffffShoma Be #ff0000$12,000 #ffffffPool Baraye Kharid In Aslahe Niaz Darid!", source, 255, 0, 0, true )
end
end)
addEvent("Uzi", true)
addEventHandler("Uzi",root,
function()
	if not verifyGunShopBuyer() then return end -- FIX: pin buyer to real caller + require presence at the shop
	local source = client
local PlayerMoney = getPlayerMoney(source)
 if ( PlayerMoney >= 12000) then
    takePlayerMoney(source,12000)
    giveWeapon ( source ,  28,100 , true )
    outputChatBox ( "#00ff00Teymur: #ffffffShoma #00ff00Uzi #ffffffBe Mablaghe #00ff00$12000 #ffffffKharidid!", source, 255, 0, 0, true )
else
    outputChatBox ( "#ff0000Teymur: #ffffffShoma Be #ff0000$12,000 #ffffffPool Baraye Kharid In Aslahe Niaz Darid!", source, 255, 0, 0, true )
end
end)
addEvent("M4", true)
addEventHandler("M4",root,
function()
	if not verifyGunShopBuyer() then return end -- FIX: pin buyer to real caller + require presence at the shop
	local source = client
local PlayerMoney = getPlayerMoney(source)
 if ( PlayerMoney >= 25000) then
    takePlayerMoney(source,25000)
    giveWeapon ( source ,  31,100 , true )
    outputChatBox ( "#00ff00Teymur: #ffffffShoma #00ff00M4 #ffffffBe Mablaghe #00ff00$25000 #ffffffKharidid!", source, 255, 0, 0, true )
else
    outputChatBox ( "#ff0000Teymur: #ffffffShoma Be #ff0000$25,000 #ffffffPool Baraye Kharid In Aslahe Niaz Darid!", source, 255, 0, 0, true )
end
end)
addEvent("AK", true)
addEventHandler("AK",root,
function()
	if not verifyGunShopBuyer() then return end -- FIX: pin buyer to real caller + require presence at the shop
	local source = client
local PlayerMoney = getPlayerMoney(source)
 if ( PlayerMoney >= 25000) then
    takePlayerMoney(source,25000)
    giveWeapon ( source ,  30,60 , true )
    outputChatBox ( "#00ff00Teymur: #ffffffShoma #00ff00AK-47 #ffffffBe Mablaghe #00ff00$25000 #ffffffKharidid!", source, 255, 0, 0, true )
else
    outputChatBox ( "#ff0000Teymur: #ffffffShoma Be #ff0000$25,000 #ffffffPool Baraye Kharid In Aslahe Niaz Darid!", source, 255, 0, 0, true )
end
end)

addEvent("Rifle", true)
addEventHandler("Rifle",root,
function()
	if not verifyGunShopBuyer() then return end -- FIX: pin buyer to real caller + require presence at the shop
	local source = client
local PlayerMoney = getPlayerMoney(source)
 if ( PlayerMoney >= 15000) then
    takePlayerMoney(source,15000)
    giveWeapon ( source ,  33,25, true  )
    outputChatBox ( "#00ff00Teymur: #ffffffShoma #00ff00Rifle #ffffffBe Mablaghe #00ff00$15000 #ffffffKharidid!", source, 255, 0, 0, true )
else
    outputChatBox ( "#ff0000Teymur: #ffffffShoma Be #ff0000$150,000 #ffffffPool Baraye Kharid In Aslahe Niaz Darid!", source, 255, 0, 0, true )
end
end)
