
NumToCount = 20 -- Tedad Sanie Hai ke Shemorde Mishe Bad Player Kick Mishe!(Alarm)
MSGtoShow = "Shoma AFK Hastid" -- Payami ke Be Playeri ke Mikhad Kick She Neshun Dade Mishe
CountSpeed = 1500 --

rRoot = getResourceRootElement(getThisResource())
setElementData(getLocalPlayer(),"AFKtime",0) 
setElementData(localPlayer,"State-AFK",false)

sw, sh = guiGetScreenSize()
x,y = sw/2,sh/2

addEvent("YouAreAFK",true)
addEventHandler("YouAreAFK",root,
function()
if getElementData(getLocalPlayer(), "inSleep") ~= true then
	function You()

	dxDrawText(  MSGtoShow, x-700,y-497,sw,sh,tocolor ( 0, 0, 0, 255 ), 4, "pricedown","center", "center", false, false, false)
	dxDrawText( MSGtoShow, x-700,y-500,sw,sh,tocolor ( 255, 255, 0, 255 ), 4, "pricedown","center", "center", false, false, false)

	end
end
removeEventHandler("onClientRender",root,You) -- FIX: avoid stacking duplicate render handlers
addEventHandler ( "onClientRender",root,You)
Count()
end )

function Count()
	if getElementData(getLocalPlayer(), "inSleep") ~= true then
		local n = NumToCount 
		local count = ""..n.."" 
		local x,y = sw/2,sh/2 

		function txt()
			dxDrawText(" Shoma  "..count.." Sanie Digar Kick Mishavid!", x-700,y-292,sw,sh,tocolor ( 0, 0, 0, 255 ), 1, "pricedown","center", "center", false, false, false) 
			dxDrawText(" Shoma  "..count.." Sanie Digar Kick Mishavid!", x-700,y-295,sw,sh,tocolor ( 255, 0, 0, 255 ), 1, "pricedown","center", "center", false, false, false)
			
			dxDrawText(" Move To Cancel", x-700,y-241,sw,sh,tocolor ( 0, 0, 0, 255 ), 1, "pricedown","center", "center", false, false, false)
			dxDrawText(" Move To Cancel", x-700,y-243,sw,sh,tocolor ( 255, 0, 0, 255 ), 1, "pricedown","center", "center", false, false, false)
		end
		
		removeEventHandler("onClientRender",root,txt) -- FIX: avoid stacking duplicate render handlers
		addEventHandler ( "onClientRender" , root ,txt)
		
	timer =	setTimer ( 
			function()
				n = n - 1 
				count = ""..n.."" 
				playSoundFrontEnd ( 20 )
			if n == 0 then -- on Count END
				if getElementData(getLocalPlayer(), "inSleep") ~= true then
					triggerServerEvent ("KillAFK", getLocalPlayer())
					playSoundFrontEnd ( 101 )
					removeEventHandler ( "onClientRender" , root ,txt)
					removeEventHandler ( "onClientRender",root,You)
				end
				end
			end
		, CountSpeed , NumToCount )
	end
		
end	

addEvent("YouAreNotAFK",true)
addEventHandler("YouAreNotAFK",root,
function()
removeEventHandler ( "onClientRender",root,You)
removeEventHandler ( "onClientRender" , root ,txt)
	if isTimer(timer) then
		killTimer(timer)
	end
end )	
