screenW, screenH = guiGetScreenSize()
ServiceBG = guiCreateStaticImage((screenW - 826) / 2, (screenH - 523) / 2, 826, 523, "Data/Service.png", false)
ServiceClose = guiCreateStaticImage(720, 52, 71, 33, "Data/Click.png", false, ServiceBG)
ServiceTowVehicle = guiCreateStaticImage(65, 295, 164, 41, "Data/Click.png", false, ServiceBG)
ServiceRepairFix = guiCreateStaticImage(65, 341, 164, 41, "Data/Click.png", false, ServiceBG)
ServiceNormalCar = guiCreateStaticImage(331, 295, 164, 41, "Data/Click.png", false, ServiceBG)
ServiceMotorcycle = guiCreateStaticImage(331, 341, 164, 41, "Data/Click.png", false, ServiceBG)
ServiceHelicopter = guiCreateStaticImage(331, 386, 164, 41, "Data/Click.png", false, ServiceBG)
ServiceLimousine = guiCreateStaticImage(331, 431, 164, 41, "Data/Click.png", false, ServiceBG)
ServiceRequestDoctor = guiCreateStaticImage(596, 295, 164, 41, "Data/Click.png", false, ServiceBG)
------------------------------------------------------------------------------------------------------------------
guiSetVisible(ServiceBG, false)
----------------------------------

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	name = getPlayerName ( getLocalPlayer() )
    if source == ServiceClose then
		guiSetVisible(ServiceBG, false)
		showCursor( false )
		playSoundFrontEnd ( 2 )
	elseif source == ServiceTowVehicle or source == ServiceRepairFix then
		if getElementData(getLocalPlayer(),"InServiceReq") then
			exports["notf"]:addNotification("Shoma yek Request Baz Darid ya Operator i Online Nist!" , 'error')
			return false
		end
		setElementData(getLocalPlayer(),"inServiceReq","mechanic")
		if source == ServiceTowVehicle then
			triggerServerEvent ( "RequestService", getLocalPlayer(), getLocalPlayer(), 1 )
		elseif source == ServiceRepairFix then
			triggerServerEvent ( "RequestService", getLocalPlayer(), getLocalPlayer(), 2 )
		end
	elseif source == ServiceNormalCar or source == ServiceHelicopter
	or source == ServiceLimousine or source == ServiceMotorcycle then
		if getElementData(getLocalPlayer(),"InServiceReq") then
			exports["notf"]:addNotification("Shoma yek Request Baz Darid ya Operator i Online Nist!" , 'error')
			return false
		end
		setElementData(getLocalPlayer(),"inServiceReq","taxi")
		if source == ServiceNormalCar then
			triggerServerEvent ( "RequestService", getLocalPlayer(), getLocalPlayer(), 3 )
		elseif source == ServiceHelicopter then
			triggerServerEvent ( "RequestService", getLocalPlayer(), getLocalPlayer(), 4 )
		elseif source == ServiceLimousine then
			triggerServerEvent ( "RequestService", getLocalPlayer(), getLocalPlayer(), 5 )
		elseif source == ServiceMotorcycle then
			triggerServerEvent ( "RequestService", getLocalPlayer(), getLocalPlayer(), 6 )
		end
	elseif source == ServiceRequestDoctor then
		if getElementData(getLocalPlayer(),"InServiceReq") then
			exports["notf"]:addNotification("Shoma yek Request Baz Darid ya Operator i Online Nist!" , 'error')
			return false
		end
		setElementData(getLocalPlayer(),"inServiceReq","medic")
		triggerServerEvent ( "RequestService", getLocalPlayer(), getLocalPlayer(), 7 )
	end
end)
addEvent("ShowServicePanel",true)
addEventHandler("ShowServicePanel", root,
function (thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
        local currentState = guiGetProperty(ServiceBG, "Visible", "false")
        if currentState == "False" then
			playSoundFrontEnd ( 1 )
            guiSetProperty(ServiceBG, "Visible", "True")
			showCursor(true)
        else
			playSoundFrontEnd ( 2 )
            guiSetProperty(ServiceBG, "Visible", "false")
			showCursor(false)
        end
	end
end)
