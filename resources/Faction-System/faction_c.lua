local screenW, screenH = guiGetScreenSize()
local font1_Font = guiCreateFont("Data/Font.ttf", 14)
local font5_Font = guiCreateFont("Data/Font.ttf", 8)
local font0_Font = guiCreateFont("Data/Font.ttf", 25)

Background = guiCreateWindow((screenW - 750) / 2, (screenH - 400) / 2, 660, 520, "Faction Member Manager", false)
guiSetProperty( Background, "Visible", "False")

Backgroundkick = guiCreateWindow((screenW - 750) / 2, (screenH - 400) / 2, 330, 170, "Aya Motmaen Hastid?", false)
guiSetProperty( Backgroundkick, "Visible", "False")
Kick = guiCreateButton(40, 80, 120, 40, "Bale", false, Backgroundkick)
cancelkick = guiCreateButton(170, 80, 120, 40, "Kheyr . Monsaref Shodam", false, Backgroundkick)
FP = guiCreateEdit(85, 125, 150, 30, "Tedad FP", false, Backgroundkick)



local Players = guiCreateGridList(0.01, 0.05, 1, 0.77, true,Background)
local cplayername = guiGridListAddColumn(Players, "Player Name", 0.17)
local cplayerrank = guiGridListAddColumn(Players, "Faction Rank", 0.17)
local cplayerwarns = guiGridListAddColumn(Players, "Warns", 0.1)
local cplayerjoain = guiGridListAddColumn(Players, "Joain Date", 0.2)
local cplayerlastl = guiGridListAddColumn(Players, "Last Login", 0.2)
local cplayerduty = guiGridListAddColumn(Players, "Duty", 0.1)
guiGridListAutoSizeColumn( Players, 7 )

guiWindowSetSizable(Background, false)
guiWindowSetSizable(Backgroundkick, false)



GiveFactionWarn = guiCreateButton(1, 430, 250, 35, "Give Faction Warn To Selected Member", false, Background)
RemoveFactionWarn = guiCreateButton(1, 475, 250, 35, "Take Faction Warn To Selected Member", false, Background)
PromotFactionRank = guiCreateButton(267, 430, 230, 35, "Promote Selected Member", false, Background)
DemoteFactionRank = guiCreateButton(267, 475, 230, 35, "Demote Selected Member", false, Background)
ShowKickWindow = guiCreateButton(503, 430, 147, 35, "Kick Selected Member", false, Background)
Close = guiCreateButton(503, 475, 147, 35, "Close", false, Background)






guiSetFont(ShowKickWindow, font5_Font)
guiSetFont(DemoteFactionRank, font5_Font)
guiSetFont(GiveFactionWarn, font5_Font)
guiSetFont(RemoveFactionWarn, font5_Font)
guiSetFont(PromotFactionRank, font5_Font)

guiSetFont(cancelkick, font5_Font)
guiSetFont(Kick, font5_Font)
guiSetFont(Close, font5_Font)
guiSetProperty(cancelkick, "NormalTextColour", "FFFF0000")
guiSetProperty(Close, "NormalTextColour", "FFFF0000")
guiSetProperty(ShowKickWindow, "NormalTextColour", "FFFF9999")
guiSetProperty(DemoteFactionRank, "NormalTextColour", "FFCCCC00")
guiSetProperty(GiveFactionWarn, "NormalTextColour", "FFFF0000")
guiSetProperty(PromotFactionRank, "NormalTextColour", "FF66FFFF")
guiSetProperty(RemoveFactionWarn, "NormalTextColour", "FF66FF66")
guiSetProperty(Kick, "NormalTextColour", "FF00FF00")
guiSetProperty(FP, "NormalTextColour", "FF000000")




bindKey ("F3", "down",
function()
	selectedName = 0
	esmesh = 0
	guiSetText ( Players, "" )
	guiSetText ( UsernameLabel1, "" )
	guiSetText ( LevelLabel1, "" )
	guiSetText ( LastLoginLabel1, "" )
	guiSetText ( DateJoinLabel1, "" )
	guiSetText ( FactionWarnsLabel1, "" )
	guiSetText ( FactionRankLabel1, "" )
	
    triggerServerEvent("openFactionPanel", getLocalPlayer(), getLocalPlayer() )
end)

