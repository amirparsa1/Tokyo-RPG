addEvent( "activeDriveOnWater", true ) 
addEventHandler("activeDriveOnWater", root, 
    function(root) 
        if root == getLocalPlayer(  ) then
            if isWorldSpecialPropertyEnabled( "hovercars" ) == false then 
                setWorldSpecialPropertyEnabled( "hovercars", true ) 
                outputChatBox("Water drive: on ", 255, 255, 0 ) 
            else 
                setWorldSpecialPropertyEnabled( "hovercars", false ) 
                outputChatBox("Water drive: off", 255, 0, 0 ) 
            end 
        end
    end 
) 
  
addEvent( "activeFlyinCar", true ) 
addEventHandler("activeFlyinCar", root, 
function(root) 
    if root == getLocalPlayer(  ) then
        if isWorldSpecialPropertyEnabled( "aircars" ) == false then 
            setWorldSpecialPropertyEnabled( "aircars", true ) 
            outputChatBox("Flying vehicle is on !", 255, 255, 0 ) 
        else 
            setWorldSpecialPropertyEnabled( "aircars", false ) 
            outputChatBox("Flying vehicle is off !", 255, 0, 0 ) 
        end 
    end
end) 