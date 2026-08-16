function knockoff(thePlayer)
    if canPedBeKnockedOffBike ( getLocalPlayer() ) then
        setPedCanBeKnockedOffBike ( getLocalPlayer(), false )
    else
        setPedCanBeKnockedOffBike ( getLocalPlayer(), true )
    end
end
addEvent("knock",true)
addEventHandler("knock", root, knockoff)


--Exam GUI Main PAGE
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),
function ()
	local screenW, screenH = guiGetScreenSize()
	examKadr = guiCreateStaticImage((screenW - 536) / 2, (screenH - 586) / 2, 536, 586, "Data/Images/kadr.png", false)
	examMemo = guiCreateStaticImage(5, 5, 525, 575, "Data/Images/memo3.png", false, examKadr)
	
	
	
	guiSetProperty(examMemo, "AlwaysOnTop", "True")
    guiSetProperty(examKadr, "AlwaysOnTop", "True")
	--examTopLabel = guiCreateLabel((529 - 184) / 2, (719 - 30) / 2 -150, 184, 30, "Amoozeshgah Ranandegi LS", false, examMemo)
	--guiSetFont(examTopLabel, "default-bold-big")
	--guiLabelSetHorizontalAlign(examTopLabel, "center", false)
	--guiLabelSetVerticalAlign(examTopLabel, "center")
	local font4_font = guiCreateFont("font2.ttf", 12)
	examText = guiCreateLabel(-30, 220, 600, 600, "Teste Nazari \n \n  \nBaraye Didan Qavanin Rooye (Qavanin) Click Konid. \n\n Baraye Shoroe Test Rooye (Start Test) Click Konid. \n\nBaraye Laghve Darkhast Roye (Bastan) Click Konid.", false, examMemo)
	guiSetFont(examText, font4_font)
	local font3_font = guiCreateFont("font2.ttf", 15)
	guiLabelSetHorizontalAlign(examText, "center", false)
	examLogo = guiCreateStaticImage(160, 30, 220, 120, "Data/Images/sw.png", false, examMemo)
	--examTopLabel = guiCreateLabel(105, 10, 350, 50, "Amoozeshgah Ranandegi LS", false, examMemo)
	--guiSetFont(examTopLabel, font3_font)
	--guiLabelSetColor(examTopLabel,21 , 162 , 0 )
	examQavanin = guiCreateStaticImage(50,430, 200, 65, "Data/Images/qavanin.png", false, examMemo)
	examStarttest = guiCreateStaticImage(280,427, 200, 65, "Data/Images/starttest.png", false, examMemo)
	examClose = guiCreateStaticImage(170,500, 200, 65, "Data/Images/close.png", false, examMemo)

    examTop = guiCreateStaticImage(0.00, -0.01, 1.00, 0.06, "Data/Images/white.png", false, examKadr)
	guiSetProperty(examTop, "AlwaysOnTop", "True")
	guiSetProperty(examKadr, "Visible", "False")
	
	
	
	-- Exam Qavanin PAGE
	examRuleKadr = guiCreateStaticImage((screenW - 500) / 2, (screenH - 590) / 2, 500, 590, "Data/Images/memo.png", false)

	examRuleButton = guiCreateStaticImage(340,543, 150, 45, "Data/Images/cancel.png", false, examRuleKadr)
	guiSetProperty(examRuleButton, "AlwaysOnTop", "True")
    examRuleText = guiCreateLabel(10, -10, 470, 699, "get Qavanin", false, examRuleKadr)
	guiSetFont(examRuleText, "default-bold-small")
	
	
	--guiLabelSetHorizontalAlign(examRuleText, "center", false)
	guiSetProperty(examRuleKadr, "Visible", "False")


	--Exam GUI Question PAGE
	
	
	
	
	examPageKadr = guiCreateStaticImage((screenW - 536) / 2, (screenH - 400) / 2, 536, 400, "Data/Images/kadr.png", false)
	examPageWindow = guiCreateStaticImage(5, 5, 525, 390, "Data/Images/kadrsoal.png", false, examPageKadr)
	examPageButton = guiCreateStaticImage(370, 340, 150, 50, "Data/Images/close.png", false, examPageWindow)
	--Nemoone Soal
	examSoalLabel = guiCreateLabel(10, 25, 509, 150, "Soal:", false, examPageWindow)
	guiLabelSetColor(examSoalLabel,232 , 203 , 150 )
	local font0_font = guiCreateFont("font.ttf", 14)
	local font5_font = guiCreateFont("font2.ttf", 15)
	guiSetFont(examSoalLabel, font3_font)
	examJavab1Label = guiCreateLabel(10, (719 - 34) / 2 -210, 509, 34, "1.", false, examPageWindow)
	local font1_font = guiCreateFont("font.ttf", 24)
	guiSetFont(examJavab1Label, font5_font)
	examJavab2Label = guiCreateLabel(10, (719 - 35) / 2 -160, 510, 35, "2.", false, examPageWindow)
	guiSetFont(examJavab2Label, font5_font)
	examJavab3Label = guiCreateLabel(10, (719 - 36) / 2 -110, 514, 36, "3.", false, examPageWindow)
	guiSetFont(examJavab3Label, font5_font)
	examJavab4Label = guiCreateLabel(10, (719 - 36) / 2 -60, 514, 36, "4.", false, examPageWindow)
	guiSetFont(examJavab4Label, font5_font)
	guiLabelSetColor(examJavab1Label,200 , 200 , 200 )
	guiLabelSetColor(examJavab2Label,200 , 200 , 200 )
	guiLabelSetColor(examJavab3Label,200 , 200 , 200 )
	guiLabelSetColor(examJavab4Label,200 , 200 , 200 )
	guiSetProperty(examPageKadr, "Visible", "False")
	
	
	
	
	--karname
		local font2_font = guiCreateFont("font2.ttf", 26)
		
	examFinalKadr = guiCreateStaticImage((screenW - 536) / 2, (screenH - 586) / 2, 536, 586, "Data/Images/kadr.png", false)
	examFinalWindow = guiCreateStaticImage(5, 5, 525, 575, "Data/Images/memo3.png", false, examFinalKadr)
	guiSetProperty(examFinalKadr, "Visible", "False")
	
	examNatijeLabel = guiCreateLabel(70, 200, 400, 400, "", false, examFinalWindow)
	guiLabelSetColor(examNatijeLabel,215 , 215 , 215 )
	guiSetFont(examNatijeLabel, font2_font)
		
	examFinalLogo = guiCreateStaticImage(160, 30, 220, 120, "Data/Images/sw.png", false, examFinalWindow)
	examFinalQabool = guiCreateStaticImage(157, 400,215, 73, "Data/Images/qabool.png", false, examFinalWindow)
	examFinalMardood = guiCreateStaticImage(157, 400,215, 73, "Data/Images/mardood.png", false, examFinalWindow)
	examFinalClose = guiCreateStaticImage(165, 480,200, 65, "Data/Images/ok.png", false, examFinalWindow)
	guiSetProperty(examFinalQabool, "Visible", "False")
	guiSetProperty(examFinalMardood, "Visible", "False")

