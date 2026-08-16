WarText = ""
function WarTime(client)
	if client == getLocalPlayer() then
		playSound("Data/WarStart.mp3",false)
		WarText = "☠ Are You Ready For War?! ☠"
		setTimer( function()
			WarText = ""
		end, 10000, 1)
	end
end
addEvent("WarTime",true)
addEventHandler("WarTime", getRootElement(), WarTime)

addEventHandler("onClientRender",root,
	function ()
		local x,y = guiGetScreenSize()
		dxDrawText(WarText,0,0,x,y,tocolor(255, 0, 0,190),2,"pricedown","center","bottom",false,false,false)
	end
)

