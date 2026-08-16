
local burgermarker1 = createMarker(376.9658203125 ,-67.818359375 ,1000.3 , "cylinder", 1.3,255,255,255,55)
local burgermarker2 = createMarker(3085.99609375 ,-665.4150390625 ,15.5 , "cylinder", 1.2,255,255,255,55)

setElementInterior ( burgermarker1, 10 )

function burgerrobindkon( hitElement, matchingDimension )
exports["notf"]:addNotification(hitElement, "Baraye Kharid Burger Be Mablaghe $10 ( B ) Ra Feshar Dahid." , 'info')
triggerClientEvent ( hitElement, "Playinfo", hitElement)
bindKey( hitElement, "b", "down", burgerrobekhar )
end
addEventHandler( "onMarkerHit", burgermarker1, burgerrobindkon )
addEventHandler( "onMarkerHit", burgermarker2, burgerrobindkon )

createBlip ( 1199 ,-918 ,43 , 7 )

function burgerrobekhar( thePlayer )
	if getElementHealth (thePlayer) >= 1 then
		if getElementData(thePlayer, "eatburger2") ~= true then --#zezaw
			setElementData(thePlayer, "eatburger2", true)
			if tonumber(getPlayerMoney(thePlayer)) > 9 then
			exports["notf"]:addNotification(thePlayer, "Shoma 1 Burger Be Mablaghe $10 Serf Kardid! +20Hp" , 'success')
			triggerClientEvent ( thePlayer, "PlayEatBurger", thePlayer)
			takePlayerMoney ( thePlayer, 10 )
			setElementHealth ( thePlayer, getElementHealth(thePlayer) + 20 )
			--unbindKey( leaveElement, "Z", "down", burgerrobekhar )
			--unbindKey("Z","down",burgerrobekhar)
			local burger = createObject(2703, 0,0,0)
			setElementInterior ( burger, getElementInterior(thePlayer) )
			setElementDimension(burger, getElementDimension ( thePlayer ) )
			exports.bone_attach:attachElementToBone(burger,thePlayer,12,0,0.05,0.1,0,270,0)
			setPedAnimation( thePlayer, "food", "eat_burger", -1, false, false )
			
			setTimer( function() --#zezaw
				setElementData(thePlayer, "eatburger2", false)
			end, 4000, 1)
			
			setTimer( function()
			setPedAnimation ( thePlayer )
			destroyElement (burger)
			end, 3000, 1)
			else
			exports["notf"]:addNotification(thePlayer, "Pol Shoma Kafi Nemibashad." , 'error')
			triggerClientEvent ( thePlayer, "PlayError", thePlayer)
			unbindKey( thePlayer, "b", "down", burgerrobekhar )
			end
		end
	end
end
--addCommandHandler( "NxNxPizzaNxNx", pizzarobekhar )

-- fixe Kill Shodan Hengame Khordan
addEventHandler( "onPlayerWasted", getRootElement( ),
function()
	unbindKey( source, "b", "down", burgerrobekhar )
end
)

function burgerrounbindkon( leaveElement, matchingDimension )
unbindKey( leaveElement, "b", "down", burgerrobekhar )
end
addEventHandler( "onMarkerLeave", burgermarker1, burgerrounbindkon )
addEventHandler( "onMarkerLeave", burgermarker2, burgerrounbindkon )
