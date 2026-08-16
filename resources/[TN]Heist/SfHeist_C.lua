local screenW, screenH = guiGetScreenSize()

-------------------------
--== Heist Main Page ==--
-------------------------

HeistMainPageBg = guiCreateStaticImage((screenW - 1000) / 2, (screenH - 500) / 2, 1000, 500, "Data/HeistGui1.png", false)
CreateSf = guiCreateStaticImage(96, 334, 171, 56, "Data/Click.png", false, HeistMainPageBg)
JoinSF = guiCreateStaticImage(96, 400, 171, 56, "Data/Click.png", false, HeistMainPageBg)
CreateLS = guiCreateStaticImage(408, 334, 171, 56, "Data/Click.png", false, HeistMainPageBg)
JoinLs = guiCreateStaticImage(408, 400, 171, 56, "Data/Click.png", false, HeistMainPageBg)
CreateLv = guiCreateStaticImage(731, 334, 171, 56, "Data/Click.png", false, HeistMainPageBg)
JoinLv = guiCreateStaticImage(731, 400, 171, 56, "Data/Click.png", false, HeistMainPageBg)
Heist1Close = guiCreateStaticImage(954, 10, 36, 29, "Data/Close.png", false, HeistMainPageBg)
guiSetVisible(HeistMainPageBg, false) 

-----------------------------
--== Heist SF Party Page ==--
-----------------------------

HeistSfPageBg = guiCreateStaticImage((screenW - 1000) / 2, (screenH - 500) / 2, 1000, 500, "Data/HeistGui2.png", false)
HeistStart = guiCreateStaticImage(299, 391, 169, 50, "Data/Click.png", false, HeistSfPageBg)
HeistLeave = guiCreateStaticImage(530, 391, 169, 50, "Data/Click.png", false, HeistSfPageBg)
Player1 = guiCreateStaticImage(38, 50, 200, 139, "Data/HeistGunner.png", false, HeistSfPageBg)
Player1Text = guiCreateLabel((200 - 114) / 2, (139 - 27) / 2, 114, 27, "No-One", false, Player1)
guiSetFont(Player1Text, "default-bold-small")
guiLabelSetColor(Player1Text, 0, 0, 0)
guiLabelSetHorizontalAlign(Player1Text, "center", false)
guiLabelSetVerticalAlign(Player1Text, "bottom")
Player2 = guiCreateStaticImage(278, 50, 200, 139, "Data/HeistGunner.png", false, HeistSfPageBg)
Player2Text = guiCreateLabel((200 - 114) / 2, (139 - 27) / 2, 114, 27, "No-One", false, Player2)
guiSetFont(Player2Text, "default-bold-small")
guiLabelSetColor(Player2Text, 0, 0, 0)
guiLabelSetHorizontalAlign(Player2Text, "center", false)
guiLabelSetVerticalAlign(Player2Text, "bottom")
Player3 = guiCreateStaticImage(520, 50, 200, 139, "Data/HeistAudienceGuard.png", false, HeistSfPageBg)
Player3Text = guiCreateLabel((200 - 114) / 2, (139 - 27) / 2, 114, 27, "No-One", false, Player3)
guiSetFont(Player3Text, "default-bold-small")
guiLabelSetColor(Player3Text, 0, 0, 0)
guiLabelSetHorizontalAlign(Player3Text, "center", false)
guiLabelSetVerticalAlign(Player3Text, "bottom")
Player4 = guiCreateStaticImage(759, 50, 200, 139, "Data/HeistDriver.png", false, HeistSfPageBg)
Player4Text = guiCreateLabel((200 - 114) / 2, (139 - 27) / 2, 114, 27, "No-One", false, Player4)
guiSetFont(Player4Text, "default-bold-small")
guiLabelSetColor(Player4Text, 0, 0, 0)
guiLabelSetHorizontalAlign(Player4Text, "center", false)
guiLabelSetVerticalAlign(Player4Text, "bottom")
guiSetVisible(HeistSfPageBg, false) 

-----------------------------
--== Client Side Scripts ==--
-----------------------------

local NumberIsPicture = {}
NumberIsPicture[1] = Player1
NumberIsPicture[2] = Player2
NumberIsPicture[3] = Player3
NumberIsPicture[4] = Player4

