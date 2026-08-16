



mafiaWarPanel = guiCreateWindow(0.01, 0.44, 0.22, 0.14, "War", true)
guiWindowSetSizable(mafiaWarPanel, false)



mafiaWarInfo = guiCreateLabel(0.03, 0.17, 0.93, 0.74, "Total Score:\nKills:\nDeaths:", true, mafiaWarPanel)
guiSetFont(mafiaWarInfo, "default-bold-small")
guiLabelSetHorizontalAlign(mafiaWarInfo, "center", true)
guiLabelSetVerticalAlign(mafiaWarInfo, "center")


guiSetVisible(mafiaWarPanel,false)

addEvent("toggleWarInfo",true)
addEventHandler("toggleWarInfo",getLocalPlayer(),function(player,whatToDo)
	guiSetVisible(mafiaWarPanel,whatToDo)
end)

addEvent("setupWarInfo",true)
addEventHandler("setupWarInfo",getLocalPlayer(),function(player,matn)
	guiSetText(mafiaWarInfo,matn)
end)



warsWindow = guiCreateStaticImage(0.20, 0.15, 0.62, 0.69, "Files/warbg.png", true, warsTab1Shanbe)
warsTab1Shanbe = guiCreateButton(0.815,0.2,0.1,0.05,"1 Shanbe",true)
guiSetVisible(warsTab1Shanbe,false)