end)

function refreshRule()
	if tonumber(getElementData(getLocalPlayer(), "examtype")) == 2 then
		guiSetText ( examRuleText, "\n \n **Nokat'e Mohem: \n \n \n \n1-Sorat'e Mojaz Dar Shahr 80km/h, Dar Otuban 120km/h \n \n2-Hagh'e Taghadom Dar Khiaban Hamishe Ba Mashin Haye Dolate \n \n3-Roshan Boodan Cheragh Haye Khodro Dar Shab Ejbari Mibashad \n \n4-Hade Aghal Fasele Mojaz Ba Khodroye Joloii Dar Khiaban Hengame Ranandegi 3M \n \n5-Bastan Kamarband Imeni Dar Hengame Ranandegi Ejbari Mibashad \n \n \n \n \n \n**Mohem Tarin Takhalofate Ranandegi: \n \n \n \n1-Sorat'e Gheyre Mojaz Ya Sorat Besyar Paien Hengam Ranandegi \n \n2-Bi Tavajohi Be Ala'em Police Rahnamaii Va Ranandegi \n \n3-Park kardane Khodro Be Soorate Gheyre Ghanooni Ya Park Kardan Dar Khiaban \n \n4-Estefade Az Nitro Dar Shahr \n \n5-Be Vojood Ovordane Terafic Sangin \n \n6-Khamoosh Boodane Cheraghe Mashin Dar Shab \n \n7-Ranandegi Ba Sorate Kam Dar Bozorg Rah Ha \n \n8-Sebghat'e Qeyre Mojaz Va Harekat Marpich \n \n9-Ranandegi Dar Jahate Mokhalef \n \n10-Estefade Az Hydrulic Dakhel Shahr")
	elseif tonumber(getElementData(getLocalPlayer(), "examtype")) == 1 then
		guiSetText ( examRuleText, "\n \n **Nokat'e Mohem: \n \n \n \n1-Sorat'e Mojaz Dar Shahr 80km/h, Dar Otuban 120km/h \n \n2-Hagh'e Taghadom Dar Khiaban Hamishe Ba Mashin Haye Dolate \n \n3-Roshan Boodan Cheragh Haye Motor Dar Shab Ejbari Mibashad\n \n4-Hade Aghal Fasele Mojaz Ba Khodroye Joloii Dar Khiaban Hengame Ranandegi 3M \n \n5-Gozashtane Kolahe Imeni Dar Hengame Ranandegi Ejbari Mibashad \n \n \n \n \n \n**Mohem Tarin Takhalofate Motorsavari: \n \n \n \n1-Sorat'e Gheyre Mojaz Ya Sorat Besyar Paien Hengam Ranandegi \n \n2-Bi Tavajohi Be Ala'em Police Rahnamaii Va Ranandegi \n \n3-Park Kardane Motor Dar Khiaban \n \n4-Tak Charkh Zadan Dar Khiaban Haye Aslie Shahr va Otooban\n \n5-Be Vojood Ovordane Terafic Sangin\n \n6-Khamoosh Boodane Cheraghe Motor Dar Shab\n \n7-Ranandegi Ba Sorate Kam Dar Bozorg Rah Ha \n \n8-Sebghat'e Qeyre Mojaz Va Harekat Marpich \n \n9-Ranandegi Dar Jahate Mokhalef")
	else
		--Yejaye Kar Moshkel Dare ... 
	end