local NumberIsText = {}
NumberIsText[1] = Player1Text
NumberIsText[2] = Player2Text
NumberIsText[3] = Player3Text
NumberIsText[4] = Player4Text

local RoleLocation = {}
RoleLocation[1] = "Data/HeistGunner.png"
RoleLocation[2] = "Data/HeistDriver.png"
RoleLocation[3] = "Data/HeistAudienceGuard.png"

function ResetHeistGui()
	guiSetText( Player1Text, "No-One" )
	guiSetText( Player2Text, "No-One" )
	guiSetText( Player3Text, "No-One" )
	guiSetText( Player4Text, "No-One" )
	guiStaticImageLoadImage(Player1, "Data/HeistGunner.png")
	guiStaticImageLoadImage(Player2, "Data/HeistGunner.png")
	guiStaticImageLoadImage(Player3, "Data/HeistAudienceGuard.png")
	guiStaticImageLoadImage(Player4, "Data/HeistDriver.png")
end


addEventHandler("onClientGUIClick", resourceRoot,
function ()
	if source == Heist1Close then
		guiSetProperty(HeistMainPageBg, "Visible", "False")
		showCursor(false) 
	elseif source == HeistLeave then
		guiSetProperty(HeistSfPageBg, "Visible", "False")
		showCursor(false) 
		ResetHeistGui()
		triggerServerEvent("ILeftSfHeist", getLocalPlayer(), getLocalPlayer())
	elseif source == HeistStart then
		triggerServerEvent("StartSfHeist", getLocalPlayer(), getLocalPlayer())
	elseif source == CreateSf then
		triggerServerEvent("CreateHeistSf", getLocalPlayer(), getLocalPlayer())
	elseif source == JoinSF then
		triggerServerEvent("JoinHeistSf", getLocalPlayer(), getLocalPlayer())
	elseif source == CreateLS then
		exports["notf"]:addNotification( "** Coming Soon! **" , 'info')
	elseif source == JoinLs then
		exports["notf"]:addNotification( "** Coming Soon! **" , 'info')
	elseif source == CreateLv then
		exports["notf"]:addNotification( "** Coming Soon! **" , 'info')
	elseif source == JoinLv then
		exports["notf"]:addNotification( "** Coming Soon! **" , 'info')
	elseif source == Player1 then
		triggerServerEvent( "ChangeRoleSfHeist", getLocalPlayer(), getLocalPlayer(), 1 )
	elseif source == Player2 then
		triggerServerEvent( "ChangeRoleSfHeist", getLocalPlayer(), getLocalPlayer(), 2 )
	elseif source == Player3 then
		triggerServerEvent( "ChangeRoleSfHeist", getLocalPlayer(), getLocalPlayer(), 3 )
	elseif source == Player4 then
		triggerServerEvent( "ChangeRoleSfHeist", getLocalPlayer(), getLocalPlayer(), 4 )
	end
end)

addEvent("UpdateHeistBoard",true)
addEventHandler("UpdateHeistBoard", root,
function ( Player1Name, Player1Role, Player2Name, Player2Role, Player3Name, Player3Role, Player4Name, Player4Role )
	if guiGetProperty(HeistSfPageBg, "Visible") == "True" then
		guiStaticImageLoadImage(Player1, RoleLocation[Player1Role])
		guiSetText(Player1Text,""..Player1Name.."")
		guiStaticImageLoadImage(Player2, RoleLocation[Player2Role])
		guiSetText(Player2Text,""..Player2Name.."")
		guiStaticImageLoadImage(Player3, RoleLocation[Player3Role])
		guiSetText(Player3Text,""..Player3Name.."")
		guiStaticImageLoadImage(Player4, RoleLocation[Player4Role])
		guiSetText(Player4Text,""..Player4Name.."")
	end
end)

addEvent("StopSfHeistBoard",true)
addEventHandler("StopSfHeistBoard", root,
function ( Player )
	if guiGetProperty(HeistSfPageBg, "Visible") == "True" then
		guiSetProperty(HeistSfPageBg, "Visible", "False")
		if Player then
			exports["notf"]:addNotification( "** Leadere In Heist (( "..Player.." )) Left Dad Va Cancel Shod! **" , 'warning')
		end
		showCursor(false) 
	end
end)

