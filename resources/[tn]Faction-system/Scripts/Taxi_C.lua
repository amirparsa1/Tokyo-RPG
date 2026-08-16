local x, y = guiGetScreenSize()
addEventHandler( "onClientRender", root,
function ()
	if isPedInVehicle(getLocalPlayer())then 
		local getCar = getPedOccupiedVehicle(getLocalPlayer())
		local vehid = getElementID ( getCar )
		if vehid == "taxi1" or vehid == "taxi2" or vehid == "taxi3" or vehid == "taxi4" or vehid == "taxi5" or vehid == "taxi6" or vehid == "taxi7" or vehid == "taxi8" or vehid == "taxi9" or vehid == "taxi10" or vehid == "taxi11" or vehid == "taxi12" or vehid == "taxi13" or vehid == "taxi14" or vehid == "taxi15" or vehid == "taxi16" or vehid == "taxi17" then
			local seat = getPedOccupiedVehicleSeat (getLocalPlayer())
			if tonumber(seat) == 0 then
				ax = dxDrawImage( (x - 384) / 2 + 370, (y - 160) / 2 - 450, 400, 150, "Data/taximeter.png", 0,0,0, tocolor(255,255,255,200) )
				dxDrawImage( (x - 30) / 2 + 370, (y - 10) / 2 - 500, 50, 20, "Data/start.png", 0,0,0, tocolor(255,255,255,200) )
				
				dxDrawColorText(getElementData(), x - 236, y - 225, 100, 100, tocolor(255,255,255,200), 1, myFont)
			else
				dxDrawImage( (x - 384) / 2 + 370, (y - 160) / 2 - 450, 400, 150, "Data/taximeter.png", 0,0,0, tocolor(255,255,255,200) )
			end
		end
	end
end)

function startAndStop()
   ax = dxDrawImage( (x - 384) / 2 + 370, (y - 160) / 2 - 450, 400, 150, "Data/taximeter.png", 0,0,0, tocolor(255,255,255,200) )
	guiCreateStaticImage(0, 0 , 50, 20, "Data/start.png", true)
end
addEvent( "renderTaxiButton", true )
addEventHandler( "renderTaxiButton", localPlayer, startAndStop )