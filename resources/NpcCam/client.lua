addEvent("moveNPC", true)
addEventHandler("moveNPC", getRootElement(),
	function(playerName, thePlayer, direction, move)
		if getElementByID(playerName.."'s bot") then
			drv = getElementByID(playerName.."'s bot")
			setPedControlState(drv, direction, move)
		end
	end
)
addEvent("onBotCamRequest", true)
addEventHandler("onBotCamRequest", getRootElement(),
	function(playerName, thePlayer)
		if getElementByID(playerName.."'s bot") then
			if thePlayer == getLocalPlayer() then
				local drv = getElementByID(playerName.."'s bot")
				setCameraTarget(drv)
				function updateCamera()
					if not drv then return true end
					local x, y, z = getElementPosition(drv)
					if getPedOccupiedVehicle(drv) then
						setCameraMatrix(x, y, z + 50, x, y, z)
					else
						setCameraMatrix(x, y, z + 25, x, y, z)
					end
				end
				addEventHandler("onClientPreRender", getRootElement(), updateCamera)
				addCommandHandler("resetcam",
					function()
						removeEventHandler("onClientPreRender", getRootElement(), updateCamera)
						setCameraTarget(getLocalPlayer())
					end
				)
			else return true end
		end
	end
)