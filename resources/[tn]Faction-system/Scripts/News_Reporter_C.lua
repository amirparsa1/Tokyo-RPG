---------------------------
--- Board News Reporter ---
---------------------------

screenW, screenH = guiGetScreenSize()
BoardBG = guiCreateStaticImage((screenW - 553) / 2, (screenH - 331) / 2, 553, 331, "Data/Board.png", false)
--BoardPhoto = guiCreateStaticImage(89, 39, 210, 127, "Data/Photo.png", false, BoardBG)
BoardEdit = guiCreateMemo( 82, 178, 289, 121, "Enter Your Topic Here !", false , BoardBG )
NameLabel = guiCreateLabel(402, 28, 57, 53, "", false, BoardBG)
Font1 = guiCreateFont("Data/Font2.ttf", 2)
guiSetFont(NameLabel, Font1)
guiLabelSetColor(NameLabel, 0, 0, 0)
guiLabelSetHorizontalAlign(NameLabel, "center", false)
guiLabelSetVerticalAlign(NameLabel, "center")
NewsLabel = guiCreateLabel(402, 95, 57, 53, "News Paper", false, BoardBG)
Font2 = guiCreateFont("Data/Font2.ttf", 6)
guiSetFont(NewsLabel, Font2)
guiLabelSetColor(NewsLabel, 0, 0, 0)
guiLabelSetHorizontalAlign(NewsLabel, "center", false)
guiLabelSetVerticalAlign(NewsLabel, "center")
Submit = guiCreateStaticImage(309, 91, 83, 26, "Data/Submit.png", false, BoardBG)
BoardClose = guiCreateStaticImage(309, 127, 83, 26, "Data/Close.png", false, BoardBG)    
guiSetVisible(BoardBG, false)

----------------------------
----- Board News Paper -----
----------------------------

NewsBG = guiCreateStaticImage(screenW - 350 - 10, (screenH - 198) / 2, 350, 198, "Data/News.png", false)
NewsLabel1 = guiCreateLabel(218, 78, 118, 105, "", false, NewsBG)
Font3 = guiCreateFont("Data/Font2.ttf", 9)
guiSetFont(NewsLabel1, Font3)
guiLabelSetColor(NewsLabel1, 0, 0, 0)
guiLabelSetHorizontalAlign(NewsLabel1, "center", true)
guiLabelSetVerticalAlign(NewsLabel1, "center")
--Photo = guiCreateStaticImage(13, 73, 189, 115, "Data/Photo.png", false, NewsBG)
NewsLabel2 = guiCreateLabel(13, 58, 327, 15, "News Reporter: ", false, NewsBG)
Font4 = guiCreateFont("Data/Font2.ttf", 7)
guiSetFont(NewsLabel2, Font4)
guiLabelSetColor(NewsLabel2, 0, 0, 0)    
guiSetVisible(NewsBG, false)

-----------------------------
---------- Scripts ----------
-----------------------------

addEventHandler("onClientPlayerWeaponFire", root,
function (weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	if source == getLocalPlayer() then
		if tonumber( weapon ) == 43 then
			executeCommandHandler("showmyhud")
			executeCommandHandler("showmyinfo")
			executeCommandHandler("showmyradar")
			setTimer(function()
				triggerServerEvent("TakeNrScreen", getLocalPlayer(), getLocalPlayer() )
				setTimer(function()
					executeCommandHandler("showmyhud", "true")
					executeCommandHandler("showmyinfo", "true")
					executeCommandHandler("showmyradar", "true")
				end, 3500, 1)
			end, 1000, 1)
		end
	end
end)

function RenderTopicImage()
	if guiGetProperty(BoardBG, "Visible") == "True" then
		dxDrawImage( (screenW - 360) / 2, (screenH - 248) / 2, 210, 127, SS )
	else
		removeEventHandler("onClientRender", root, RenderTopicImage)
		-- FIX: SS = nil only dropped the Lua reference; the dx texture stayed
		--      in video memory. Destroy it explicitly.
		if isElement(SS) then destroyElement(SS) end
		SS = nil
	end
end

function RenderNewsImage()
	if guiGetProperty(NewsBG, "Visible") == "True" then
		dxDrawImage( (screenW - 350) , (screenH - 60) / 2, 200, 123, SS )
	else
		removeEventHandler("onClientRender", root, RenderNewsImage)
		-- FIX: same texture leak as RenderTopicImage (see above).
		if isElement(SS) then destroyElement(SS) end
		SS = nil
	end
end

addEvent( "ShowTopic", true )
addEventHandler( "ShowTopic", localPlayer,
function ( Screen )
	if Screen then
		NowImage = Screen
		-- FIX: leaked the previous texture when this fired twice.
		if isElement(SS) then destroyElement(SS) end
		SS = dxCreateTexture( Screen )
		guiSetVisible(BoardBG, true)
		guiSetText ( NameLabel, ""..getPlayerName(getLocalPlayer()) )
		removeEventHandler( "onClientRender", root, RenderTopicImage ) -- FIX: prevent stacking duplicate handlers
		addEventHandler( "onClientRender", root, RenderTopicImage )
		showCursor(true)
	end
end)

addEvent( "ShowNewsPaper", true )
addEventHandler( "ShowNewsPaper", localPlayer,
function ( ReporterName , Screen , Matn )
	if ReporterName and Screen and Matn then
		NowImage = Screen
		guiSetVisible(NewsBG, true)
		-- FIX: leaked the previous texture on repeat broadcasts.
		if isElement(SS) then destroyElement(SS) end
		SS = dxCreateTexture( Screen )
		guiSetText( NewsLabel1 , ""..ReporterName..":\n"..Matn.."" )
		removeEventHandler( "onClientRender", root, RenderNewsImage ) -- FIX: prevent stacking duplicate handlers
		addEventHandler( "onClientRender", root, RenderNewsImage )
		setTimer(function()
			guiSetVisible(NewsBG, false)
		end, 30000, 1)
	end
end)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
    if source == BoardClose then
		guiSetVisible(BoardBG, false)
		showCursor( false )
	elseif source == Submit then
		triggerServerEvent( "SendTopicToServer", getLocalPlayer(), getLocalPlayer() , NowImage , guiGetText(BoardEdit) )
		guiSetVisible(BoardBG, false)
		showCursor( false )
	end
end)
