addCommandHandler("createrezakhan",
	function(thePlayer, command, state, veicolo)
		local command = gettok(veicolo, 1, string.byte(" "))
		if getElementByID(getPlayerName(thePlayer).."'s bot") then return true end
		x, y, z = getElementPosition(thePlayer)
		drv = createPed(146, x + 3, y, z)
		setElementID(drv, getPlayerName(thePlayer).."'s bot")
		bindKey(thePlayer, "num_8", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "forwards", true)
			end
		)
		bindKey(thePlayer, "num_8", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "forwards", false)
			end
		)
		bindKey(thePlayer, "num_8", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "accelerate", true)
			end
		)
		bindKey(thePlayer, "num_8", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "accelerate", false)
			end
		)
		bindKey(thePlayer, "num_2", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "backwards", true)
			end
		)
		bindKey(thePlayer, "num_2", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "backwards", false)
			end
		)
		bindKey(thePlayer, "num_2", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "brake_reverse", true)
			end
		)
		bindKey(thePlayer, "num_2", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "brake_reverse", false)
			end
		)
		bindKey(thePlayer, "num_6", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "right", true)
			end
		)
		bindKey(thePlayer, "num_6", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "right", false)
			end
		)
		bindKey(thePlayer, "num_6", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "vehicle_right", true)
			end
		)
		bindKey(thePlayer, "num_6", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "vehicle_right", false)
			end
		)
		bindKey(thePlayer, "num_4", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "left", true)
			end
		)
		bindKey(thePlayer, "num_4", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "left", false)
			end
		)
		bindKey(thePlayer, "num_4", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "vehicle_left", true)
			end
		)
		bindKey(thePlayer, "num_4", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "vehicle_left", false)
			end
		)
		bindKey(thePlayer, "num_add", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "jump", true)
			end
		)
		bindKey(thePlayer, "num_add", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "jump", false)
			end
		)
		bindKey(thePlayer, "num_5", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "enter_exit", true)
			end
		)
		bindKey(thePlayer, "num_5", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "enter_exit", false)
			end
		)
		bindKey(thePlayer, "num_7", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "enter_passenger", true)
			end
		)
		bindKey(thePlayer, "num_7", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "enter_passenger", false)
			end
		)
		bindKey(thePlayer, "o", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "vehicle_look_right", true)
			end
		)
		bindKey(thePlayer, "o", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "vehicle_look_right", false)
			end
		)
		bindKey(thePlayer, "u", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "vehicle_look_left", true)
			end
		)
		bindKey(thePlayer, "u", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "vehicle_look_left", false)
			end
		)
		bindKey(thePlayer, "i", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "steer_forward", true)
			end
		)
		bindKey(thePlayer, "i", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "steer_forward", false)
			end
		)
		bindKey(thePlayer, "k", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "steer_back", true)
			end
		)
		bindKey(thePlayer, "k", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "steer_back", false)
			end
		)
		bindKey(thePlayer, "num_9", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "special_control_up", true)
			end
		)
		bindKey(thePlayer, "num_9", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "special_control_up", false)
			end
		)
		bindKey(thePlayer, "num_3", "down",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "special_control_down", true)
			end
		)
		bindKey(thePlayer, "num_3", "up",
			function()
				triggerClientEvent("moveNPC", getRootElement(), getPlayerName(thePlayer), thePlayer, "special_control_down", false)
			end
		)
		if state == "onvehicle" then
			if veicolo then
				if getVehicleModelFromName(veicolo) then
					rz = getPedRotation(drv)
					x, y, z = getElementPosition(drv)
					v = createVehicle(getVehicleModelFromName(veicolo), x, y, z)
					setElementRotation(v, 0, 0, rz)
					warpPedIntoVehicle(drv, v)
				end
			else
				rz = getPedRotation(drv)
				x, y, z = getElementPosition(drv)
				v = createVehicle(522, x, y, z)
				setElementRotation(v, 0, 0, rz)
				warpPedIntoVehicle(drv, v)
			end
		end
	end
)
addCommandHandler("dvbot",
	function(thePlayer, command)
		if getElementByID(getPlayerName(thePlayer).."'s bot") then
			destroyElement(getElementByID(getPlayerName(thePlayer).."'s bot"))
		end
	end
)
addCommandHandler("botcam",
	function(thePlayer, command)
		triggerClientEvent("onBotCamRequest", getRootElement(), getPlayerName(thePlayer), thePlayer)
	end
)