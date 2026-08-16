local pizzamarker1 = createMarker(374.6494140625 ,-119.4736328125 ,1000.3295117188 , "cylinder", 1.3,255,255,255,55)
setElementInterior ( pizzamarker1, 5 )
local pizzamarker11 = createMarker(825.0810546875 ,2858.89453125 ,133.5 , "cylinder", 1.3,255,255,255,55)
setElementDimension ( pizzamarker11, 2 )


function pizzarobindkon( hitElement, matchingDimension )
exports["notf"]:addNotification(hitElement, "Baraye Kharid Pizza Be Mablaghe $10 ( Z ) Ra Feshar Dahid." , 'info')
triggerClientEvent ( hitElement, "Playinfo", hitElement)
bindKey( hitElement, "Z", "down", pizzarobekhar )
end
addEventHandler( "onMarkerHit", pizzamarker1, pizzarobindkon )
addEventHandler( "onMarkerHit", pizzamarker11, pizzarobindkon )


local blip = createBlip(2105 ,-1806 ,13 , 60 )
setElementData(blip,'blipName',"Pizza Delivery")
pizzashopped = createPed( 167, 374.60546875 ,-117.2783203125 ,1001.4921875)
setElementRotation ( pizzashopped, 0 ,0 ,178.91235351563 )
setElementInterior ( pizzashopped, 5 )
setElementFrozen(pizzashopped, true)
function pizzshoppednpc()
	setTimer ( function()
		setPedAnimation(pizzashopped,"ped","XPRESSscratch",1,true,false)
		setElementHealth( pizzashopped, 100 )
	end, 1000, 0 )
end
pizzshoppednpc()

function pizzarobekhar( thePlayer )
	if getElementHealth (thePlayer) >= 1 then
		if getElementData(thePlayer, "eatpizza") ~= true then 
			setElementData(thePlayer, "eatpizza", true)
			if tonumber(getPlayerMoney(thePlayer)) > 9 then
			exports["notf"]:addNotification(thePlayer, "Shoma 1 Pizza Be Mablaghe $10 Serf Kardid! +20Hp" , 'success')
			triggerClientEvent ( thePlayer, "PlayEatpizza", thePlayer)
			unbindKey( thePlayer, "Z", "down", "NxNxPizzaNxNx" )
			takePlayerMoney ( thePlayer, 10 )
			setElementHealth ( thePlayer, getElementHealth(thePlayer) + 20 )
			--unbindKey( thePlayer, "Z", "down", pizzarobekhar )
			local pizza = createObject(2702, 0,0,0)
			setElementInterior ( pizza, getElementInterior(thePlayer) )
			setElementDimension(pizza, getElementDimension ( thePlayer ) )
			exports.bone_attach:attachElementToBone(pizza,thePlayer,12,0,0.1,0.1,0,270,0)
			setPedAnimation( thePlayer, "food", "eat_pizza", -1, false, false )
			
			setTimer( function() 
				-- FIX (bugfix pass 4): the element can be gone by the time this timer
				--   fires (player quit / object destroyed). Without this guard MTA
				--   raises "Bad argument" and the rest of the callback never runs.
				if not isElement(thePlayer) then return end
				setElementData(thePlayer, "eatpizza", false)
			end, 4000, 1)
			
			setTimer( function()
				-- FIX (bugfix pass 4): the element can be gone by the time this timer
				--   fires (player quit / object destroyed). Without this guard MTA
				--   raises "Bad argument" and the rest of the callback never runs.
				if not isElement(thePlayer) then return end
			setPedAnimation ( thePlayer )
			destroyElement (pizza)
			end, 3000, 1)
			else
			exports["notf"]:addNotification(thePlayer, "Pol Shoma Kafi Nemibashad." , 'error')
			triggerClientEvent ( thePlayer, "PlayError", thePlayer)
			unbindKey( thePlayer, "Z", "down", pizzarobekhar )
			end
		end
	end
end
--addCommandHandler( "NxNxPizzaNxNx", pizzarobekhar )

-- fixe Kill Shodan Hengame Khordan
addEventHandler( "onPlayerWasted", getRootElement( ),
function()
	unbindKey( source, "Z", "down", pizzarobekhar )
end
)


function pizzarounbindkon( leaveElement, matchingDimension )
unbindKey( leaveElement, "Z", "down", pizzarobekhar )
end
addEventHandler( "onMarkerLeave", pizzamarker1, pizzarounbindkon )
addEventHandler( "onMarkerLeave", pizzamarker11, pizzarounbindkon )
