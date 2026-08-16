		
		local screenW, screenH = guiGetScreenSize()
        Background = guiCreateStaticImage((screenW - 1134) / 2, (screenH - 758) / 2, 1134, 758, "Files/Background.png", false)
		guiSetProperty(Background, "Visible", "false")
        Label_VCRPGJOBS = guiCreateLabel(380, 10, 374, 82, "FearZone - Job Center", false, Background)
        local font0_Font = guiCreateFont("Files/Font.ttf", 15)
        local font1_Font = guiCreateFont("Files/Font.ttf", 10)
        guiSetFont(Label_VCRPGJOBS, font0_Font)
        guiLabelSetHorizontalAlign(Label_VCRPGJOBS, "center", false)
        guiLabelSetVerticalAlign(Label_VCRPGJOBS, "center")
        Close_Button = guiCreateButton(408, 698, 318, 45, "Close", false, Background)
        guiSetProperty(Close_Button, "NormalTextColour", "FF839AB9")
        Scroll_Pane = guiCreateScrollPane((1134 - 1071) / 2, (758 - 606) / 2, 1071, 606, false, Background)

        

        FisherManPhoto = guiCreateStaticImage(44, 42, 493, 308, "Files/FisherMan.png", false, Scroll_Pane)
        Label_FisherMan = guiCreateLabel(44, 360, 493, 48, "Fisher Man", false, Scroll_Pane)
        guiSetFont(Label_FisherMan, font0_Font)
        guiLabelSetColor(Label_FisherMan, 245, 191, 3)
        guiLabelSetHorizontalAlign(Label_FisherMan, "center", false)
        guiLabelSetVerticalAlign(Label_FisherMan, "center")
        Label_FisherMan_Tozihat = guiCreateLabel(44, 408, 493, 100, "Dar in Job Shoma Bayad Ba Estefade Az Choob Mahi Giri Ba Ghayegh Be Manateq Mahi Giri Vaghe Dar Darya Beravid va Mahi Haei ra Baraye Khod Seyd Konid! Va Dar Akhar Mahi Haro Be Maghaze Dar Kenar Eskele Mahi Giri Befrooshid!", false, Scroll_Pane)
        guiSetFont(Label_FisherMan_Tozihat, font1_Font)
        guiLabelSetColor(Label_FisherMan_Tozihat, 47, 200, 169)
        guiLabelSetHorizontalAlign(Label_FisherMan_Tozihat, "center", true)
        guiLabelSetVerticalAlign(Label_FisherMan_Tozihat, "center")
        FisherMan_GPS = guiCreateButton(204, 513, 167, 52, "Select in GPS", false, Scroll_Pane)
        BusDriverPhoto = guiCreateStaticImage(553, 42, 493, 308, "Files/BusDriver.png", false, Scroll_Pane)
        Label_BusDriver = guiCreateLabel(553, 360, 493, 48, "Bus Driver", false, Scroll_Pane)
        guiSetFont(Label_BusDriver, font0_Font)
        guiLabelSetColor(Label_BusDriver, 245, 191, 3)
        guiLabelSetHorizontalAlign(Label_BusDriver, "center", false)
        guiLabelSetVerticalAlign(Label_BusDriver, "center")
        Label_BusDriver_Tozihat = guiCreateLabel(553, 408, 493, 100, "Dar in Job Shoma Bayad Manand Yek Ranande Bus Ra Beranid va Mosaferan Ra Savar Konid va be Maghsad Ha Beresanid va Pas az Residan Be Isgah Akhar Mablaq Dast Mozd Khod Ra Daryaft Konid!", false, Scroll_Pane)
        guiSetFont(Label_BusDriver_Tozihat, font1_Font)
        guiLabelSetColor(Label_BusDriver_Tozihat, 47, 200, 169)
        guiLabelSetHorizontalAlign(Label_BusDriver_Tozihat, "center", true)
        guiLabelSetVerticalAlign(Label_BusDriver_Tozihat, "center")
        BusDriver_GPS = guiCreateButton(718, 512, 167, 52, "Select in GPS", false, Scroll_Pane)
        PizzaBoyPhoto = guiCreateStaticImage(1061, 42, 493, 308, "Files/PizzaBoy.png", false, Scroll_Pane)
        Label_PizzaBoy = guiCreateLabel(1056, 360, 493, 48, "Pizza Boy", false, Scroll_Pane)
        guiSetFont(Label_PizzaBoy, font0_Font)
        guiLabelSetColor(Label_PizzaBoy, 245, 191, 3)
        guiLabelSetHorizontalAlign(Label_PizzaBoy, "center", false)
        guiLabelSetVerticalAlign(Label_PizzaBoy, "center")
        Label_PizzaBoy_Tozihat = guiCreateLabel(1056, 408, 493, 100, "Dar in Job Shoma Bayad Yek Peyk Motori Bashid Va Pizza Haye Kharidari Shode Tavasot Ahali Shahr ra Be Darb Manzel Hayeshan Beresanid va Pas az Tahvil Pizza Be Darb Manazel Pool Tahvil Pizza Ra Az Ahali Daryaft Konid!", false, Scroll_Pane)
        guiSetFont(Label_PizzaBoy_Tozihat, font1_Font)
        guiLabelSetColor(Label_PizzaBoy_Tozihat, 47, 200, 169)
        guiLabelSetHorizontalAlign(Label_PizzaBoy_Tozihat, "center", true)
        guiLabelSetVerticalAlign(Label_PizzaBoy_Tozihat, "center")
        PizzaBoy_GPS = guiCreateButton(1216, 513, 167, 52, "Select in GPS", false, Scroll_Pane)
        SodaDeliveryPhoto = guiCreateStaticImage(1570, 42, 493, 308, "Files/SodaDelivery.png", false, Scroll_Pane)
        Label_Soda = guiCreateLabel(1560, 350, 493, 48, "Soda Delivery", false, Scroll_Pane)
        guiSetFont(Label_Soda, font0_Font)
        guiLabelSetColor(Label_Soda, 245, 191, 3)
        guiLabelSetHorizontalAlign(Label_Soda, "center", false)
        guiLabelSetVerticalAlign(Label_Soda, "center")
        Label_Soda_Tozihat = guiCreateLabel(1570, 408, 493, 100, "Dar in Job Shoma Bayad Nooshabe haye Mored Niyaz Frooshgah ha Va Tamami Maghaze haye Server ra ke Niyaz Be Anha Darand ra Barayeshan az Karkhane Soda Sazi Be Darb Maghaze Hayeshan Beresanid va Pas az Tahvil Hazine Tahvil Anha Ra Daryaft Konid!", false, Scroll_Pane)
        guiSetFont(Label_Soda_Tozihat, font1_Font)
        guiLabelSetColor(Label_Soda_Tozihat, 47, 200, 169)
        guiLabelSetHorizontalAlign(Label_Soda_Tozihat, "center", true)
        guiLabelSetVerticalAlign(Label_Soda_Tozihat, "center")
        SodaDelivery_GPS = guiCreateButton(1722, 514, 167, 52, "Select in GPS", false, Scroll_Pane)
        TruckerPhoto = guiCreateStaticImage(2080, 42, 493, 308, "Files/Trucker.png", false, Scroll_Pane)
        Label_Trucker = guiCreateLabel(2073, 350, 493, 48, "Trucker", false, Scroll_Pane)
        guiSetFont(Label_Trucker, font0_Font)
        guiLabelSetColor(Label_Trucker, 245, 191, 3)
        guiLabelSetHorizontalAlign(Label_Trucker, "center", false)
        guiLabelSetVerticalAlign(Label_Trucker, "center")
        Label_Trucker_Tozihat = guiCreateLabel(2080, 408, 493, 100, "Dar in Job Shoma Bayad Bar Haei ke Niyaz be Tahvil Darand ra Bar Bezanid va Be Makan Mohskhas Shode Enteghal Dahid va Pas Az Enteghal Hazine Enteghal Bar ra Daryaft Namaeid!", false, Scroll_Pane)
        guiSetFont(Label_Trucker_Tozihat, font1_Font)
        guiLabelSetColor(Label_Trucker_Tozihat, 47, 200, 169)
        guiLabelSetHorizontalAlign(Label_Trucker_Tozihat, "center", true)
        guiLabelSetVerticalAlign(Label_Trucker_Tozihat, "center")
        Trucker_GPS = guiCreateButton(2242, 513, 167, 52, "Select in GPS", false, Scroll_Pane)
        StreetWasherPhoto = guiCreateStaticImage(2589, 42, 493, 308, "Files/StreetWasher.png", false, Scroll_Pane)
        Label_StreetWasher = guiCreateLabel(2594, 350, 493, 48, "Street Washer", false, Scroll_Pane)
        guiSetFont(Label_StreetWasher, font0_Font)
        guiLabelSetColor(Label_StreetWasher, 245, 191, 3)
        guiLabelSetHorizontalAlign(Label_StreetWasher, "center", false)
        guiLabelSetVerticalAlign(Label_StreetWasher, "center")
        Label_StreetWasher_Tozihat = guiCreateLabel(2589, 408, 493, 100, "Dar in Job Shoma Bayad ba Estefade az Mashin Sweeper Shahr ra Nezafat Konid va Pas Az Anjam Nezafat Shahr Mablaqi Az Taraf Shahrdari Baraye Nezafat Shahr Be Onvan Dastmozd Khod Daryaft Konid!", false, Scroll_Pane)
        guiSetFont(Label_StreetWasher_Tozihat, font1_Font)
        guiLabelSetColor(Label_StreetWasher_Tozihat, 47, 200, 169)
        guiLabelSetHorizontalAlign(Label_StreetWasher_Tozihat, "center", true)
        guiLabelSetVerticalAlign(Label_StreetWasher_Tozihat, "center")
        StreetWasher_GPS = guiCreateButton(2762, 514, 167, 52, "Select in GPS", false, Scroll_Pane)
        PostManPhoto = guiCreateStaticImage(3097, 42, 493, 308, "Files/Mihan.png", false, Scroll_Pane)
        Label_PostMan = guiCreateLabel(3102, 350, 493, 48, "KarKhoone Mihan", false, Scroll_Pane)
        guiSetFont(Label_PostMan, font0_Font)
        guiLabelSetColor(Label_PostMan, 245, 191, 3)
        guiLabelSetHorizontalAlign(Label_PostMan, "center", false)
        guiLabelSetVerticalAlign(Label_PostMan, "center")
        Label_PostMan_Tozihat = guiCreateLabel(3087, 408, 493, 100, "Dar In Job Mitavanid Be Sarasar Shahr Mahsolat Kar Khone  Ra Eraee Konid!", false, Scroll_Pane)
        guiSetFont(Label_PostMan_Tozihat, font1_Font)
        guiLabelSetColor(Label_PostMan_Tozihat, 47, 200, 169)
        guiLabelSetHorizontalAlign(Label_PostMan_Tozihat, "center", true)
        guiLabelSetVerticalAlign(Label_PostMan_Tozihat, "center")
        PostMan_GPS = guiCreateButton(3270, 513, 167, 52, "Select in GPS", false, Scroll_Pane)
        SoonPhoto = guiCreateStaticImage(3605, 42, 493, 308, "Files/Soon.png", false, Scroll_Pane)
        Label_Soon = guiCreateLabel(3595, 350, 493, 48, "Shoti Savar", false, Scroll_Pane)
        guiSetFont(Label_Soon, font0_Font)
        guiLabelSetColor(Label_Soon, 245, 191, 3)
        guiLabelSetHorizontalAlign(Label_Soon, "center", false)
        guiLabelSetVerticalAlign(Label_Soon, "center")
        Label_Soon_Tozihat = guiCreateLabel(3600, 408, 493, 100, "Dar In Jobs Shoma Mitavanid Jens Haye Ghachagh Ba Mashin Haye Shoti Ro Az Marz Kharej Konid Va Padash daryaft konid!!", false, Scroll_Pane)
        guiSetFont(Label_Soon_Tozihat, font1_Font)
        guiLabelSetColor(Label_Soon_Tozihat, 47, 200, 169)
        guiLabelSetHorizontalAlign(Label_Soon_Tozihat, "center", true)
        guiLabelSetVerticalAlign(Label_Soon_Tozihat, "center")
        Soon_GPS = guiCreateButton(3763, 514, 167, 52, "Select in GPS", false, Scroll_Pane)
		guiSetProperty(Background, "Visible", "false")
		
		GhavasManPhoto = guiCreateStaticImage(4160, 42, 493, 308, "Files/Ghavas.png", false, Scroll_Pane)
        Label_GhavasMan = guiCreateLabel(4150, 360, 493, 48, "Ghavasi", false, Scroll_Pane)
        guiSetFont(Label_GhavasMan, font0_Font)
        guiLabelSetColor(Label_GhavasMan, 245, 191, 3)
        guiLabelSetHorizontalAlign(Label_GhavasMan, "center", false)
        guiLabelSetVerticalAlign(Label_GhavasMan, "center")
        Label_GhavasMan_Tozihat = guiCreateLabel(4160, 408, 493, 100, "Dar In Job Shoma Bayad Item Jam Konid Az Kaf Darya Va Be Semsari Befroshid!!", false, Scroll_Pane)
        guiSetFont(Label_GhavasMan_Tozihat, font1_Font)
        guiLabelSetColor(Label_GhavasMan_Tozihat, 47, 200, 169)
        guiLabelSetHorizontalAlign(Label_GhavasMan_Tozihat, "center", true)
        guiLabelSetVerticalAlign(Label_GhavasMan_Tozihat, "center")
        GhavasMan_GPS = guiCreateButton(4350, 513, 167, 52, "Select in GPS", false, Scroll_Pane)
		NowGpsMarker = nil
		NowGpsBlip = nil
		NowGpsCol = nil

