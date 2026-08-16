local screenW, screenH = guiGetScreenSize()

--[[ Panel Baraye Kharid Material ]]--
buywindow = guiCreateStaticImage((screenW - 200) / 2, (screenH - 120) / 2.3, 200, 120, "File/bgpage.png", false)
guiWindowSetSizable(buywindow, false)
guiSetVisible(buywindow, false)

buybtn = guiCreateButton(17, 15, 165, 35, "Kharid", false, buywindow)
guiSetProperty(buybtn, "HoverTextColour", "FF00FF00" )
exitbuy = guiCreateButton(17, 70, 165, 35, "Cancel", false, buywindow)
guiSetProperty(exitbuy, "HoverTextColour", "FFFE0000" )

--[[ Panel Baraye Foroosh Material ]]--
sellwindow = guiCreateStaticImage((screenW - 200) / 2, (screenH - 120) / 2.3, 200, 120, "File/bgpage.png", false)
guiWindowSetSizable(sellwindow, false)
guiSetVisible(sellwindow, false)

sellbtn = guiCreateButton(17, 15, 165, 35, "Foroosh", false, sellwindow)
guiSetProperty(sellbtn, "HoverTextColour", "FF00FF00" )
exitsell = guiCreateButton(17, 70, 165, 35, "Cancel", false, sellwindow)
guiSetProperty(exitsell, "HoverTextColour", "FFFE0000" )

addEvent("buyPanel",true)
addEventHandler("buyPanel",getLocalPlayer(),function()
	guiSetVisible(buywindow, true)
	showCursor(true)
end)

addEvent("sellPanel",true)
addEventHandler("sellPanel",getLocalPlayer(),function()
	guiSetVisible(sellwindow, true)
	showCursor(true)
end)

addEventHandler("onClientGUIClick",root,
function ()
	if source == exitbuy then
		guiSetVisible(buywindow, false)
	    showCursor(false)
	elseif source == exitsell then
		guiSetVisible(sellwindow, false)
	    showCursor(false)
    elseif source == buybtn then
		triggerServerEvent("bekharMaterial",getLocalPlayer())
		guiSetVisible(buywindow, false)
	    showCursor(false)
	elseif source == sellbtn then
	 	triggerServerEvent("befroshMaterial",getLocalPlayer())
		guiSetVisible(sellwindow, false)
	    showCursor(false)
end
end)




