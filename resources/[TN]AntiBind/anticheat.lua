local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1600), (screenH/900)
local newFont12 = dxCreateFont(":[TN]HUD/Data/FONT.ttf",(x+y)*20)
--[[bindKey("crouch","down",function()
	if getPlayerName(getLocalPlayer()) ~= "ExoPrims" then
		triggerServerEvent("handleCrouch",getLocalPlayer(),getLocalPlayer())
	end
end)

bindKey("aim_weapon","down",function()
	if getPlayerName(getLocalPlayer()) ~= "ExoPrims" then
		triggerServerEvent("handleaim_weapon",getLocalPlayer(),getLocalPlayer())
	end
end)


function cheangew()
	if getPlayerName(getLocalPlayer()) ~= "ExoPrims" then
		triggerServerEvent("handlepunch_weapon",getLocalPlayer(),getLocalPlayer())
	end
end
bindKey("fire","down", cheangew)
]]


controlTable2 = {"fire", "aim_weapon", "next_weapon", "previous_weapon", "forwards", "backwards", "left", "right", "zoom_in", "zoom_out",
"change_camera", "jump", "sprint", "look_behind", "crouch", "action", "walk", "conversation_yes", "conversation_no",
"group_control_forwards", "group_control_back", "enter_exit", "vehicle_fire", "vehicle_secondary_fire", "vehicle_left", "vehicle_right",
"steer_forward", "steer_back", "accelerate", "brake_reverse", "radio_next", "radio_previous", "radio_user_track_skip", "horn", "sub_mission",
"handbrake", "vehicle_look_left", "vehicle_look_right", "vehicle_look_behind", "vehicle_mouse_look", "special_control_left", "special_control_right",
"special_control_down", "special_control_up"}


isplayerfrozen = {}
addEventHandler("onClientRender", root, function()
	if getElementData(getLocalPlayer(), "loggedIn") == true then
    	local loss = getNetworkStats()["packetlossLastSecond"]
		if (loss > 10) then
			dxDrawText("Packet Shoma Balasat",x*1100,y*450,x*500,y*500, tocolor(254, 21, 27, 255), 1.00, newFont12, "center", "center", false, false, false, true, false)
    	    if isElementFrozen(getLocalPlayer()) == false then
    	        setElementFrozen(getLocalPlayer(), true)
    	        isplayerfrozen[getLocalPlayer()] = true
				for i=1, #controlTable2 do
					toggleControl(controlTable2[i],false)
				end
    	    end
    	else
    	    if isplayerfrozen[getLocalPlayer()] ~= false then
    	        if isElementFrozen(getLocalPlayer()) == true then
    	            setElementFrozen(getLocalPlayer(), false)
					for i=1, #controlTable2 do
						toggleControl(controlTable2[i], true)
					end
    	        end
    	    end
		end
	end
end)