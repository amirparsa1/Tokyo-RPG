local font = guiCreateFont("normal.woff", 12)
CR = 255
CG = 255
CB = 255
 
local screenW, screenH = guiGetScreenSize()
local x,y=(screenW/1600), (screenH/900)
local TimeKamion = 14
local AirDropTime = 19
local TimeKamion2 = 18
local TimeKeshti = 17
local TimeMantagheHavaei = 20
local FreeForAll = 22
local notfSys = exports['notf']
--{ID,ESM,SCORE}
function insertSortingByIndex(array, e)
	local data = array
    e = tonumber(e)
	for i = 2, #data do
		local j = i - 1
		local ass = data[i]
		while j > 0 and data[j][e] > ass[e] do
			data[j + 1] = data[j]
			j = j - 1
		end
		data[j + 1] = ass
	end
	return data
end
function table.reverse(t) 
    local reversedTable = {} 
    local itemCount = #t  
    for k, v in ipairs(t) do 
        reversedTable[itemCount + 1 - k] = v  
    end 
    return reversedTable  
end 
function fixedBubbleSortingByIndex(array, e)
	local data = array
    e = tonumber(e)
	local i = #data
	while i >= 2 do
		local idx = 0
		for j = 1, (i - 1) do
			if data[j][e] > data[j + 1][e] then
				local holder = data[j][e]
				data[j][e] = data[j + 1][e]
				data[j + 1][e] = holder
				idx = j
			end
		end
		i = idx
	end
	return data