-- For Panel Create Gun --
--^^^^^^^ Edward ^^^^^^^--
--^^^^^^^^^^^^^^^^^^^^^^--
addEvent("BiarPanelo", true)
addEventHandler("BiarPanelo",root,
function  ()

     local screenW, screenH = guiGetScreenSize()
	 local font = guiCreateFont("File/font.ttf", 14)
	 local font1 = guiCreateFont("File/font.ttf", 13.5)
	 local font2 = guiCreateFont("File/fonts.ttf", 17)
	 local font3 = guiCreateFont("File/font.ttf", 10)
	 
	    bgpage = guiCreateStaticImage((screenW - 370) / 2, (screenH - 400) / 2, 370, 400, "File/bgpage.png", false) -- Aks backgrund
        guiWindowSetSizable(bgpage, false)
		
-------------------
-- close btn
        back = guiCreateButton(342, 5, 21, 21, "X", false, bgpage)
        guiSetProperty(back, "NormalTextColour", "FFFE0000")
		guiSetProperty(back, "HoverTextColour", "FFFE0000")
------------------------------------------
		
		
		
		
	
-- ID labale
        ID = guiCreateLabel(20, 35, 261, 27, "ID Gun", false, bgpage)
       	guiSetFont(ID, font)
		guiLabelSetColor(ID, 230 , 176 , 6) 
		--ID Gun Ha
		pistol22 = guiCreateLabel(20, 70, 261, 27, "22", false, bgpage)
       	guiSetFont(pistol22, font2)
		guiLabelSetColor(pistol22, 255 , 255 , 255)
		deagle24 = guiCreateLabel(20, 97, 261, 27, "24", false, bgpage)
       	guiSetFont(deagle24, font2)
		guiLabelSetColor(deagle24, 255 , 255 , 255)
		shotgun25 = guiCreateLabel(20, 124, 261, 27, "25", false, bgpage)
       	guiSetFont(shotgun25, font2)
		guiLabelSetColor(shotgun25, 255 , 255 , 255)
		spaz1227 = guiCreateLabel(20, 151, 261, 27, "27", false, bgpage)
       	guiSetFont(spaz1227, font2)
		guiLabelSetColor(spaz1227, 255 , 255 , 255)
		mp529 = guiCreateLabel(20, 178, 261, 27, "29", false, bgpage)
       	guiSetFont(mp529, font2)
		guiLabelSetColor(mp529, 255 , 255 , 255)
		ak4730 = guiCreateLabel(20, 205, 261, 27, "30", false, bgpage)
       	guiSetFont(ak4730, font2)
		guiLabelSetColor(ak4730, 255 , 255 , 255)
		m431 = guiCreateLabel(20, 232, 261, 27, "31", false, bgpage)
       	guiSetFont(m431, font2)
		guiLabelSetColor(m431, 255 , 255 , 255)
	    tec9 = guiCreateLabel(20, 259, 261, 27, "32", false, bgpage)
       	guiSetFont(tec9, font2)
		guiLabelSetColor(tec9, 255 , 255 , 255)
		rifle = guiCreateLabel(20, 286, 261, 27, "33", false, bgpage)
       	guiSetFont(rifle, font2)
		guiLabelSetColor(rifle, 255 , 255 , 255)
		
		
-- Esme labale
        esme = guiCreateLabel(150, 35, 261, 27, "Esme", false, bgpage)
       	guiSetFont(esme, font)
		guiLabelSetColor(esme, 230 , 176 , 6) 
		
		--Esme Gun Ha
		pistolesm = guiCreateLabel(145, 70, 261, 27, "Pistol", false, bgpage)
       	guiSetFont(pistolesm, font2)
		guiLabelSetColor(pistolesm, 255 , 255 , 255)
		deagleesm = guiCreateLabel(145, 97, 261, 27, "Deagle", false, bgpage)
       	guiSetFont(deagleesm, font2)
		guiLabelSetColor(deagleesm, 255 , 255 , 255)
		shotgunesm = guiCreateLabel(145, 124, 261, 27, "Shotgun", false, bgpage)
       	guiSetFont(shotgunesm, font2)
		guiLabelSetColor(shotgunesm, 255 , 255 , 255)
		spazesm = guiCreateLabel(145, 151, 261, 27, "Spaz12", false, bgpage)
       	guiSetFont(spazesm, font2)
		guiLabelSetColor(spazesm, 255 , 255 , 255)
		Mp5esm = guiCreateLabel(145, 178, 261, 27, "Mp5", false, bgpage)
       	guiSetFont(Mp5esm, font2)
		guiLabelSetColor(Mp5esm, 255 , 255 , 255)
		ak47esm = guiCreateLabel(145, 205, 261, 27, "Ak47", false, bgpage)
       	guiSetFont(ak47esm, font2)
		guiLabelSetColor(ak47esm, 255 , 255 , 255)
		M4esm = guiCreateLabel(145, 232, 261, 27, "M4", false, bgpage)
       	guiSetFont(M4esm, font2)
		guiLabelSetColor(M4esm, 255 , 255 , 255)
		Tec9esm = guiCreateLabel(145, 259, 261, 27, "Tec-9", false, bgpage)
       	guiSetFont(Tec9esm, font2)
		guiLabelSetColor(Tec9esm, 255 , 255 , 255)
		Rifleesm = guiCreateLabel(145, 286, 261, 27, "Rifle", false, bgpage)
       	guiSetFont(Rifleesm, font2)
		guiLabelSetColor(Rifleesm, 255 , 255 , 255)
		
		
		
-- Material labale
        mat = guiCreateLabel(270, 35, 261, 50, "Material", false, bgpage)
       	guiSetFont(mat, font)
		guiLabelSetColor(mat, 230 , 176 , 6) 		
        --Material Gun Ha
        mat22 = guiCreateLabel(295, 70, 261, 27, "10", false, bgpage)
       	guiSetFont(mat22, font2)
		guiLabelSetColor(mat22, 255 , 255 , 255) 
		mat24 = guiCreateLabel(295, 97, 261, 27, "10", false, bgpage)
       	guiSetFont(mat24, font2)
		guiLabelSetColor(mat24, 255 , 255 , 255)
		mat25 = guiCreateLabel(295, 124, 261, 27, "20", false, bgpage)
       	guiSetFont(mat25, font2)
		guiLabelSetColor(mat25, 255 , 255 , 255)
		mat27 = guiCreateLabel(295, 151, 261, 27, "20", false, bgpage)
       	guiSetFont(mat27, font2)
		guiLabelSetColor(mat27, 255 , 255 , 255)
		mat29 = guiCreateLabel(295, 178, 261, 27, "10", false, bgpage)
       	guiSetFont(mat29, font2)
		guiLabelSetColor(mat29, 255 , 255 , 255)
		mat30 = guiCreateLabel(295, 205, 261, 27, "20", false, bgpage)
       	guiSetFont(mat30, font2)
		guiLabelSetColor(mat30, 255 , 255 , 255)
		mat31 = guiCreateLabel(295, 232, 261, 27, "20", false, bgpage)
       	guiSetFont(mat31, font2)
		guiLabelSetColor(mat31, 255 , 255 , 255)
		mat32 = guiCreateLabel(295, 259, 261, 27, "10", false, bgpage)
       	guiSetFont(mat32, font2)
		guiLabelSetColor(mat32, 255 , 255 , 255)
		mat33 = guiCreateLabel(295, 286, 261, 27, "20", false, bgpage)
       	guiSetFont(mat33, font2)
		guiLabelSetColor(mat33, 255 , 255 , 255)
		
		
		--------------
		Nokte = guiCreateLabel(20, 340, 345, 27, "*Mizan Material Har Gun Bar Asas (10) Tir Mibashad.", false, bgpage)
       	guiSetFont(Nokte, font3)
		guiLabelSetColor(Nokte, 230 , 176 , 6) 
------------------------------------------------------------------
		showCursor (true)
		addEventHandler ("onClientGUIClick", back, closepanel, false)
		
end
)


function closepanel ()
showCursor (false)
guiSetVisible (bgpage, not guiGetVisible ( bgpage ) )
end
