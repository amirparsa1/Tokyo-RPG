bindKey ( 'x','down', 
    function (      ) 
        showCursor ( not isCursorShowing (      )   ) 
    end 
) 

function handleMinimize()
	setElementData(getLocalPlayer(), "inAFK", true)
	createTrayNotification( "Shoma Dar Arthurs MTA AFK Shodid!", "warning" )
end
addEventHandler( "onClientMinimize", getRootElement(), handleMinimize )

function handleRestore( )	
	setElementData(getLocalPlayer(), "inAFK", nil)
end
addEventHandler("onClientRestore",getRootElement(),handleRestore)