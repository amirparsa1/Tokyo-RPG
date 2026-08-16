addEventHandler("onClientResourceStart", resourceRoot,
function()

  --------- Panel Game Net ---------
local font = guiCreateFont("Data/TREBUCBD.ttf", 13)
local font5 = guiCreateFont("Data/TREBUCBD.ttf", 10)
local font2 = guiCreateFont("Data/TREBUCBD.ttf", 10)
local font3 = guiCreateFont("Data/GOTHIC.ttf", 15)
local font4 = guiCreateFont("Data/GOTHIC.ttf", 16)
local screenW, screenH = guiGetScreenSize()



addEvent("PlayPwinner",true)
addEventHandler("PlayPwinner",getLocalPlayer(),function(player)
		sound = playSound("Data/Winner.wav",false)
		setSoundVolume(sound,0.4)
end)



Window = guiCreateWindow(350, 220, 650, 300, "PaintBall", false)
guiSetProperty(Window, "Visible", "False")
guiWindowSetSizable(Window, false)
bg = guiCreateStaticImage(5, 25, 650, 300, "Data/bg.png", false, Window)
Game1 = guiCreateStaticImage(37, 47, 140, 140, "Data/paintball.png", false, bg)
Game2 = guiCreateStaticImage(237, 47, 140, 140, "Data/paintball.png", false, bg)
Game3 = guiCreateStaticImage(437, 31, 160, 160, "Data/paintball1.png", false, bg)
---------
Gamel1 = guiCreateLabel(55, 190, 150, 50, "Coming Soon!", false, bg)
Gamel2 = guiCreateLabel(257, 190, 150, 50, "Coming Soon!", false, bg)
Gamel3 = guiCreateLabel(482, 190, 150, 50, "Paintball", false, bg)
guiLabelSetColor(Gamel1,160 , 160 , 160 )
guiLabelSetColor(Gamel2,160 , 160 , 160 )
guiSetFont(Gamel1, font)
guiSetFont(Gamel2, font)
guiSetFont(Gamel3, font)
--------
CloseButton = guiCreateButton(600, 5, 25, 25, "X", false, bg)
guiSetFont(CloseButton, font2)
guiSetProperty(CloseButton, "HoverTextColour", "FFFE0000")

		
  --------- Panel Avali Paintball ---------		
  
  Window2 = guiCreateWindow(470, 250, 400, 210, "Paintball", false)
  bg2 = guiCreateStaticImage(5, 25, 400, 210, "Data/bgp.png", false, Window2)
  guiWindowSetSizable(Window2, false)
  guiSetProperty(Window2, "Visible", "False")
  ----------
  Tozih = guiCreateLabel(20, 10, 320, 150, "  Baraye Sakhte Match Jadid Az [Create]\n   Va Baraye Vared Shodan Be Matche\n      Digaran Az [Join] Estefade Konid.", false, bg2)
  guiSetFont(Tozih, font)
  Hazine = guiCreateLabel(130, 80, 250, 50, "Hazine Create: $1500\n   Hazine Join: $800", false, bg2)
  guiSetFont(Hazine, font5)
  guiLabelSetColor(Hazine, 255 , 216 , 45)
  ---------
  pbJoinButton = guiCreateButton(10, 120, 175, 45, "Join", false, bg2)
  guiSetProperty(pbJoinButton, "HoverTextColour", "FF00FF00")
  pbStart = guiCreateButton(190, 120, 175, 45, "Create", false, bg2)
  guiSetProperty(pbStart, "HoverTextColour", "FF00FFFF")
  pbCloseButton = guiCreateButton(351, 5, 25, 25, "X", false, bg2)
  guiSetFont(pbCloseButton, font2)
  guiSetProperty(pbCloseButton, "HoverTextColour", "FFFE0000")
  guiSetFont(pbCloseButton, pbCloseButton)
  guiSetFont(pbJoinButton, font3)
  guiSetFont(pbStart, font3)

  -------------- Panel Entekhabe Map ---------------
  
  Window3 = guiCreateWindow(345, 110, 650, 480, "Entekhabe Map", false)
  guiWindowSetSizable(Window3, false)
  guiSetProperty(Window3, "Visible", "False")
 
  Map1 = guiCreateStaticImage(16, 27, 140, 80, "Data/Map1.png", false, Window3)
  Map11 = guiCreateStaticImage(16, 27, 140, 80, "Data/Map11.png", false, Window3)
  guiSetProperty(Map11, "Visible", "False")
  Map2 = guiCreateStaticImage(177, 27, 140, 80, "Data/Map2.png", false, Window3)
  Map22 = guiCreateStaticImage(177, 27, 140, 80, "Data/Map22.png", false, Window3)
  guiSetProperty(Map22, "Visible", "False")
  Map3 = guiCreateStaticImage(336, 27, 140, 80, "Data/Map3.png", false, Window3)
  Map33 = guiCreateStaticImage(336, 27, 140, 80, "Data/Map33.png", false, Window3)
  guiSetProperty(Map33, "Visible", "False")
  Map4 = guiCreateStaticImage(494, 27, 140, 80, "Data/Map4.png", false, Window3)
  Map44 = guiCreateStaticImage(494, 27, 140, 80, "Data/Map44.png", false, Window3)
  guiSetProperty(Map44, "Visible", "False")
---------
Map5 = guiCreateStaticImage(494, 130, 140, 80, "Data/Map5.png", false, Window3)
  Map55 = guiCreateStaticImage(494, 130, 140, 80, "Data/Map55.png", false, Window3)
  guiSetProperty(Map55, "Visible", "False")

	 Map6 = guiCreateStaticImage(494, 230, 140, 80, "Data/Mapsoon.png", false, Window3)
	 Map7 = guiCreateStaticImage(494, 330, 140, 80, "Data/Mapsoon.png", false, Window3)
--------
  Mapentekhabi = guiCreateStaticImage(16, 128, 461, 283, "Data/entekhabemap.png", false, Window3)
  
 -------------
  Next = guiCreateButton(493, 420, 145, 45, "Next", false, Window3)
  guiSetProperty(Next, "HoverTextColour", "FF00FF00")
  
  Time = guiCreateLabel(178, 430, 150, 50, "Time (Min):", false, Window3)
  guiSetFont(Time, font)
 
  Time1 = guiCreateStaticImage(282, 428, 35, 30, "Data/Time1.png", false, Window3)
    Time2 = guiCreateStaticImage(340, 428, 35, 30, "Data/Time2.png", false, Window3)
	Time3 = guiCreateStaticImage(402, 428, 35, 30, "Data/Time3.png", false, Window3)
	Time11 = guiCreateStaticImage(282, 428, 35, 30, "Data/Time11.png", false, Window3)
    Time22 = guiCreateStaticImage(340, 428, 35, 30, "Data/Time22.png", false, Window3)
	Time33	= guiCreateStaticImage(402, 428, 35, 30, "Data/Time33.png", false, Window3)
	
   guiSetProperty(Time11, "Visible", "False")
   guiSetProperty(Time22, "Visible", "False")
   guiSetProperty(Time33, "Visible", "False")
	   
  MapBack = guiCreateButton( 14, 420, 145, 45, "Back", false, Window3)
  guiSetProperty(MapBack, "HoverTextColour", "FFFE0000")
  guiSetFont(Next, font3)
  guiSetFont(MapBack, font3)
  
  
  -------------- Panel Entekhabe Gun ---------------
  
  Window4 = guiCreateWindow(385, 190, 548, 330, "Entekhabe Aslahe", false)
  guiWindowSetSizable(Window4, false)
  guiSetProperty(Window4, "Visible", "False")
  
  Gun1 = guiCreateStaticImage(15, 25, 125, 125, "Data/ak47.png", false, Window4)
  Gun2 = guiCreateStaticImage(146, 25, 125, 125, "Data/M4.png", false, Window4)
  Gun3 = guiCreateStaticImage(278, 25, 125, 125, "Data/mp5.png", false, Window4)
  Gun4 = guiCreateStaticImage(409, 25, 125, 125, "Data/SNIPER.png", false, Window4)
  Gun5 = guiCreateStaticImage(15, 150, 125, 125, "Data/Spaz.png", false, Window4)
  Gun6 = guiCreateStaticImage(146, 150, 125, 125, "Data/desert.png", false, Window4)
  Gun7 = guiCreateStaticImage(278, 150, 125, 125, "Data/rifle.png", false, Window4)
  Gun8 = guiCreateStaticImage(409, 150, 125, 125, "Data/tec9.png", false, Window4)
  
  Gun11 = guiCreateStaticImage(15, 25, 125, 125, "Data/ak472.png", false, Window4)
  Gun22 = guiCreateStaticImage(146, 25, 125, 125, "Data/M42.png", false, Window4)
  Gun33 = guiCreateStaticImage(278, 25, 125, 125, "Data/mp52.png", false, Window4)
  Gun44 = guiCreateStaticImage(409, 25, 125, 125, "Data/SNIPER2.png", false, Window4)
  Gun55 = guiCreateStaticImage(15, 150, 125, 125, "Data/Spaz2.png", false, Window4)
  Gun66 = guiCreateStaticImage(146, 150, 125, 125, "Data/desert2.png", false, Window4)
  Gun77 = guiCreateStaticImage(278, 150, 125, 125, "Data/rifle2.png", false, Window4)
  Gun88 = guiCreateStaticImage(409, 150, 125, 125, "Data/tec92.png", false, Window4)
  
 guiSetProperty(Gun11, "Visible", "False")
  guiSetProperty(Gun22, "Visible", "False")
   guiSetProperty(Gun33, "Visible", "False")
    guiSetProperty(Gun44, "Visible", "False")
	 guiSetProperty(Gun55, "Visible", "False")
	  guiSetProperty(Gun66, "Visible", "False")
	   guiSetProperty(Gun77, "Visible", "False")
	    guiSetProperty(Gun88, "Visible", "False")

  Confirm = guiCreateButton(410, 278, 125, 40, "Confirm", false, Window4)
  guiSetProperty(Confirm, "HoverTextColour", "FF00FF00")

  GunBack = guiCreateButton( 15, 278, 125, 40, "Back", false, Window4)
  guiSetProperty(GunBack, "HoverTextColour", "FFFE0000")
  GunCancel = guiCreateButton( 212, 278, 125, 40, "Cancel", false, Window4)
  guiSetProperty(GunCancel, "HoverTextColour", "FFFE0000")
  guiSetFont(Confirm, font3)
  guiSetFont(GunCancel, font3)
  guiSetFont(GunBack, font3)
  
  
end
)