function toggleFactionPanel(root)
	if root == getLocalPlayer() then
		if getElementData(root, "loggedIn") == true then
			local windowState = guiGetProperty(Background, "Visible")
			if windowState == "False" then
				if tonumber(getElementData(root,"mitoneyana")) == 0 then
					guiSetEnabled(RemoveFactionWarn,false)
					guiSetEnabled(PromotFactionRank,false)
					guiSetEnabled(DemoteFactionRank,false)
					guiSetEnabled(ShowKickWindow,false)
					guiSetEnabled(GiveFactionWarn,false)
				elseif tonumber(getElementData(root,"mitoneyana")) == 1 then
					guiSetEnabled(RemoveFactionWarn,true)
					guiSetEnabled(PromotFactionRank,true)
					guiSetEnabled(DemoteFactionRank,true)
					guiSetEnabled(ShowKickWindow,true)
					guiSetEnabled(GiveFactionWarn,true)
				end
				guiGridListClear( Players, factionMember )
				guiSetProperty(Backgroundkick, "Visible", "False")
				guiSetProperty(Background, "Visible", "True")
				showCursor(true)
				guiSetInputEnabled( true )
				triggerServerEvent("infoFaction", getLocalPlayer(), getLocalPlayer() )
				guiSetText( labelnamekcik, "" )
				selectedName = 0
			else
				selectedName = 0
				guiSetProperty(Backgroundkick, "Visible", "False")
				guiSetProperty(Background, "Visible", "False")
				guiGridListClear( Players, factionMember )
				showCursor(false)
				guiSetInputEnabled( false )
				guiSetText( labelnamekcik, "" )
			end
		end
	end
end
addEvent("toggleFcPanel",true)
addEventHandler("toggleFcPanel", root, toggleFactionPanel,mitoneyana)
-- Bade demote shodane elader panel baste she ta abuse nakone
function toggleFactionPanel2 (root)
	guiSetProperty(Background, "Visible", "False")
	guiGridListClear( Players, factionMember )
	showCursor(false)
end
addEvent("toggleFcPanelForAbuse",true)
addEventHandler("toggleFcPanelForAbuse", root, toggleFactionPanel2)

addEvent("infoFactionPanel",true)
addEventHandler("infoFactionPanel",getLocalPlayer(),function(fmember,rank,pFwarn,pJoinFaction,pLastLogin,pDuty,R,G,B)
	local factionMember,rank,pFwarn,pJoinFaction,pLastLogin,pDuty,R,G,B = tostring(fmember),tostring(rank),tostring(pFwarn),tostring(pJoinFaction),tostring(pLastLogin),tostring(pDuty),tonumber(R),tonumber(G),tonumber(B)

	local myrow = guiGridListAddRow(Players,factionMember,rank,pFwarn,pJoinFaction,pLastLogin,pDuty)
	guiGridListSetItemColor ( Players, myrow, cplayername, R,G,B )
	
end)

selectedName = 0

