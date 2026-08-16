weaponsTable = {}
function synchronizeWeaponTable()
vehicles = getElementsByType ( "vehicle", root, true ) 
for i, vehicle in pairs(vehicles) do
	if getElementData(vehicle,"storedWeapons") then
		weaponsTable[vehicle] = getElementData(vehicle,"storedWeapons")	
	end
end
end
addEventHandler( "onResourceStart", root, synchronizeWeaponTable )

function putWeaponInBoot (vehicle,player)
if getElementData(vehicle,"storedWeapons") then
weaponsTable[vehicle] = getElementData(vehicle,"storedWeapons")
else
weaponsTable[vehicle] = {}
end
table.insert(weaponsTable[vehicle],getPedWeapon ( player )..","..getPedTotalAmmo ( player ))
setElementData(vehicle,"storedWeapons",weaponsTable[vehicle])
setPedAnimation(player, "CARRY", "putdwn05",-1,false,false,false,false)
takeWeapon ( player, getPedWeapon ( player ) )
end
addEvent( "onPutWeaponInBoot", true )
addEventHandler( "onPutWeaponInBoot", root, putWeaponInBoot )

function pickWeaponFromBoot (vehicle,player,pickedWeaponData)
tempTable = getElementData(vehicle,"storedWeapons")
tempTable2 = {}
if tempTable then
for i, weaponData in pairs(tempTable) do
	if weaponData == pickedWeaponData then
		setPedAnimation(player, "CARRY", "liftup05",-1,false,false,false,false)
		giveWeapon ( player, string.sub(tempTable[i],1,string.find(tempTable[i], ',')-1),string.sub(tempTable[i],string.find(tempTable[i], ',')+1), true)
			x = 1
			tempTable[i] = nil
			for o, tempWeaponData in pairs(tempTable) do	
				tempTable2[x] = tempWeaponData
				--outputChatBox(x.." "..tempWeaponData)		
				x=x+1			
			end
		setElementData(vehicle,"storedWeapons",tempTable2)
		break
	end
end
end
end
addEvent( "onPickWeaponFromBoot", true )
addEventHandler( "onPickWeaponFromBoot", root, pickWeaponFromBoot )

function openCloseBoot(vehicle,openClose)
if openClose then
setVehicleDoorOpenRatio ( vehicle, 1,  1, 500)
else
setVehicleDoorOpenRatio ( vehicle, 1,  0, 500)
end
end
addEvent( "onOpenCloseBoot", true )
addEventHandler( "onOpenCloseBoot", root, openCloseBoot )