end
--Start Activating Pages ...
local now = nil
function refreshSoal()
	if now == nil then
		now = 0
		guiSetText ( examSoalLabel, "Soal: Hade Aksar Sorat'e Mojaz Dar Shahr\nCheghadr Ast?!")
		guiSetText ( examJavab1Label, "1. 80")--true
		guiSetText ( examJavab2Label, "2. 100")
		guiSetText ( examJavab3Label, "3. 120")
		guiSetText ( examJavab4Label, "4. 140")
	elseif now == 0 then
		now = 1
		guiSetText ( examSoalLabel, "Soal: Haghe Taghadom Dar Khiaban Ba Kist?!")
		guiSetText ( examJavab1Label, "1. Khodro Haye Faction Ha")
		guiSetText ( examJavab2Label, "2. Khodro Haye Sport")
		guiSetText ( examJavab3Label, "3. Khanoom Ha")
		guiSetText ( examJavab4Label, "4. Khodro Haye Dolati")--true
	elseif now == 1 then
		now = 2
		guiSetText ( examSoalLabel, "Soal: Bayad Hamishe Az Kodam Taraf'e \nKhiaban Beranid?!")
		guiSetText ( examJavab1Label, "1. Rast")--true
		guiSetText ( examJavab2Label, "2. Chap")
		guiSetText ( examJavab3Label, "3. Az har Taraf Ke Bekhahim")
		guiSetText ( examJavab4Label, "4. Hichkodam")
	elseif now == 2 then
		now = 3
		if tonumber(getElementData(getLocalPlayer(), "examtype")) == 2 then
			guiSetText ( examSoalLabel, "Soal: Estefade az Nitro Dar Shahr:")
			guiSetText ( examJavab1Label, "1. Azad Ast")
			guiSetText ( examJavab2Label, "2. Khalaf Ast")--true
			guiSetText ( examJavab3Label, "3. Eshkali Nadarad")
			guiSetText ( examJavab4Label, "4. Del Bekhah Ast")
		elseif tonumber(getElementData(getLocalPlayer(), "examtype")) == 1 then
			guiSetText ( examSoalLabel, "Soal: Takcharkh Zadan Dar Shahr:")
			guiSetText ( examJavab1Label, "1. Azad Ast")
			guiSetText ( examJavab2Label, "2. Khalaf Ast")--true
			guiSetText ( examJavab3Label, "3. Eshkali Nadarad")
			guiSetText ( examJavab4Label, "4. Del Bekhah Ast")
		end
	elseif now == 3 then
		now = 4
		guiSetText ( examSoalLabel, "Soal: Roshan Boodan Cheragh Haye Vasile Naqlie\nDar Shab:")--
		guiSetText ( examJavab1Label, "1. Ejbari Ast")--true
		guiSetText ( examJavab2Label, "2. Delbekhah Ast")
		guiSetText ( examJavab3Label, "3. Khalaf Ast")
		guiSetText ( examJavab4Label, "4. Jarime Darad")
	elseif now == 4 then
		now = 5
		guiSetText ( examSoalLabel, "Soal: Hade Aghal Fasele Mojaz Ba Vasile Naqlie Joloii\nDar Khiaban Cheghadr Ast?")
		guiSetText ( examJavab1Label, "1. 4 Metr")
		guiSetText ( examJavab2Label, "2. 3 Metr")--true
		guiSetText ( examJavab3Label, "3. 2 Metr")
		guiSetText ( examJavab4Label, "4. 1 Metr")
	elseif now == 5 then
		now = 6
		guiSetText ( examSoalLabel, "Soal: Hade Aksar Sorat'e Mojaz Dar Otooban\nCheghadr Ast?")
		guiSetText ( examJavab1Label, "1. 100")
		guiSetText ( examJavab2Label, "2. 120")--true
		guiSetText ( examJavab3Label, "3. 140")
		guiSetText ( examJavab4Label, "4. 160")
	elseif now == 6 then
		now = 7
		if tonumber(getElementData(getLocalPlayer(), "examtype")) == 2 then
			guiSetText ( examSoalLabel, "Soal: Bastan Kamarband'e Imeni Hengam'e \nRanandegi:")
			guiSetText ( examJavab1Label, "1. Khalaf Ast")
			guiSetText ( examJavab2Label, "2. Delbekhah Ast")
			guiSetText ( examJavab3Label, "3. Ejbari Ast")--true
			guiSetText ( examJavab4Label, "4. Jarime Darad")
		elseif tonumber(getElementData(getLocalPlayer(), "examtype")) == 1 then
			guiSetText ( examSoalLabel, "Soal: Gozashtan Kolah'e Imeni Hengam'e \nRanandegi:")
			guiSetText ( examJavab1Label, "1. Khalaf Ast")
			guiSetText ( examJavab2Label, "2. Delbekhah Ast")
			guiSetText ( examJavab3Label, "3. Ejbari Ast")--true
			guiSetText ( examJavab4Label, "4. Jarime Darad")
		end
	elseif now == 7 then
		now = 8
		guiSetText ( examSoalLabel, "Soal: Hengame Daryafte Payam Az Tarafe Police\nBayad Che Kard?")
		guiSetText ( examJavab1Label, "1. Tarsid va Farar Kard")
		guiSetText ( examJavab2Label, "2. Bi Tavajohi Kard")
		guiSetText ( examJavab3Label, "3. Bayad Aheste Kenare Khiaban Istad")--true
		guiSetText ( examJavab4Label, "4. Javgir Shod Va Sorat Ro Ziad Kard")
	elseif now == 8 then
		now = 9
		guiSetText ( examSoalLabel, "Soal: Harekaat'e Marpich Dar Khiaban:")
		guiSetText ( examJavab1Label, "1. Takhalof Ast")
		guiSetText ( examJavab2Label, "2. Ehtemale Khesarate Maali Va Jaani Darad")
		guiSetText ( examJavab3Label, "3. Jarime Darad")
		guiSetText ( examJavab4Label, "4. Hame Mavared")--true
	elseif now == 9 then
		--Final Page!
		if emtiaz > 6 then
			guiSetProperty(examFinalQabool, "Visible", "True")
		else
			guiSetProperty(examFinalMardood, "Visible", "True")
		end
		now = nil
		guiSetProperty(examPageKadr, "Visible", "False")
		guiSetProperty(examFinalKadr, "Visible", "True")
		qalat = 10 - emtiaz
		guiSetText ( examNatijeLabel, "\n Javab Haye Dorost: "..emtiaz.." \n\n Javab Haye Qalat: "..qalat)
		guiLabelSetHorizontalAlign(examNatijeLabel, "center", false)
	end