addEventHandler("onClientGUIClick",root,
function ()
	if source == Close then
	    sound = playSound("Data/error.mp3",false)
        setSoundVolume(sound,1)
		guiSetVisible(Background, false)
	    showCursor(false)
		guiSetInputEnabled( false )
		guiGridListClear( Players, factionMember )
	elseif source == Players then
		if guiGetText(myrow) == "" then
			exports["notf"]:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
			sound = playSound("Data/errorp.mp3",false)
        	setSoundVolume(sound,0.2)
		else
			sound = playSound("Data/click.mp3",false)
    		setSoundVolume(sound,0.2)

			entekhab = guiGridListGetSelectedItem(Players,myrow)
			esmesh = guiGridListGetItemText ( Players, entekhab, cplayername )
			guiSetText ( UsernameLabel1, ""..esmesh )

			local finalName = tostring(esmesh)
			selectedName = esmesh
			triggerServerEvent("getPlayerFactionData",getLocalPlayer(),getLocalPlayer(),finalName)
		end
		

	elseif source == GiveFactionWarn then
		if selectedName ~= 0 then
			local finalPlayerName = tostring(selectedName)
			triggerServerEvent("bedeFw", getLocalPlayer(), getLocalPlayer(),finalPlayerName)
			reloadF4Page()
		else
			exports["notf"]:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
			sound = playSound("Data/errorp.mp3",false)
        	setSoundVolume(sound,0.2)
		end
	elseif source == RemoveFactionWarn then
		if selectedName ~= 0 then
			
			local finalPlayerName = tostring(selectedName)
			triggerServerEvent("removeFw", getLocalPlayer(), getLocalPlayer(),finalPlayerName)
			reloadF4Page()
		else
			exports["notf"]:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
			sound = playSound("Data/errorp.mp3",false)
			setSoundVolume(sound,0.2)
		end

		
	elseif source == PromotFactionRank then
		if selectedName ~= 0 then
			local finalPlayerName = tostring(selectedName)
			triggerServerEvent("poromoteshkonfaction", getLocalPlayer(), getLocalPlayer(),finalPlayerName)
			reloadF4Page()
		else
			exports["notf"]:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
			sound = playSound("Data/errorp.mp3",false)
			setSoundVolume(sound,0.2)
		end
	elseif source == DemoteFactionRank then
		if selectedName ~= 0 then
			local finalPlayerName = tostring(selectedName)
			triggerServerEvent("demoteshkonfaction", getLocalPlayer(), getLocalPlayer(),finalPlayerName)
			reloadF4Page()
		else
			exports["notf"]:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
			sound = playSound("Data/errorp.mp3",false)
			setSoundVolume(sound,0.2)
		end
	elseif source == ShowKickWindow then
		if selectedName ~= 0 then
			
			labelnamekcik = guiCreateLabel( 10,25, 300, 50, "Aya Mikhahid Player "..selectedName.." Ra Az Faction\n\n/Deparment/Mafia Ekhraj Konid?", false, Backgroundkick )
			guiSetProperty(Backgroundkick, "Visible", "True")
			guiSetProperty(Background, "Visible", "False")
		else
			exports["notf"]:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
			sound = playSound("Data/errorp.mp3",false)
        	setSoundVolume(sound,0.2)

		end
	elseif source == cancelkick then
		if selectedName ~= 0 then 
			guiSetText( labelnamekcik, "" )
			selectedName = 0 
			guiGridListClear( Players, factionMember )
			guiSetProperty(Backgroundkick, "Visible", "False")
			triggerServerEvent("openFactionPanel", getLocalPlayer(), getLocalPlayer() )
		end
		
    elseif source == Kick then
		
		if selectedName ~= 0 then
			if guiGetText(FP) == "Tedad FP" then
				exports["notf"]:addNotification("Faction Punish Ra Vared Konid!","error")
				
				sound = playSound("Data/errorp.mp3",false)
        		setSoundVolume(sound,0.2)
			else
				
				if tonumber(guiGetText(FP)) then
					if tonumber(guiGetText(FP)) >= 10 and tonumber(guiGetText(FP)) < 181 then
						
						local fName = tostring(selectedName)
						local fFp = tostring(guiGetText(FP))

						guiSetProperty(Backgroundkick, "Visible", "False")
						guiSetProperty(Background, "Visible", "True")
						guiSetText( FP, "Tedad FP" )
						guiSetText( labelnamekcik, "" )
						triggerServerEvent("KickeshKonAzToFac",getLocalPlayer(),getLocalPlayer(),fName,fFp)
						
					else
						exports["notf"]:addNotification("Meqdare Faction Punish Bayad Bishtar Az 10 Va Hadaksar 180 Bashad!","error")
						sound = playSound("Data/errorp.mp3",false)
                        setSoundVolume(sound,0.2)
					end
				else
					exports["notf"]:addNotification("Baraye Faction Punish Bayad Yek Adad Vared Konid!","error")
					sound = playSound("Data/errorp.mp3",false)
                    setSoundVolume(sound,0.2)
				end

			end
		else
			exports["notf"]:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
			sound = playSound("Data/errorp.mp3",false)
            setSoundVolume(sound,0.2)
		end
	end
end)

