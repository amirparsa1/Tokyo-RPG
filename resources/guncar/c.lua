openTrunk = true

openKey = "s"
leaveKey = "k"
pickKey = "j"

vehicleDistance = 4

addEventHandler("onClientResourceStart", resourceRoot,function()
bootWeaponWindow = guiCreateWindow(0.4, 0.4, 0.2, 0.2, "Trunk", true)
guiWindowSetSizable(bootWeaponWindow, false)
bootWeaponGrid = guiCreateGridList(0, 0.1, 1, 1, true, bootWeaponWindow)
guiGridListAddColumn(bootWeaponGrid, "Weapon", 0.6)
guiSetVisible (bootWeaponWindow, false )
guiGridListSetSortingEnabled ( bootWeaponGrid, false )
guiGridListAddColumn(bootWeaponGrid, "Ammo", 0.3)
closeButton = guiCreateButton(0.59, 0.4, 0.01, 0.018, "X", true) 
guiSetProperty ( closeButton, "AlwaysOnTop", "True" )
addEventHandler ( "onClientGUIClick", closeButton, hideGui, false ) 
--addEventHandler ( "onClientGUIClick", bootWeaponWindow, function () guiBringToFront ( closeButton ) end ) 
addEventHandler( "onClientGUIDoubleClick", bootWeaponGrid, pickWeaponUp, false )
guiWindowSetMovable ( bootWeaponWindow, false )
guiSetVisible(closeButton, false) 
end
)

function pickWeaponUp()
    selectedRow, selectedCol = guiGridListGetSelectedItem( bootWeaponGrid )
	triggerServerEvent ( "onPickWeaponFromBoot", root, globalVehicle, localPlayer, getElementData ( globalVehicle, "storedWeapons" )[selectedRow]) 
	--outputChatBox(getElementData ( globalVehicle, "storedWeapons" )[selectedRow])
	setTimer ( function() refreshGUI(globalVehicle) end, 50, 1 )
end

function hideGui() 
	guiSetVisible(closeButton, false) 
    guiSetVisible(bootWeaponWindow, false) 
    showCursor ( false ) 
end 


function openBoot()
if isPedInVehicle ( localPlayer ) == false then
vehicles = getElementsByType ( "vehicle", root, true ) 
x,y,z = getElementPosition(localPlayer)
for i, vehicle in pairs(vehicles) do
	if isElementInRange(vehicle,x,y,z,vehicleDistance) then
		--outputChatBox(getElementModel(vehicle))
		if getVehicleDoorOpenRatio ( vehicle , 1 ) > 0.5 then
			triggerServerEvent ( "onOpenCloseBoot", root, vehicle, false) 
		else
			triggerServerEvent ( "onOpenCloseBoot", root, vehicle, true) 
		end
	end
end
end
end
if openTrunk then
bindKey(openKey,"down",openBoot)
end

function leaveWeapon()
if isPedInVehicle ( localPlayer ) == false then
vehicles = getElementsByType ( "vehicle", root, true ) 
x,y,z = getElementPosition(localPlayer)
for i, vehicle in pairs(vehicles) do
	if isElementInRange(vehicle,x,y,z,vehicleDistance) then
		if getVehicleDoorOpenRatio ( vehicle , 1 ) == 1 then
			if getPedWeapon ( localPlayer ) ~= 0 then
				triggerServerEvent ( "onPutWeaponInBoot", root, vehicle, localPlayer)
			end
		end
	end
end
end
end
bindKey(leaveKey,"down",leaveWeapon)

function refreshGUI(vehicle)
guiGridListClear (bootWeaponGrid)
guiGridListAddRow(bootWeaponGrid)
for o, weapon in pairs (getElementData ( vehicle, "storedWeapons" )) do
--outputChatBox(o)
	guiGridListAddRow(bootWeaponGrid)
	guiGridListSetItemText(bootWeaponGrid, o, 1, getWeaponNameFromID(string.sub(getElementData ( vehicle, "storedWeapons" )[o],1,string.find(getElementData ( vehicle, "storedWeapons" )[o], ',')-1)), false, false)   
	guiGridListSetItemText(bootWeaponGrid, o, 2, string.sub(getElementData ( vehicle, "storedWeapons" )[o],string.find(getElementData ( vehicle, "storedWeapons" )[o], ',')+1), false, false)  
end
end

function pickWeaponFromBoot()
if isPedInVehicle ( localPlayer ) == false then
if guiGetVisible (bootWeaponWindow) == false then
vehicles = getElementsByType ( "vehicle", root, true ) 
x,y,z = getElementPosition(localPlayer)
for i, vehicle in pairs(vehicles) do
	if isElementInRange(vehicle,x,y,z,vehicleDistance) then
		if getVehicleDoorOpenRatio ( vehicle , 1 ) == 1 and getElementData ( vehicle, "storedWeapons" ) then
		globalVehicle = vehicle
			refreshGUI(vehicle)
			guiSetVisible (bootWeaponWindow, true )
			guiSetVisible(closeButton, true) 
			showCursor(true)
		end
	end
end
end
end
end
bindKey(pickKey,"down",pickWeaponFromBoot)

function isElementInRange(ele, x, y, z, range)
   if isElement(ele) and type(x) == "number" and type(y) == "number" and type(z) == "number" and type(range) == "number" then
      return getDistanceBetweenPoints3D(x, y, z, getElementPosition(ele)) <= range
   end
   return false
end