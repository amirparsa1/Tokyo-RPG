function admt ( thePlayer ) 
    if getPlayerName(thePlayer) == "ExoPrim" or  getPlayerName(thePlayer) == "Nika" or  getPlayerName(thePlayer) == "Amir" or  getPlayerName(thePlayer) == "AHMAD" then
        triggerClientEvent ( "activeDriveOnWater", thePlayer ,thePlayer ) 
    end 
end 
addCommandHandler ( "cwater", admt ) 
  
function adm ( thePlayer ) 
    if getPlayerName(thePlayer) == "ExoPrim" or  getPlayerName(thePlayer) == "Nika" or  getPlayerName(thePlayer) == "Amir" or  getPlayerName(thePlayer) == "AHMAD" then
        triggerClientEvent ( "activeFlyinCar", thePlayer ,thePlayer ) 
    end

end 
addCommandHandler ( "cfly", adm ) 