addEvent("SetPlayerDataOnGui",true)
addEventHandler("SetPlayerDataOnGui",getLocalPlayer(),function(thePlayer,pLevel,pFWarn,pLastLogin,pJoinFaction,finalRank)
	guiSetText(LevelLabel1," "..pLevel)
	guiSetText(FactionWarnsLabel1," "..pFWarn.."/3")
	guiSetText(FactionRankLabel1," "..finalRank.."")
	guiSetText(LastLoginLabel1," "..pLastLogin)
	guiSetText(DateJoinLabel1," "..pJoinFaction)
end)

function reloadF4Page()

	
	guiGridListClear( Players, factionMember )
	triggerServerEvent("infoFaction", getLocalPlayer(), getLocalPlayer() )
end

addEvent("reloadPageEvent",true)
addEventHandler("reloadPageEvent",getLocalPlayer(),function()
	reloadF4Page()
end)
----------------------- Peds --------------------------
--- Medic ---
pedmariz = createPed(162, 248.26973266602 ,146.98828125 ,1021.8502197266) 
setElementFrozen(pedmariz, true)
setElementInterior ( pedmariz, 3 )
medicped1 = createPed(275, 247.3251953125 ,146.9 ,1020.8515625) 
setElementFrozen(medicped1, true)
setElementInterior ( medicped1, 3 )
setElementRotation( medicped1, 0 ,0 ,270.38040161133, "default", true)
medicped2 = createPed(276, 231.482421875 ,163.19921875 ,1020.8515625) 
setElementFrozen(medicped2, true)
setElementInterior ( medicped2, 3 )
setElementRotation( medicped2, 0 ,0 ,272.03936767578, "default", true)
medicped3 = createPed(256, 231.58203125 ,167.4833984375 ,1020.8515625) 
setElementFrozen(medicped3, true)
setElementInterior ( medicped3, 3 )
setElementRotation( medicped3, 0 ,0 ,272.03936767578, "default", true)
medicped4 = createPed(274, 241.42578125 ,151.99609375 ,1020.8515625) 
setElementFrozen(medicped4, true)
setElementInterior ( medicped4, 3 )
setElementRotation( medicped4, 0 ,0 ,179.20349121094, "default", true)
function pedsnpc()
	setTimer ( function()
		setPedAnimation(pedmariz,"CRACK","crckidle1",1,true,false)
		setPedAnimation(medicped1,"CASINO","slot_wait",1,true,false)
		setPedAnimation(medicped2,"ped","SEAT_idle",1,true,false)
		setPedAnimation(medicped3,"ped","SEAT_idle",1,true,false)
		setPedAnimation(medicped4,"ped","SEAT_idle",1,true,false)
	end, 1000, 0 )
end
pedsnpc()


function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", pedmariz, cancelPedDamage)
function cancelPedDamage()
	cancelEvent()
end
addEventHandler("onClientPedDamage", medicped1, cancelPedDamage)
function cancelPedDamage()
	cancelEvent()
