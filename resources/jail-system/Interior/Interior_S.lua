local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]





--> Markers <--
local FBiMarkerVorodH = createMarker(3077.4169921875 ,-746.380859375 ,16.589061737061, "cylinder", 0.7,0,0,0,0 )
local FBiMarkerKhorojH = createMarker(3078.255859375 ,-746.4931640625 ,16.610000610352, "cylinder", 0.7,0,0,0,0 )
setElementDimension ( FBiMarkerKhorojH, 0 )
setElementInterior ( FBiMarkerKhorojH, 0)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",FBiMarkerVorodH,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
	triggerClientEvent ( hitElement, "BiadPanelEnterJail", hitElement)
	end
end)
 
 
-- Bad Az Zadan ro Enter Mokhtasat Set She Dakhel --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
		triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
		setElementPosition (ThePlayer, 3079.0703125 ,-746.5185546875 ,16.610000610352)
		setElementInterior ( ThePlayer, 0 )
		setElementDimension ( ThePlayer, 0 )
		setElementRotation( ThePlayer, 0 ,0 ,268.91918945313, "default", true)
		fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BoroToJail",true)
addEventHandler("BoroToJail", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",FBiMarkerKhorojH,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
	triggerClientEvent ( hitElement, "BiadPanelExitJail", hitElement)
	end
end)


-- Bad Az Zadan ro Exit Mokhtasat Set She Biron --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
	setElementPosition (ThePlayer, 3076.5625 ,-746.3515625 ,16.589061737061)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,88.515441894531, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironJail",true)
addEventHandler("BiaBironJail", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 3077.4169921875 ,-746.380859375 ,16.589061737061, 3, 1318, 0)
	PickupKhoroj = createPickup ( 3078.255859375 ,-746.4931640625 ,16.610000610352, 3, 1318, 0)
	setElementInterior(PickupKhoroj, 0)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)