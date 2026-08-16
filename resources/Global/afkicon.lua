function handleMinimize()
	setElementData(getLocalPlayer(), "inAFK", true)
end
addEventHandler( "onClientMinimize", getRootElement(), handleMinimize )

function handleRestore( )	
	setElementData(getLocalPlayer(), "inAFK", nil)
end
addEventHandler("onClientRestore",getRootElement(),handleRestore)