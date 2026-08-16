local hideKey = "F7"
local hideALL = false
local sx, sy = guiGetScreenSize()
local px, py = (sx), (sy/900)
local screen = dxCreateScreenSource ( sx, sy ) 
bindKey ( hideKey, "down", function()
    if hideALL then
        showChat ( true ) 		
		hideALL = false
		
	else
	
	   showChat ( false ) 
	   hideALL = true
	end
end)
addEventHandler( "onClientRender", root, function()
	if hideALL then
		dxUpdateScreenSource( screen )                  
		dxDrawImage( 0,  0,  sx, sy, screen )      
		dxDrawImage(0, 0, sx, py*100, "Files/Cinematic.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(0, py*800, sx, py*100, "Files/Cinematic.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	end
end)