showCursor(false)

function PaintBallRoBazKon(root)
	if root == getLocalPlayer() then
		if getElementData(root, "loggedIn") == true then
		local WindowGa = guiGetProperty(Window, "Visible")
		    if WindowGa == "False" then
            guiSetProperty(Window, "Visible", "True")
            showCursor(true)
			else
			guiSetProperty(Window, "Visible", "False")
			end
		end
	end
end
addEvent("PaintBallRoBazKon",true)
addEventHandler("PaintBallRoBazKon", root, PaintBallRoBazKon)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == CloseButton then
		guiSetProperty(Window, "Visible", "False")
        showCursor(false)
        setElementData(getLocalPlayer(), "pbMap", nil)
	    sound = playSound("Data/error.mp3",false)
		setSoundVolume(sound,0.9)
	elseif source == GunCancel then
        guiSetProperty(Window4, "Visible", "False")
		guiSetProperty(Gun11, "Visible", "False")
		guiSetProperty(Gun22, "Visible", "False")
        guiSetProperty(Gun33, "Visible", "False")
        guiSetProperty(Gun44, "Visible", "False")
	    guiSetProperty(Gun55, "Visible", "False")
	    guiSetProperty(Gun66, "Visible", "False")
	    guiSetProperty(Gun77, "Visible", "False")
		guiSetProperty(Gun88, "Visible", "False")
		guiSetProperty(Gun1, "Visible", "True")
		guiSetProperty(Gun2, "Visible", "True")
        guiSetProperty(Gun3, "Visible", "True")
        guiSetProperty(Gun4, "Visible", "True")
	    guiSetProperty(Gun5, "Visible", "True")
	    guiSetProperty(Gun6, "Visible", "True")
	    guiSetProperty(Gun7, "Visible", "True")
		guiSetProperty(Gun8, "Visible", "True")
		sound = playSound("Data/error.mp3",false)
		setSoundVolume(sound,0.9)
		showCursor(false)
		setElementData(getLocalPlayer(), "pbMap", nil)
		setElementData(getLocalPlayer(), "pbGunSet", nil)
		
	elseif source == Game3 then
	
        guiSetProperty(Window, "Visible", "False")
		guiSetProperty(Window2, "Visible", "True")
		sound = playSound("Data/click.mp3",false)
		setSoundVolume(sound,0.9)
		
	elseif source == Next then
	
		
			
			if getElementData(getLocalPlayer(), "pbMap") == 1 or getElementData(getLocalPlayer(), "pbMap") == 2 or getElementData(getLocalPlayer(), "pbMap") == 3 or getElementData(getLocalPlayer(), "pbMap") == 4 or getElementData(getLocalPlayer(), "pbMap") == 5  then
				if getElementData(getLocalPlayer(), "pbTime") == 180000 or getElementData(getLocalPlayer(), "pbTime") == 360000 or getElementData(getLocalPlayer(), "pbTime") == 600000 then
					exports["notf"]:addNotification("Lotfan Yek Aslahe Entekhab Konid.", 'info')
					sound = playSound("Data/info.mp3",false)
					setSoundVolume(sound,0.3)
					setElementData(getLocalPlayer(), "pbGunSet", nil)
					guiSetProperty(Gun11, "Visible", "False")
					guiSetProperty(Gun22, "Visible", "False")
					guiSetProperty(Gun33, "Visible", "False")
					guiSetProperty(Gun44, "Visible", "False")
					guiSetProperty(Gun55, "Visible", "False")
					guiSetProperty(Gun66, "Visible", "False")
					guiSetProperty(Gun77, "Visible", "False")
					guiSetProperty(Gun88, "Visible", "False")
					
					guiSetProperty(Gun1, "Visible", "True")
					guiSetProperty(Gun2, "Visible", "True")
					guiSetProperty(Gun3, "Visible", "True")
					guiSetProperty(Gun4, "Visible", "True")
					guiSetProperty(Gun5, "Visible", "True")
					guiSetProperty(Gun6, "Visible", "True")
					guiSetProperty(Gun7, "Visible", "True")
					guiSetProperty(Gun8, "Visible", "True")
					
					guiSetProperty(Window, "Visible", "False")
					guiSetProperty(Window2, "Visible", "False")
					guiSetProperty(Window3, "Visible", "False")
					guiSetProperty(Window4, "Visible", "True")
					sound = playSound("Data/click.mp3",false)
					setSoundVolume(sound,0.9)
				else
					sound = playSound("Data/errorp.mp3",false)
					setSoundVolume(sound,0.3)
					exports["notf"]:addNotification("Lotfan Time Paintball Ra Moshakhas Konid!", 'error')
				end

		else
			sound = playSound("Data/errorp.mp3",false)
			setSoundVolume(sound,0.3)
			exports["notf"]:addNotification("Lotfan Yek Map Entekhab Konid!", 'error')
		end
	
		
	elseif source == MapBack then
	    setElementData(getLocalPlayer(), "pbMap", nil)
		setElementData(getLocalPlayer(), "pbGunSet", nil)
		setElementData(getLocalPlayer(), "pbTime", nil)
		guiSetProperty(Time33, "Visible", "False")
		guiSetProperty(Time22, "Visible", "False")
		guiSetProperty(Time11, "Visible", "False")
        guiSetProperty(Window, "Visible", "False")
		guiSetProperty(Window2, "Visible", "True")
		guiSetProperty(Window3, "Visible", "False")
		guiSetProperty(Time3, "Visible", "True")
		guiSetProperty(Time2, "Visible", "True")
		guiSetProperty(Time1, "Visible", "True")
		sound = playSound("Data/error.mp3",false)
		setSoundVolume(sound,0.9)
		
	elseif source == GunBack then
        guiSetProperty(Window, "Visible", "False")
		guiSetProperty(Window2, "Visible", "False")
		guiSetProperty(Window3, "Visible", "True")
		guiSetProperty(Window4, "Visible", "False")
		guiSetProperty(Gun11, "Visible", "False")
		guiSetProperty(Gun22, "Visible", "False")
        guiSetProperty(Gun33, "Visible", "False")
        guiSetProperty(Gun44, "Visible", "False")
	    guiSetProperty(Gun55, "Visible", "False")
	    guiSetProperty(Gun66, "Visible", "False")
	    guiSetProperty(Gun77, "Visible", "False")
		guiSetProperty(Gun88, "Visible", "False")
		guiSetProperty(Gun1, "Visible", "True")
		guiSetProperty(Gun2, "Visible", "True")
        guiSetProperty(Gun3, "Visible", "True")
        guiSetProperty(Gun4, "Visible", "True")
	    guiSetProperty(Gun5, "Visible", "True")
	    guiSetProperty(Gun6, "Visible", "True")
	    guiSetProperty(Gun7, "Visible", "True")
		guiSetProperty(Gun8, "Visible", "True")
		sound = playSound("Data/error.mp3",false)
		setSoundVolume(sound,0.9)
		setElementData(getLocalPlayer(), "pbGunSet", nil)
		
	elseif source == pbStart then
	if tonumber(getPlayerWantedLevel (getLocalPlayer())) == 0 then
	   setElementData(getLocalPlayer(), "pbMap", nil)
		setElementData(getLocalPlayer(), "pbGunSet", nil)
		setElementData(getLocalPlayer(), "pbTime", nil)
		guiSetProperty(Time33, "Visible", "False")
		guiSetProperty(Time22, "Visible", "False")
		guiSetProperty(Time11, "Visible", "False")
		guiSetProperty(Time3, "Visible", "True")
		guiSetProperty(Time2, "Visible", "True")
		guiSetProperty(Time1, "Visible", "True")
		exports["notf"]:addNotification("Lotfan Map Va Time Paintball Ra Moshakhas Konid.", 'info')
		sound = playSound("Data/info.mp3",false)
					setSoundVolume(sound,0.3)
	    guiStaticImageLoadImage ( Mapentekhabi, "Data/entekhabemap.png" )
		guiSetProperty(Map22, "Visible", "False")
		guiSetProperty(Map33, "Visible", "False")
		guiSetProperty(Map44, "Visible", "False")
		guiSetProperty(Map11, "Visible", "False")
		guiSetProperty(Map2, "Visible", "True")
		guiSetProperty(Map3, "Visible", "True")
		guiSetProperty(Map4, "Visible", "True")
		guiSetProperty(Map1, "Visible", "True")
        guiSetProperty(Window, "Visible", "False")
		guiSetProperty(Window2, "Visible", "False")
		guiSetProperty(Window3, "Visible", "True")
		guiSetProperty(Mapentekhabi, "Visible", "True")
		guiSetProperty(Map55, "Visible", "False")
		guiSetProperty(Map5, "Visible", "True")
		sound = playSound("Data/click.mp3",false)
		setSoundVolume(sound,0.9)
	else
		exports["notf"]:addNotification("Ba Wanted Nemishe Create Match Kard!", 'error')
		sound = playSound("Data/errorp.mp3",false)
		setSoundVolume(sound,0.9)
	end
	elseif source == pbCloseButton then
        guiSetProperty(Window2, "Visible", "False")
        showCursor(false)
        setElementData(getLocalPlayer(), "pbMap", nil)
	    sound = playSound("Data/error.mp3",false)
		setSoundVolume(sound,0.9)
	
	
	--------------------------------------------
	elseif source == Time1 then
    setElementData(getLocalPlayer(), "pbTime", 180000)
    guiSetProperty(Time11, "Visible", "True")
    guiSetProperty(Time2, "Visible", "True")
	guiSetProperty(Time3, "Visible", "True")
    guiSetProperty(Time1, "Visible", "False")
    guiSetProperty(Time22, "Visible", "False")
    guiSetProperty(Time33, "Visible", "False")
   
	elseif source == Time2 then
    setElementData(getLocalPlayer(), "pbTime", 360000)
	guiSetProperty(Time22, "Visible", "True")
	guiSetProperty(Time1, "Visible", "True")
	guiSetProperty(Time3, "Visible", "True")
    guiSetProperty(Time2, "Visible", "False")
    guiSetProperty(Time11, "Visible", "False")
    guiSetProperty(Time33, "Visible", "False")
	
    elseif source == Time3 then
	setElementData(getLocalPlayer(), "pbTime", 600000)
	guiSetProperty(Time33, "Visible", "True")
	guiSetProperty(Time1, "Visible", "True")
	guiSetProperty(Time2, "Visible", "True")
    guiSetProperty(Time3, "Visible", "False")
    guiSetProperty(Time22, "Visible", "False")
    
	
   ---------------------------------------------
	
	
    elseif source == Gun1 then
       -- exports["notf"]:addNotification("AK47 Baraye Paintball Set Shod!", 'success')
		setElementData(getLocalPlayer(), "pbGunSet", 30)
		--sound = playSound("Data/movafagh.mp3",false)
		--setSoundVolume(sound,0.1)
		guiSetProperty(Gun1, "Visible", "False")
		guiSetProperty(Gun11, "Visible", "True")
		guiSetProperty(Gun2, "Visible", "True")
        guiSetProperty(Gun3, "Visible", "True")
        guiSetProperty(Gun4, "Visible", "True")
	    guiSetProperty(Gun5, "Visible", "True")
	    guiSetProperty(Gun6, "Visible", "True")
	    guiSetProperty(Gun7, "Visible", "True")
	    guiSetProperty(Gun8, "Visible", "True")
		guiSetProperty(Gun22, "Visible", "False")
		guiSetProperty(Gun33, "Visible", "False")
		guiSetProperty(Gun44, "Visible", "False")
		guiSetProperty(Gun55, "Visible", "False")
		guiSetProperty(Gun66, "Visible", "False")
		guiSetProperty(Gun77, "Visible", "False")
	    guiSetProperty(Gun88, "Visible", "False")
	
	elseif source == Gun2 then
        
		setElementData(getLocalPlayer(), "pbGunSet", 31)
		guiSetProperty(Gun2, "Visible", "False")
		guiSetProperty(Gun22, "Visible", "True")
		guiSetProperty(Gun11, "Visible", "False")
		guiSetProperty(Gun1, "Visible", "True")
		guiSetProperty(Gun3, "Visible", "True")
		guiSetProperty(Gun4, "Visible", "True")
		guiSetProperty(Gun5, "Visible", "True")
		guiSetProperty(Gun6, "Visible", "True")
		guiSetProperty(Gun7, "Visible", "True")
	    guiSetProperty(Gun8, "Visible", "True")
		guiSetProperty(Gun33, "Visible", "False")
		guiSetProperty(Gun44, "Visible", "False")
		guiSetProperty(Gun55, "Visible", "False")
		guiSetProperty(Gun66, "Visible", "False")
	   guiSetProperty(Gun77, "Visible", "False")
	    guiSetProperty(Gun88, "Visible", "False")
    elseif source == Gun3 then

		setElementData(getLocalPlayer(), "pbGunSet", 29)

		guiSetProperty(Gun3, "Visible", "False")
		guiSetProperty(Gun33, "Visible", "True")
		guiSetProperty(Gun11, "Visible", "False")
		guiSetProperty(Gun1, "Visible", "True")
		guiSetProperty(Gun2, "Visible", "True")
		guiSetProperty(Gun4, "Visible", "True")
		guiSetProperty(Gun5, "Visible", "True")
		guiSetProperty(Gun6, "Visible", "True")
		guiSetProperty(Gun7, "Visible", "True")
	    guiSetProperty(Gun8, "Visible", "True")
		guiSetProperty(Gun22, "Visible", "False")
		guiSetProperty(Gun44, "Visible", "False")
		guiSetProperty(Gun55, "Visible", "False")
		guiSetProperty(Gun66, "Visible", "False")
		guiSetProperty(Gun77, "Visible", "False")
	    guiSetProperty(Gun88, "Visible", "False")
		
    elseif source == Gun4 then
       
		setElementData(getLocalPlayer(), "pbGunSet", 34)
        guiSetProperty(Gun4, "Visible", "False")
		guiSetProperty(Gun44, "Visible", "True")
		guiSetProperty(Gun11, "Visible", "False")
		guiSetProperty(Gun1, "Visible", "True")
		guiSetProperty(Gun3, "Visible", "True")
		guiSetProperty(Gun2, "Visible", "True")
		guiSetProperty(Gun5, "Visible", "True")
		guiSetProperty(Gun6, "Visible", "True")
		guiSetProperty(Gun7, "Visible", "True")
	    guiSetProperty(Gun8, "Visible", "True")
		guiSetProperty(Gun22, "Visible", "False")
		guiSetProperty(Gun33, "Visible", "False")
        guiSetProperty(Gun55, "Visible", "False")
		guiSetProperty(Gun66, "Visible", "False")
		guiSetProperty(Gun77, "Visible", "False")
	    guiSetProperty(Gun88, "Visible", "False")
		
    elseif source == Gun5 then
        setElementData(getLocalPlayer(), "pbGunSet", 27)
		guiSetProperty(Gun5, "Visible", "False")
		guiSetProperty(Gun55, "Visible", "True")
		guiSetProperty(Gun11, "Visible", "False")
		guiSetProperty(Gun1, "Visible", "True")
		guiSetProperty(Gun3, "Visible", "True")
		guiSetProperty(Gun4, "Visible", "True")
		guiSetProperty(Gun2, "Visible", "True")
		guiSetProperty(Gun6, "Visible", "True")
		guiSetProperty(Gun7, "Visible", "True")
	    guiSetProperty(Gun8, "Visible", "True")
		guiSetProperty(Gun22, "Visible", "False")
		guiSetProperty(Gun33, "Visible", "False")
		guiSetProperty(Gun44, "Visible", "False")
		guiSetProperty(Gun66, "Visible", "False")
		guiSetProperty(Gun77, "Visible", "False")
	    guiSetProperty(Gun88, "Visible", "False")
		
    elseif source == Gun6 then

		setElementData(getLocalPlayer(), "pbGunSet", 24)
		guiSetProperty(Gun6, "Visible", "False")
		guiSetProperty(Gun66, "Visible", "True")
		guiSetProperty(Gun11, "Visible", "False")
		guiSetProperty(Gun1, "Visible", "True")
		guiSetProperty(Gun3, "Visible", "True")
		guiSetProperty(Gun4, "Visible", "True")
		guiSetProperty(Gun5, "Visible", "True")
		guiSetProperty(Gun2, "Visible", "True")
		guiSetProperty(Gun7, "Visible", "True")
	    guiSetProperty(Gun8, "Visible", "True")
		guiSetProperty(Gun22, "Visible", "False")
		guiSetProperty(Gun33, "Visible", "False")
		guiSetProperty(Gun44, "Visible", "False")
		guiSetProperty(Gun55, "Visible", "False")
		guiSetProperty(Gun77, "Visible", "False")
		guiSetProperty(Gun88, "Visible", "False")
		
    elseif source == Gun7 then
        
		setElementData(getLocalPlayer(), "pbGunSet", 33)
		guiSetProperty(Gun7, "Visible", "False")
		guiSetProperty(Gun77, "Visible", "True")
		guiSetProperty(Gun11, "Visible", "False")
		guiSetProperty(Gun1, "Visible", "True")
		guiSetProperty(Gun3, "Visible", "True")
		guiSetProperty(Gun4, "Visible", "True")
		guiSetProperty(Gun5, "Visible", "True")
		guiSetProperty(Gun6, "Visible", "True")
		guiSetProperty(Gun2, "Visible", "True")
		guiSetProperty(Gun8, "Visible", "True")
		guiSetProperty(Gun22, "Visible", "False")
		guiSetProperty(Gun33, "Visible", "False")
		guiSetProperty(Gun44, "Visible", "False")
		guiSetProperty(Gun55, "Visible", "False")
		guiSetProperty(Gun66, "Visible", "False")
	    guiSetProperty(Gun88, "Visible", "False")
		
    elseif source == Gun8 then
       
		setElementData(getLocalPlayer(), "pbGunSet", 32)
		guiSetProperty(Gun8, "Visible", "False")
		guiSetProperty(Gun88, "Visible", "True")
		guiSetProperty(Gun11, "Visible", "False")
	    guiSetProperty(Gun1, "Visible", "True")
        guiSetProperty(Gun3, "Visible", "True")
        guiSetProperty(Gun4, "Visible", "True")
	    guiSetProperty(Gun5, "Visible", "True")
	    guiSetProperty(Gun6, "Visible", "True")
	    guiSetProperty(Gun7, "Visible", "True")
	    guiSetProperty(Gun2, "Visible", "True")
        guiSetProperty(Gun22, "Visible", "False")
        guiSetProperty(Gun33, "Visible", "False")
        guiSetProperty(Gun44, "Visible", "False")
	    guiSetProperty(Gun55, "Visible", "False")
	    guiSetProperty(Gun66, "Visible", "False")
	    guiSetProperty(Gun77, "Visible", "False")



		
	elseif source == Map1 then
        guiStaticImageLoadImage ( Mapentekhabi, "Data/Mapasli1.png" )
        setElementData(getLocalPlayer(), "pbMap", 1)
		guiSetProperty(Map1, "Visible", "False")
		guiSetProperty(Map11, "Visible", "True")
		guiSetProperty(Map4, "Visible", "True")
		guiSetProperty(Map2, "Visible", "True")
		guiSetProperty(Map3, "Visible", "True")
		guiSetProperty(Map55, "Visible", "False")
		guiSetProperty(Map5, "Visible", "True")
		guiSetProperty(Map22, "Visible", "False")
		guiSetProperty(Map33, "Visible", "False")
		guiSetProperty(Map44, "Visible", "False")
	elseif source == Map2 then
        guiStaticImageLoadImage ( Mapentekhabi, "Data/Mapasli2.png" )
        setElementData(getLocalPlayer(), "pbMap", 2)
		guiSetProperty(Map2, "Visible", "False")
		guiSetProperty(Map1, "Visible", "True")
		guiSetProperty(Map4, "Visible", "True")
		guiSetProperty(Map55, "Visible", "False")
		guiSetProperty(Map5, "Visible", "True")
		guiSetProperty(Map3, "Visible", "True")
		guiSetProperty(Map11, "Visible", "False")
		guiSetProperty(Map22, "Visible", "True")
		guiSetProperty(Map33, "Visible", "False")
		guiSetProperty(Map44, "Visible", "False")
		
	elseif source == Map3 then
        guiStaticImageLoadImage ( Mapentekhabi, "Data/Mapasli3.png" )
		guiSetProperty(Map3, "Visible", "False")
		guiSetProperty(Map2, "Visible", "True")
		guiSetProperty(Map4, "Visible", "True")
		guiSetProperty(Map1, "Visible", "True")
		guiSetProperty(Map11, "Visible", "False")
		guiSetProperty(Map22, "Visible", "False")
		guiSetProperty(Map55, "Visible", "False")
		guiSetProperty(Map5, "Visible", "True")
		guiSetProperty(Map33, "Visible", "True")
		guiSetProperty(Map44, "Visible", "False")
        setElementData(getLocalPlayer(), "pbMap", 3)
	elseif source == Map4 then
        guiStaticImageLoadImage ( Mapentekhabi, "Data/Mapasli4.png" )
		guiSetProperty(Map4, "Visible", "False")
		guiSetProperty(Map11, "Visible", "False")
		guiSetProperty(Map1, "Visible", "True")
		guiSetProperty(Map2, "Visible", "True")
		guiSetProperty(Map3, "Visible", "True")
		guiSetProperty(Map22, "Visible", "False")
		guiSetProperty(Map33, "Visible", "False")
		guiSetProperty(Map55, "Visible", "False")
		guiSetProperty(Map5, "Visible", "True")
		guiSetProperty(Map44, "Visible", "True")
        setElementData(getLocalPlayer(), "pbMap", 4)
		
	elseif source == Map5 then
        guiStaticImageLoadImage ( Mapentekhabi, "Data/Mapasli5.png" )
		guiSetProperty(Map5, "Visible", "False")
		guiSetProperty(Map11, "Visible", "False")
		guiSetProperty(Map1, "Visible", "True")
		guiSetProperty(Map2, "Visible", "True")
		guiSetProperty(Map3, "Visible", "True")
		guiSetProperty(Map4, "Visible", "True")
		guiSetProperty(Map44, "Visible", "False")
		guiSetProperty(Map22, "Visible", "False")
		guiSetProperty(Map33, "Visible", "False")
		guiSetProperty(Map55, "Visible", "True")
        setElementData(getLocalPlayer(), "pbMap", 5)
   
    elseif source == pbJoinButton then
        triggerServerEvent("onClientClickedJoin", getLocalPlayer(), getLocalPlayer() )
    elseif source == Confirm then
	guiSetProperty(Window, "Visible", "False")
        triggerServerEvent("onClientClickedCreate", getLocalPlayer(), getLocalPlayer() )

	end
