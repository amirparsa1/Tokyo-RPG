function syncTime() 
    local realTime = getRealTime() 
    local hour = realTime.hour 
    local minute = realTime.minute 
    setTime( hour , minute ) 
end 
  
removeEventHandler("onClientRender",rootElement,syncTime) -- FIX: avoid stacking duplicate render handlers
addEventHandler( "onClientRender" , rootElement , syncTime ) 