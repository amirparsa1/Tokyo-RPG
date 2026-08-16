bindKey ( 'x','down', 
    function (      ) 
        showCursor ( not isCursorShowing (      )   ) 
    end 
) 

function damag(attacker, weapon, bodypart)
    if getElementData(source, "inSleep") == true then
        cancelEvent()
    end
 end 
 addEventHandler("onClientPlayerDamage", getLocalPlayer(), damag)
 