end)




-- Baste Shodane Panel Baraye Kasi KE Create Kard
function paintBallRoBeband(root)
    if root == getLocalPlayer() then

        guiSetProperty(Window4, "Visible", "False")
		guiSetProperty(Window2, "Visible", "False")
        showCursor(false)
        setElementData(getLocalPlayer(), "pbMap", nil)
        setElementData(getLocalPlayer(), "pbGunSet", nil)
	end
end
addEvent("pbForceClose",true)
addEventHandler("pbForceClose", root, paintBallRoBeband)

-- Baste Shodane Panel Baraye Kasi KE Join Dad
function paintBallRoBeban2d(root)
    if root == getLocalPlayer() then
		guiSetProperty(Window2, "Visible", "False")
        showCursor(false)
	end
end
addEvent("pbJoinClose",true)
addEventHandler("pbJoinClose", root, paintBallRoBeban2d)

function dominatingsound(attacker)
	  if attacker == getLocalPlayer() then
	  local dominating = playSound("VoiceEffects/dominating.mp3",false)
	  end
end
addEvent("dominatingsound",true)
addEventHandler("dominatingsound", getRootElement(), dominatingsound)

function godlikesound(attacker)
	  if attacker == getLocalPlayer() then
	  local godlike = playSound("VoiceEffects/godlike.mp3",false)
	  end