local font1 = guiCreateFont("IRANSans.ttf",25)
WarText = guiCreateLabel(0.46, 0.01, 0.9, 0.9,"Wars",true,warsWindow)
guiSetFont(WarText,font1)
guiSetProperty(warsTab1Shanbe,"NormalTextColour","FF00FF00")
warsImg1 = warsWindow
warsScroll1 = guiCreateScrollPane(0.01, 0.075, 0.925, 0.925, true, warsImg1)
wars1shanbe18BG = guiCreateStaticImage(0.00, 0.00, 1.00, 0.4, "Files/bg2.png", true, warsScroll1)
wars1shanbe18attackerlogo = guiCreateStaticImage(0.08, 0.11, 0.18, 0.70, "Files/12.png", true, wars1shanbe18BG)
wars1shanbe18defenderlogo = guiCreateStaticImage(0.74, 0.11, 0.18, 0.70, "Files/13.png", true, wars1shanbe18BG)
wars1shanbe18VS = guiCreateStaticImage(0.45, 0.23, 0.09, 0.42, "Files/vs.png", true, wars1shanbe18BG)
wars1shanbe18winner = guiCreateLabel(0.37, 0.64, 0.25, 0.20, "Winner:", true, wars1shanbe18BG)
guiLabelSetColor(wars1shanbe18winner, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe18winner, "center", false)
guiLabelSetVerticalAlign(wars1shanbe18winner, "center")
wars1shanbe18defenderpoint = guiCreateLabel(0.70, 0.74, 0.25, 0.20, "Point:", true, wars1shanbe18BG)
guiLabelSetColor(wars1shanbe18defenderpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe18defenderpoint, "center", false)
guiLabelSetVerticalAlign(wars1shanbe18defenderpoint, "center")
wars1shanbe18attackerpoint = guiCreateLabel(0.05, 0.74, 0.25, 0.20, "Point:", true, wars1shanbe18BG)
guiLabelSetColor(wars1shanbe18attackerpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe18attackerpoint, "center", false)
guiLabelSetVerticalAlign(wars1shanbe18attackerpoint, "center")
wars1shanbe18label = guiCreateLabel(0.37, 0.06, 0.25, 0.20, "Saat 18", true, wars1shanbe18BG)
guiLabelSetColor(wars1shanbe18label, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe18label, "center", false)
guiLabelSetVerticalAlign(wars1shanbe18label, "center")
wars1shanbe19BG = guiCreateStaticImage(0.00, 0.50, 1.00, 0.4, "Files/bg2.png", true, warsScroll1)
wars1shanbe19attackerlogo = guiCreateStaticImage(0.08, 0.11, 0.18, 0.70, "Files/12.png", true, wars1shanbe19BG)
wars1shanbe19defenderlogo = guiCreateStaticImage(0.74, 0.11, 0.18, 0.70, "Files/13.png", true, wars1shanbe19BG)
wars1shanbe19VS = guiCreateStaticImage(0.45, 0.23, 0.09, 0.42, "Files/vs.png", true, wars1shanbe19BG)
wars1shanbe19winner = guiCreateLabel(0.37, 0.64, 0.25, 0.20, "Winner:", true, wars1shanbe19BG)
guiLabelSetColor(wars1shanbe19winner, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe19winner, "center", false)
guiLabelSetVerticalAlign(wars1shanbe19winner, "center")
wars1shanbe19defenderpoint = guiCreateLabel(0.70, 0.74, 0.25, 0.20, "Point:", true, wars1shanbe19BG)
guiLabelSetColor(wars1shanbe19defenderpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe19defenderpoint, "center", false)
guiLabelSetVerticalAlign(wars1shanbe19defenderpoint, "center")
wars1shanbe19attackerpoint = guiCreateLabel(0.05, 0.74, 0.25, 0.20, "Point:", true, wars1shanbe19BG)
guiLabelSetColor(wars1shanbe19attackerpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe19attackerpoint, "center", false)
guiLabelSetVerticalAlign(wars1shanbe19attackerpoint, "center")
wars1shanbe19label = guiCreateLabel(0.37, 0.06, 0.25, 0.20, "Saat 19", true, wars1shanbe19BG)
guiLabelSetColor(wars1shanbe19label, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe19label, "center", false)
guiLabelSetVerticalAlign(wars1shanbe19label, "center")  
wars1shanbe20BG = guiCreateStaticImage(0.00, 1.00, 1.00, 0.4, "Files/bg2.png", true, warsScroll1)
wars1shanbe20attackerlogo = guiCreateStaticImage(0.08, 0.11, 0.18, 0.70, "Files/12.png", true, wars1shanbe20BG)
wars1shanbe20defenderlogo = guiCreateStaticImage(0.74, 0.11, 0.18, 0.70, "Files/13.png", true, wars1shanbe20BG)
wars1shanbe20VS = guiCreateStaticImage(0.45, 0.23, 0.09, 0.42, "Files/vs.png", true, wars1shanbe20BG)
wars1shanbe20winner = guiCreateLabel(0.37, 0.64, 0.25, 0.20, "Winner:", true, wars1shanbe20BG)
guiLabelSetColor(wars1shanbe20winner, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe20winner, "center", false)
guiLabelSetVerticalAlign(wars1shanbe20winner, "center")
wars1shanbe20defenderpoint = guiCreateLabel(0.70, 0.74, 0.25, 0.20, "Point:", true, wars1shanbe20BG)
guiLabelSetColor(wars1shanbe20defenderpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe20defenderpoint, "center", false)
guiLabelSetVerticalAlign(wars1shanbe20defenderpoint, "center")
wars1shanbe20attackerpoint = guiCreateLabel(0.05, 0.74, 0.25, 0.20, "Point:", true, wars1shanbe20BG)
guiLabelSetColor(wars1shanbe20attackerpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe20attackerpoint, "center", false)
guiLabelSetVerticalAlign(wars1shanbe20attackerpoint, "center")
wars1shanbe20label = guiCreateLabel(0.37, 0.06, 0.25, 0.20, "Saat 20", true, wars1shanbe20BG)
guiLabelSetColor(wars1shanbe20label, 254, 254, 254)
guiLabelSetHorizontalAlign(wars1shanbe20label, "center", false)
guiLabelSetVerticalAlign(wars1shanbe20label, "center")  
guiSetVisible(warsScroll1,false)
-- 3 Shanbe
warsTab3shanbe = guiCreateButton(0.815,0.2+0.06,0.1,0.05,"3 Shanbe",true)
guiSetVisible(warsTab3shanbe,false)
guiSetProperty(warsTab3shanbe,"NormalTextColour","FF00FF00")
warsImg1 = warsWindow
warsScroll2 = guiCreateScrollPane(0.01, 0.075, 0.925, 0.925, true, warsImg1)
wars3shanbe18BG = guiCreateStaticImage(0.00, 0.00, 1.00, 0.4, "Files/bg2.png", true, warsScroll2)
wars3shanbe18attackerlogo = guiCreateStaticImage(0.08, 0.11, 0.18, 0.70, "Files/12.png", true, wars3shanbe18BG)
wars3shanbe18defenderlogo = guiCreateStaticImage(0.74, 0.11, 0.18, 0.70, "Files/13.png", true, wars3shanbe18BG)
wars3shanbe18VS = guiCreateStaticImage(0.45, 0.23, 0.09, 0.42, "Files/vs.png", true, wars3shanbe18BG)
wars3shanbe18winner = guiCreateLabel(0.37, 0.64, 0.25, 0.20, "Winner:", true, wars3shanbe18BG)
guiLabelSetColor(wars3shanbe18winner, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe18winner, "center", false)
guiLabelSetVerticalAlign(wars3shanbe18winner, "center")
wars3shanbe18defenderpoint = guiCreateLabel(0.70, 0.74, 0.25, 0.20, "Point:", true, wars3shanbe18BG)
guiLabelSetColor(wars3shanbe18defenderpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe18defenderpoint, "center", false)
guiLabelSetVerticalAlign(wars3shanbe18defenderpoint, "center")
wars3shanbe18attackerpoint = guiCreateLabel(0.05, 0.74, 0.25, 0.20, "Point:", true, wars3shanbe18BG)
guiLabelSetColor(wars3shanbe18attackerpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe18attackerpoint, "center", false)
guiLabelSetVerticalAlign(wars3shanbe18attackerpoint, "center")
wars3shanbe18label = guiCreateLabel(0.37, 0.06, 0.25, 0.20, "Saat 18", true, wars3shanbe18BG)
guiLabelSetColor(wars3shanbe18label, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe18label, "center", false)
guiLabelSetVerticalAlign(wars3shanbe18label, "center")
wars3shanbe19BG = guiCreateStaticImage(0.00, 0.50, 1.00, 0.4, "Files/bg2.png", true, warsScroll2)
wars3shanbe19attackerlogo = guiCreateStaticImage(0.08, 0.11, 0.18, 0.70, "Files/12.png", true, wars3shanbe19BG)
wars3shanbe19defenderlogo = guiCreateStaticImage(0.74, 0.11, 0.18, 0.70, "Files/13.png", true, wars3shanbe19BG)
wars3shanbe19VS = guiCreateStaticImage(0.45, 0.23, 0.09, 0.42, "Files/vs.png", true, wars3shanbe19BG)
wars3shanbe19winner = guiCreateLabel(0.37, 0.64, 0.25, 0.20, "Winner:", true, wars3shanbe19BG)
guiLabelSetColor(wars3shanbe19winner, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe19winner, "center", false)
guiLabelSetVerticalAlign(wars3shanbe19winner, "center")
wars3shanbe19defenderpoint = guiCreateLabel(0.70, 0.74, 0.25, 0.20, "Point:", true, wars3shanbe19BG)
guiLabelSetColor(wars3shanbe19defenderpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe19defenderpoint, "center", false)
guiLabelSetVerticalAlign(wars3shanbe19defenderpoint, "center")
wars3shanbe19attackerpoint = guiCreateLabel(0.05, 0.74, 0.25, 0.20, "Point:", true, wars3shanbe19BG)
guiLabelSetColor(wars3shanbe19attackerpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe19attackerpoint, "center", false)
guiLabelSetVerticalAlign(wars3shanbe19attackerpoint, "center")
wars3shanbe19label = guiCreateLabel(0.37, 0.06, 0.25, 0.20, "Saat 19", true, wars3shanbe19BG)
guiLabelSetColor(wars3shanbe19label, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe19label, "center", false)
guiLabelSetVerticalAlign(wars3shanbe19label, "center")  
wars3shanbe20BG = guiCreateStaticImage(0.00, 1.00, 1.00, 0.4, "Files/bg2.png", true, warsScroll2)
wars3shanbe20attackerlogo = guiCreateStaticImage(0.08, 0.11, 0.18, 0.70, "Files/12.png", true, wars3shanbe20BG)
wars3shanbe20defenderlogo = guiCreateStaticImage(0.74, 0.11, 0.18, 0.70, "Files/13.png", true, wars3shanbe20BG)
wars3shanbe20VS = guiCreateStaticImage(0.45, 0.23, 0.09, 0.42, "Files/vs.png", true, wars3shanbe20BG)
wars3shanbe20winner = guiCreateLabel(0.37, 0.64, 0.25, 0.20, "Winner:", true, wars3shanbe20BG)
guiLabelSetColor(wars3shanbe20winner, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe20winner, "center", false)
guiLabelSetVerticalAlign(wars3shanbe20winner, "center")
wars3shanbe20defenderpoint = guiCreateLabel(0.70, 0.74, 0.25, 0.20, "Point:", true, wars3shanbe20BG)
guiLabelSetColor(wars3shanbe20defenderpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe20defenderpoint, "center", false)
guiLabelSetVerticalAlign(wars3shanbe20defenderpoint, "center")
wars3shanbe20attackerpoint = guiCreateLabel(0.05, 0.74, 0.25, 0.20, "Point:", true, wars3shanbe20BG)
guiLabelSetColor(wars3shanbe20attackerpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe20attackerpoint, "center", false)
guiLabelSetVerticalAlign(wars3shanbe20attackerpoint, "center")
wars3shanbe20label = guiCreateLabel(0.37, 0.06, 0.25, 0.20, "Saat 20", true, wars3shanbe20BG)
guiLabelSetColor(wars3shanbe20label, 254, 254, 254)
guiLabelSetHorizontalAlign(wars3shanbe20label, "center", false)
guiLabelSetVerticalAlign(wars3shanbe20label, "center")  
guiSetVisible(warsScroll2,false)
-- 5 shanbe
warsTab5shanbe = guiCreateButton(0.815,0.2+0.06+0.06,0.1,0.05,"5 Shanbe",true)
guiSetVisible(warsTab5shanbe,false)
guiSetProperty(warsTab5shanbe,"NormalTextColour","FF00FF00")
warsImg1 = warsWindow
warsScroll3 = guiCreateScrollPane(0.01, 0.075, 0.925, 0.925, true, warsImg1)
wars5shanbe18BG = guiCreateStaticImage(0.00, 0.00, 1.00, 0.4, "Files/bg2.png", true, warsScroll3)
wars5shanbe18attackerlogo = guiCreateStaticImage(0.08, 0.11, 0.18, 0.70, "Files/12.png", true, wars5shanbe18BG)
wars5shanbe18defenderlogo = guiCreateStaticImage(0.74, 0.11, 0.18, 0.70, "Files/13.png", true, wars5shanbe18BG)
wars5shanbe18VS = guiCreateStaticImage(0.45, 0.23, 0.09, 0.42, "Files/vs.png", true, wars5shanbe18BG)
wars5shanbe18winner = guiCreateLabel(0.37, 0.64, 0.25, 0.20, "Winner:", true, wars5shanbe18BG)
guiLabelSetColor(wars5shanbe18winner, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe18winner, "center", false)
guiLabelSetVerticalAlign(wars5shanbe18winner, "center")
wars5shanbe18defenderpoint = guiCreateLabel(0.70, 0.74, 0.25, 0.20, "Point:", true, wars5shanbe18BG)
guiLabelSetColor(wars5shanbe18defenderpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe18defenderpoint, "center", false)
guiLabelSetVerticalAlign(wars5shanbe18defenderpoint, "center")
wars5shanbe18attackerpoint = guiCreateLabel(0.05, 0.74, 0.25, 0.20, "Point:", true, wars5shanbe18BG)
guiLabelSetColor(wars5shanbe18attackerpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe18attackerpoint, "center", false)
guiLabelSetVerticalAlign(wars5shanbe18attackerpoint, "center")
wars5shanbe18label = guiCreateLabel(0.37, 0.06, 0.25, 0.20, "Saat 18", true, wars5shanbe18BG)
guiLabelSetColor(wars5shanbe18label, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe18label, "center", false)
guiLabelSetVerticalAlign(wars5shanbe18label, "center")
wars5shanbe19BG = guiCreateStaticImage(0.00, 0.50, 1.00, 0.4, "Files/bg2.png", true, warsScroll3)
wars5shanbe19attackerlogo = guiCreateStaticImage(0.08, 0.11, 0.18, 0.70, "Files/12.png", true, wars5shanbe19BG)
wars5shanbe19defenderlogo = guiCreateStaticImage(0.74, 0.11, 0.18, 0.70, "Files/13.png", true, wars5shanbe19BG)
wars5shanbe19VS = guiCreateStaticImage(0.45, 0.23, 0.09, 0.42, "Files/vs.png", true, wars5shanbe19BG)
wars5shanbe19winner = guiCreateLabel(0.37, 0.64, 0.25, 0.20, "Winner:", true, wars5shanbe19BG)
guiLabelSetColor(wars5shanbe19winner, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe19winner, "center", false)
guiLabelSetVerticalAlign(wars5shanbe19winner, "center")
wars5shanbe19defenderpoint = guiCreateLabel(0.70, 0.74, 0.25, 0.20, "Point:", true, wars5shanbe19BG)
guiLabelSetColor(wars5shanbe19defenderpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe19defenderpoint, "center", false)
guiLabelSetVerticalAlign(wars5shanbe19defenderpoint, "center")
wars5shanbe19attackerpoint = guiCreateLabel(0.05, 0.74, 0.25, 0.20, "Point:", true, wars5shanbe19BG)
guiLabelSetColor(wars5shanbe19attackerpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe19attackerpoint, "center", false)
guiLabelSetVerticalAlign(wars5shanbe19attackerpoint, "center")
wars5shanbe19label = guiCreateLabel(0.37, 0.06, 0.25, 0.20, "Saat 19", true, wars5shanbe19BG)
guiLabelSetColor(wars5shanbe19label, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe19label, "center", false)
guiLabelSetVerticalAlign(wars5shanbe19label, "center")  
wars5shanbe20BG = guiCreateStaticImage(0.00, 1.00, 1.00, 0.4, "Files/bg2.png", true, warsScroll3)
wars5shanbe20attackerlogo = guiCreateStaticImage(0.08, 0.11, 0.18, 0.70, "Files/12.png", true, wars5shanbe20BG)
wars5shanbe20defenderlogo = guiCreateStaticImage(0.74, 0.11, 0.18, 0.70, "Files/13.png", true, wars5shanbe20BG)
wars5shanbe20VS = guiCreateStaticImage(0.45, 0.23, 0.09, 0.42, "Files/vs.png", true, wars5shanbe20BG)
wars5shanbe20winner = guiCreateLabel(0.37, 0.64, 0.25, 0.20, "Winner:", true, wars5shanbe20BG)
guiLabelSetColor(wars5shanbe20winner, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe20winner, "center", false)
guiLabelSetVerticalAlign(wars5shanbe20winner, "center")
wars5shanbe20defenderpoint = guiCreateLabel(0.70, 0.74, 0.25, 0.20, "Point:", true, wars5shanbe20BG)
guiLabelSetColor(wars5shanbe20defenderpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe20defenderpoint, "center", false)
guiLabelSetVerticalAlign(wars5shanbe20defenderpoint, "center")
wars5shanbe20attackerpoint = guiCreateLabel(0.05, 0.74, 0.25, 0.20, "Point:", true, wars5shanbe20BG)
guiLabelSetColor(wars5shanbe20attackerpoint, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe20attackerpoint, "center", false)
guiLabelSetVerticalAlign(wars5shanbe20attackerpoint, "center")
wars5shanbe20label = guiCreateLabel(0.37, 0.06, 0.25, 0.20, "Saat 20", true, wars5shanbe20BG)
guiLabelSetColor(wars5shanbe20label, 254, 254, 254)
guiLabelSetHorizontalAlign(wars5shanbe20label, "center", false)
guiLabelSetVerticalAlign(wars5shanbe20label, "center") 
guiSetVisible(warsScroll3,false)
guiSetVisible(warsWindow,false)
addEventHandler("onClientGUIClick",root,function()
	if source == warsTab1Shanbe then 
		guiSetProperty(warsScroll1,"Visible","True")
		guiSetProperty(warsScroll2,"Visible","False")
		guiSetProperty(warsScroll3,"Visible","False")
	elseif source == warsTab3shanbe then 
		guiSetProperty(warsScroll1,"Visible","False")
		guiSetProperty(warsScroll2,"Visible","True")
		guiSetProperty(warsScroll3,"Visible","False")
	elseif source == warsTab5shanbe then 
		guiSetProperty(warsScroll1,"Visible","False")
		guiSetProperty(warsScroll2,"Visible","False")
		guiSetProperty(warsScroll3,"Visible","True")
	end
end)
addEvent("warspanel",true)
addEventHandler("warspanel",getLocalPlayer(),function(p,b)
	if guiGetVisible(warsWindow) == true then
		guiSetVisible(warsWindow,false)
		guiSetVisible(warsTab1Shanbe,false)
		guiSetVisible(warsTab3shanbe,false)
		guiSetVisible(warsTab5shanbe,false)
		showCursor(false)
		return
	end
	
	guiSetVisible(warsWindow,b)
	showCursor(b)
	guiSetVisible(warsTab1Shanbe,true)
	guiSetVisible(warsTab3shanbe,true)
	guiSetVisible(warsTab5shanbe,true)
	guiSetVisible(wars1shanbe18BG,false)
	guiSetVisible(wars1shanbe19BG,false)
	guiSetVisible(wars1shanbe20BG,false)
	
	guiSetVisible(wars3shanbe18BG,false)
	guiSetVisible(wars3shanbe19BG,false)
	guiSetVisible(wars3shanbe20BG,false)
	
	guiSetVisible(wars5shanbe18BG,false)
	guiSetVisible(wars5shanbe19BG,false)
	guiSetVisible(wars5shanbe20BG,false)
	
end)

