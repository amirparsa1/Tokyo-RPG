ZoneCols = createColCuboid (1068.6279296875 ,-1390.654296875, 12 ,220, 120, 250 )
safeZoneRadar = createRadarArea ( 1068.6279296875 ,-1390.654296875 ,220, 120, 0, 255,141,170 )
local accSys = exports["Accounts-System"]
function joinzone(thePlayer)
	if getElementType ( thePlayer ) == "player" then
		setElementData(thePlayer,"godmode",true)
		exports["notf"]:addNotification(thePlayer, "*Shoma Be Safe Zone Vared Shodid*" , 'warning')
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3  then
		else
			toggleControl (thePlayer, "aim_weapon", false)
			toggleControl (thePlayer, "vehicle_fire", false)
			toggleControl (thePlayer, "next_weapon", false)
			toggleControl (thePlayer, "previous_weapon", false)
			toggleControl (thePlayer, "fire", false )
			toggleControl (thePlayer, "vehicle_look_right", false )
			
		end
		
	end
end
addEventHandler( "onColShapeHit", ZoneCols, joinzone )

function leftzone(thePlayer)
	if getElementType ( thePlayer ) == "player"  then
		setElementData(thePlayer,"godmode",nil)
		exports["notf"]:addNotification(thePlayer, "*Shoma Az Safe Zone Kharej Shodid*" , 'warning')
		toggleControl (thePlayer, "next_weapon", true)
		toggleControl (thePlayer, "previous_weapon", true)
		toggleControl (thePlayer, "vehicle_fire", true)
		toggleControl (thePlayer, "vehicle_look_right", true)
		toggleControl (thePlayer, "fire", true )
		toggleControl (thePlayer, "aim_weapon", true)
	end
end
addEventHandler( "onColShapeLeave", ZoneCols, leftzone )