addEvent("UpdateHeistRole",true)
addEventHandler("UpdateHeistRole", root,
function ( Player , HeistNumber , HeistRole )
	if guiGetProperty(HeistSfPageBg, "Visible") == "True" then
		guiStaticImageLoadImage(NumberIsPicture[HeistNumber], RoleLocation[HeistRole])
		exports["notf"]:addNotification( "Role "..guiGetText(NumberIsText[HeistNumber]).." Tavasote "..getPlayerName(Player).." Taghir Kard!" , 'info')
	end
end)

addEvent("ShowHeistGui",true)
addEventHandler("ShowHeistGui", root,
function ( thePlayer )
	if ( thePlayer == getLocalPlayer() ) then
		guiSetVisible(HeistMainPageBg, true)
		showCursor(true)
	end
end)

addEvent("StartHeistBoard",true)
addEventHandler("StartHeistBoard", root,
function ( thePlayer )
	if ( thePlayer == getLocalPlayer() ) then
		ResetHeistGui()
		guiSetProperty(HeistMainPageBg, "Visible", "False")
		guiSetProperty(HeistSfPageBg, "Visible", "True")
	end
end)

local pedTarget = {}
local pedTimer = {}
local pedShooting = {}

local function doPedAttackOtherPlayer(ped)
	if(isTimer(pedTimer[ped])) or (isPedInVehicle(ped)) then
		killTimer(pedTimer[ped])
	end
	if(isElement(ped)) then
		pedTimer[ped] = setTimer(function()
			if(isElement(ped)) then
				--if isPedDead ( ped ) then
					--return
				--end
				local target = pedTarget[ped]
				if(target) then
					local x, y, z = getElementPosition(ped)
					local x2, y2, z2 = getElementPosition(target)
					if(isLineOfSightClear(x, y, z, x2, y2, z2, true, false, false, false, false, false)) then
						if(getElementHealth(target) > 1) then
							if(pedShooting[ped] ~= true) then
								setPedControlState(ped, "fire", true)
								pedShooting[ped] = true
							else
								local x1, y1, z1 = getElementPosition(ped)
								local x2, y2, z2 = getElementPosition(target)
								local rot = math.atan2(y2 - y1, x2 - x1) * 180 / math.pi
								rot = rot-90
								setPedRotation(ped, rot)
								setPedAimTarget(ped, x2, y2, z2)
							end
						else
							killTimer(pedTimer[ped])
							pedShooting[ped] = false
							setPedControlState(ped, "fire", false)
						end
					else
						killTimer(pedTimer[ped])
						pedShooting[ped] = false
						setPedControlState(ped, "fire", false)
					end
				end
			else
				killTimer(pedTimer[ped])
			end
		end, 500, 20)
	else
		killTimer(pedTimer[ped])
	end
end

addEvent("SetGuardAttacking", true)
addEventHandler("SetGuardAttacking", getRootElement(), function(Guard,Player)
	pedTarget[Guard] = Player
	doPedAttackOtherPlayer(Guard)
end)

local Sound1 = nil
local Sound2 = nil

addEvent("StartAlarmeSf", true)
addEventHandler("StartAlarmeSf", getRootElement(), function()
	Sound1 = playSound3D("Data/Alarm.mp3", 439.5322265625 ,258.1845703125 ,992.18139648438, true)
    setSoundMaxDistance(Sound1, 150)
	Sound2 = playSound3D("Data/Alarm.mp3", -1482.7568359375 ,919.7080078125 ,11.429557800293, true)
    setSoundMaxDistance(Sound2, 150)
end)

addEvent("StopAlarmeSf",true)
addEventHandler("StopAlarmeSf", getRootElement(),
function ( )
	if Sound1 then
		destroyElement( Sound1 )
		Sound1 = nil
		destroyElement( Sound2 )
		Sound2 = nil
	end
end)

local HeistText = ""

addEvent("ShowHeistText",true)
addEventHandler("ShowHeistText", getRootElement(),
function ( thePlayer , Text , IsItTrue )
	if ( thePlayer == getLocalPlayer() ) then
		HeistText = Text
		playSound("Data/HeistSound.mp3")
		setTimer( function()
			HeistText = ""
		end, 8000, 1)
	end
end)

local x,y = guiGetScreenSize()

addEventHandler("onClientRender",root,
function ()
	dxDrawText(HeistText,0,0,x,y,tocolor(255,0,0,190),2,"pricedown","center","center",false,false,false)
end)