function ShowJobPanel(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
        local currentState = guiGetProperty(Background, "Visible", "false")
        if currentState == "False" then
			playSoundFrontEnd ( 1 )
            guiSetProperty(Background, "Visible", "True")
			showCursor(true)
        else
			playSoundFrontEnd ( 2 )
            guiSetProperty(Background, "Visible", "false")
			showCursor(false)
        end
	end
end
addEvent("ShowJobPanel",true)
addEventHandler("ShowJobPanel", root, ShowJobPanel)

function DestroyMarked( theElement, matchingDimension )
	if ( theElement == localPlayer ) then
		exports["notf"]:addNotification( "Shoma Be Maghsad Residid." , 'success')
		removeEventHandler( "onClientColShapeHit", NowGpsCol, DestroyMarked )
		destroyElement(NowGpsMarker)
		destroyElement(NowGpsBlip)
		destroyElement(NowGpsCol)
		NowGpsMarker = nil
		NowGpsBlip = nil
		NowGpsCol = nil
	end
end

function MarkTheJob( X , Y , Z )
	if NowGpsMarker then
		removeEventHandler( "onClientColShapeHit", NowGpsCol, DestroyMarked )
		destroyElement(NowGpsMarker)
		destroyElement(NowGpsBlip)
		destroyElement(NowGpsCol)
		NowGpsMarker = nil
		NowGpsBlip = nil
		NowGpsCol = nil
	end
	NowGpsMarker = createMarker(X,Y,Z-2,"checkpoint",2,255, 255, 0,200)
	NowGpsBlip = createBlipAttachedTo( NowGpsMarker, 56, 2, 255, 0, 0, 255,  0 , 65535 )
	setBlipVisibleDistance(NowGpsBlip, 16383)
	NowGpsCol = createColCircle( X , Y ,50)
	addEventHandler("onClientColShapeHit", NowGpsCol, DestroyMarked )
	exports["notf"]:addNotification( "Location Ba Movafaghiat Baraye Shoma Mark Shod!" , 'success')
end

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == Close_Button then
		guiSetProperty(Background, "Visible", "False")
		showCursor(false)
		playSoundFrontEnd ( 2 )
	elseif source == FisherMan_GPS then
		MarkTheJob( -2938.01171875 ,484.2080078125 ,4.9140625 )
		guiSetProperty(Background, "Visible", "False")
		showCursor(false)
	elseif source == BusDriver_GPS then
		MarkTheJob( 1652.3828125 ,-1896.525390625 ,13.552103996277 )
		guiSetProperty(Background, "Visible", "False")
		showCursor(false)
	elseif source == Trucker_GPS then
		MarkTheJob( -92.359375 ,-1135.755859375 ,1.160298824310 )
		guiSetProperty(Background, "Visible", "False")
		showCursor(false)
	elseif source == PizzaBoy_GPS then
		MarkTheJob( 2104.642578125 ,-1803.1650390625 ,13.5546875 )
		guiSetProperty(Background, "Visible", "False")
		showCursor(false)
	elseif source == SodaDelivery_GPS then
		MarkTheJob( -78.8515625 ,-1546.2919921875 ,3.0936317443848 )
		guiSetProperty(Background, "Visible", "False")
		showCursor(false)
	elseif source == StreetWasher_GPS then
		MarkTheJob( 1666.470703125 ,-1903.1435546875 ,13.546875 )
		guiSetProperty(Background, "Visible", "False")
		showCursor(false)
	elseif source == PostMan_GPS then
		MarkTheJob( 2787.1469726563 ,-2504.2954101563 ,13.984130859375 )
		guiSetProperty(Background, "Visible", "False")
		showCursor(false)
	elseif source == Soon_GPS then
		MarkTheJob( 1360.603515625 ,-1639.42578125 ,13.3828125 )
		guiSetProperty(Background, "Visible", "False")
		showCursor(false)
	elseif source == GhavasMan_GPS then
		MarkTheJob( -77.7841796875 ,-787.63317871094 ,9.455365180969 )
		guiSetProperty(Background, "Visible", "False")
		showCursor(false)
	end
end)
local screenW, screenH = guiGetScreenSize()
windowjob = guiCreateWindow((screenW - 342) / 2, (screenH - 338) / 2, 342, 338, "Jobs Location", false)
guiWindowSetSizable(windowjob, false)
guiSetProperty(windowjob, "CaptionColour", "FFFFFFFF")
image = guiCreateStaticImage(75,46,250,250,"files/bg.png",false, windowjob)
combo = guiCreateComboBox(9, 26, 324, 256, "Select Job", false, windowjob)
guiComboBoxAddItem ( combo, "Pizza Boy")--1
guiComboBoxAddItem ( combo, "Shoti")--2
guiComboBoxAddItem ( combo, "Ghavasi")--3
guiComboBoxAddItem ( combo, "Mahi Giri")--4
guiComboBoxAddItem ( combo, "Truker")--5
guiComboBoxAddItem ( combo, "Car Jack")--6

