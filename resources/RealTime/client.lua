function syncTime() 
    local realTime = getRealTime() 
    local hour = realTime.hour 
    local minute = realTime.minute 
    setTime( hour , minute ) 
end 
  
addEventHandler( "onClientRender" , rootElement , syncTime ) 