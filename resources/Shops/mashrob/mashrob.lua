local mashrobmarker1 = createMarker(499.9404296875 ,-22.4912109375 ,999.7 , "cylinder", 1.0,0,246,255,100)
setElementInterior ( mashrobmarker1, 17 )
local mashrobmarker2 = createMarker(496.494140625 ,-75.7470703125 ,997.8578125 , "cylinder", 1.0,0,246,255,100)
setElementInterior ( mashrobmarker2, 11 )


function mashrobrobindkon( hitElement, matchingDimension )
exports["notf"]:addNotification(hitElement, "Baraye Kharid Noshidani Be Gheymate $250 Dokme ( B ) Ra Feshar Dahid!" , 'info')
bindKey( hitElement, "b", "down", mashrobrobekhar )
playSoundFrontEnd ( hitElement, 1 )
end
addEventHandler( "onMarkerHit", mashrobmarker1, mashrobrobindkon )
addEventHandler( "onMarkerHit", mashrobmarker2, mashrobrobindkon )


function mashrobrobekhar( thePlayer )
	if tonumber(getPlayerMoney(thePlayer)) > 249 then
	--unbindKey( thePlayer, "Z", "down", mashrobrobekhar )
	takePlayerMoney ( thePlayer, 250 )
	local bottle = createObject(1512, 0,0,0)
	setElementInterior ( bottle, getElementInterior(thePlayer) )
	setElementDimension(bottle, getElementDimension ( thePlayer ) )
	exports.bone_attach:attachElementToBone(bottle,thePlayer,11,-0.14,0.01,0.1,0,90,0)
	setPedAnimation( thePlayer, "vending", "vend_drink_p", -1, true, false )
	setTimer( function()
	setPedAnimation ( thePlayer )
	destroyElement (bottle)
	triggerClientEvent ( thePlayer, "shake", thePlayer )
	setPedWalkingStyle(thePlayer,126) 
	toggleControl ( thePlayer, "sprint", false )
	toggleControl ( thePlayer, "jump", false )
	setControlState ( thePlayer, "walk", true )
	end, 7000, 1)
	else
	exports["notf"]:addNotification(thePlayer, "Pol Shoma Kafi Nemibashad!" , 'error')
	triggerClientEvent ( thePlayer, "PlayError", thePlayer)
	unbindKey( thePlayer, "b", "down", mashrobrobekhar )
	end
end
--addCommandHandler( "NxNxPizzaNxNx", pizzarobekhar )

function mashrobrounbindkon( leaveElement, matchingDimension )
unbindKey( leaveElement, "b", "down", mashrobrobekhar )
end
addEventHandler( "onMarkerLeave", mashrobmarker1, mashrobrounbindkon )
addEventHandler( "onMarkerLeave", mashrobmarker2, mashrobrounbindkon )


function resetkon(root)
	setPedWalkingStyle(root,0) 
	setControlState ( root, "walk", false )
	toggleControl ( root, "sprint", true )
	toggleControl ( root, "jump", true )
end
addEvent("resetkon",true)
addEventHandler("resetkon", root, resetkon)

function getPointFromDistanceRotation(x, y, dist, angle)
    local a = math.rad(angle + 90)
    local dx = math.cos(a) * dist
    local dy = math.sin(a) * dist
    return x+dx, y+dy
end


-- fixe Kill Shodan Hengame Khordan
addEventHandler( "onPlayerWasted", getRootElement( ),
function()
	unbindKey( source, "b", "down", mashrobrobekhar )
end
)


createBlip ( 2310.130859375 ,-1643.5791015625 ,14.8203125, 49 )