end

function guiExamNeshoonBede(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(examKadr, "Visible", "True")
		showCursor(true)
		emtiaz = 0
	end
end
addEvent("examShowEvent",true)
addEventHandler("examShowEvent", getRootElement(), guiExamNeshoonBede)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == examClose then
		guiSetProperty(examKadr, "Visible", "False")
		showCursor(false)
	elseif source == examStarttest then
		guiSetProperty(examKadr, "Visible", "False")
		guiSetProperty(examPageKadr, "Visible", "True")
		refreshSoal()
	elseif source == examPageButton then
		guiSetProperty(examKadr, "Visible", "False")
		guiSetProperty(examPageKadr, "Visible", "False")
		showCursor(false)
		now = nil
		emtiaz = 0
	elseif source == examQavanin then
		guiSetProperty(examKadr, "Visible", "False")
		guiSetProperty(examRuleKadr, "Visible", "True")
		refreshRule()
	elseif source == examRuleButton then
		guiSetProperty(examRuleKadr, "Visible", "False")
		guiSetProperty(examKadr, "Visible", "True")
	elseif source == examFinalClose then
		local state = guiGetProperty(examFinalQabool, "Visible")
		if state == "True" then
		guiSetProperty(examFinalKadr, "Visible", "False")
		guiSetProperty(examFinalQabool, "Visible", "False")
		guiSetProperty(examFinalMardood, "Visible", "False")
		showCursor(false)
		now = nil
		emtiaz = 0
		if getElementData(getLocalPlayer(),"examtype") == 1 then
		triggerServerEvent("bikeghabolshod", getLocalPlayer(), getLocalPlayer() )
		elseif getElementData(getLocalPlayer(),"examtype") == 2 then
		triggerServerEvent("carghabolshod", getLocalPlayer(), getLocalPlayer() )
		end
		else
		guiSetProperty(examFinalKadr, "Visible", "False")
		guiSetProperty(examFinalQabool, "Visible", "False")
		guiSetProperty(examFinalMardood, "Visible", "False")
		triggerServerEvent("radshod", getLocalPlayer(), getLocalPlayer() )
		showCursor(false)
		now = nil
		emtiaz = 0
		end
	elseif source == examJavab1Label then
		if now == 0 then
			refreshSoal()
			emtiaz = 1
		elseif now == 1 then
			refreshSoal()
		elseif now == 2 then
			refreshSoal()
			emtiaz = emtiaz + 1
		elseif now == 3 then
			refreshSoal()
		elseif now == 4 then
			refreshSoal()
			emtiaz = emtiaz + 1
		elseif now == 5 then
			refreshSoal()
		elseif now == 6 then
			refreshSoal()
		elseif now == 7 then
			refreshSoal()
		elseif now == 8 then
			refreshSoal()
		elseif now == 9 then
			refreshSoal()
		end
	elseif source == examJavab2Label then
		if now == 0 then
			refreshSoal()
		elseif now == 1 then
			refreshSoal()
		elseif now == 2 then
			refreshSoal()
		elseif now == 3 then
			refreshSoal()
			emtiaz = emtiaz + 1
		elseif now == 4 then
			refreshSoal()
		elseif now == 5 then
			refreshSoal()
			emtiaz = emtiaz + 1
		elseif now == 6 then
			refreshSoal()
		elseif now == 7 then
			refreshSoal()
		elseif now == 8 then
			refreshSoal()
		elseif now == 9 then
			refreshSoal()
		end
	elseif source == examJavab3Label then
		if now == 0 then
			refreshSoal()
		elseif now == 1 then
			refreshSoal()
		elseif now == 2 then
			refreshSoal()
		elseif now == 3 then
			refreshSoal()
		elseif now == 4 then
			refreshSoal()
		elseif now == 5 then
			refreshSoal()
		elseif now == 6 then
			refreshSoal()
		elseif now == 7 then
			refreshSoal()
			emtiaz = emtiaz + 1
		elseif now == 8 then
			refreshSoal()
			emtiaz = emtiaz + 1
		elseif now == 9 then
			refreshSoal()
		end
	elseif source == examJavab4Label then
		if now == 0 then
			refreshSoal()
		elseif now == 1 then
			refreshSoal()
			emtiaz = emtiaz + 1
		elseif now == 2 then
			refreshSoal()
		elseif now == 3 then
			refreshSoal()
		elseif now == 4 then
			refreshSoal()
		elseif now == 5 then
			refreshSoal()
		elseif now == 6 then
			refreshSoal()
		elseif now == 7 then
			refreshSoal()
		elseif now == 8 then
			refreshSoal()
		elseif now == 9 then
			emtiaz = emtiaz + 1
			refreshSoal()
		end
	end
end)


examnpc1 = createPed( 141, -2035.0288085938 ,-117.92977905273 ,1035.171875)
setElementRotation ( examnpc1, 0, 0 , 268.47424316406 )
setElementInterior ( examnpc1, 3 )
setElementFrozen(examnpc1, true)

examnpc2 = createPed( 187, -2033.1352539063 ,-114.07048034668 ,1035.171875)
setElementRotation ( examnpc2, 0, 0 , 180 )
setElementInterior ( examnpc2, 3 )
setElementFrozen(examnpc2, true)
setPedAnimation(examnpc1,"dealer","dealer_idle",1,true,false)
setPedAnimation(examnpc2,"dealer","dealer_idle",1,true,false)


function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", examnpc1, cancelPedDamage)
function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", examnpc2, cancelPedDamage)