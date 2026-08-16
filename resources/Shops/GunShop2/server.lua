local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]


addEvent("satchel", true)
addEventHandler("satchel",root,
function()
	local KoleMat = getElementData(accSys:getPlayerAcc(source), "pMats")
	if tonumber(KoleMat) >= 1500 then
		local kamkon = tonumber(KoleMat) - 1500
		setElementData(accSys:getPlayerAcc(source), "pMats", tonumber(kamkon))
		giveWeapon ( source ,  39,1 , true )
		outputChatBox ("#728111Shahin Over: #E9E0CB1500 Geram Material Ro Ba 1 #728111Satchel #E9E0CBTagh Zadi!", source, 255, 0, 0, true )
	else
    outputChatBox ( "#ff0000Shahin Over:#E9E0CB Jenset Kame "..getPlayerName(source)..", Be 1500 Geram Material Baraye In Moamele Niaz Dari!", source, 255, 0, 0, true )
	end
end)





addEvent("molotov", true)
addEventHandler("molotov",root,
function()
	local KoleMat = getElementData(accSys:getPlayerAcc(source), "pMats")
	if tonumber(KoleMat) >= 1200 then
		local kamkon = tonumber(KoleMat) - 1200
		setElementData(accSys:getPlayerAcc(source), "pMats", tonumber(kamkon))
		giveWeapon ( source ,  18,1, true  )
		outputChatBox ("#728111Shahin Over: #E9E0CB1200 Geram Material Ro Ba 1 #728111Molotov #E9E0CBTagh Zadi!", source, 255, 0, 0, true )
	else
    outputChatBox ( "#ff0000Shahin Over:#E9E0CB Jenset Kame "..getPlayerName(source)..", Be 1200 Geram Material Baraye In Moamele Niaz Dari!", source, 255, 0, 0, true )
	end
end)




addEvent("Grenade", true)
addEventHandler("Grenade",root,
function()
	local KoleMat = getElementData(accSys:getPlayerAcc(source), "pMats")
	if tonumber(KoleMat) >= 1200 then
		local kamkon = tonumber(KoleMat) - 1200
		setElementData(accSys:getPlayerAcc(source), "pMats", tonumber(kamkon))
		giveWeapon ( source ,  16,1 , true )
		outputChatBox ("#728111Shahin Over: #E9E0CB1200 Geram Material Ro Ba 1 #728111Bomb #E9E0CBTagh Zadi!", source, 255, 0, 0, true )
	else
    outputChatBox ( "#ff0000Shahin Over:#E9E0CB Jenset Kame "..getPlayerName(source)..", Be 1200 Geram Material Baraye In Moamele Niaz Dari!", source, 255, 0, 0, true )
	end
end)


addEvent("Rockedlauncher", true)
addEventHandler("Rockedlauncher",root,
function()
	local KoleMat = getElementData(accSys:getPlayerAcc(source), "pMats")
	if tonumber(KoleMat) >= 20000 then
		local kamkon = tonumber(KoleMat) - 20000
		setElementData(accSys:getPlayerAcc(source), "pMats", tonumber(kamkon))
		giveWeapon ( source ,  35,1 , true )
		outputChatBox ("#728111Shahin Over: #E9E0CB20000 Geram Material Ro Ba 1 #728111Rocked Launcher #E9E0CBTagh Zadi!", source, 255, 0, 0, true )
	else
    outputChatBox ( "#ff0000Shahin Over:#E9E0CB Jenset Kame "..getPlayerName(source)..", Be 20000 Geram Material Baraye In Moamele Niaz Dari!", source, 255, 0, 0, true )
	end
end)



addEvent("Parachute", true)
addEventHandler("Parachute",root,
function()
	local KoleMat = getElementData(accSys:getPlayerAcc(source), "pMats")
	if tonumber(KoleMat) >= 1000 then
		local kamkon = tonumber(KoleMat) - 1000
		setElementData(accSys:getPlayerAcc(source), "pMats", tonumber(kamkon))
		giveWeapon ( source ,  46,1 , true )
		outputChatBox ("#728111Shahin Over: #E9E0CB1000 Geram Material Ro Ba 1 #728111Parachute #E9E0CBTagh Zadi!", source, 255, 0, 0, true )
	else
    outputChatBox ( "#ff0000Shahin Over:#E9E0CB Jenset Kame "..getPlayerName(source)..", Be 1000 Geram Material Baraye In Moamele Niaz Dari!", source, 255, 0, 0, true )
	end
end)