local factions = {
{"Edare Police","#507dde",80,125,222, 265},-- 1
{"Police Federal","#2f64e1",47,100,225, 161},-- 2
{"National Gard","#1953e6",25,83,230, 159},-- 3
{"Pezeshk","#ff7700",255,119,0, 67},-- 4
{"Atash Neshani","#e22500",226, 37, 0, 277},-- 5
{"Shahrdar","#bf2abd",191, 24, 189, 153},-- 6
{"KhabarNegar","#cd5c5c",205,92,92, 306},-- 7
{"Edare Amoozesh","#2fa1d6",47,161,214, 254},-- 8
{"Edare Taxirani","#f0f000",240, 240, 0, 255},-- 9



{"Tokyo Gang","#cf9c0a",207, 156, 10, 108},-- 10
{"Piky Gang","#00FFF7",0, 255, 255, 178},-- 11
{"Virus Gang","#FF2D00",255,45,0, 255},-- 12
{"Gang - oFF","#9400FF",148, 0, 255, 223},-- 13
{"Silver Gang","#9400FF",148, 0, 255, 223},-- 14
{"Grove Street","#008000",0, 128, 0, 270},-- 15
{"Hackers","#686e9b",104,110,155, 210},-- 16

}
addEvent("addNewWar",true)
addEventHandler("addNewWar",getLocalPlayer(),function(p,attacker,defender,saat,rooz,now,attackpoint,defendpoint)
	if tonumber(rooz) == 0 then -- 1 shanbe
		if tonumber(saat) == 18 then
			if now >= 1 then
				guiSetVisible(wars1shanbe18BG,true)
				
				guiStaticImageLoadImage(wars1shanbe18attackerlogo,"Files/"..attacker..".png")
				guiStaticImageLoadImage(wars1shanbe18defenderlogo,"Files/"..defender..".png")
				
				if now == 3 then
					guiStaticImageLoadImage(wars1shanbe18VS,"Files/vs.png")
					guiSetVisible(wars1shanbe18attackerpoint,true)
					guiSetVisible(wars1shanbe18defenderpoint,true)
					guiSetVisible(wars1shanbe18winner,true)
					
					guiSetText(wars1shanbe18attackerpoint,"Score: "..attackpoint)
					guiSetText(wars1shanbe18defenderpoint,"Score: "..defendpoint)
					
					if tonumber(attackpoint) > tonumber(defendpoint) then
						guiSetText(wars1shanbe18winner,"Winner: "..factions[attacker][1])
					else
						guiSetText(wars1shanbe18winner,"Winner: "..factions[defender][1])
					end
				else
					guiStaticImageLoadImage(wars1shanbe18VS,"Files/vs.png")
					guiSetVisible(wars1shanbe18attackerpoint,false)
					guiSetVisible(wars1shanbe18defenderpoint,false)
					guiSetVisible(wars1shanbe18winner,false)
				end
			end
		elseif tonumber(saat) == 19 then
			if now >= 1 then
				guiSetVisible(wars1shanbe19BG,true)
				
				guiStaticImageLoadImage(wars1shanbe19attackerlogo,"Files/"..attacker..".png")
				guiStaticImageLoadImage(wars1shanbe19defenderlogo,"Files/"..defender..".png")
				
				if now == 3 then
					guiStaticImageLoadImage(wars1shanbe19VS,"Files/vs.png")
					guiSetVisible(wars1shanbe19attackerpoint,true)
					guiSetVisible(wars1shanbe19defenderpoint,true)
					guiSetVisible(wars1shanbe19winner,true)
					
					guiSetText(wars1shanbe19attackerpoint,"Score: "..attackpoint)
					guiSetText(wars1shanbe19defenderpoint,"Score: "..defendpoint)
					
					if tonumber(attackpoint) > tonumber(defendpoint) then
						guiSetText(wars1shanbe19winner,"Winner: "..factions[attacker][1])
					else
						guiSetText(wars1shanbe19winner,"Winner: "..factions[defender][1])
					end
				else
					guiStaticImageLoadImage(wars1shanbe19VS,"Files/vs.png")
					guiSetVisible(wars1shanbe19attackerpoint,false)
					guiSetVisible(wars1shanbe19defenderpoint,false)
					guiSetVisible(wars1shanbe19winner,false)
				end
			end
		elseif tonumber(saat) == 20 then
			if now >= 1 then
				guiSetVisible(wars1shanbe20BG,true)
				
				guiStaticImageLoadImage(wars1shanbe20attackerlogo,"Files/"..attacker..".png")
				guiStaticImageLoadImage(wars1shanbe20defenderlogo,"Files/"..defender..".png")
				
				if now == 3 then
					guiStaticImageLoadImage(wars1shanbe20VS,"Files/vs.png")
					guiSetVisible(wars1shanbe20attackerpoint,true)
					guiSetVisible(wars1shanbe20defenderpoint,true)
					guiSetVisible(wars1shanbe20winner,true)
					
					guiSetText(wars1shanbe20attackerpoint,"Score: "..attackpoint)
					guiSetText(wars1shanbe20defenderpoint,"Score: "..defendpoint)
					
					if tonumber(attackpoint) > tonumber(defendpoint) then
						guiSetText(wars1shanbe20winner,"Winner: "..factions[attacker][1])
					else
						guiSetText(wars1shanbe20winner,"Winner: "..factions[defender][1])
					end
				else
					guiStaticImageLoadImage(wars1shanbe20VS,"Files/vs.png")
					guiSetVisible(wars1shanbe20attackerpoint,false)
					guiSetVisible(wars1shanbe20defenderpoint,false)
					guiSetVisible(wars1shanbe20winner,false)
				end
			end
		end
	elseif tonumber(rooz) == 2 then -- 3 shanbe
		if tonumber(saat) == 18 then
			if now >= 1 then
				guiSetVisible(wars3shanbe18BG,true)
				
				guiStaticImageLoadImage(wars3shanbe18attackerlogo,"Files/"..attacker..".png")
				guiStaticImageLoadImage(wars3shanbe18defenderlogo,"Files/"..defender..".png")
				
				if now == 3 then
					guiStaticImageLoadImage(wars3shanbe18VS,"Files/vs.png")
					guiSetVisible(wars3shanbe18attackerpoint,true)
					guiSetVisible(wars3shanbe18defenderpoint,true)
					guiSetVisible(wars3shanbe18winner,true)
					
					guiSetText(wars3shanbe18attackerpoint,"Score: "..attackpoint)
					guiSetText(wars3shanbe18defenderpoint,"Score: "..defendpoint)
					
					if tonumber(attackpoint) > tonumber(defendpoint) then
						guiSetText(wars3shanbe18winner,"Winner: "..factions[attacker][1])
					else
						guiSetText(wars3shanbe18winner,"Winner: "..factions[defender][1])
					end
				else
					guiStaticImageLoadImage(wars3shanbe18VS,"Files/vs.png")
					guiSetVisible(wars3shanbe18attackerpoint,false)
					guiSetVisible(wars3shanbe18defenderpoint,false)
					guiSetVisible(wars3shanbe18winner,false)
				end
			end
		elseif tonumber(saat) == 19 then
			if now >= 1 then
				guiSetVisible(wars3shanbe19BG,true)
				
				guiStaticImageLoadImage(wars3shanbe19attackerlogo,"Files/"..attacker..".png")
				guiStaticImageLoadImage(wars3shanbe19defenderlogo,"Files/"..defender..".png")
				
				if now == 3 then
					guiStaticImageLoadImage(wars3shanbe19VS,"Files/vs.png")
					guiSetVisible(wars3shanbe19attackerpoint,true)
					guiSetVisible(wars3shanbe19defenderpoint,true)
					guiSetVisible(wars3shanbe19winner,true)
					
					guiSetText(wars3shanbe19attackerpoint,"Score: "..attackpoint)
					guiSetText(wars3shanbe19defenderpoint,"Score: "..defendpoint)
					
					if tonumber(attackpoint) > tonumber(defendpoint) then
						guiSetText(wars3shanbe19winner,"Winner: "..factions[attacker][1])
					else
						guiSetText(wars3shanbe19winner,"Winner: "..factions[defender][1])
					end
				else
					guiStaticImageLoadImage(wars3shanbe19VS,"Files/vs.png")
					guiSetVisible(wars3shanbe19attackerpoint,false)
					guiSetVisible(wars3shanbe19defenderpoint,false)
					guiSetVisible(wars3shanbe19winner,false)
				end
			end
		elseif tonumber(saat) == 20 then
			if now >= 1 then
				guiSetVisible(wars3shanbe20BG,true)
				
				guiStaticImageLoadImage(wars3shanbe20attackerlogo,"Files/"..attacker..".png")
				guiStaticImageLoadImage(wars3shanbe20defenderlogo,"Files/"..defender..".png")
				
				if now == 3 then
					guiStaticImageLoadImage(wars3shanbe20VS,"Files/vs.png")
					guiSetVisible(wars3shanbe20attackerpoint,true)
					guiSetVisible(wars3shanbe20defenderpoint,true)
					guiSetVisible(wars3shanbe20winner,true)
					
					guiSetText(wars3shanbe20attackerpoint,"Score: "..attackpoint)
					guiSetText(wars3shanbe20defenderpoint,"Score: "..defendpoint)
					
					if tonumber(attackpoint) > tonumber(defendpoint) then
						guiSetText(wars3shanbe20winner,"Winner: "..factions[attacker][1])
					else
						guiSetText(wars3shanbe20winner,"Winner: "..factions[defender][1])
					end
				else
					guiStaticImageLoadImage(wars3shanbe20VS,"Files/vs.png")
					guiSetVisible(wars3shanbe20attackerpoint,false)
					guiSetVisible(wars3shanbe20defenderpoint,false)
					guiSetVisible(wars3shanbe20winner,false)
				end
			end
		end
	elseif tonumber(rooz) == 4 then -- 5 shanbe
		if tonumber(saat) == 18 then
			if now >= 1 then
				guiSetVisible(wars5shanbe18BG,true)
				
				guiStaticImageLoadImage(wars5shanbe18attackerlogo,"Files/"..attacker..".png")
				guiStaticImageLoadImage(wars5shanbe18defenderlogo,"Files/"..defender..".png")
				
				if now == 3 then
					guiStaticImageLoadImage(wars5shanbe18VS,"Files/vs.png")
					guiSetVisible(wars5shanbe18attackerpoint,true)
					guiSetVisible(wars5shanbe18defenderpoint,true)
					guiSetVisible(wars5shanbe18winner,true)
					
					guiSetText(wars5shanbe18attackerpoint,"Score: "..attackpoint)
					guiSetText(wars5shanbe18defenderpoint,"Score: "..defendpoint)
					
					if tonumber(attackpoint) > tonumber(defendpoint) then
						guiSetText(wars5shanbe18winner,"Winner: "..factions[attacker][1])
					else
						guiSetText(wars5shanbe18winner,"Winner: "..factions[defender][1])
					end
				else
					guiStaticImageLoadImage(wars5shanbe18VS,"Files/vs.png")
					guiSetVisible(wars5shanbe18attackerpoint,false)
					guiSetVisible(wars5shanbe18defenderpoint,false)
					guiSetVisible(wars5shanbe18winner,false)
				end
			end
		elseif tonumber(saat) == 19 then
			if now >= 1 then
				guiSetVisible(wars5shanbe19BG,true)
				
				guiStaticImageLoadImage(wars5shanbe19attackerlogo,"Files/"..attacker..".png")
				guiStaticImageLoadImage(wars5shanbe19defenderlogo,"Files/"..defender..".png")
				
				if now == 3 then
					guiStaticImageLoadImage(wars5shanbe19VS,"Files/vs.png")
					guiSetVisible(wars5shanbe19attackerpoint,true)
					guiSetVisible(wars5shanbe19defenderpoint,true)
					guiSetVisible(wars5shanbe19winner,true)
					
					guiSetText(wars5shanbe19attackerpoint,"Score: "..attackpoint)
					guiSetText(wars5shanbe19defenderpoint,"Score: "..defendpoint)
					
					if tonumber(attackpoint) > tonumber(defendpoint) then
						guiSetText(wars5shanbe19winner,"Winner: "..factions[attacker][1])
					else
						guiSetText(wars5shanbe19winner,"Winner: "..factions[defender][1])
					end
				else
					guiStaticImageLoadImage(wars5shanbe19VS,"Files/vs.png")
					guiSetVisible(wars5shanbe19attackerpoint,false)
					guiSetVisible(wars5shanbe19defenderpoint,false)
					guiSetVisible(wars5shanbe19winner,false)
				end
			end
		elseif tonumber(saat) == 20 then
			if now >= 1 then
				guiSetVisible(wars5shanbe20BG,true)
				
				guiStaticImageLoadImage(wars5shanbe20attackerlogo,"Files/"..attacker..".png")
				guiStaticImageLoadImage(wars5shanbe20defenderlogo,"Files/"..defender..".png")
				
				if now == 3 then
					guiStaticImageLoadImage(wars5shanbe20VS,"Files/vs.png")
					guiSetVisible(wars5shanbe20attackerpoint,true)
					guiSetVisible(wars5shanbe20defenderpoint,true)
					guiSetVisible(wars5shanbe20winner,true)
					
					guiSetText(wars5shanbe20attackerpoint,"Score: "..attackpoint)
					guiSetText(wars5shanbe20defenderpoint,"Score: "..defendpoint)
					
					if tonumber(attackpoint) > tonumber(defendpoint) then
						guiSetText(wars5shanbe20winner,"Winner: "..factions[attacker][1])
					else
						guiSetText(wars5shanbe20winner,"Winner: "..factions[defender][1])
					end
				else
					guiStaticImageLoadImage(wars5shanbe20VS,"Files/vs.png")
					guiSetVisible(wars5shanbe20attackerpoint,false)
					guiSetVisible(wars5shanbe20defenderpoint,false)
					guiSetVisible(wars5shanbe20winner,false)
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



buymatBtn = guiCreateButton(0.43, 0.34, 0.09, 0.04, "Kharid Material", true)
sellmatBtn = guiCreateButton(0.43, 0.34, 0.09, 0.04, "Foroosh Material", true)
closeBtn = guiCreateButton(0.43, 0.38, 0.09, 0.04, "Bastan", true)

guiSetFont(buymatBtn, "default-bold-small")
guiSetProperty(buymatBtn, "NormalTextColour", "FFFFFFFF")
guiSetFont(sellmatBtn, "default-bold-small")
guiSetProperty(sellmatBtn, "NormalTextColour", "FFFFFFFF")
guiSetFont(closeBtn, "default-bold-small")
guiSetProperty(closeBtn, "NormalTextColour", "FFFFFFFF")

guiSetVisible(buymatBtn,false)
guiSetVisible(sellmatBtn,false)
guiSetVisible(closeBtn,false)

spamtimer = nil

addEvent("ShowBuyMaterialPanel",true)
addEventHandler("ShowBuyMaterialPanel",getLocalPlayer(),function(thePlayer)
	if thePlayer == getLocalPlayer() then
		if guiGetVisible(closeBtn) == false then
			if not spamtimer then
				local X,Y = getCursorPosition()
				guiSetPosition(buymatBtn,X,Y,true)
				guiSetVisible(buymatBtn,true)
				local NX,NY = guiGetPosition(buymatBtn,true)
				guiSetPosition(closeBtn,NX,NY+0.04,true)
				guiSetVisible(closeBtn,true)
			end
		end
	end
end)

addEvent("ShowSellMaterialPanel",true)
addEventHandler("ShowSellMaterialPanel",getLocalPlayer(),function(thePlayer)
	if thePlayer == getLocalPlayer() then
		if guiGetVisible(closeBtn) == false then
			if not spamtimer then
				local X,Y = getCursorPosition()
				guiSetPosition(sellmatBtn,X,Y,true)
				guiSetVisible(sellmatBtn,true)
				local NX,NY = guiGetPosition(sellmatBtn,true)
				guiSetPosition(closeBtn,NX,NY+0.04,true)
				guiSetVisible(closeBtn,true)
			end
		end
	end
end)

addEvent("syncTurnOffForMaterialPage",true)
addEventHandler("syncTurnOffForMaterialPage",getLocalPlayer(),function(thePlayer)
	if thePlayer == getLocalPlayer() then
		guiSetVisible(buymatBtn,false)
		guiSetVisible(sellmatBtn,false)
		guiSetVisible(closeBtn,false)
		spamtimer = setTimer(function()
			spamtimer = nil
		end,1500,1)
	end
end)


addEventHandler("onClientGUIClick",getRootElement(),function()
	if source == closeBtn then
		guiSetVisible(buymatBtn,false)
		guiSetVisible(sellmatBtn,false)
		guiSetVisible(closeBtn,false)
		spamtimer = setTimer(function()
			spamtimer = nil
		end,1500,1)
	elseif source == buymatBtn then
		triggerServerEvent("requestBuyMaterial",getLocalPlayer(),getLocalPlayer())
	elseif source == sellmatBtn then
		triggerServerEvent("requestSellMaterial",getLocalPlayer(),getLocalPlayer())
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


notfSys = exports["notf"]
localPlayer = getLocalPlayer()

-- Fonts
local Font1 = guiCreateFont("Files/Font1.ttf", 16)
local Font2 = guiCreateFont("Files/Font1.ttf", 20)
local Font3 = guiCreateFont("Files/Font1.ttf", 13)

-- GUI
HQBG = guiCreateStaticImage(0.37, 0.21, 0.27, 0.59, "Files/bg.png", true)
HQTitle = guiCreateLabel(0.15, 0.00, 0.71, 0.12, "Gang Panel", true, HQBG)
HQMat = guiCreateLabel(0.03, 0.25, 0.93, 0.08, "Materials:", true, HQBG)
HQDrug = guiCreateLabel(0.03, 0.35, 0.93, 0.08, "Drugs:", true, HQBG)
HQBank = guiCreateLabel(0.03, 0.45, 0.93, 0.08, "Bank:", true, HQBG)
HQTake = guiCreateButton(0.04, 0.88, 0.22, 0.08, "Take", true, HQBG)
HQPut = guiCreateButton(0.28, 0.88, 0.22, 0.08, "Put", true, HQBG)
HQClose = guiCreateButton(0.51, 0.88, 0.22, 0.08, "Close", true, HQBG)
guiSetFont(HQPut, Font3) guiSetFont(HQTake, Font3) guiSetFont(HQBank, Font1) guiSetFont(HQClose, Font3) guiSetFont(HQTitle, Font2) guiSetFont(HQDrug, Font1) guiSetFont(HQMat, Font1)
guiSetProperty(HQPut, "NormalTextColour", "FFCFC407") guiSetProperty(HQTake, "NormalTextColour", "FFCFC407") guiSetProperty(HQClose, "NormalTextColour", "FFFE4141")
guiLabelSetColor(HQBank, 255, 255, 255) guiLabelSetColor(HQDrug, 255, 255, 255) guiLabelSetColor(HQMat, 255, 255, 255)
guiLabelSetHorizontalAlign(HQDrug, "left", true) guiLabelSetHorizontalAlign(HQMat, "left", true) guiLabelSetHorizontalAlign(HQBank, "left", true) guiLabelSetHorizontalAlign(HQTitle, "center", true)
guiLabelSetVerticalAlign(HQDrug, "center") guiLabelSetVerticalAlign(HQMat, "center") guiLabelSetVerticalAlign(HQBank, "center") guiLabelSetVerticalAlign(HQTitle, "center")

-- Sure Page

finalbg = guiCreateWindow(0.37, 0.42, 0.24, 0.22, "HQ", true)
finalsubmit = guiCreateButton(0.05, 0.72, 0.23, 0.20, "Submit", true, finalbg)
finalcancel = guiCreateButton(0.31, 0.72, 0.23, 0.20, "Cancel", true, finalbg)
finaledit = guiCreateEdit(0.10, 0.26, 0.80, 0.17, "", true, finalbg)

guiSetProperty(finalcancel, "NormalTextColour", "FFFE313B") guiSetProperty(finalsubmit, "NormalTextColour", "FFFFFEFE") guiWindowSetSizable(finalbg, false)



guiSetProperty(HQBG,"Visible","False")
guiSetProperty(finalbg,"Visible","False")

-- Tables
mafiaNames = { [12] = "Gang", [13] = "Gang", [14] = "Gang", [15] = "Gang"}
mafiaColors = {[12] = {0,128,0}, [11] = {148, 0, 255}, [10] = {207, 156, 10}, [14] = {207, 156, 10}, [15] = {0, 203, 255}}


rank = 0
selected = 0
now = "none"

addEvent("showHQ",true)
addEventHandler("showHQ",getLocalPlayer(),function(p,r,x,a)
	if ( p == localPlayer ) then
		guiSetProperty(HQBG,"Visible","True")
		guiSetProperty(finalbg,"Visible","False")
		
		rank = tonumber(r)
		ranka = tonumber(a)
		selected = 0
		now = "none"
		
		showCursor(true)
		
		-- Editing
		--guiSetText(HQTitle,mafiaNames[x])
		guiLabelSetColor(HQBank, 255, 255, 255) guiLabelSetColor(HQDrug, 255, 255, 255) guiLabelSetColor(HQMat, 255, 255, 255)
		--guiLabelSetColor(HQTitle,mafiaColors[x][1],mafiaColors[x][2],mafiaColors[x][3])
	end
end)

addEvent("closeHQ",true)
addEventHandler("closeHQ",getLocalPlayer(),function(p)
	if ( p == localPlayer ) then
		guiSetProperty(HQBG,"Visible","False")
		guiSetProperty(finalbg,"Visible","False")
		
		rank = 0
		selected = 0
		now = "none"
		
		showCursor(false)
	end
end)

addEvent("loadFactionData",true)
addEventHandler("loadFactionData",getLocalPlayer(),function(thePlayer,m,d,b)
	guiSetText(HQMat,"Materials: ".. m)
	guiSetText(HQDrug,"Drugs: ".. d)
	guiSetText(HQBank,"Bank: ".. b)
end)

spam = nil


addEventHandler("onClientGUIClick",getRootElement(),function(style)
	if source == HQBank or source == HQDrug or source == HQMat then
		selected = 0
		guiLabelSetColor(HQBank, 255, 255, 255) guiLabelSetColor(HQDrug, 255, 255, 255) guiLabelSetColor(HQMat, 255, 255, 255)
	end
	if style == "left" then
		if source == HQBank then
			if ranka >= 2 then
				selected = 1
				guiLabelSetColor(HQBank, 0, 255, 0) guiLabelSetColor(HQDrug, 255, 255, 255) guiLabelSetColor(HQMat, 255, 255, 255)
			else
				notfSys:addNotification("Az Bank Nemishe Chizi Bardasht!","error")
			end
		elseif source == HQDrug then
			selected = 2
			guiLabelSetColor(HQBank, 255, 255, 255) guiLabelSetColor(HQDrug, 0, 255, 0) guiLabelSetColor(HQMat, 255, 255, 255)
		elseif source == HQMat then
			selected = 3
			guiLabelSetColor(HQBank, 255, 255, 255) guiLabelSetColor(HQDrug, 255, 255, 255) guiLabelSetColor(HQMat, 0, 255, 0)
		elseif source == HQTake then
			if selected ~= 0 then
			if rank ~= 7 then return notfSys:addNotification("Baraye Take Bayad Leader Bashid!","error") end
				now = "take"
				guiSetProperty(HQBG,"Visible","False")
				guiSetProperty(finalbg,"Visible","True")
			else
				notfSys:addNotification("Shoma Chizi ro Entekhab Nakardid!","error")
			end
		elseif source == HQPut then
			if selected ~= 0 then
				now = "put"
				guiSetProperty(HQBG,"Visible","False")
				guiSetProperty(finalbg,"Visible","True")
			else
				notfSys:addNotification("Shoma Chizi ro Entekhab Nakardid!","error")
			end
		elseif source == HQClose then
			guiSetProperty(HQBG,"Visible","False")
			guiSetProperty(finalbg,"Visible","False")
			
			rank = 0
			selected = 0
			now = "none"
			
			showCursor(false)
		elseif source == finalsubmit then
			if not spam then
				local wish = guiGetText(finaledit)
				if tonumber(wish) and tonumber(wish) >= 1 then
					triggerServerEvent("hqActions",localPlayer,localPlayer,tonumber(wish),now,selected)
				else
					notfSys:addNotification("Lotfan yek Adade Sahih Vared Konid!","error")
				end
				spam = setTimer(function()
					spam = nil
				end,2000,1)
			end
		elseif source == finalcancel then
			guiSetProperty(HQBG,"Visible","False")
			guiSetProperty(finalbg,"Visible","False")
			
			rank = 0
			selected = 0
			now = "none"
			
			showCursor(false)
		end
	end
end)
