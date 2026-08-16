--[[ Panel Baraye Modiriat Faction ]]--
		local screenW, screenH = guiGetScreenSize()
        Background = guiCreateStaticImage((screenW - 886) / 2, (screenH - 505) / 2, 886, 505, "Data/Background.png", false)
		guiSetProperty( Background, "Visible", "False")
        Close = guiCreateStaticImage(736, 27, 118, 36, "Data/Close.png", false, Background)
        Players = guiCreateComboBox(458, 89, 316, 390, "", false, Background)
        Select = guiCreateButton(783, 90, 61, 24, "Select", false, Background)
        InformationBackground = guiCreateStaticImage(34, 89, 386, 317, "Data/WhiteBG.png", false, Background)

        PlayerInofrmationLabel = guiCreateLabel(8, 8, 364, 41, "Player Information", false, InformationBackground)
        local font0_Font = guiCreateFont("Data/Font.ttf", 29)
        guiSetFont(PlayerInofrmationLabel, font0_Font)
        guiLabelSetHorizontalAlign(PlayerInofrmationLabel, "center", false)
        UsernameLabel = guiCreateLabel(7, 55, 365, 41, "Username:", false, InformationBackground)
        local font1_Font = guiCreateFont("Data/Font.ttf", 21)
        guiSetFont(UsernameLabel, font1_Font)
        guiLabelSetVerticalAlign(UsernameLabel, "center")
        LevelLabel = guiCreateLabel(7, 96, 365, 41, "Level:", false, InformationBackground)
        guiSetFont(LevelLabel, font1_Font)
        guiLabelSetVerticalAlign(LevelLabel, "center")
        LastLoginLabel = guiCreateLabel(7, 137, 365, 41, "Last Login:", false, InformationBackground)
        guiSetFont(LastLoginLabel, font1_Font)
        guiLabelSetVerticalAlign(LastLoginLabel, "center")
        FactionWarnsLabel = guiCreateLabel(7, 178, 365, 41, "Faction Warns:", false, InformationBackground)
        guiSetFont(FactionWarnsLabel, font1_Font)
        guiLabelSetVerticalAlign(FactionWarnsLabel, "center")
        FactionRankLabel = guiCreateLabel(7, 219, 365, 41, "Faction Rank:", false, InformationBackground)
        guiSetFont(FactionRankLabel, font1_Font)
        guiLabelSetVerticalAlign(FactionRankLabel, "center")
        GiveFactionWarn = guiCreateStaticImage(7, 260, 181, 34, "Data/GiveFactionWarn.png", false, InformationBackground)
        Kick = guiCreateStaticImage(215, 260, 116, 32, "Data/Kick.png", false, InformationBackground)
        FP = guiCreateEdit(335, 262, 47, 30, "FP", false, InformationBackground)
        guiSetProperty(FP, "NormalTextColour", "FF194B37")
        guiEditSetMaxLength(FP, 2)    

bindKey ("F3", "down",
function()
    triggerServerEvent("openFactionPanel", getLocalPlayer(), getLocalPlayer() )
end)

function toggleFactionPanel(root)
	if root == getLocalPlayer() then
		if getElementData(root, "loggedIn") == true then
			local windowState = guiGetProperty(Background, "Visible")
			if windowState == "False" then
				playSoundFrontEnd ( 1 )
                guiSetProperty(Background, "Visible", "True")
				showCursor(true)
				triggerServerEvent("infoFaction", getLocalPlayer(), getLocalPlayer() )
			else
				playSoundFrontEnd ( 2 )
				guiSetProperty(Background, "Visible", "False")
				guiComboBoxClear(Players)
				showCursor(false)
			end
		end
	end
end
addEvent("toggleFcPanel",true)
addEventHandler("toggleFcPanel", root, toggleFactionPanel)

addEvent("infoFactionPanel",true)
addEventHandler("infoFactionPanel",getLocalPlayer(),function(fmember,lvl)
	factionMember = tostring(fmember)
	guiComboBoxAddItem(Players, factionMember)
end)

selectedName = 0

addEventHandler("onClientGUIClick",root,
function ()
	if source == Close then
		guiSetVisible(Background, false)
		playSoundFrontEnd ( 2 )
	    showCursor(false)
		guiComboBoxClear(Players)
	elseif source == RespawnVeh then
		executeCommandHandler ( "rv" )
		playSoundFrontEnd ( 4 )
	elseif source == Select then
		playSoundFrontEnd ( 4 )
		if guiGetText(Players) == "" then
			exports["notf"]:addNotification("Player Entekhab Konid!","error")
		else
			entekhab = guiComboBoxGetSelected(Players)
			esmesh = guiComboBoxGetItemText(Players, entekhab)
			guiSetText ( UsernameLabel, "Username: "..esmesh )
			local finalName = tostring(esmesh)
			selectedName = esmesh
			triggerServerEvent("getPlayerFactionData",getLocalPlayer(),getLocalPlayer(),finalName)
		end
	elseif source == GiveFactionWarn then
		playSoundFrontEnd ( 4 )
		if selectedName ~= 0 then
			local finalPlayerName = tostring(selectedName)
			triggerServerEvent("GiveFW", getLocalPlayer(), getLocalPlayer(),finalPlayerName)
		else
			exports["notf"]:addNotification("Ebteda Yek Player Ra Entekhab Konid","error")
		end
    elseif source == Kick then
		playSoundFrontEnd ( 4 )
		if selectedName ~= 0 then
			if guiGetText(FP) == "FP" then
				exports["notf"]:addNotification("Faction Punish Ra Vared Konid!","error")
			else
				if tonumber(guiGetText(FP)) then
					if tonumber(guiGetText(FP)) >= 0 and tonumber(guiGetText(FP)) < 61 then
						local fName = tostring(selectedName)
						local fFp = tostring(guiGetText(FP))
						triggerServerEvent("KickFromFaction",getLocalPlayer(),getLocalPlayer(),fName,fFp)
					else
						exports["notf"]:addNotification("Meqdare Faction Punish Bayad Bishtar Az 0 Va Kamtar Az 60 Bashad!","error")
					end
				else
					exports["notf"]:addNotification("Baraye Faction Punish Bayad Yek Adad Vared Konid!","error")
				end
			end
		else
			exports["notf"]:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
		end
	end
end)

addEvent("SetPlayerDataOnGui",true)
addEventHandler("SetPlayerDataOnGui",getLocalPlayer(),function(thePlayer,pLevel,pFWarn,pLastLogin,finalRank)
	guiSetText(LevelLabel,"Level: "..pLevel)
	guiSetText(FactionWarnsLabel,"Faction Warns: "..pFWarn.."/3")
	guiSetText(FactionRankLabel,"Faction Rank: "..finalRank.."")
	guiSetText(LastLoginLabel,"Last Login: "..pLastLogin)
end)

function reloadF2Page()
	guiSetText(LevelLabel,"Level: ")
	guiSetText(FactionWarnsLabel,"Faction Warns: ")
	guiSetText(FactionRankLabel,"Faction Rank: ")
	guiSetText(LastLoginLabel,"Last Login: ")
	guiComboBoxClear(Players)
	triggerServerEvent("infoFaction", getLocalPlayer(), getLocalPlayer() )
end

addEvent("reloadPageEvent",true)
addEventHandler("reloadPageEvent",getLocalPlayer(),function()
	reloadF2Page()
end)