end
addEvent("godlikesound",true)
addEventHandler("godlikesound", getRootElement(), godlikesound)

function headshotsound(attacker)
	  if attacker == getLocalPlayer() then
	  local headshot = playSound("VoiceEffects/headshot.mp3",false)
	  setSoundVolume(headshot,0.5)
	  end
end
addEvent("headshotsound",true)
addEventHandler("headshotsound", getRootElement(), headshotsound)


function Mordansound(source)
	  if source == getLocalPlayer() then
	  local Mordan = playSound("VoiceEffects/Mordan.mp3",false)
	  setSoundVolume(Mordan,0.5)
	  end
end
addEvent("Mordansound",true)
addEventHandler("Mordansound", getRootElement(), Mordansound)

function holyshiiitsound(attacker)
	  if attacker == getLocalPlayer() then
	  local holyshiiit = playSound("VoiceEffects/holyshiiit.mp3",false)
	  end
end
addEvent("holyshiiitsound",true)
addEventHandler("holyshiiitsound", getRootElement(), holyshiiitsound)



addEvent("BbandPanelP",true)
addEventHandler("BbandPanelP",getLocalPlayer(), function()
guiSetVisible(Window, false)
guiSetVisible(Window2, false)
guiSetVisible(Window3, false)
guiSetVisible(Window4, false)
showCursor(false)
end, false)



local paintballblip = createBlip ( 2695.0146484375 ,-1707.8837890625 ,11.84375 , 33 )
setElementData(paintballblip,"blipName","Paintball")