end
--local fontPanelManage1 = guiCreateFont( ,1 )
function openpanelcreatefam(root)
	if root == getLocalPlayer() then
        logoid = 1
        fMemberSlot = 5
        fVehSlot = 5

		bg = guiCreateWindow(420, 160, 700, 500, "TheNigh MTA Family System V1.0", false)
        guiWindowSetSizable(bg, false)
        dokmebastan = guiCreateButton(10, 458, 900, 50, "Bastan", false, bg)
        guiSetFont(dokmebastan,guiCreateFont("normal.woff", 20))
        guiSetProperty (dokmebastan, "NormalTextColour", "FFFF0000")
        guiSetProperty (dokmebastan, "HoverTextColour", "FFFF0000")
        --guiSetProperty()
        showCursor(true)
        tabpanel1 = guiCreateTabPanel(9, 22, 740, 430, false, bg)
        tab1 = guiCreateTab("Moshakhasat Family", tabpanel1)
        --[[Start Tab 1]]
        namefam = guiCreateEdit(150, 25, 180, 28, "", false, tab1)
        guiEditSetMaxLength ( namefam, 20 )
        guiCreateLabel(10, 30, 140, 25, "Esm Family Shoma:", false, tab1)
        shoarfam = guiCreateEdit(150, 80, 270, 28, "", false, tab1)
        guiEditSetMaxLength ( shoarfam, 45 )
        guiCreateLabel(10, 85, 150, 25, "Shoar Family Shoma:", false, tab1)
        pickcolorfam = guiCreateButton(150, 130, 270, 28, "Pick Color", false, tab1)
        guiCreateLabel(20, 132, 150, 70, "Rang Family Shoma:", false, tab1)
        guiLabelSetColor(pickcolorfam,0 , 0 , 255 )
        --[[قسمت لوگو انتخاب کردن]]
        guiCreateLabel(40, 200, 250, 25, "Logo Family Shoma:", false, tab1)
        logofamily = guiCreateStaticImage(135, 175, 190, 190,"logo/"..logoid..".dds",false, tab1)
        
        dokmenextlogo = guiCreateButton(230, 365, 100, 30, ">>", false, tab1)
        dokmebacklogo = guiCreateButton(130, 365, 100, 30, "<<", false, tab1)
        guiSetFont(dokmenextlogo,guiCreateFont("normal.woff", 20))
        guiSetFont(dokmebacklogo,guiCreateFont("normal.woff", 20))
        guiCreateLabel(470, 40, 250, 25, "Max Slot Family Shoma (Member):", false, tab1)
        --[[قسمت اسلات ممبر انتخاب کردن]]
        maxslot5 = guiCreateButton(460, 65, 35, 35, "5", false, tab1)
        guiSetEnabled(maxslot5,false)
        maxslot10 = guiCreateButton(515, 65, 35, 35, "10", false, tab1)
        maxslot15 = guiCreateButton(570, 65, 35, 35, "15", false, tab1)
        maxslot25 = guiCreateButton(625, 65, 35, 35, "25", false, tab1)
        --[[قسمت اسلات ماشین انتخاب کردن]]
        guiCreateLabel(470, 150, 250, 25, "Max Slot Family Shoma (Vehicle):", false, tab1)
        maxslotv5 = guiCreateButton(460, 175, 35, 35, "5", false, tab1)
        guiSetEnabled(maxslotv5,false)
        maxslotv8 = guiCreateButton(515, 175, 35, 35, "8", false, tab1)
        maxslotv15 = guiCreateButton(570, 175, 35, 35, "15", false, tab1)
        maxslotv20 = guiCreateButton(625, 175, 35, 35, "20", false, tab1)
        guiCreateLabel(470, 255, 250, 25, "Tag:", false, tab1)
        tagfam = guiCreateEdit(500, 250, 75, 28, "", false, tab1)
        guiEditSetMaxLength ( tagfam, 5 )

        tab2 = guiCreateTab("List Rank Haye Family", tabpanel1)
        header = guiCreateLabel(265, 10, 250, 25, "List Rank Haye Family Shoma:", false, tab2)

        frank10 = guiCreateLabel(220, 45, 50, 25, "(10)", false, tab2)
        
        nrank10 = guiCreateEdit(270, 40, 150, 28, "Leader", false, tab2)
        guiSetEnabled(nrank10,false)
        frank9 = guiCreateLabel(220, 75, 50, 25, "(9)", false, tab2)
        nrank9 = guiCreateEdit(270, 70, 150, 28, "Co-Leader", false, tab2)
        guiSetEnabled(nrank9,false)
        frank8 = guiCreateLabel(220, 105, 50, 25, "(8)", false, tab2)
        nrank8 = guiCreateEdit(270, 100, 150, 28, "Rank-8", false, tab2)
        guiEditSetMaxLength ( nrank8, 10 )
        frank7 = guiCreateLabel(220, 135, 50, 25, "(7)", false, tab2)
        nrank7 = guiCreateEdit(270, 130, 150, 28, "Rank-7", false, tab2)
        guiEditSetMaxLength ( nrank7, 10 )
        frank6 = guiCreateLabel(220, 165, 50, 25, "(6)", false, tab2)
        nrank6 = guiCreateEdit(270, 160, 150, 28, "Rank-6", false, tab2)
        guiEditSetMaxLength ( nrank6, 10 )
        frank5 = guiCreateLabel(220, 195, 50, 25, "(5)", false, tab2)
        nrank5 = guiCreateEdit(270, 190, 150, 28, "Rank-5", false, tab2)
        guiEditSetMaxLength ( nrank5, 10 )
        frank4 = guiCreateLabel(220, 225, 50, 25, "(4)", false, tab2)
        nrank4 = guiCreateEdit(270, 220, 150, 28, "Rank-4", false, tab2)
        guiEditSetMaxLength ( nrank4, 10 )
        frank3 = guiCreateLabel(220, 255, 50, 25, "(3)", false, tab2)
        nrank3 = guiCreateEdit(270, 250, 150, 28, "Rank-3", false, tab2)
        guiEditSetMaxLength ( nrank3, 10 )
        frank2 = guiCreateLabel(220, 285, 50, 25, "(2)", false, tab2)
        nrank2 = guiCreateEdit(270, 280, 150, 28, "Rank-2", false, tab2)
        guiEditSetMaxLength ( nrank2, 10 )
        frank1 = guiCreateLabel(220, 315, 50, 25, "(1)", false, tab2)
        nrank1 = guiCreateEdit(270, 310, 150, 28, "Rank-1", false, tab2)
        guiEditSetMaxLength ( nrank1, 10 )
        --[[end tab2]]
        --[[start tab3]]
        tab3 = guiCreateTab("Sakht Family", tabpanel1)
        guiCreateLabel(10, 5, 100, 20, "(Ghavanin Family)", false, tab3)
        gaver = guiCreateLabel(10, 30, 670, 500, "Player Haye Aziz Tavajoh Dashte Bashid Ke Pas Az Sakht Family Mablgh Gold Ke Dar\nZir Baraye Shoma Neveshte Shode Ast Az Hesab Shoma Kasr Mishavad Va Be Soorat\nKhodkar 30 Rooz Family Shoma Sharj Mishavad,Monteha Baraye Sharj Mibayest 15% \nHazine Sakht Family Khodra Be Onvan Hazine Tamdid Family Pardakht Konid.\nTavajoh Dashte Bashid Ke Pas Az Sakht Family Yeki Az Admin Haye Faal Dar Server\nFamily Shomara Taeid Konad,Hamchenin Pas Az Sakht Family Khane Shoma Be Onvan \nHQ Family Set Mishavad Va Ta Zamani Ke Family Shoma Faal Bashad Nemitavanid \nKhane Khod Ra Sell Dahid.", false, tab3)
        guiSetFont(gaver,font)
        accgover = guiCreateRadioButton(27, 260, 370, 65,"Matn Balara (Ghavanin) Motale Kardam Va Mipaziram",false,tab3)
        guiSetFont(accgover,guiCreateFont("normal.woff", 14))
        local smgf = 1700
        local svgf = 2700
        matnghablgold = guiCreateLabel(10, 310, 670, 500, "Meghdar Hazine Sakht: ", false, tab3)
        matnbadegold = guiCreateLabel(390, 310, 670, 500, "Gold", false, tab3)
        endgold = guiCreateLabel(310, 310, 670, 500, "", false, tab3)
        guiLabelSetColor(endgold,255,255,0)
        guiLabelSetColor(matnghablgold,128,255,0)
        guiLabelSetColor(matnbadegold,128,255,0)
        guiLabelSetColor(gaver,255,255,255)
        guiSetFont(matnghablgold,guiCreateFont("normal.woff", 20))
        guiSetFont(matnbadegold,guiCreateFont("normal.woff", 20))
        guiSetFont(endgold,guiCreateFont("normal.woff", 20))
        guiSetText(endgold,smgf + svgf)
        submitcreatefam = guiCreateButton(470, 300, 200, 70, "Sakht Family", false, tab3)
        guiSetFont(submitcreatefam,guiCreateFont("normal.woff", 15))
        guiSetProperty (submitcreatefam, "NormalTextColour", "FF00FF00")
        guiSetProperty (submitcreatefam, "HoverTextColour", "FF00FF00")
        --{{پایان کلاینت #ExoPrim}}

	end
end
addEvent("openkonpanelro",true)
addEventHandler("openkonpanelro", getRootElement(), openpanelcreatefam)



function closepanelcreatefam(root)
	if root == getLocalPlayer() then
        guiSetProperty(bg, "Visible", "False")
        showCursor(false)
	end
end
addEvent("closekonpanelro",true)
addEventHandler("closekonpanelro", getRootElement(), closepanelcreatefam)



addEventHandler("onClientGUIClick", getRootElement(),
function ()
    if source == dokmebastan then
        triggerServerEvent("openpanel", getLocalPlayer(), getLocalPlayer() )
        guiSetProperty(bg, "Visible", "False")
        showCursor(false)
    elseif source == dokmenextlogo then
        logoid = logoid + 1
        if logoid < 100 then
            guiSetProperty(logofamily, "Visible", "False")
            logofamily = guiCreateStaticImage(135, 175, 190, 190,"logo/"..logoid..".dds",false, tab1)
        else
            logoid = 1
        end
        notfSys:addNotification("Logo Family Shoma Roye "..logoid.." Set Shod", "info")
    elseif source == dokmebacklogo then
        logoid = logoid - 1
        if logoid == 0 then
            logoid = 100

        else
            guiSetProperty(logofamily, "Visible", "False")
            logofamily = guiCreateStaticImage(135, 175, 190, 190,"logo/"..logoid..".dds",false, tab1)
        end
        notfSys:addNotification("Logo Family Shoma Roye "..logoid.." Set Shod", "info")
    elseif source == maxslot5 then
        fMemberSlot = 5
        notfSys:addNotification("Max Slot Member Family Shoma Roye 5 Set Shod", "info")
        if svgf == nil then
            svgf = 2700
        end
        smgf = 1700
        guiSetText(endgold,smgf + svgf)
        guiSetEnabled(maxslot5,false)
        guiSetEnabled(maxslot10, true)
        guiSetEnabled(maxslot15, true)
        guiSetEnabled(maxslot25, true)
    elseif source == maxslot10 then
        fMemberSlot = 10
        notfSys:addNotification("Max Slot Member Family Shoma Roye 10 Set Shod", "info")
        if svgf == nil then
            svgf = 2700
        end
        smgf = 2500
        guiSetText(endgold,smgf + svgf)
        guiSetEnabled(maxslot5,true)
        guiSetEnabled(maxslot10, false)
        guiSetEnabled(maxslot15, true)
        guiSetEnabled(maxslot25, true)
    elseif source == maxslot15 then
        fMemberSlot = 15
        notfSys:addNotification("Max Slot Member Family Shoma Roye 15 Set Shod", "info")
        if svgf == nil then
            svgf = 2700
        end
        smgf = 10000
        guiSetText(endgold,smgf + svgf)
        guiSetEnabled(maxslot5,true)
        guiSetEnabled(maxslot10, true)
        guiSetEnabled(maxslot15, false)
        guiSetEnabled(maxslot25, true)
    elseif source == maxslot25 then
        fMemberSlot = 25
        notfSys:addNotification("Max Slot Member Family Shoma Roye 25 Set Shod", "info")
        if svgf == nil then
            svgf = 2700
        end
        
        smgf = 21000
        guiSetText(endgold,smgf + svgf)
        guiSetEnabled(maxslot5,true)
        guiSetEnabled(maxslot10, true)
        guiSetEnabled(maxslot15, true)
        guiSetEnabled(maxslot25, false)
    elseif source == maxslotv5 then
        fVehSlot = 5
        notfSys:addNotification("Max Slot Vehicle Family Shoma Roye 5 Set Shod", "info")
        if smgf == nil then
            smgf = 1700
        end
        svgf = 2700
        guiSetText(endgold,smgf + svgf)
        guiSetEnabled(maxslotv5, false)
        guiSetEnabled(maxslotv8, true)
        guiSetEnabled(maxslotv15, true)
        guiSetEnabled(maxslotv20, true)
    elseif source == maxslotv8 then
        fVehSlot = 8
        notfSys:addNotification("Max Slot Vehicle Family Shoma Roye 8 Set Shod", "info")
        if smgf == nil then
            smgf = 1700
        end
        svgf = 3500
        guiSetText(endgold,smgf + svgf)
        guiSetEnabled(maxslotv5, true)
        guiSetEnabled(maxslotv8,  false)
        guiSetEnabled(maxslotv15, true)
        guiSetEnabled(maxslotv20, true)
    elseif source == maxslotv15 then
        fVehSlot = 15
        notfSys:addNotification("Max Slot Vehicle Family Shoma Roye 15 Set Shod", "info")
        if smgf == nil then
            smgf = 1700
        end
        svgf = 10000
        guiSetText(endgold,smgf + svgf)
        guiSetEnabled(maxslotv5, true)
        guiSetEnabled(maxslotv8,  true)
        guiSetEnabled(maxslotv15, false)
        guiSetEnabled(maxslotv20, true)
    elseif source == maxslotv20 then
        fVehSlot = 20
        notfSys:addNotification("Max Slot Vehicle Family Shoma Roye 20 Set Shod", "info")
        if smgf == nil then
            smgf = 1700
        end
        
        svgf = 16000
        guiSetText(endgold,smgf + svgf)
        guiSetEnabled(maxslotv5, true)
        guiSetEnabled(maxslotv8,  true)
        guiSetEnabled(maxslotv15, true)
        guiSetEnabled(maxslotv20, false)
    elseif source == pickcolorfam then
        exports["cpickerfam"]:openPicker(getLocalPlayer(), "#FFAA00", "Rang Family Khod Ra Entekhab Konid")
        addEventHandler("onColorPickerOK", root, 
        function(element, hex, R, G, B) 
            CR = tonumber(R)
            CG = tonumber(G)
            CB = tonumber(B)
        end) 
    elseif source == PickColorForPanelEditFamily then
        exports["cpickerfam"]:openPicker(getLocalPlayer(), "#FFAA00", "Rang Jadid Family Khod Ra Entekhab Konid.")
        addEventHandler("onColorPickerOK", root, 
        function(element, hex, R2, G2, B2) 
            FCR2 = tonumber(R2)
            FCG2 = tonumber(G2)
            FCB2 = tonumber(B2)
        end) 
    elseif source == submitcreatefam then 
        tagfams = guiGetText(tagfam)
        namefams = guiGetText(namefam)
        if guiRadioButtonGetSelected(accgover)then             
            if (string.len(guiGetText(namefam))>=3) then
                if (string.len(guiGetText(tagfam))>=3) then
                    if (string.len(guiGetText(nrank8))>=1) then
                        if (string.len(guiGetText(nrank7))>=1) then
                            if (string.len(guiGetText(nrank6))>=1) then
                                if (string.len(guiGetText(nrank5))>=1) then
                                    if (string.len(guiGetText(nrank4))>=1) then
                                        if (string.len(guiGetText(nrank3))>=1) then
                                            if (string.len(guiGetText(nrank2))>=1) then
                                                if (string.len(guiGetText(nrank1))>=1) then
                                                    triggerServerEvent("openpanel", getLocalPlayer(),getLocalPlayer())                                  
                                                    triggerServerEvent("createkonfam", getLocalPlayer(),getLocalPlayer(),tagfams,namefams,CR,CG,CB,guiGetText(shoarfam),fMemberSlot,fVehSlot,guiGetText(nrank8),guiGetText(nrank7),guiGetText(nrank6),guiGetText(nrank5),guiGetText(nrank4),guiGetText(nrank3),guiGetText(nrank2),guiGetText(nrank1),guiGetText(endgold),logoid )
                                                else
                                                    notfSys:addNotification( "Rank 1 Family Hadaghal Bayad 1 Harf Bashad!" , 'error')
                                                end
                                            else
                                                notfSys:addNotification( "Rank 2 Family Hadaghal Bayad 1 Harf Bashad!" , 'error')
                                            end
                                        else
                                            notfSys:addNotification( "Rank 3 Family Hadaghal Bayad 1 Harf Bashad!" , 'error')
                                        end

                                    else
                                        notfSys:addNotification( "Rank 4 Family Hadaghal Bayad 1 Harf Bashad!" , 'error')
                                    end
                                else
                                    notfSys:addNotification( "Rank 5 Family Hadaghal Bayad 1 Harf Bashad!" , 'error')
                                end
                            else
                                notfSys:addNotification( "Rank 6 Family Hadaghal Bayad 1 Harf Bashad!" , 'error')
                            end
                        else
                            notfSys:addNotification( "Rank 7 Family Hadaghal Bayad 1 Harf Bashad!" , 'error')
                        end
                    else
                        notfSys:addNotification( "Rank 8 Family Hadaghal Bayad 1 Harf Bashad!" , 'error')
                    end
                else
                    notfSys:addNotification( "Tage Fam Hadaghal 3 Harf Bayad Dashte Beshe!" , 'error')
                end
            else
                notfSys:addNotification( "Name Fam Hadaghal 3 Harf Bayad Dashte Beshe!" , 'error')
            end
        else 
            notfSys:addNotification("Ghavanin Ra Motale V Bepazir!" , 'error')
        end
    end
end)
------------------------------------------------------------start panel Manage Famile For Admins----------------------------
BackgroundF = guiCreateWindow((screenW - 750) / 2, (screenH - 400) / 2, 660, 520, "Panel Manage Familys", false)
guiSetProperty(BackgroundF, "Visible", "False")
local Familyslist = guiCreateGridList(0.01, 0.05, 3, 0.77, true,BackgroundF)
local cplayername = guiGridListAddColumn(Familyslist, "Family Name", 0.2)
local cplayerwarns = guiGridListAddColumn(Familyslist,"Family Owner", 0.15)
local cplayerrank = guiGridListAddColumn(Familyslist, "Family Shoar", 0.45)
local cplayerjoain = guiGridListAddColumn(Familyslist,"Family Tag", 0.1)
local cplayerlastl = guiGridListAddColumn(Familyslist,"LogoID", 0.1)
local cplayerMaxPlayer = guiGridListAddColumn(Familyslist, "Player Slot", 0.1)
local cplayerMaxVeh = guiGridListAddColumn(Familyslist,  "Veh Slot", 0.1)
local cplayerduty = guiGridListAddColumn(Familyslist,  "Active", 0.1)
local cplayerBanTime = guiGridListAddColumn(Familyslist,"Family Ban", 0.2)
guiGridListAutoSizeColumn( Familyslist, 9 )
guiWindowSetSizable(BackgroundF, false)
local BackgroundBanFam = guiCreateWindow((screenW - 750) / 2, (screenH - 400) / 2, 330, 170, "Aya Motmaen Hastid?", false)
guiSetProperty( BackgroundBanFam, "Visible", "False")
local BanFam = guiCreateButton(40, 80, 120, 40, "Bale", false, BackgroundBanFam)
local cancelBanFam = guiCreateButton(170, 80, 120, 40, "Kheyr . Monsaref Shodam", false, BackgroundBanFam)
local BanFamTime = guiCreateEdit(85, 125, 150, 30, "Ban Time(Saat)", false, BackgroundBanFam)
local GiveFactionWarn = guiCreateButton(1, 430, 250, 35, "Active", false, BackgroundF)
local RemoveFactionWarn = guiCreateButton(1, 475, 250, 35, "Off Active", false, BackgroundF)
local PromotFactionRank = guiCreateButton(267, 430, 230, 35, "Ban", false, BackgroundF)
local DemoteFactionRank = guiCreateButton(267, 475, 230, 35, "Delete", false, BackgroundF)
local ShowKickWindow = guiCreateButton(503, 430, 147, 35, "Unban", false, BackgroundF)
local Close = guiCreateButton(503, 475, 147, 35, "Close", false, BackgroundF)
addCommandHandler("familys",function()
    if getElementData(getLocalPlayer(), "loggedIn") == true then
        triggerServerEvent("openFamilyManagePanel", getLocalPlayer(), getLocalPlayer() )
    end
end)
addEvent("infoFamPanel",true)
addEventHandler("infoFamPanel",getLocalPlayer(),function(root,fname,R,G,B,owner,shoar,fTag,LogoId,mslot,vslot,fActive,fids)
    if root == getLocalPlayer() then
		if getElementData(root, "loggedIn") == true then
            if tonumber(fActive) == 0 then
                activeity = "Not Active"
                ra,ga,ba = 255,0,0
            elseif tonumber(fActive) == 1 then
                activeity = "Active"
                ra,ga,ba = 0,255,0
            end
            local familyname = fname
	        local myrow = guiGridListAddRow(Familyslist,familyname,owner,shoar,fTag,LogoId,mslot,vslot,activeity)
	        guiGridListSetItemColor (Familyslist,myrow,cplayername,R,G,B)
            guiGridListSetItemColor (Familyslist,myrow,cplayerduty,ra,ga,ba)
        end
    end
end)
function toggleFamilyPanleManage(root)
    if root == getLocalPlayer() then
		if getElementData(root, "loggedIn") == true then
            if guiGetVisible( BackgroundF ) == false then
                showCursor(true)
                guiSetProperty(BackgroundF, "Visible", "True")
                triggerServerEvent("infoFam", getLocalPlayer(), getLocalPlayer() )
            else
                guiGridListClear(Familyslist,factionMember)
                showCursor(false)
                guiSetProperty(BackgroundF,"Visible","False")
            end
        end
    end
end
addEvent("toggleFamilyPanleManage",true)
addEventHandler("toggleFamilyPanleManage", root, toggleFamilyPanleManage)
selectedFamily = 0
addEventHandler("onClientGUIClick",root,
function ()
    
	if source == Close then
        toggleFamilyPanleManage(getLocalPlayer())
    elseif source == Familyslist then

		entekhab = guiGridListGetSelectedItem(Familyslist,myrow)
		esmefamily = guiGridListGetItemText ( Familyslist, entekhab, cplayername )
        fsahebe = guiGridListGetItemText ( Familyslist, entekhab, cplayerwarns )
        fshoard = guiGridListGetItemText ( Familyslist, entekhab, cplayerrank )
        selectedFamily = esmefamily

		
    elseif source == GiveFactionWarn then
        if selectedFamily ~= 0 then
            selectedFamily = 0
            triggerServerEvent("ActiveFamilily", getLocalPlayer(), getLocalPlayer(),esmefamily,fsahebe,fshoard )
            guiGridListClear(Familyslist,factionMember)

            triggerServerEvent("infoFam", getLocalPlayer(), getLocalPlayer() )
        else
            notfSys:addNotification("Ebteda Yek Family Ra Entekhab Konid!","error")
        end
        
    elseif source == RemoveFactionWarn then
        if selectedFamily ~= 0 then
            selectedFamily = 0
            triggerServerEvent("NoActiveFamilily", getLocalPlayer(), getLocalPlayer(),esmefamily,fsahebe,fshoard )
            guiGridListClear(Familyslist,factionMember)
            triggerServerEvent("infoFam", getLocalPlayer(), getLocalPlayer() )
        else
            notfSys:addNotification("Ebteda Yek Family Ra Entekhab Konid!","error")
        end
    elseif source == DemoteFactionRank then
        if selectedFamily ~= 0 then
            selectedFamily = 0
            triggerServerEvent("DelFamily", getLocalPlayer(), getLocalPlayer(),esmefamily,fsahebe,fshoard )
            guiGridListClear(Familyslist,factionMember)
            triggerServerEvent("infoFam", getLocalPlayer(), getLocalPlayer() )
        else
            notfSys:addNotification("Ebteda Yek Family Ra Entekhab Konid!","error")
        end
    elseif source == DemoteFactionRank then
        if selectedFamily ~= 0 then
            selectedFamily = 0
            triggerServerEvent("DelFamily", getLocalPlayer(), getLocalPlayer(),esmefamily,fsahebe,fshoard )
            guiGridListClear(Familyslist,factionMember)
            triggerServerEvent("infoFam", getLocalPlayer(), getLocalPlayer() )
        else
            notfSys:addNotification("Ebteda Yek Family Ra Entekhab Konid!","error")
        end
    elseif source == PromotFactionRank then
        if selectedFamily ~= 0 then
            labelnamekcik = guiCreateLabel( 10,25, 300, 50, "Aya Mikhahid Family "..esmefamily.." Ra Az Tamim\n\n/Event/War Mahrom Konid?", false, BackgroundBanFam )
            guiSetProperty( BackgroundBanFam, "Visible", "True")
            guiSetProperty(BackgroundF,"Visible","False")
        else
            notfSys:addNotification("Ebteda Yek Family Ra Entekhab Konid!","error")
        end

    elseif source == cancelBanFam then
        guiSetProperty( BackgroundBanFam, "Visible", "False")
        guiSetProperty(BackgroundF,"Visible","True")
    elseif source == BanFam then
        BanFamTime = guiGetText(BanFamTime) 
        if BanFamTime == "" or BanFamTime == nil or BanFamTime == false then
            BanFamTime = 0
        end
        if ( string.find ( BanFamTime, '~' ) ) or ( string.find ( BanFamTime, '!' ) ) or ( string.find ( BanFamTime, '_' ) )  or ( string.find ( BanFamTime, '@' ) ) or ( string.find ( BanFamTime, '#' ) ) or ( string.find ( BanFamTime, '&' ) ) or ( string.find ( BanFamTime, '*' ) ) or ( string.find ( BanFamTime, '-' ) ) or ( string.find ( BanFamTime, '=' ) ) or ( string.find ( BanFamTime, '+' ) ) or ( string.find ( BanFamTime, '\\' ) ) or ( string.find ( BanFamTime, '|' ) ) or ( string.find ( BanFamTime, '{' ) ) or ( string.find ( BanFamTime, '}' ) ) or ( string.find ( BanFamTime, ';' ) ) or ( string.find ( BanFamTime, ':' ) ) or ( string.find ( BanFamTime, '"' ) ) or ( string.find ( BanFamTime, '<' ) ) or ( string.find ( BanFamTime, '>' ) ) or ( string.find ( BanFamTime, '/' ) ) or ( string.find ( BanFamTime, '?' ) ) then	
            notfSys:addNotification("Ban Time Bayad Shamel Adad Bashad, Estefade Az Hargone Alamat Haye Digar Mojaz Nist!", "error")
            return false	
        end
        if ( string.find ( BanFamTime, 'ض' ) ) or ( string.find ( BanFamTime, 'ص' ) )  or ( string.find ( BanFamTime, 'ث' ) ) or ( string.find ( BanFamTime, 'ق' ) ) or ( string.find ( BanFamTime, 'ف' ) ) or ( string.find ( BanFamTime, 'غ' ) ) or ( string.find ( BanFamTime, 'ع' ) ) or ( string.find ( BanFamTime, 'ه' ) ) or ( string.find ( BanFamTime, 'خ' ) ) or ( string.find ( BanFamTime, 'ح' ) ) or ( string.find ( BanFamTime, 'ج' ) ) or ( string.find ( BanFamTime, 'چ' ) ) or ( string.find ( BanFamTime, 'ش' ) ) or ( string.find ( BanFamTime, 'س' ) ) or ( string.find ( BanFamTime, 'ی' ) ) or ( string.find ( BanFamTime, 'ب' ) ) or ( string.find ( BanFamTime, 'ل' ) ) or ( string.find ( BanFamTime, 'ا' ) ) or ( string.find ( BanFamTime, 'ت' ) ) or ( string.find ( BanFamTime, 'ن' ) )  or ( string.find ( BanFamTime, 'م' ) )  or ( string.find ( BanFamTime, 'ک' ) )  or ( string.find ( BanFamTime, 'گ' ) )  or ( string.find ( BanFamTime, 'ظ' ) )  or ( string.find ( BanFamTime, 'ط' ) )  or ( string.find ( BanFamTime, 'ز' ) )  or ( string.find ( BanFamTime, 'ر' ) )  or ( string.find ( BanFamTime, 'ذ' ) )  or ( string.find ( BanFamTime, 'د' ) )  or ( string.find ( BanFamTime, 'ئ' ) )  or ( string.find ( BanFamTime, 'و' ) ) or ( string.find ( BanFamTime, 'ً' ) )  or ( string.find ( BanFamTime, 'ٌ' ) )  or ( string.find ( BanFamTime, 'ٍ' ) )  or ( string.find ( BanFamTime, 'ريال' ) )  or ( string.find ( BanFamTime, '،' ) )  or ( string.find ( BanFamTime, '؛' ) )  or ( string.find ( BanFamTime, 'َ' ) )  or ( string.find ( BanFamTime, 'ُ' ) )  or ( string.find ( BanFamTime, 'ِ' ) )  or ( string.find ( BanFamTime, 'ّ' ) )  or ( string.find ( BanFamTime, 'ۀ' ) )  or ( string.find ( BanFamTime, 'آ' ) )  or ( string.find ( BanFamTime, 'ـ' ) )  or ( string.find ( BanFamTime, '«' ) )  or ( string.find ( BanFamTime, '»' ) )  or ( string.find ( BanFamTime, 'ة' ) )  or ( string.find ( BanFamTime, 'ي' ) )  or ( string.find ( BanFamTime, 'ژ' ) )  or ( string.find ( BanFamTime, 'ؤ' ) )  or ( string.find ( BanFamTime, 'إ' ) )  or ( string.find ( BanFamTime, 'أ' ) )  or ( string.find ( BanFamTime, 'ء' ) )  or ( string.find ( BanFamTime, 'پ' ) )  or ( string.find ( BanFamTime, '؟' ) ) then
            notfSys:addNotification("NBan Timeame Bayad Shamel Horof English Bashad!", "error")
            return false
        end
        if ( string.find ( BanFamTime, 'a' ) ) or ( string.find ( BanFamTime, 'q' ) )  or ( string.find ( BanFamTime, 'w' ) ) or ( string.find ( BanFamTime, 'e' ) ) or ( string.find ( BanFamTime, 'r' ) ) or ( string.find ( BanFamTime, 't' ) ) or ( string.find ( BanFamTime, 'y' ) ) or ( string.find ( BanFamTime, 'u' ) ) or ( string.find ( BanFamTime, 'i' ) ) or ( string.find ( BanFamTime, 'o' ) ) or ( string.find ( BanFamTime, 'p' ) ) or ( string.find ( BanFamTime, 's' ) ) or ( string.find ( BanFamTime, 'd' ) ) or ( string.find ( BanFamTime, 'f' ) ) or ( string.find ( BanFamTime, 'g' ) ) or ( string.find ( BanFamTime, 'h' ) ) or ( string.find ( BanFamTime, 'j' ) ) or ( string.find ( BanFamTime, 'k' ) ) or ( string.find ( BanFamTime, 'l' ) ) or ( string.find ( BanFamTime, 'z' ) )  or ( string.find ( BanFamTime, 'x' ) )  or ( string.find ( BanFamTime, 'c' ) )  or ( string.find ( BanFamTime, 'v' ) )  or ( string.find ( BanFamTime, 'b' ) )  or ( string.find ( BanFamTime, 'n' ) )  or ( string.find ( BanFamTime, 'm' ) )  or ( string.find ( BanFamTime, 'Q' ) )  or ( string.find ( BanFamTime, 'W' ) )  or ( string.find ( BanFamTime, 'E' ) )  or ( string.find ( BanFamTime, 'R' ) )  or ( string.find ( BanFamTime, 'T' ) ) or ( string.find ( BanFamTime, 'Y' ) )  or ( string.find ( BanFamTime, 'U' ) )  or ( string.find ( BanFamTime, 'I' ) )  or ( string.find ( BanFamTime, 'O' ) )  or ( string.find ( BanFamTime, 'P' ) )  or ( string.find ( BanFamTime, 'A' ) )  or ( string.find ( BanFamTime, 'S' ) )  or ( string.find ( BanFamTime, 'D' ) )  or ( string.find ( BanFamTime, 'F' ) )  or ( string.find ( BanFamTime, 'G' ) )  or ( string.find ( BanFamTime, 'H' ) )  or ( string.find ( BanFamTime, 'J' ) )  or ( string.find ( BanFamTime, 'K' ) )  or ( string.find ( BanFamTime, 'L' ) )  or ( string.find ( BanFamTime, 'Z' ) )  or ( string.find ( BanFamTime, 'X' ) )  or ( string.find ( BanFamTime, 'C' ) )  or ( string.find ( BanFamTime, 'V' ) )  or ( string.find ( BanFamTime, 'B' ) )  or ( string.find ( BanFamTime, 'N' ) )  or ( string.find ( BanFamTime, 'M' ) )  then
            notfSys:addNotification("NBan Timeame Bayad Shamel Horof English Bashad!", "error")
            return false
        end
        if ( string.find ( BanFamTime, '%s' ) ) then
            notfSys:addNotification("Estefade Az Fasele (Space) Baraye Ban Time Sahih Nist!", "error")
            return false
        end
        triggerServerEvent("BanFanily", getLocalPlayer(), getLocalPlayer(),esmefamily,fsahebe,fshoard,BanFamTime )
        guiSetProperty( BackgroundBanFam, "Visible", "False")
        guiSetProperty(BackgroundF,"Visible","True")
        guiGridListClear(Familyslist,factionMember)
        triggerServerEvent("infoFam", getLocalPlayer(), getLocalPlayer() )
    elseif source == ShowKickWindow then
        triggerServerEvent("UnBanFanily", getLocalPlayer(), getLocalPlayer(),esmefamily,fsahebe,fshoard )
 
        guiGridListClear(Familyslist,factionMember)
        triggerServerEvent("infoFam", getLocalPlayer(), getLocalPlayer() )
    end
end)
----------------------------=============================Panel Manage Leader Family============================----------------------------------
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

local normalfont = guiCreateFont("Fonts/font.ttf", 10.5)
local normalfont8 = guiCreateFont("Fonts/font.ttf", 8)
local normalfont10 = guiCreateFont("Fonts/font.ttf", 10)
local normalfont5 = guiCreateFont("Fonts/font.ttf", 9)
local normalfont12 = guiCreateFont("Fonts/font.ttf", 11)
local font3 = dxCreateFont("Fonts/font.ttf", (x+y)*10)
local font3gui = guiCreateFont("Fonts/font.ttf", 20)
local font10 = dxCreateFont("Fonts/font.ttf", (x+y)*6.5)
local font12 = dxCreateFont("Fonts/font.ttf", (x+y)*7)
local font11 = dxCreateFont("Fonts/font.ttf", (x+y)*6)
local font13 = dxCreateFont("Fonts/font.ttf", (x+y)*5)

function findFontToHeight(font, sizeY)
	local fontScale = 0
	local fontSize
	repeat
		fontScale = fontScale+1
		fontSize = dxGetFontHeight(fontScale, "default-bold")
	until fontSize >= sizeY
	return fontScale
end
fontScale = findFontToHeight(font, screenH*0.01)
local onlinemembers = 0
local allmembers = 0

function drawDXPanelFamilyManage()
    if fmvisable == true then
        dxDrawImage(x*950, y*150, x*350, y*580, "IMG/BoxMini.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        dxDrawText("Family Member (Online: "..onlinemembers..")" , x*458, y*275, x*70, y*35, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,true, false)
        dxDrawImage(x*1020, y*150, x*200, y*200, "Logo/"..logoidfamily..".dds", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        dxDrawText(namefamilys2, x*(1125-dxGetTextWidth(namefamilys2)), y*700, x*70, y*35, tocolor(FCR2, FCG2, FCB2, 255), fontScale, font3, "left", "center",false,false,true, false)
        dxDrawText(ShoarFC, x*(1140-dxGetTextWidth(ShoarFC)+string.len(ShoarFC)) , y*760, x*70, y*35, tocolor(255, 255, 255, 255), fontScale, font12, "left", "center",false,false,true, false)
        dxDrawText(informationslotfam, x*(1178-dxGetTextWidth(informationslotfam)) , y*820, x*70, y*35, tocolor(255, 255, 204, 255), fontScale, font12, "left", "center",false,false,true, false)
        dxDrawText(ExpiteTime, x*(1158-dxGetTextWidth(ExpiteTime)) , y*880, x*70, y*35, tocolor(255, 153,204 , 255), fontScale, font12, "left", "center",false,false,true, false)
        dxDrawText(levelfam, x*(1125-dxGetTextWidth(levelfam)) , y*940, x*70, y*35, tocolor(255, 255, 0, 255), fontScale, font3, "left", "center",false,false,true, false)
        dxDrawText(fscore, x*(1148-dxGetTextWidth(fscore)) , y*1000, x*70, y*35, tocolor(255, 255, 255, 255), fontScale, font12, "left", "center",false,false,true, false)
        dxDrawText("Creation Date:", x*1000 , y*1350, x*70, y*35, tocolor(128, 128, 128, 255), fontScale, font12, "left", "center",false,false,true, false)
        dxDrawText(string.gsub(fCreateDate,"-", "/"), x*1102 , y*1350, x*70, y*35, tocolor(128, 128, 128, 255), fontScale, font12, "left", "center",false,false,true, false)
        dxDrawText("Total Score:", x*1080, y*1380, x*70, y*35, tocolor(128, 128, 128, 255), fontScale, font11, "left", "center",false,false,true, false)
        dxDrawText(flastscore, x*1160 , y*1380, x*70, y*35, tocolor(128, 128, 128, 255), fontScale, font11, "left", "center",false,false,true, false)
        if getTime() ~= TimeKamion or getTime() ~= TimeKamion2 then
            if isMouseInPosition(x*867, y*200, x*90, y*120) then
                dxDrawImage(x*867, y*200, x*90, y*120, "Events/Kamion.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        notfSys:addNotification("Event Family Kamion Dar Saat "..TimeKamion..":00 , "..TimeKamion2..":00 Bargozar Mishavad.", "info")
                    end
                else
                    press = false
                end
            else
                dxDrawImage(x*867, y*200, x*90, y*120, "Events/Kamion.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end

            if getTime() ~= TimeKamion then
                dxDrawText(TimeKamion..":00", x*895 , y*530, x*70, y*35, tocolor(255, 255, 255, 255), fontScale, font11, "left", "center",false,false,true, false)
            end
            if getTime() ~= TimeKamion2 then
                dxDrawText(TimeKamion2..":00", x*895 , y*560, x*70, y*35, tocolor(255, 255, 255, 255), fontScale, font11, "left", "center",false,false,true, false)
            end
        end
        if getTime() ~= TimeKeshti then
            if isMouseInPosition(x*868, y*330, x*90, y*120) then
                dxDrawImage(x*868, y*330, x*90, y*120, "Events/Keshti.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        notfSys:addNotification("Event Family Keshti Dar Saat "..TimeKeshti..":00 Bargozar Mishavad.", "info")
                    end
                else
                    press = false
                end
            else
                dxDrawImage(x*868, y*330, x*90, y*120, "Events/Keshti.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end
            dxDrawText(TimeKeshti..":00", x*894 , y*800, x*70, y*35, tocolor(255, 255, 255, 255), fontScale, font11, "left", "center",false,false,true, false)
        end
        if getTime() ~= TimeMantagheHavaei then
            if isMouseInPosition(x*860, y*465, x*105, y*120) then
                dxDrawImage(x*860, y*465, x*105, y*120, "Events/MantagheHavaei.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        notfSys:addNotification("Event Family Mantaghew-Havaei Dar Saat "..TimeMantagheHavaei..":00 Bargozar Mishavad.", "info")
                    end
                else
                    press = false
                end
            else
                dxDrawImage(x*860, y*465, x*105, y*120, "Events/MantagheHavaei.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end
            
            dxDrawText(TimeMantagheHavaei..":00", x*896 , y*1070, x*70, y*35, tocolor(255, 255, 255, 255), fontScale, font11, "left", "center",false,false,true, false)
        end
         
        if getTime() ~= AirDropTime then
            if isMouseInPosition(x*265, y*200, x*90, y*120) then
                dxDrawImage(x*265, y*200, x*90, y*120, "Events/AirDrop.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        notfSys:addNotification("Event Family AirDrop Dar Saat "..AirDropTime..":00 Bargozar Mishavad.", "info")
                    end
                else
                    press = false
                end
            else
                dxDrawImage(x*265, y*200, x*90, y*120, "Events/AirDrop.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end

            if getTime() ~= AirDropTime then
                dxDrawText(AirDropTime..":00", x*293 , y*550, x*70, y*35, tocolor(255, 255, 255, 255), fontScale, font11, "left", "center",false,false,true, false)
            end
        end

        if getTime() ~= FreeForAll then
            if isMouseInPosition(x*265, y*330, x*90, y*120) then
                dxDrawImage(x*265, y*330, x*90, y*120, "Events/FFA.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        notfSys:addNotification("Event Family FFA (Free For All) Dar Saat "..FreeForAll..":00 Bargozar Mishavad.", "info")
                    end
                else
                    press = false
                end
            else
                dxDrawImage(x*265, y*330, x*90, y*120, "Events/FFA.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end
            dxDrawText(FreeForAll..":00", x*292 , y*800, x*70, y*35, tocolor(255, 255, 255, 255), fontScale, font11, "left", "center",false,false,true, false)
        end

        if cangotosetting == true then
            if isMouseInPosition(x*945, y*560, x*85, y*85) then
                dxDrawImage(x*945, y*560, x*85, y*85, "IMG/SettingIcon.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        removeEventHandler("onClientRender",root,drawDXPanelFamilyManage)
                        guiSetVisible(Players,false)
                        guiSetVisible(PanelChapeSetting,true)
                        guiSetVisible(PanelChapeSetting2,true)
                        guiSetVisible(IconSetting,true)
                        guiSetVisible(DokmeTamdidFam,true)
                        guiSetVisible(DokmeDemote,false)
                        guiSetVisible(DokmePoromote,false)
                        guiSetVisible(DokmeKick,false)
                        homepage = false
                        guiSetEnabled(DokmeTamdidFam,true)
                        guiSetVisible(DokmeChengeParkingLoc,true)
                        guiSetVisible(DokmeChengeInformationFamily,true)
                        guiSetVisible(DokmeBackeAzSetting,true)
                    end
                else
                    press = false
                end
            else
                dxDrawImage(x*945, y*560, x*85, y*85, "IMG/SettingIcon.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end
        else
            dxDrawImage(x*945, y*560, x*85, y*85, "IMG/SettingIcon.png", 0, 0, 0, tocolor(150,150,150, 150), true)
        end
        if MyRanks > 8 then
            if isMouseInPosition(x*1030, y*555, x*90, y*90) then
                dxDrawImage(x*1030, y*555, x*90, y*90, "IMG/VehicleIcon.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                        removeEventHandler("onClientRender",root,drawDXPanelFamilyManage)
                        guiSetVisible(Players,false)
                        guiSetVisible(DokmeDemote,false)
                        guiSetVisible(DokmePoromote,false)
                        guiSetVisible(DokmeKick,false)
                        homepage = false
                        guiSetVisible(PanelKharideVeh,true)
                    end
                else
                    press = false
                end
            else
                dxDrawImage(x*1030, y*555, x*90, y*90, "IMG/VehicleIcon.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end
        else
            dxDrawImage(x*1030, y*555, x*90, y*90, "IMG/VehicleIcon.png", 0, 0, 0, tocolor(150,150,150, 150), true)
        end
        if MyRanks > 7 then
            if isMouseInPosition(x*1120, y*555, x*90, y*90) then
                dxDrawImage(x*1120, y*555, x*90, y*90, "IMG/RvIcon.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true

                        triggerServerEvent("RespawnCarFamilys",getLocalPlayer(),getLocalPlayer())
                    end
                else
                    press = false
                end
            else
                dxDrawImage(x*1120, y*555, x*90, y*90, "IMG/RvIcon.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end
        else
            dxDrawImage(x*1120, y*555, x*90, y*90, "IMG/RvIcon.png", 0, 0, 0, tocolor(150,150,150, 150), true)
        end
        if MyRanks > 8 then
            if isMouseInPosition(x*1215, y*555, x*90, y*90) then
                dxDrawImage(x*1215, y*555, x*90, y*90, "IMG/LockerIcon.png", 0, 0, 0, tocolor(150,150,150, 255), true)
                if getKeyState("mouse1")  then
                    if not press then
                        press = true
                    
                        notfSys:addNotification("Commins Soon!","error")
                    end
                else
                    press = false
                end
            else
                dxDrawImage(x*1215, y*555, x*90, y*90, "IMG/LockerIcon.png", 0, 0, 0, tocolor(255,255,255, 255), true)
            end
        else
            dxDrawImage(x*1215, y*555, x*90, y*90, "IMG/LockerIcon.png", 0, 0, 0, tocolor(150,150,150, 150), true)
        end
        
    end
end
local BackGrundManageFamilyPanel = guiCreateStaticImage(0.17, 0.14, 0.66, 0.70,"IMG/Box.png",true) 
PanelKharideVeh = guiCreateStaticImage(0, 0, 1, 1,"IMG/Box.png",true,BackGrundManageFamilyPanel)
guiSetVisible(PanelKharideVeh,false)


DokmeBackeAzVehcle = guiCreateButton(0.82, 0.01, 0.12, 0.09, "Bazgasht >>", true, PanelKharideVeh)
guiSetFont(DokmeBackeAzVehcle,normalfont5)
guiSetProperty (DokmeBackeAzVehcle, "NormalTextColour", "FFFF1010")
scrollbarbucar = guiCreateScrollPane(0.04, 0.15, 0.95, 0.8, true, PanelKharideVeh)

veh458 = guiCreateStaticImage(0.0, 0, 0.45, 0.5,"Vehicles/458.png",true,scrollbarbucar)
BuyVeh458 = guiCreateButton(0.05, 0.75, 0.9, 0.19, 'Kharide Khodro "Toyota Land Cruiser" Be Gheymat 56,000,000$', true, veh458)
guiSetFont(BuyVeh458,normalfont5)
guiSetProperty (BuyVeh458, "NormalTextColour", "FF006600")

veh479 = guiCreateStaticImage(0.5, 0, 0.45, 0.5,"Vehicles/479.png",true,scrollbarbucar)
BuyVeh479 = guiCreateButton(0.05, 0.75, 0.9, 0.19, 'Kharide Khodro "Mercedes-Benz G-Class" Be Gheymat 19,750,000$', true, veh479)
guiSetFont(BuyVeh479,normalfont5)
guiSetProperty (BuyVeh479, "NormalTextColour", "FF006600")

veh433 = guiCreateStaticImage(0.0, 0.55, 0.45, 0.5,"Vehicles/433.png",true,scrollbarbucar)
BuyVeh433 = guiCreateButton(0.05, 0.75, 0.9, 0.19, 'Kharide Khodro "Mashin Arteshi" Be Gheymat 17,000,000$', true, veh433)
guiSetFont(BuyVeh433,normalfont5)
guiSetProperty (BuyVeh433, "NormalTextColour", "FF006600")

veh546 = guiCreateStaticImage(0.5, 0.55, 0.45, 0.5,"Vehicles/546.png",true,scrollbarbucar)
BuyVeh546 = guiCreateButton(0.05, 0.75, 0.9, 0.19, 'Kharide Khodro "Xanti" Be Gheymat 6,150,000$', true, veh546)
guiSetFont(BuyVeh546,normalfont5)
guiSetProperty (BuyVeh546, "NormalTextColour", "FF006600")

PanelChapeSetting = guiCreateStaticImage(0.02, 0.050, 0.35, 0.9,"IMG/BoxMini.png",true,BackGrundManageFamilyPanel) 
labelmemberslot = guiCreateLabel( 0.155, 0.1, 9, 0.9, "Change Member Slot", true , PanelChapeSetting )
guiSetFont(labelmemberslot,font3gui)
BuySlotMember5X = guiCreateButton(0.05, 0.35, 0.9, 0.1, "x5 | 1,700 Gold", true, PanelChapeSetting)
guiSetFont(BuySlotMember5X,normalfont5)
guiSetProperty (BuySlotMember5X, "NormalTextColour", "FFFFFF00")
BuySlotMember10X = guiCreateButton(0.05, 0.5, 0.9, 0.1, "x10 | 2,500 Gold", true, PanelChapeSetting)
guiSetFont(BuySlotMember10X,normalfont5)
guiSetProperty (BuySlotMember10X, "NormalTextColour", "FFFFFF00")
BuySlotMember15X = guiCreateButton(0.05, 0.65, 0.9, 0.1, "x15 | 10,000 Gold", true, PanelChapeSetting)
guiSetFont(BuySlotMember15X,normalfont5)
guiSetProperty (BuySlotMember15X, "NormalTextColour", "FFFFFF00")
BuySlotMember25X = guiCreateButton(0.05, 0.8, 0.9, 0.1, "x25 | 21,000 Gold", true, PanelChapeSetting)
guiSetFont(BuySlotMember25X,normalfont5)
guiSetProperty (BuySlotMember25X, "NormalTextColour", "FFFFFF00")
PanelChapeSetting2 = guiCreateStaticImage(0.63, 0.050, 0.35, 0.9,"IMG/BoxMini.png",true,BackGrundManageFamilyPanel) 
labelmemberslot = guiCreateLabel( 0.175, 0.1, 9, 0.9, "Change Vehicle Slot", true , PanelChapeSetting2 )
guiSetFont(labelmemberslot,font3gui)
BuySlotVeh5X = guiCreateButton(0.05, 0.35, 0.9, 0.1, "x5 | 2,700 Gold", true, PanelChapeSetting2)
guiSetFont(BuySlotVeh5X,normalfont5)
guiSetProperty (BuySlotVeh5X, "NormalTextColour", "FFFFFF00")
BuySlotVeh8X = guiCreateButton(0.05, 0.5, 0.9, 0.1, "x8 | 3,500 Gold", true, PanelChapeSetting2)
guiSetFont(BuySlotVeh8X,normalfont5)
guiSetProperty (BuySlotVeh8X, "NormalTextColour", "FFFFFF00")
BuySlotVeh15X = guiCreateButton(0.05, 0.65, 0.9, 0.1, "x15 | 10,000 Gold", true, PanelChapeSetting2)
guiSetFont(BuySlotVeh15X,normalfont5)
guiSetProperty (BuySlotVeh15X, "NormalTextColour", "FFFFFF00")
BuySlotVeh20X = guiCreateButton(0.05, 0.8, 0.9, 0.1, "x20 | 15,000 Gold", true, PanelChapeSetting2)
guiSetFont(BuySlotVeh20X,normalfont5)
guiSetProperty (BuySlotVeh20X, "NormalTextColour", "FFFFFF00")
IconSetting = guiCreateStaticImage(0.451, 0, 0.1, 0.17,"IMG/SettingIcon.png",true,BackGrundManageFamilyPanel) 
DokmeTamdidFam = guiCreateButton(0.397, 0.2, 0.21, 0.17, "Please Wait", true, BackGrundManageFamilyPanel)
guiSetFont(DokmeTamdidFam,normalfont5)
guiSetProperty (DokmeTamdidFam, "NormalTextColour", "FFFFFF33")
DokmeChengeParkingLoc = guiCreateButton(0.397, 0.4, 0.21, 0.1, "Enteghal Ya Taghire\nMahal Garage Dar Posation Man", true, BackGrundManageFamilyPanel)
guiSetFont(DokmeChengeParkingLoc,normalfont5)
guiSetProperty (DokmeChengeParkingLoc, "NormalTextColour", "FF0066CC")
DokmeChengeInformationFamily = guiCreateButton(0.397, 0.53, 0.21, 0.1, "Taghire Moshakhasate Family", true, BackGrundManageFamilyPanel)
guiSetFont(DokmeChengeInformationFamily,normalfont5)
guiSetProperty (DokmeChengeInformationFamily, "NormalTextColour", "FF606060")
DokmeBackeAzSetting = guiCreateButton(0.407, 0.85, 0.19, 0.1, "(( Bazgasht ))", true, BackGrundManageFamilyPanel)
guiSetFont(DokmeBackeAzSetting,normalfont5)
guiSetProperty (DokmeBackeAzSetting, "NormalTextColour", "FFFFFFFF")


Players = guiCreateGridList(0.07, 0.09, 0.5, 0.78, true,BackGrundManageFamilyPanel)
guiSetFont(Players,normalfont)
local cplayername = guiGridListAddColumn(Players, "Player Name", 0.25)
local cplayerrank = guiGridListAddColumn(Players, "Family Rank", 0.25)
local cplayerwarns = guiGridListAddColumn(Players, "Status", 0.25)
local cplayerbaj = guiGridListAddColumn(Players, "Baj", 0.2)
guiSetVisible(BackGrundManageFamilyPanel,false)
guiGridListAutoSizeColumn( Players, 7 )
DokmePoromote = guiCreateButton(0.07, 0.875, 0.18, 0.06, "Promote Selected", true, BackGrundManageFamilyPanel)
guiSetFont(DokmePoromote,normalfont5)
guiSetProperty (DokmePoromote, "NormalTextColour", "FF00CC00")
DokmeDemote = guiCreateButton(0.254, 0.875, 0.18, 0.06, "Demote Selected", true, BackGrundManageFamilyPanel)
guiSetFont(DokmeDemote,normalfont5)
guiSetProperty (DokmeDemote, "NormalTextColour", "FFFF0000")
DokmeKick = guiCreateButton(0.436, 0.875, 0.135, 0.06, "Kick", true, BackGrundManageFamilyPanel)
guiSetFont(DokmeKick,normalfont5)
guiSetProperty (DokmeKick, "NormalTextColour", "FFFF6666")
guiSetVisible(DokmeDemote,false)
guiSetVisible(DokmePoromote,false)
guiSetVisible(DokmeKick,false)
---------============ PANEL EDIT INFO ============---------
paneeditfamesmfam = guiCreateEdit(x*275, y*55, x*180, y*35, "", false, BackGrundManageFamilyPanel)
guiSetFont(paneeditfamesmfam,normalfont5)
guiSetProperty (paneeditfamesmfam, "NormalTextColour", "FF000000")
guiEditSetMaxLength ( paneeditfamesmfam, 20 )
paneeditfamesmfamtext = guiCreateLabel(x*30, y*50, x*270, y*50, "Esm Family Shoma:", false, BackGrundManageFamilyPanel)

guiSetFont(paneeditfamesmfamtext,font3gui)
guiSetVisible(paneeditfamesmfam,false)
guiSetVisible(paneeditfamesmfamtext,false)
paneledittagfamtext = guiCreateLabel(x*470, y*50, x*270, y*50, "Tag:", false, BackGrundManageFamilyPanel)
paneledittagfam = guiCreateEdit(x*540, y*55, x*180, y*35, "", false, BackGrundManageFamilyPanel)
guiEditSetMaxLength ( paneledittagfam, 5 )
guiSetFont(paneledittagfam,normalfont5)
guiSetProperty (paneledittagfam, "NormalTextColour", "FF000000")
guiSetFont(paneledittagfamtext,font3gui)
guiSetVisible(paneledittagfamtext,false)
guiSetVisible(paneledittagfam,false)

shoarfamilyforeditpaneltext = guiCreateLabel(x*30,y*120,x*260,y*50,"Shoar Family Shoma:",false,BackGrundManageFamilyPanel)
shoarfamilyforeditpanel = guiCreateEdit(x*300,y*120,x*330,y*45,"",false, BackGrundManageFamilyPanel)
guiEditSetMaxLength ( shoarfamilyforeditpanel, 5 )
guiSetFont(shoarfamilyforeditpanel,normalfont5)
guiSetProperty (shoarfamilyforeditpanel, "NormalTextColour", "FF000000")
guiSetFont(shoarfamilyforeditpaneltext,font3gui)
guiEditSetMaxLength (shoarfamilyforeditpanel,45)
guiSetVisible(shoarfamilyforeditpanel,false)
guiSetVisible(shoarfamilyforeditpaneltext,false)

PickColorForPanelEditFamilyText = guiCreateLabel(x*30,y*200,x*260,y*50,"Rang Family Shoma:",false,BackGrundManageFamilyPanel)
guiSetFont(PickColorForPanelEditFamilyText,font3gui)
PickColorForPanelEditFamily = guiCreateButton(x*300,y*200,x*330,y*50, "Pick Color", false, BackGrundManageFamilyPanel)
guiSetProperty (PickColorForPanelEditFamily, "NormalTextColour", "FF0000FF")
guiSetFont(PickColorForPanelEditFamily,normalfont5)
guiSetVisible(PickColorForPanelEditFamily,false)
guiSetVisible(PickColorForPanelEditFamilyText,false)

logofamilyforeditpaneltext = guiCreateLabel(x*50, y*340, x*250, y*50, "Logo Family Shoma:", false, BackGrundManageFamilyPanel)
logofamilyforeditpanel = guiCreateStaticImage(x*300, x*300, x*220, y*220,"logo/1.dds",false, BackGrundManageFamilyPanel)
guiSetFont(logofamilyforeditpaneltext,font3gui)
NextLogoInPanelEditFam = guiCreateButton(x*450, y*530, x*100, y*40, ">>", false, BackGrundManageFamilyPanel)
extLogoInPanelEditFam = guiCreateButton(x*260, y*530, x*100, y*40, "<<", false, BackGrundManageFamilyPanel)
guiSetFont(NextLogoInPanelEditFam,guiCreateFont("normal.woff", 20))
guiSetFont(extLogoInPanelEditFam,guiCreateFont("normal.woff", 20))
guiSetVisible(logofamilyforeditpaneltext,false)
guiSetVisible(logofamilyforeditpanel,false)
guiSetVisible(extLogoInPanelEditFam,false)
guiSetVisible(NextLogoInPanelEditFam,false)
DokmeBackeAzSettingToEditPanel = guiCreateButton(x*850, y*20, x*165, y*60, "(( Bazgasht ))", false, BackGrundManageFamilyPanel)
guiSetFont(DokmeBackeAzSettingToEditPanel,normalfont5)
guiSetProperty (DokmeBackeAzSettingToEditPanel, "NormalTextColour", "FFFF0000")
guiSetVisible(DokmeBackeAzSettingToEditPanel,false)


RulForEditFamily = guiCreateLabel(x*720,y*230,x*300,y*100,"Leader Gerami Aya Motmaen Hatid Ke\nMikhahid Ba Pardakh '500 Gold' Etelat \nFamily Khodra Be Etelaat Vared Shode\nDar Samt Chap Taghir Dahid?",false,BackGrundManageFamilyPanel)
guiSetFont(RulForEditFamily,normalfont12)

AccEditFamilyForEnd = guiCreateButton(x*720, y*360, x*280, y*60, "Sabt Taghirat", false, BackGrundManageFamilyPanel)
guiSetFont(AccEditFamilyForEnd,normalfont5)
guiSetProperty (AccEditFamilyForEnd, "NormalTextColour", "FF00FF00")
guiSetVisible(RulForEditFamily,false)
guiSetVisible(AccEditFamilyForEnd,false)

function reloadkonpanelglistfamra()
    guiGridListClear( Players )
    triggerServerEvent("reloadglistfamilymanage", getLocalPlayer(), getLocalPlayer() )
    onlinemembers = 0
    selectedName = 0
    allmembers = 0
end
function reloadinfopanel()
    triggerServerEvent("PanelInfomationLoader", getLocalPlayer(), getLocalPlayer() )
end
function baktohomepage()
    
    addEventHandler("onClientRender",root,drawDXPanelFamilyManage)
    guiSetVisible(PanelChapeSetting,false)
    guiSetVisible(PanelChapeSetting2,false)
    guiSetVisible(IconSetting,false)
    guiSetVisible(DokmeTamdidFam,false)
    guiSetVisible(DokmeChengeParkingLoc,false)
    guiSetVisible(DokmeChengeInformationFamily,false)
end
addEventHandler("onClientGUIClick", getRootElement(),
function ()
    if source == Players then
        if guiGetText(myrow) == "" then
            notfSys:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
        else
            entekhab = guiGridListGetSelectedItem(Players,myrow)
            esmesh = guiGridListGetItemText ( Players, entekhab, cplayername )
            finalName = tostring(esmesh)
            selectedName = esmesh
        end
    elseif source == AccEditFamilyForEnd then
        if tonumber(MyRanks) == 10 then
            showCursor(false)
            triggerServerEvent("EditFamilyForLeader",getLocalPlayer(),getLocalPlayer(),guiGetText(paneeditfamesmfam),guiGetText(shoarfamilyforeditpanel),guiGetText(paneledittagfam),tonumber(logoidforedit),FCR2,FCG2,FCB2)
            guiSetVisible(BackGrundManageFamilyPanel,false)
            
        else
            notfSys:addNotification("Shoma Leader Nistid." , 'error')
        end
    elseif source == DokmePoromote then
    
        if selectedName ~= 0 then
            local finalPlayerName = tostring(selectedName)
            triggerServerEvent("PoromotePlayerInFamily",getLocalPlayer(),getLocalPlayer(),selectedName)
            reloadkonpanelglistfamra()
        else
            notfSys:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
        end
    elseif source == DokmeBackeAzVehcle then
        guiSetVisible(PanelKharideVeh,false)
        addEventHandler("onClientRender",root,drawDXPanelFamilyManage)
        guiSetVisible(Players,true)
        homepage = true
        reloadinfopanel()
    elseif source == DokmeDemote then
        if selectedName ~= 0 then
            triggerServerEvent("DemotePlayerInFamily",getLocalPlayer(),getLocalPlayer(),selectedName)
            reloadkonpanelglistfamra()
        else
            notfSys:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
        end
    elseif source == DokmeKick then
        if selectedName ~= 0 then
            triggerServerEvent("KickPlayerInFamily",getLocalPlayer(),getLocalPlayer(),selectedName)
            reloadkonpanelglistfamra()
        else
            notfSys:addNotification("Ebteda Yek Member Ra Entekhab Konid!","error")
        end
    elseif source == DokmeBackeAzSetting then
        guiSetVisible(PanelChapeSetting,false)
        guiSetVisible(PanelChapeSetting2,false)
        guiSetVisible(IconSetting,false)
        guiSetVisible(DokmeTamdidFam,false)
        guiSetVisible(DokmeChengeParkingLoc,false)
        guiSetVisible(DokmeChengeInformationFamily,false)
        guiSetVisible(DokmeBackeAzSetting,false)
        addEventHandler("onClientRender",root,drawDXPanelFamilyManage)
        guiSetVisible(Players,true)
        homepage = true
        reloadinfopanel()
    elseif source == DokmeChengeInformationFamily then
        -- ان کلاینت کلیک
        logoidforedit = 1
        guiSetVisible(PanelChapeSetting,false)
        guiSetVisible(PanelChapeSetting2,false)
        guiSetVisible(IconSetting,false)
        guiSetVisible(DokmeTamdidFam,false)
        guiSetVisible(RulForEditFamily,true)
        guiSetVisible(AccEditFamilyForEnd,true)
        guiSetVisible(RulForEditFamily,true)
        guiSetVisible(AccEditFamilyForEnd,true)
        homepage = false
        guiSetEnabled(DokmeTamdidFam,false)
        guiSetVisible(DokmeChengeParkingLoc,false)
        guiSetVisible(DokmeChengeInformationFamily,false)
        guiSetVisible(DokmeBackeAzSetting,false)
        guiSetText(paneeditfamesmfam,namefamilys2)
        guiSetVisible(paneeditfamesmfam,true)
        guiSetVisible(paneeditfamesmfamtext,true)
        guiSetVisible(paneledittagfamtext,true)
        guiSetVisible(paneledittagfam,true)
        guiSetText(paneledittagfam,tagfamilyforpanel)
        guiSetVisible(shoarfamilyforeditpanel,true)
        guiSetVisible(shoarfamilyforeditpaneltext,true)
        guiSetText(shoarfamilyforeditpanel,ShoarFC)
        guiSetVisible(PickColorForPanelEditFamily,true)
        guiSetVisible(PickColorForPanelEditFamilyText,true)
        guiSetVisible(logofamilyforeditpaneltext,true)
        guiSetVisible(logofamilyforeditpanel,true)
        guiSetVisible(extLogoInPanelEditFam,true)
        guiSetVisible(NextLogoInPanelEditFam,true)
        guiSetVisible(DokmeBackeAzSettingToEditPanel,true)
    elseif source == DokmeBackeAzSettingToEditPanel then
        guiSetVisible(RulForEditFamily,false)
        guiSetVisible(AccEditFamilyForEnd,false)
        guiSetVisible(DokmeBackeAzSettingToEditPanel,false)
        guiSetVisible(paneeditfamesmfam,false)
        guiSetVisible(paneeditfamesmfamtext,false)
        guiSetVisible(paneledittagfamtext,false)
        guiSetVisible(paneledittagfam,false)
        guiSetVisible(shoarfamilyforeditpanel,false)
        guiSetVisible(shoarfamilyforeditpaneltext,false)
        guiSetText(shoarfamilyforeditpanel,ShoarFC)
        guiSetVisible(PickColorForPanelEditFamily,false)
        guiSetVisible(PickColorForPanelEditFamilyText,false)
        guiSetVisible(logofamilyforeditpaneltext,false)
        guiSetVisible(logofamilyforeditpanel,false)
        guiSetVisible(extLogoInPanelEditFam,false)
        guiSetVisible(NextLogoInPanelEditFam,false)
        removeEventHandler("onClientRender",root,drawDXPanelFamilyManage)
        guiSetVisible(Players,false)
        guiSetVisible(PanelChapeSetting,true)
        guiSetVisible(PanelChapeSetting2,true)
        guiSetVisible(IconSetting,true)
        guiSetVisible(DokmeTamdidFam,true)
        guiSetVisible(DokmeDemote,false)
        guiSetVisible(DokmePoromote,false)
        guiSetVisible(DokmeKick,false)
        homepage = false
        guiSetEnabled(DokmeTamdidFam,true)
        guiSetVisible(DokmeChengeParkingLoc,true)
        guiSetVisible(DokmeChengeInformationFamily,true)
        guiSetVisible(DokmeBackeAzSetting,true)
    elseif source == NextLogoInPanelEditFam then
        logoidforedit = logoidforedit + 1
        if logoidforedit < 100 then
            
            guiSetProperty(logofamilyforeditpanel, "Visible", "False")
            logofamilyforeditpanel = guiCreateStaticImage(300, 300, 220, 220,"logo/"..logoidforedit..".dds",false, BackGrundManageFamilyPanel)
        else
            logoidforedit = 1
        end
        notfSys:addNotification("Logo Family Shoma Roye "..logoidforedit.." Set Shod", "info")
    elseif source == extLogoInPanelEditFam then
        logoidforedit = logoidforedit - 1
        if logoidforedit == 0 then
            logoidforedit = 100

        else
            guiSetProperty(logofamilyforeditpanel, "Visible", "False")
            logofamilyforeditpanel = guiCreateStaticImage(300, 300, 220, 220,"logo/"..logoidforedit..".dds",false, BackGrundManageFamilyPanel)
        end
        notfSys:addNotification("Logo Family Shoma Roye "..logoidforedit.." Set Shod", "info")
    elseif source == DokmeTamdidFam then
        triggerServerEvent("DokmeTamdidFam",getLocalPlayer(),getLocalPlayer())
        reloadinfopanel()
        guiSetVisible(DokmeDemote,false)
        guiSetVisible(DokmePoromote,false)
        guiSetVisible(DokmeKick,false)
    elseif source == BuySlotMember5X then
        triggerServerEvent("DokmeAfzodaneSloteMember",getLocalPlayer(),getLocalPlayer(),5)
        reloadinfopanel()
    elseif source == BuySlotMember10X then
        triggerServerEvent("DokmeAfzodaneSloteMember",getLocalPlayer(),getLocalPlayer(),10)
        reloadinfopanel()
    elseif source == BuySlotMember15X then
        triggerServerEvent("DokmeAfzodaneSloteMember",getLocalPlayer(),getLocalPlayer(),15)
        reloadinfopanel()
    elseif source == BuySlotMember25X then
        triggerServerEvent("DokmeAfzodaneSloteMember",getLocalPlayer(),getLocalPlayer(),25)
        reloadinfopanel()
    elseif source == BuySlotVeh5X then
        triggerServerEvent("DokmeAfzodaneSloteVeh",getLocalPlayer(),getLocalPlayer(),5)
        reloadinfopanel()
    elseif source == BuySlotVeh8X then
        triggerServerEvent("DokmeAfzodaneSloteVeh",getLocalPlayer(),getLocalPlayer(),8)
        reloadinfopanel()
    elseif source == BuySlotVeh15X then
        triggerServerEvent("DokmeAfzodaneSloteVeh",getLocalPlayer(),getLocalPlayer(),15)
        reloadinfopanel()
    elseif source == BuySlotVeh20X then
        triggerServerEvent("DokmeAfzodaneSloteVeh",getLocalPlayer(),getLocalPlayer(),20)
        reloadinfopanel()
    elseif source == DokmeChengeParkingLoc then
        triggerServerEvent("DokmeCheangeLocaGarage",getLocalPlayer(),getLocalPlayer())
    elseif source == BuyVeh458 then
        triggerServerEvent("BuyCarForFamily",getLocalPlayer(),getLocalPlayer(),458,56000000,"Toyota Land Cruiser")
    elseif source == BuyVeh479 then
        triggerServerEvent("BuyCarForFamily",getLocalPlayer(),getLocalPlayer(),479,19750000,"Mercedes-Benz G-Class")
    elseif source == BuyVeh433 then
        triggerServerEvent("BuyCarForFamily",getLocalPlayer(),getLocalPlayer(),433,17000000,"Mashin Arteshi")
    elseif source == BuyVeh546 then
        triggerServerEvent("BuyCarForFamily",getLocalPlayer(),getLocalPlayer(),546,6150000,"Xanti")
    else
        finalName = false
    end
end)
function CreateGruidList(player,fmember,fclientrank)
    if getElementData(getLocalPlayer(), "loggedIn") == true and getLocalPlayer() == player then
        allmembers = allmembers + 1
        local statusonlineorofline = "Offline"
        local R,G,B=255,0,0
        for k, hame_Playera	in ipairs (getElementsByType("player")) do	
            if getElementData(hame_Playera, "loggedIn") == true and getPlayerName(hame_Playera) == fmember then
                statusonlineorofline = "Online"
                onlinemembers = onlinemembers + 1 
                R,G,B=0,255,0
            end
        end
        local myrow = guiGridListAddRow(Players,fmember,fclientrank,statusonlineorofline,"--------")
        guiGridListSetItemColor ( Players, myrow, cplayerwarns, R,G,B )
        guiGridListSetItemColor ( Players, myrow, cplayerbaj, 255,255,255,150)
    end
end
addEvent("infoFamilyPanelManageLeader",true)
addEventHandler("infoFamilyPanelManageLeader",getLocalPlayer(),CreateGruidList)


function PanelInfomationLoaderClient(player,FCR,FCG,FCB,namefamilys,logoid,ShoarFamC,memslots,MaxSlotVeh,ExpiteTim,MyRank,fsc,fCreateDatatesad,fpricefortamdid,AllVahFam,tagfamilyforpane)
    
    if getElementData(getLocalPlayer(), "loggedIn") == true and getLocalPlayer() == player then
        
        fpricefortamdi = tonumber(fpricefortamdid*15)/100
        guiSetText(DokmeTamdidFam,"Tamdide 1 Mah (720 Saat) Etebar Family Ba\nPardakhte("..fpricefortamdi.." Gold)")
        cangotosetting = false
        MyRanks = MyRank
        tagfamilyforpanel = tagfamilyforpane
        if MyRank > 8 then
            
            cangotosetting = true
            if homepage == true then
                guiSetVisible(DokmeDemote,true)
                guiSetVisible(DokmePoromote,true)
                guiSetVisible(DokmeKick,true)
            end
        else
            cangotosetting = false
            guiSetVisible(DokmeDemote,false)
            guiSetVisible(DokmePoromote,false)
            guiSetVisible(DokmeKick,false)
        end
        
        fscore = fsc
        if fscore < 70 then
            formenha = 0
            levelfam = 1 
            fornextlevel = 70
        elseif fscore > 69 and fscore < 170 then
            formenha = 70
            levelfam = 2
            fornextlevel = 170
        elseif fscore > 169 and fscore < 320 then
            formenha = 170
            levelfam = 3 
            fornextlevel = 320
        elseif fscore > 319 and fscore < 540 then
            formenha = 320
            levelfam = 4 
            fornextlevel = 540
        elseif fscore > 539 and fscore < 850 then
            formenha = 540
            levelfam = 5 
            fornextlevel = 850
        elseif fscore > 849 and fscore < 1270 then
            formenha = 850
            levelfam = 6 
            fornextlevel = 1270
        elseif fscore > 1269 and fscore < 1740 then
            formenha = 1270
            levelfam = 7 
            fornextlevel = 1740
        elseif fscore > 1739 and fscore < 2240 then
            formenha = 1740
            levelfam = 8
            fornextlevel = 2240
        elseif fscore > 2239 and fscore < 2760 then
            formenha = 2240
            levelfam = 9
            fornextlevel = 2760 
        elseif fscore > 2759 and fscore < 3290 then
            formenha = 2760
            levelfam = 10 
            fornextlevel = 3290
        elseif fscore > 3289 and fscore < 3840 then
            formenha = 3290
            levelfam = 11 
            fornextlevel = 3840
        elseif fscore > 3839 and fscore < 4410 then
            formenha = 3840
            levelfam = 12 
            fornextlevel = 4410
        elseif fscore > 4409 and fscore < 5000 then
            formenha = 4410
            levelfam = 13 
            fornextlevel = 5000
        elseif fscore > 4999 and fscore < 5600 then
            formenha = 5000
            levelfam = 14 
            fornextlevel = 5600
        elseif fscore > 5599 and fscore < 6250 then
            formenha = 5600
            levelfam = 15 
            fornextlevel = 6250
        elseif fscore > 6249 and fscore < 6950 then
            formenha = 6250
            levelfam = 16 
            fornextlevel = 6950
        elseif fscore > 6949 and fscore < 7670 then
            formenha = 6950
            levelfam = 17
            fornextlevel = 7670
        elseif fscore > 7669 and fscore < 8420 then
            formenha = 7670
            levelfam = 18 
            fornextlevel = 8420
        elseif fscore > 8419 and fscore < 9190 then
            formenha = 8420
            levelfam = 19 
            fornextlevel = 9190
        elseif fscore > 9189 and fscore < 10000 then
            formenha = 9190
            levelfam = 20 
            fornextlevel = 10000
        elseif fscore > 9999 and fscore < 10830 then
            formenha = 10000
            levelfam = 21 
            fornextlevel = 10930
        elseif fscore > 10829 and fscore < 11680 then
            formenha = 10830
            levelfam = 22 
            fornextlevel = 11680
        elseif fscore > 11679 and fscore < 12550 then
            formenha = 11680
            levelfam = 23 
            fornextlevel = 12550
        elseif fscore > 12549 and fscore < 13440 then
            formenha = 12550
            levelfam = 24 
            fornextlevel = 13440
        elseif fscore > 13439 and fscore < 14340 then
            formenha = 13440
            levelfam = 25 
            fornextlevel = 14340
        elseif fscore > 14339 and fscore < 15260 then
            formenha = 14340
            levelfam = 26 
            fornextlevel = 15260
        elseif fscore > 15259 and fscore < 16200 then
            formenha = 15260
            levelfam = 27 
            fornextlevel = 16200
        elseif fscore > 16199 and fscore < 17160 then
            formenha = 16200
            levelfam = 28
            fornextlevel = 17160
        elseif fscore > 17159 and fscore < 18140 then
            formenha = 17160
            levelfam = 29 
            fornextlevel = 18140
        elseif fscore > 18139 and fscore < 19140 then
            formenha = 18140
            levelfam = 30 
            fornextlevel = 19140
        elseif fscore > 19139 and fscore < 20200 then
            formenha = 19140
            levelfam = 31 
            fornextlevel = 20200
        elseif fscore > 20199 and fscore < 21460 then
            formenha = 20200
            levelfam = 32 
            fornextlevel = 21460
        elseif fscore > 21459 and fscore <  22760 then
            formenha = 21460
            levelfam = 33 
            fornextlevel = 22760
        elseif fscore > 22759 and fscore < 24160 then
            formenha = 22760
            levelfam = 34 
            fornextlevel = 24160
        elseif fscore > 24159 and fscore < 25700 then
            formenha = 24160
            levelfam = 35 
            fornextlevel = 25700
        elseif fscore > 25699 and fscore < 27300 then
            formenha = 25700
            levelfam = 36
            fornextlevel = 27300
        elseif fscore > 27299 and fscore < 29000 then
            formenha = 27300
            levelfam = 37 
            fornextlevel = 29000
        elseif fscore > 28999 and fscore < 30800 then
            formenha = 29000
            levelfam = 38 
            fornextlevel = 30800
        elseif fscore > 30799 and fscore < 32700 then
            formenha = 30800
            levelfam = 39 
            fornextlevel = 32700
        elseif fscore > 32699 then
            levelfam = "40"
            fornextlevel = "(MAX)"
        else
            levelfam = "?"
            fornextlevel = "N/A"
        end
        MaxSlotVehs = MaxSlotVeh
        logoidfamily = tostring(logoid)
        maxmemebemrs = memslots
        levelfam = "Level: "..levelfam
        namefamilys2 = tostring(namefamilys)
        FCR2,FCG2,FCB2,ShoarFC = FCR,FCG,FCB,ShoarFamC

        allvehs = 5
        flastscore = fscore
        fCreateDate = fCreateDatatesad

        if fornextlevel ~= "(MAX)" then
            fscore = "Score: "..fscore-formenha.." / "..fornextlevel-formenha
        else
            fscore = "Score: "..fscore.." / "..fornextlevel
        end
        ExpiteTime = "Expire Time: "..ExpiteTim.."h"
        ExpiteTimes = ExpiteTim
        guiSetEnabled(BuySlotMember5X,true)
        guiSetEnabled(BuySlotMember10X,true)
        guiSetEnabled(BuySlotMember15X,true)
        guiSetEnabled(BuySlotMember25X,true)

        guiSetEnabled(BuySlotVeh5X,true)
        guiSetEnabled(BuySlotVeh8X,true)
        guiSetEnabled(BuySlotVeh15X,true)
        guiSetEnabled(BuySlotVeh20X,true)
        if maxmemebemrs >= 25 then
            guiSetText(BuySlotMember5X,"x5 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotMember10X,"x10 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotMember15X,"x15 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotMember25X,"x25 | Gheyr Ghabel Kharid")
            guiSetEnabled(BuySlotMember25X,false)
            guiSetEnabled(BuySlotMember15X,false)
            guiSetEnabled(BuySlotMember10X,false)
            guiSetEnabled(BuySlotMember5X,false)
        elseif maxmemebemrs >= 15 then
            guiSetText(BuySlotMember5X,"x5 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotMember10X,"x10 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotMember15X,"x15 | Gheyr Ghabel Kharid")
            guiSetEnabled(BuySlotMember15X,false)
            guiSetEnabled(BuySlotMember10X,false)
            guiSetEnabled(BuySlotMember5X,false)
        elseif maxmemebemrs >= 10 then
            guiSetText(BuySlotMember5X,"x5 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotMember10X,"x10 | Gheyr Ghabel Kharid")
            guiSetEnabled(BuySlotMember10X,false)
            guiSetEnabled(BuySlotMember5X,false)
        elseif maxmemebemrs >= 5 then
            guiSetText(BuySlotMember5X,"x5 | Gheyr Ghabel Kharid")
            guiSetEnabled(BuySlotMember5X,false)
        end

        if MaxSlotVehs >= 20 then
            guiSetText(BuySlotVeh5X,"x5 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotVeh8X,"x8 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotVeh15X,"x15 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotVeh20X,"x20 | Gheyr Ghabel Kharid")
            guiSetEnabled(BuySlotVeh20X,false)
            guiSetEnabled(BuySlotVeh15X,false)
            guiSetEnabled(BuySlotVeh8X,false)
            guiSetEnabled(BuySlotVeh5X,false)
        elseif MaxSlotVehs >= 15 then
            guiSetText(BuySlotVeh5X,"x5 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotVeh8X,"x8 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotVeh15X,"x15 | Gheyr Ghabel Kharid")
            guiSetEnabled(BuySlotVeh15X,false)
            guiSetEnabled(BuySlotVeh8X,false)
            guiSetEnabled(BuySlotVeh5X,false)
        elseif MaxSlotVehs >= 8 then
            guiSetText(BuySlotVeh5X,"x5 | Gheyr Ghabel Kharid")
            guiSetText(BuySlotVeh8X,"x8 | Gheyr Ghabel Kharid")
            guiSetEnabled(BuySlotVeh8X,false)
            guiSetEnabled(BuySlotVeh5X,false)
        elseif MaxSlotVehs >= 5 then
            guiSetText(BuySlotVeh5X,"x5 | Gheyr Ghabel Kharid")
            guiSetEnabled(BuySlotVeh5X,false)
        end

        informationslotfam = "Members: "..allmembers.."/"..maxmemebemrs.." | VehIcles: "..AllVahFam.."/"..MaxSlotVehs..""
    end
end
addEvent("PanelInfomationLoaderClient",true)
addEventHandler("PanelInfomationLoaderClient",getLocalPlayer(),PanelInfomationLoaderClient)



function OpenPanelManageFamily(player)
    if getElementData(getLocalPlayer(), "loggedIn") == true and getLocalPlayer() == player then
        guiSetVisible(paneledittagfamtext,false)
        guiSetVisible(paneledittagfam,false)
        guiSetVisible(paneeditfamesmfam,false)
        guiSetVisible(paneeditfamesmfamtext,false)
        guiSetVisible(PanelKharideVeh,false)
        guiSetVisible(PanelChapeSetting,false)
        guiSetVisible(PanelChapeSetting2,false)
        guiSetVisible(IconSetting,false)
        guiSetVisible(DokmeTamdidFam,false)
        guiSetVisible(DokmeChengeParkingLoc,false)
        guiSetVisible(DokmeChengeInformationFamily,false)
        guiSetVisible(DokmeBackeAzSetting,false)
        guiSetVisible(shoarfamilyforeditpanel,false)
        guiSetVisible(shoarfamilyforeditpaneltext,false)
        guiSetVisible(PickColorForPanelEditFamily,false)
        guiSetVisible(PickColorForPanelEditFamilyText,false)
        guiSetVisible(logofamilyeditpanel,false)
        guiSetVisible(logofamilyforeditpanel,false)
        guiSetVisible(extLogoInPanelEditFam,false)
        guiSetVisible(NextLogoInPanelEditFam,false)
        guiSetVisible(logofamilyforeditpaneltext,false)
        guiSetVisible(DokmeBackeAzSettingToEditPanel,false)
        guiSetVisible(RulForEditFamily,false)
        guiSetVisible(AccEditFamilyForEnd,false)
        guiSetVisible(RulForEditFamily,false)
        guiSetVisible(AccEditFamilyForEnd,false)
        homepage = true
        if fmvisable == nil then
            reloadkonpanelglistfamra()
            guiSetVisible(Players,true)
            showCursor(true)
            fmvisable=true
            playSound( "Sounds/s1.wav", false)
            guiSetVisible(BackGrundManageFamilyPanel,true)
            addEventHandler("onClientRender",root,drawDXPanelFamilyManage)
            triggerServerEvent("PanelInfomationLoader", getLocalPlayer(), getLocalPlayer() )
        else
            MyRank = 0
            guiGridListClear( Players )
            playSound( "Sounds/s3.wav", false)
            allmembers = 0
            onlinemembers = 0
            guiSetVisible(BackGrundManageFamilyPanel,false)		
            removeEventHandler("onClientRender",root,drawDXPanelFamilyManage)
            showCursor(false)
            fmvisable=nil

        end
    end
end
addEvent("OpenPanelFamilyManage",true)
addEventHandler("OpenPanelFamilyManage",getLocalPlayer(),OpenPanelManageFamily)
function openPanel (  )
    if getElementData(getLocalPlayer(), "loggedIn") == true then
        triggerServerEvent("OpenPanelFamilyManageServer", getLocalPlayer(), getLocalPlayer() )
    end
end
bindKey( "F10", "down", openPanel )
-------------------------=======================#ExoPrim[Panel In And Out Family]=======================-------------------------[[Kose Nanash Ke Cpy Kone Ya Pub Kone]]
function SetTextFont(Name,Size)
    guiSetFont(Name,guiCreateFont("Fonts/font.ttf", Size))
end
-----=====Gui Vorodi=====-----
PanelDayereIn = guiCreateStaticImage(0.315, 0.15, 0.4, 0.7,"IMG/Dayere.png",true) 
Label1 = guiCreateLabel(0.18, 0.37,1, 0.1, "(( Aya Mikhahid Varede Garage Family Shavid? ))", true, PanelDayereIn)
SetTextFont(Label1,13)
GoingInGarage = guiCreateButton(0.155, 0.53, 0.7, 0.08, "Vorod Be Garage Family", true, PanelDayereIn)
guiSetProperty (GoingInGarage, "NormalTextColour", "FF666600")
SetTextFont(GoingInGarage,15)
CancelInGarage = guiCreateButton(0.23, 0.67, 0.55, 0.08, "Bastan", true, PanelDayereIn)
guiSetProperty (CancelInGarage, "NormalTextColour", "FFCC0000")
SetTextFont(CancelInGarage,13)
guiSetVisible(PanelDayereIn,false)
function OpenPanelInFamily(thePlayer)
    if thePlayer == getLocalPlayer() then
        guiSetVisible(PanelDayereIn,true)
        showCursor(true)
    end
end
addEvent("OpenPanelInFamily",true)
addEventHandler("OpenPanelInFamily",getLocalPlayer(),OpenPanelInFamily)

function CloseInPanelGarageFam(thePlayer)
    if thePlayer == getLocalPlayer() then
        if guiGetVisible(PanelDayereIn) == true then
            guiSetVisible(PanelDayereIn,false)
            showCursor(false)
        end
    end
end
addEvent("CloseInPanelGarageFam",true)
addEventHandler("CloseInPanelGarageFam",getLocalPlayer(),CloseInPanelGarageFam)

PanelDayereIn2 = guiCreateStaticImage(0.315, 0.15, 0.4, 0.7,"IMG/Dayere.png",true) 
Label2 = guiCreateLabel(0.175, 0.37, 1, 0.1, "(( Aya Mikhahid Az Garage Family Kharej Shavid? ))", true, PanelDayereIn2)
SetTextFont(Label2,13)
GoingInGarage2 = guiCreateButton(0.15, 0.53, 0.7, 0.08, "Khoroj Az Garage Family", true, PanelDayereIn2)
guiSetProperty (GoingInGarage2, "NormalTextColour", "FF666600")
SetTextFont(GoingInGarage2,15)
CancelInGarage2 = guiCreateButton(0.23, 0.67, 0.55, 0.08, "Bastan", true, PanelDayereIn2)
guiSetProperty (CancelInGarage2, "NormalTextColour", "FFCC0000")
SetTextFont(CancelInGarage2,13)
guiSetVisible(PanelDayereIn2,false)

function OpenPanelOUTFamily(thePlayer)
    if thePlayer == getLocalPlayer() then
        guiSetVisible(PanelDayereIn2,true)
        showCursor(true)
    end
end
addEvent("OpenPanelOUTFamily",true)
addEventHandler("OpenPanelOUTFamily",getLocalPlayer(),OpenPanelOUTFamily)

function CloseOUTPanelGarageFam(thePlayer)
    if thePlayer == getLocalPlayer() then
        if guiGetVisible(PanelDayereIn2) == true then
            guiSetVisible(PanelDayereIn2,false)
            showCursor(false)
        end
    end
end
addEvent("CloseOUTPanelGarageFam",true)
addEventHandler("CloseOUTPanelGarageFam",getLocalPlayer(),CloseOUTPanelGarageFam)
addEventHandler("onClientGUIClick", getRootElement(),
function ()
    if source == CancelInGarage then
        CloseInPanelGarageFam(getLocalPlayer())
    elseif source == GoingInGarage then
        triggerServerEvent("VorodeBeParkingGarageFam", getLocalPlayer(), getLocalPlayer() )
    elseif source == CancelInGarage2 then 
        CloseOUTPanelGarageFam(getLocalPlayer())
    elseif source == GoingInGarage2 then
        triggerServerEvent("KhorojeBeParkingGarageFam", getLocalPlayer(), getLocalPlayer() )
    end
end)
bindKey( "h", "down", "putkamion" )

setDevelopmentMode (true)
addCommandHandler ("showcol",function ()
    showCol (not isShowCollisionsEnabled())
end)

--------==============Panel Hack Keshti=================---------

local bghack = guiCreateWindow(420, 160, 700, 250, "Panel Hack", false)
guiSetVisible(bghack,false)
local btn = {}
local helphack = guiCreateLabel(0.02,0.1, 1, 0.2, "Addad Hara Be Tartib (Az Kam Be Ziad Entekhab Konid) Entekhab Konid", true, bghack)
SetTextFont(helphack , 15)

btn[1] = guiCreateButton(0.01, 0.4, 0.1, 0.25, "5", true, bghack)
btn[2] = guiCreateButton(0.12, 0.4, 0.1, 0.25, "7", true, bghack)
btn[3] = guiCreateButton(0.23, 0.4, 0.1, 0.25, "9", true, bghack)
btn[4] = guiCreateButton(0.34, 0.4, 0.1, 0.25, "8", true, bghack)
btn[5] = guiCreateButton(0.45, 0.4, 0.1, 0.25, "1", true, bghack)
btn[6] = guiCreateButton(0.56, 0.4, 0.1, 0.25, "3", true, bghack)
btn[7] = guiCreateButton(0.67, 0.4, 0.1, 0.25, "4", true, bghack)
btn[8] = guiCreateButton(0.78, 0.4, 0.1, 0.25, "2", true, bghack)
btn[9] = guiCreateButton(0.89, 0.4, 0.1, 0.25, "6", true, bghack)
local CloseBTNHACK = guiCreateButton(0.05, 0.7, 0.9, 0.3, "Close", true, bghack)
guiSetProperty (CloseBTNHACK, "NormalTextColour", "FFFF0000")
SetTextFont(CloseBTNHACK,15)
guiSetAlpha( CloseBTNHACK, 100)


function OpenPanelHack(player)
    if player == getLocalPlayer() then
        allbuttn = 0
        ghabli = 0
        guiSetVisible(bghack,true)
        for i = 1 ,#btn do
            guiSetProperty (btn[i], "NormalTextColour", "FFFFFF00")
            SetTextFont(btn[i],15)
            guiSetEnabled(btn[i],true)
        end
    end
end
addEvent("OpenPanelHack",true)
addEventHandler("OpenPanelHack",getLocalPlayer(),OpenPanelHack)

function ClosePanelHackKeshti(player)
    if player == getLocalPlayer() then
        allbuttn = 0
        ghabli = 0
        guiSetVisible(bghack,false)
    end
end
addEvent("ClosePanelHackKeshti",true)
addEventHandler("ClosePanelHackKeshti",getLocalPlayer(),ClosePanelHackKeshti)




addEventHandler("onClientGUIClick", getRootElement(),function ()
    if guiGetVisible(bghack) == true and tonumber(getElementData(getLocalPlayer(),"KeshtiHack")) > 0 then
        if source == btn[5] then
            guiSetEnabled(source,false)
        elseif source == btn[8] then
            if guiGetEnabled(btn[5]) == false then
                guiSetEnabled(source,false)
            else
                guiSetEnabled( btn[1],true )
                guiSetEnabled( btn[2],true )
                guiSetEnabled( btn[3],true )
                guiSetEnabled( btn[4],true )
                guiSetEnabled( btn[5],true )
                guiSetEnabled( btn[6],true )
                guiSetEnabled( btn[7],true )
                guiSetEnabled( btn[8],true )
                guiSetEnabled( btn[9],true )
            end
        elseif source == btn[6] then
            if guiGetEnabled(btn[5]) == false and guiGetEnabled(btn[8]) == false then
                guiSetEnabled(source,false)
            else
                guiSetEnabled( btn[1],true )
                guiSetEnabled( btn[2],true )
                guiSetEnabled( btn[3],true )
                guiSetEnabled( btn[4],true )
                guiSetEnabled( btn[5],true )
                guiSetEnabled( btn[6],true )
                guiSetEnabled( btn[7],true )
                guiSetEnabled( btn[8],true )
                guiSetEnabled( btn[9],true )
            end
        elseif source == btn[7] then
            if guiGetEnabled(btn[5]) == false and guiGetEnabled(btn[8]) == false and guiGetEnabled(btn[6]) == false then
                guiSetEnabled(source,false)
            else
                guiSetEnabled( btn[1],true )
                guiSetEnabled( btn[2],true )
                guiSetEnabled( btn[3],true )
                guiSetEnabled( btn[4],true )
                guiSetEnabled( btn[5],true )
                guiSetEnabled( btn[6],true )
                guiSetEnabled( btn[7],true )
                guiSetEnabled( btn[8],true )
                guiSetEnabled( btn[9],true )
            end
        elseif source == btn[1] then
            if guiGetEnabled(btn[5]) == false and guiGetEnabled(btn[8]) == false and guiGetEnabled(btn[6]) == false and guiGetEnabled(btn[7]) == false then
                guiSetEnabled(source,false)
            else
                guiSetEnabled( btn[1],true )
                guiSetEnabled( btn[2],true )
                guiSetEnabled( btn[3],true )
                guiSetEnabled( btn[4],true )
                guiSetEnabled( btn[5],true )
                guiSetEnabled( btn[6],true )
                guiSetEnabled( btn[7],true )
                guiSetEnabled( btn[8],true )
                guiSetEnabled( btn[9],true )
            end
        elseif source == btn[9] then
            if guiGetEnabled(btn[5]) == false and guiGetEnabled(btn[8]) == false and guiGetEnabled(btn[6]) == false and guiGetEnabled(btn[7]) == false and guiGetEnabled(btn[1]) == false then
                guiSetEnabled(source,false)
            else
                guiSetEnabled( btn[1],true )
                guiSetEnabled( btn[2],true )
                guiSetEnabled( btn[3],true )
                guiSetEnabled( btn[4],true )
                guiSetEnabled( btn[5],true )
                guiSetEnabled( btn[6],true )
                guiSetEnabled( btn[7],true )
                guiSetEnabled( btn[8],true )
                guiSetEnabled( btn[9],true )
            end
        elseif source == btn[2] then
            if guiGetEnabled(btn[5]) == false and guiGetEnabled(btn[8]) == false and guiGetEnabled(btn[6]) == false and guiGetEnabled(btn[7]) == false and guiGetEnabled(btn[1]) == false and guiGetEnabled(btn[9]) == false then
                guiSetEnabled(source,false)
            else
                guiSetEnabled( btn[1],true )
                guiSetEnabled( btn[2],true )
                guiSetEnabled( btn[3],true )
                guiSetEnabled( btn[4],true )
                guiSetEnabled( btn[5],true )
                guiSetEnabled( btn[6],true )
                guiSetEnabled( btn[7],true )
                guiSetEnabled( btn[8],true )
                guiSetEnabled( btn[9],true )
            end
        elseif source == btn[4] then
            if guiGetEnabled(btn[5]) == false and guiGetEnabled(btn[8]) == false and guiGetEnabled(btn[6]) == false and guiGetEnabled(btn[7]) == false and guiGetEnabled(btn[1]) == false and guiGetEnabled(btn[9]) == false and guiGetEnabled(btn[2]) == false then
                guiSetEnabled(source,false)
            else
                guiSetEnabled( btn[1],true )
                guiSetEnabled( btn[2],true )
                guiSetEnabled( btn[3],true )
                guiSetEnabled( btn[4],true )
                guiSetEnabled( btn[5],true )
                guiSetEnabled( btn[6],true )
                guiSetEnabled( btn[7],true )
                guiSetEnabled( btn[8],true )
                guiSetEnabled( btn[9],true )
            end
        elseif source == btn[3] then
            if guiGetEnabled(btn[5]) == false and guiGetEnabled(btn[8]) == false and guiGetEnabled(btn[6]) == false and guiGetEnabled(btn[7]) == false and guiGetEnabled(btn[1]) == false and guiGetEnabled(btn[9]) == false and guiGetEnabled(btn[2]) == false and guiGetEnabled(btn[4]) == false then
                guiSetEnabled(source,false)
                ClosePanelHackKeshti(getLocalPlayer())
                triggerServerEvent("bazkondarekeshtio", getLocalPlayer(), getLocalPlayer() )
            else
                guiSetEnabled( btn[1],true )
                guiSetEnabled( btn[2],true )
                guiSetEnabled( btn[3],true )
                guiSetEnabled( btn[4],true )
                guiSetEnabled( btn[5],true )
                guiSetEnabled( btn[6],true )
                guiSetEnabled( btn[7],true )
                guiSetEnabled( btn[8],true )
                guiSetEnabled( btn[9],true )
            end
        elseif source == CloseBTNHACK then
            
            ClosePanelHackKeshti(getLocalPlayer())
        end
    end
end)
addEventHandler("onClientObjectBreak", root,
    function()
        if getElementData(source,"PasswordEnterForGateFamily") == true then
            if tonumber(getElementData(source,"GateID")) > 0 then
                local id = tonumber(getElementData(source,"GateID"))
                outputChatBox(id)
                triggerServerEvent("moveObjectDoorAfterBreakSec", getLocalPlayer(),  getElementData(source,"GateID"))
            end
        end
    end
)
  
----------------=============panelinformationplayerfamily=============----------------
familysinformation = {}
panellistfamily = false
addEvent("infofamilypanelforreghabat",true)
addEventHandler("infofamilypanelforreghabat",getLocalPlayer(),function(root,row,allmembersonline,score,name,logoid,leadername, shoarefamilyfopanel , slotmemberfamily , allplayersplayers , fCreateDateForPanel,Rr,Gg,Bb)
    if getElementData(root, "loggedIn") == true then
        if root == getLocalPlayer() then
            logoidforedit = logoid
            

            row = tonumber(row)
            familysinformation[row] = {}
            familysinformation[row][1]=row
            familysinformation[row][2]=allmembersonline
            familysinformation[row][3]=score
            familysinformation[row][4]=name
            familysinformation[row][5]=logoid
            familysinformation[row][6]=tostring(leadername)
            familysinformation[row][7]=tostring(shoarefamilyfopanel)
            familysinformation[row][8]=tostring(slotmemberfamily)
            familysinformation[row][9]=tostring(allplayersplayers)
            familysinformation[row][10]=string.gsub(fCreateDateForPanel,"-", "/")
            familysinformation[row][11]=tonumber(Rr)
            familysinformation[row][12]=tonumber(Gg)
            familysinformation[row][13]=tonumber(Bb)
            if score < 70 then
                familysinformation[row][14] = 1 
            elseif score > 69 and score < 170 then
                familysinformation[row][14] = 2
            elseif score > 169 and score < 320 then
                familysinformation[row][14] = 3 
            elseif score > 319 and score < 540 then
                familysinformation[row][14] = 4 
            elseif score > 539 and score < 850 then
                familysinformation[row][14] = 5 
            elseif score > 849 and score < 1270 then
                familysinformation[row][14] = 6 
            elseif score > 1269 and score < 1740 then
                familysinformation[row][14] = 7 
            elseif score > 1739 and score < 2240 then
                familysinformation[row][14] = 8
            elseif score > 2239 and score < 2760 then
                familysinformation[row][14] = 9
            elseif score > 2759 and score < 3290 then
                familysinformation[row][14] = 10 
            elseif score > 3289 and score < 3840 then
                familysinformation[row][14] = 11 
            elseif score > 3839 and score < 4410 then
                familysinformation[row][14] = 12 
            elseif score > 4409 and score < 5000 then
                familysinformation[row][14] = 13 
            elseif score > 4999 and score < 5600 then
                familysinformation[row][14] = 14 
            elseif score > 5599 and score < 6250 then
                familysinformation[row][14] = 15 
            elseif score > 6249 and score < 6950 then
                familysinformation[row][14] = 16 
            elseif score > 6949 and score < 7670 then
                familysinformation[row][14] = 17
            elseif score > 7669 and score < 8420 then
                familysinformation[row][14] = 18 
            elseif score > 8419 and score < 9190 then
                familysinformation[row][14] = 19 
            elseif score > 9189 and score < 10000 then
                familysinformation[row][14] = 20 
            elseif score > 9999 and score < 10830 then
                familysinformation[row][14] = 21 
            elseif score > 10829 and score < 11680 then
                familysinformation[row][14] = 22 
            elseif score > 11679 and score < 12550 then
                familysinformation[row][14] = 23 
            elseif score > 12549 and score < 13440 then
                familysinformation[row][14] = 24 
            elseif score > 13439 and score < 14340 then
                familysinformation[row][14] = 25 
            elseif score > 14339 and score < 15260 then
                familysinformation[row][14] = 26 
            elseif score > 15259 and score < 16200 then
                familysinformation[row][14] = 27 
            elseif score > 16199 and score < 17160 then
                familysinformation[row][14] = 28
            elseif score > 17159 and score < 18140 then
                familysinformation[row][14] = 29 
            elseif score > 18139 and score < 19140 then
                familysinformation[row][14] = 30 
            elseif score > 19139 and score < 20200 then
                familysinformation[row][14] = 31 
            elseif score > 20199 and score < 21460 then
                familysinformation[row][14] = 32 
            elseif score > 21459 and score <  22760 then
                familysinformation[row][14] = 33 
            elseif score > 22759 and score < 24160 then
                familysinformation[row][14] = 34 
            elseif score > 24159 and score < 25700 then
                familysinformation[row][14] = 35 
            elseif score > 25699 and score < 27300 then
                familysinformation[row][14] = 36
            elseif score > 27299 and score < 29000 then
                familysinformation[row][14] = 37 
            elseif score > 28999 and score < 30800 then
                familysinformation[row][14] = 38 
            elseif score > 30799 and score < 32700 then
                familysinformation[row][14] = 39 
            elseif score > 32699 then
                familysinformation[row][14] = "40"

            else
                familysinformation[row][14] = "?"
            end
        end
	end
end)
function dxfamilylist()
    dxDrawImage(x*600, y*150, x*450, y*500, "IMG/Background.png", 0, 0, 0, tocolor(120, 120, 120, 200), true)
    if isMouseInPosition(x*1010, y*140, x*49, y*49) then
        dxDrawImage(x*1010, y*140, x*49, y*49, "list/Close.png", 0, 0, 0, tocolor(150,150,150, 255), true)
        if getKeyState("mouse1")  then
            if not press then
                press = true
            
                closepanelfamilylist()
            end
        else
            press = false
        end
    else
        dxDrawImage(x*1010, y*140, x*49, y*49, "list/Close.png", 0, 0, 0, tocolor(255,255,255, 255), true)
    end
    dxDrawImage(x*624, y*170, x*400, y*450, "IMG/BoxMini.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    dxDrawText("#"..familysinformation[nowrow][1], x*(658-dxGetTextWidth("#"..familysinformation[nowrow][1])), y*370, x*95, y*35, tocolor(255, 255, 255, 255), fontScale, font3, "left", "center",false,false,true, false)
    dxDrawImage(x*738, y*180, x*170, y*170, "Logo/"..familysinformation[nowrow][5]..".dds", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    dxDrawImage(x*675, y*350, x*300, y*65, "list/Kargah_Box.png", 0, 0, 0, tocolor(200, 200, 255, 230), true)
    dxDrawText(familysinformation[nowrow][4], x*(830-dxGetTextWidth(familysinformation[nowrow][4])), y*735, x*95, y*35, tocolor(familysinformation[nowrow][11], familysinformation[nowrow][12], familysinformation[nowrow][13], 255), fontScale, font3, "left", "center",false,false,true, false)
    dxDrawImage(x*675, y*423, x*300, y*47, "list/Kargah_Box.png", 0, 0, 0, tocolor(200, 200, 255, 230), true)
    dxDrawText("Leader: "..familysinformation[nowrow][6], x*(860-dxGetTextWidth("Leader: "..familysinformation[nowrow][6])), y*855, x*95, y*35, tocolor(192,192,192,255), fontScale, font12, "left", "center",false,false,true, false)
    dxDrawImage(x*675, y*480, x*120, y*40, "list/Kargah_Box.png", 0, 0, 0, tocolor(200, 200, 255, 230), true)
    dxDrawText("Members: "..familysinformation[nowrow][9].."/"..familysinformation[nowrow][8], x*(765-dxGetTextWidth("Members: "..familysinformation[nowrow][8].."/"..familysinformation[nowrow][9])), y*965, x*95, y*35, tocolor(0,128,255,255), fontScale, font12, "left", "center",false,false,true, false)
    dxDrawImage(x*797, y*480, x*80, y*40, "list/Kargah_Box.png", 0, 0, 0, tocolor(200, 200, 255, 230), true)
    dxDrawText("Level: "..familysinformation[nowrow][14], x*(850-dxGetTextWidth("Level: "..familysinformation[nowrow][14])), y*965, x*95, y*35, tocolor(255,255,0,255), fontScale, font12, "left", "center",false,false,true, false)
    dxDrawImage(x*880, y*480, x*90, y*40, "list/Kargah_Box.png", 0, 0, 0, tocolor(200, 200, 255, 230), true)
    dxDrawImage(x*885, y*486, x*31, y*25, "list/Online.png", 0, 0, 0, tocolor(200, 200, 255, 230), true)
    dxDrawText(familysinformation[nowrow][2], x*(930-dxGetTextWidth(familysinformation[nowrow][2])), y*965, x*95, y*35, tocolor(51,255,51,255), fontScale, font12, "left", "center",false,false,true, false)
    dxDrawText(string.gsub("Creation Date: "..familysinformation[nowrow][10],"-", "/"), x*(890-dxGetTextWidth("Creation Date: "..familysinformation[nowrow][10])), y*1100, x*70, y*35, tocolor(128, 128, 128, 255), fontScale, font12, "left", "center",false,false,true, false)
    if #familysinformation > nowrow then
        if isMouseInPosition(x*1020, y*600, x*32, y*32) then
            dxDrawImage(x*1020, y*600, x*32, y*32, "list/Next.png", 0, 0, 0, tocolor(150,150,150, 255), true)
            if getKeyState("mouse1")  then
                if not press then
                    press = true
                
                    nowrow = nowrow+1
                end
            else
                press = false
            end
        else
            dxDrawImage(x*1020, y*600, x*32, y*32, "list/Next.png", 0, 0, 0, tocolor(255,255,255, 255), true)
        end
    end
    if 1 < nowrow then
        if isMouseInPosition(x*590, y*600, x*32, y*32) then
            dxDrawImage(x*590, y*600, x*32, y*32, "list/Next.png", 180, 0, 0, tocolor(150,150,150, 255), true)
            if getKeyState("mouse1")  then
                if not press then
                    press = true

                    nowrow = nowrow-1
                end
            else
                press = false
            end
        else
            dxDrawImage(x*590, y*600, x*32, y*32, "list/Next.png", 180, 0, 0, tocolor(255,255,255, 255), true)
        end
    end

end
function openpanelfamilylist()
    panelfamilylist = true
    addEventHandler("onClientRender",root,dxfamilylist)
end

function closepanelfamilylist()
    removeEventHandler("onClientRender",root,dxfamilylist)
    panelfamilylist = false
end

addCommandHandler("family",function (  )
    if getElementData(getLocalPlayer(), "loggedIn") == true then
        triggerServerEvent("PanelRaghabatFamily", getLocalPlayer(), getLocalPlayer() )
        if panelfamilylist == true then
            closepanelfamilylist()
            
        else
            openpanelfamilylist()
            nowrow = 1
        end
    end
end)


----------------============ START FFA ============--------------------------








function convertTime ( ms ) 
    if ( ms and type ( ms ) == "number" ) then 
    local milliseconds = math.floor((ms % 1000) / 100)
    local seconds = math.floor((ms / 1000) % 60)
    local minutes = math.floor((ms / (1000 * 60)) % 60)
        if seconds < 10 then
            seconds = "0"..seconds
        end
        if minutes < 10 then
            minutes = "0"..minutes
        end
	    return minutes, seconds, milliseconds

    end 
end 

PanelBgFFA = guiCreateStaticImage(x*1250, y*250, x*320.25, y*482,"IMG/BoxMini.png",false) 
guiSetVisible(PanelBgFFA,false)
text1ffa = guiCreateLabel(x*82, y*20, x*160, y*30, "Emtiyaz Haye Family Ha", false, PanelBgFFA)
guiSetFont(text1ffa,guiCreateFont("Fonts/font.ttf", (x+y)*5))
guiLabelSetColor(text1ffa,255,0,0)
text2ffa = guiCreateLabel(x*98, y*50, x*160, y*30, "((Be Tatib Emtiyaz))", false, PanelBgFFA)
guiSetFont(text2ffa,guiCreateFont("Fonts/font.ttf", (x+y)*4.5))
text3ffa = guiCreateLabel(x*73, y*450, x*200, y*60, "Loading", false, PanelBgFFA)
guiSetFont(text3ffa,guiCreateFont("Fonts/font.ttf", (x+y)*4.5))
local Familscores = guiCreateGridList(x*10, y*80, x*300, y*340, false,PanelBgFFA)
guiSetEnabled(Familscores,false)
local NameFamily = guiGridListAddColumn(Familscores, "Family Name", 0.55)
local ScoreFamily = guiGridListAddColumn(Familscores, "Score Family", 0.35)
local familylistinffa = {}

guiSetFont(Familscores,guiCreateFont("Fonts/font.ttf", (x+y)*5))
function OmadToyeFFATurf(player,timeris,famid,famname)
    if player == getLocalPlayer() then
        if guiGetVisible(PanelBgFFA) == false then
            guiSetVisible(PanelBgFFA,true)
            ffatimer = setTimer (
            function ( )
                timeris = timeris - 1000
                minutes, seconds, milliseconds = convertTime(timeris)
                guiSetText(text3ffa,"Zaman BaghiMande (( "..minutes..":"..seconds.." ))")
                if ffatimer == 0 then
                    for i=1 , #familylistinffa do
                        familylistinffa[i] = nil
                    end
                end
            end,1000, 0)
        end
    end
end
addEvent("OmadToyeFFATurf",true)
addEventHandler("OmadToyeFFATurf", getRootElement(), OmadToyeFFATurf)

SortAndReversArry = {}
FamilyIdInFFA = {}
function RefreshPanelFFA(player)

    guiGridListClear(Familscores)
    i = 0
    local SortedTestArray2 = insertSortingByIndex(familylistinffa, 3)
    for k, v in pairs(SortedTestArray2) do
        i = i + 1
        SortAndReversArry[i] = {v[1],v[2],v[3]}
    end
    local SortedTestArray2 = table.reverse(SortAndReversArry) 
    for k, v in pairs(SortedTestArray2) do
        FamilyIdInFFA[i] = guiGridListAddRow(Familscores,v[2],v[3])
    end
    
end
addEvent("RefreshPanelFFA",true)
addEventHandler("RefreshPanelFFA", getRootElement(), RefreshPanelFFA)

function ChangeScoreFamily(allpl,i,famid,Score,famname)
    if allpl == getLocalPlayer() then
        familylistinffa[i] = {famid,Score,famname}
    end
end
addEvent("ChangeScoreFamily",true)
addEventHandler("ChangeScoreFamily", getRootElement(), ChangeScoreFamily)

function ClosePanelFFA(player)
    if getLocalPlayer() == player then
        if guiGetVisible(PanelBgFFA) == true then
            guiSetVisible(PanelBgFFA,false)
        end
    end
end
addEvent("ClosePanelFFA",true)
addEventHandler("ClosePanelFFA", getRootElement(), ClosePanelFFA)

--[[
function findfambyname(name)
    for i = 1 , #familylistinffa do
        if familylistinffa[i][2] == name then
            return familylistinffa[i][1]
        end
    end
    return false
end
]]