showbtn = guiCreateButton(241, 300, 85, 26, "Show Me", false, windowjob)
guiSetProperty(showbtn, "HoverTextColour", "FF00FF00" )
cancelbtn = guiCreateButton(15, 300, 85, 26, "Cancel", false, windowjob)
guiSetProperty(cancelbtn, "HoverTextColour", "FFFE0000" )

guiSetVisible(windowjob, false)

addEventHandler ( "onClientGUIClick", showbtn,function()
local selected = guiComboBoxGetSelected ( combo )
local x,y,z = nil, nil, nil
if isElement(mark) then
destroyElement(mark)
destroyElement(blip)
end
if selected == -1 then outputChatBox("#ff0000✖️ Yek Job Ra Entekhab Konid!",255,255,255,true)
elseif selected == 0 then --pizzaboy
x,y,z = 2105.48828125 ,-1806.5078125 ,13.5546875
elseif selected == 1 then --Shoti
x,y,z = 2449.5869140625 ,-1758.6845703125 ,13.592364311218
elseif selected == 2 then --Ghavasi
x,y,z = -67.605270385742 ,-767.39923095703 ,9.7328128814697
elseif selected == 3 then --Mahi Giri
x,y,z = 835.4443359375 ,-2056.3564453125 ,12.8671875
elseif selected == 4 then --Truker
x,y,z = -92.7822265625 ,-1135.4912109375 ,1.1927628517151
elseif selected == 5 then -- CarJack
x,y,z = 2155.47265625 ,-2299.6474609375 ,13.460076332092
else
    outputChatBox("#ff0000✖️ In Job Hanooz Faal Nashode! ",255,255,255,true)
end
if x then
mark = createMarker ( x,y, z, "checkpoint", 4.0, 236, 124, 1, 255 )
blip = createBlip ( x, y, z, 0, 2, 236, 124, 1, 255, 255, 99999 )
setElementData(blip, "exclusiveBlip", true)
guiSetVisible(windowjob, false)
showCursor(false)
outputChatBox(" Makan In Job Roye Map Neshan Dade Shod.", 236, 124, 1,true)
end
end, false )

addEventHandler ( "onClientGUIClick", cancelbtn,function()
guiSetVisible(windowjob, false)
showCursor(false)
end, false )

addCommandHandler("jobs", function()

guiSetVisible(windowjob, true)
showCursor(true)
end )

function markresidam(player)
if player == localPlayer and source == mark then
outputChatBox(" Be Makan Mark Shode Residid.", 236, 124, 1,true)
destroyElement(mark)
destroyElement(blip)
end
end
addEventHandler("onClientMarkerHit", getResourceRootElement(getThisResource()), markresidam)