end
addEventHandler("onClientPedDamage", medicped2, cancelPedDamage)
function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", medicped3, cancelPedDamage)
function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", medicped4, cancelPedDamage)
-----------------============ICA-PANEL============-----------------
local sX, sY = guiGetScreenSize()
local px, py = (sX/1600), (sY/900)
local PanelBgCanteractICA = guiCreateStaticImage(px*325 , py*202.5 , px*962 , py*495 ,"Data/ICA/Background.png", false,false)
guiSetVisible(PanelBgCanteractICA,false)
local comboboxallplayerforica = guiCreateComboBox(px*400 , py*133 , px*400  , py*150, "Entekhab Konid.", false , PanelBgCanteractICA)
local ClosePanelICACANTERACT = guiCreateStaticImage(px*10 , py*10 , px*43.5 , py*42.25 ,"Data/ICA/Close.png", false , PanelBgCanteractICA)
local pricepanelforicapanelcanteract = guiCreateEdit(px*470, py*187, px*270, py*40, "0", false, PanelBgCanteractICA)
addEventHandler("onClientGUIClick",root,
function ()
	if source == comboboxallplayerforica then

		
	end
end)
function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing ( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
		return true
	else
		return false
	end
end
function DrawDXICAPANELCANTRACT()
	if DrawDXICAPANELCANTRACTs == true then

		if isMouseInPosition(px*600 , py*530 , px*164.25 , py*45) and ALPHACICAHITMANH == 100 then
        	dxDrawImage(px*600 , py*530 , px*164.25 , py*45, "Data/ICA/H.png", 0, 0, 0, tocolor(150,150,150, 255), true)
        	if getKeyState("mouse1") then
        		if not press then
        			press = true
					ALPHACICAHITMANH = 255
					ALPHACICAHITMANM1 = 100
					ALPHACICAHITMANM2 = 100
                end
        	else
        		press = false
        	end
        else
            dxDrawImage(px*600 , py*530 , px*164.25 , py*45, "Data/ICA/H.png", 0, 0, 0, tocolor(255, 255, 255, ALPHACICAHITMANH), true)
        end

		if isMouseInPosition(px*790 , py*530 , px*164.25 , py*45) and ALPHACICAHITMANM1 == 100 then
        	dxDrawImage(px*790 , py*530 , px*164.25 , py*45, "Data/ICA/M1.png", 0, 0, 0, tocolor(150,150,150, 255), true)
        	if getKeyState("mouse1") then
        		if not press then
        			press = true
					ALPHACICAHITMANH = 100
					ALPHACICAHITMANM1 = 255
					ALPHACICAHITMANM2 = 100
                end
        	else
        		press = false
        	end
        else
            dxDrawImage(px*790 , py*530 , px*164.25 , py*45, "Data/ICA/M1.png", 0, 0, 0, tocolor(255, 255, 255, ALPHACICAHITMANM1), true)
        end

		if isMouseInPosition(px*990 , py*530 , px*164.25 , py*45) and ALPHACICAHITMANM2 == 100 then
        	dxDrawImage(px*990 , py*530 , px*164.25 , py*45, "Data/ICA/M2.png", 0, 0, 0, tocolor(150,150,150, 255), true)
        	if getKeyState("mouse1") then
        		if not press then
        			press = true
					ALPHACICAHITMANH = 100
					ALPHACICAHITMANM1 = 100
					ALPHACICAHITMANM2 = 255
                end
        	else
        		press = false
        	end
        else
            dxDrawImage(px*990 , py*530 , px*164.25 , py*45, "Data/ICA/M2.png", 0, 0, 0, tocolor(255, 255, 255, ALPHACICAHITMANM2), true)
        end
		if isMouseInPosition(px*790 , py*620 , px*164.25 , py*45) then
        	dxDrawImage(px*790 , py*620 , px*164.25 , py*45, "Data/ICA/Start.png", 0, 0, 0, tocolor(150,150,150, 255), true)
        	if getKeyState("mouse1") then
        		if not press then
        			press = true
					if tonumber(guiGetText(pricepanelforicapanelcanteract)) > 999 then
						local selected = guiComboBoxGetSelected ( comboboxallplayerforica )
						if selected ~= 0 then
							for k, hame_Playera	in ipairs (getElementsByType("player")) do	
								if getPlayerName(hame_Playera) == tostring(guiComboBoxGetItemText(comboboxallplayerforica,guiComboBoxGetSelected(comboboxallplayerforica))) then
									if ALPHACICAHITMANH == 255 then
										noecontracts = 1
									elseif ALPHACICAHITMANM1 == 255 then
										noecontracts = 2
									elseif ALPHACICAHITMANM2 == 255 then
										noecontracts = 3
									end
									triggerServerEvent("SetConnteract",getLocalPlayer(),getLocalPlayer(),getElementData(hame_Playera, "TarafID"),tonumber(guiGetText(pricepanelforicapanelcanteract)),noecontracts)
								end
							end
							
						end
					else
						exports["notf"]:addNotification("Hadaghal Price Baraye Inkar Bayad +1000 Bashad","error")
					end
                end
        	else
        		press = false
        	end
        else
            dxDrawImage(px*790 , py*620 , px*164.25 , py*45, "Data/ICA/Start.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        end
	end
end
DrawDXICAPANELCANTRACTs = false
addEventHandler("onClientGUIClick",root,function()
	if source == ClosePanelICACANTERACT then
		closepanelICACoNTrAcT(getLocalPlayer())
		removeEventHandler("onClientRender",root,DrawDXICAPANELCANTRACT)
	end
end)

function openpanelICACoNTrAcT(player)
	if getLocalPlayer() == player then
		guiComboBoxClear( comboboxallplayerforica )
		for index,allPlayers in ipairs(getElementsByType("player")) do
			if getElementData(allPlayers, "loggedIn") == true then
				guiComboBoxAddItem(comboboxallplayerforica,getPlayerName(allPlayers) )
			end

		end
		removeEventHandler("onClientRender",root,DrawDXICAPANELCANTRACT) -- FIX: avoid stacking duplicate render handlers
		addEventHandler("onClientRender",root,DrawDXICAPANELCANTRACT)
		ALPHACICAHITMANH = 255
		ALPHACICAHITMANM1 = 100
		ALPHACICAHITMANM2 = 100
		DrawDXICAPANELCANTRACTs = true
		guiSetVisible(PanelBgCanteractICA,true)
		showCursor(true)
	end
end

function closepanelICACoNTrAcT(player)
	if getLocalPlayer() == player then
		DrawDXICAPANELCANTRACTs = false
		guiSetVisible(PanelBgCanteractICA,false)
		showCursor(false)
	end
end

addCommandHandler("contract",function()
	if guiGetVisible(PanelBgCanteractICA) == true then
		closepanelICACoNTrAcT(getLocalPlayer())
		noecontracts = 0
	else
		openpanelICACoNTrAcT(getLocalPlayer())
		noecontracts = 0
	end
end)


-------====Cuff Anim===------
function setCuffed(player)
    -- Left
    setElementBoneRotation(player, 32, 26.57374382019, 61.337575733622, 59.206573486328)
    setElementBoneRotation(player, 33, 27.843754291534, 15.3639249801636, 46.40625) -- y = 8.3639249801636
    setElementBoneRotation(player, 34, -81.018516340527, 342.87482380867, 326.11833715439)
    -- Right
    setElementBoneRotation(player, 22, 338.839179039, 53.49357098341, 298.45233917236)
    setElementBoneRotation(player, 23, 307.68748283386, 22.110015869141, 313.59375) -- y = 5.110015869141
    setElementBoneRotation(player, 24, 96.047592163086, 357.88313293457, 56.739406585693)
    
    updateElementRpHAnim(player)
end
function PlaySoundForPlayer(player,Sound)
	if player == getLocalPlayer( ) then
		sound = playSound(Sound,false)
		setSoundVolume(sound,1)
	end
end
addEvent("PlaySoundForPlayer",true)
addEventHandler("PlaySoundForPlayer",getLocalPlayer(),PlaySoundForPlayer)

function updateCuffedPlayers( )
    for _,p in ipairs(getElementsByType'player') do
		cuffed = getElementData(p, "pCuffed?") or false
		if cuffed == true then
            setCuffed(p)
			if p == getLocalPlayer( ) then
				dxDrawImage(px*1450 , py*240 , px*95 , py*92, "Data/Cuff/Cuff.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			end
        end
    end
end
addEventHandler ("onClientPedsProcessed", root, updateCuffedPlayers)
bindKey("mouse3","down","cuffnear")