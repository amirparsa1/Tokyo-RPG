local notfSys = exports["notf"]
local player = getLocalPlayer()
local sX, sY = guiGetScreenSize()
local px, py = (sX/1600), (sY/900)
local bgcheange = guiCreateStaticImage( px*180, py*80,  px*1280, py*720, "Data/Bg.png", false,false)
guiSetVisible( bgcheange, false )
local dokmebastan = guiCreateButton(px*1050, py*30, px*170, py*50, "Close", false, bgcheange)
local MatnSabtAhval = guiCreateLabel(px*300, py*100, px*700, py*500,  "Daftar Pishkhan Khadamat Dolat", false, bgcheange)
guiLabelSetColor( MatnSabtAhval, 255,255,255 )
guiSetFont(MatnSabtAhval, guiCreateFont( "Data/Rage.ttf",(px+py)*13 ))
taghirenamekarbari = guiCreateTabPanel(px*270, py*200, px*740, py*430, false, bgcheange)
tabsabtahval1 = guiCreateTab("Thaghire Name Karbari", taghirenamekarbari)
local NamePlayertosabtahval = guiCreateLabel(px*70, py*60, px*400, py*200,  "Name Karbari Shoma: Loading", false, tabsabtahval1)
guiLabelSetColor( NamePlayertosabtahval, 255,255,255 )
guiSetFont(NamePlayertosabtahval, guiCreateFont( "Data/Rage.ttf",(px+py)*7 ))
local namebe = guiCreateLabel(px*70, py*170, px*400, py*200,  "Taghire Be:", false, tabsabtahval1)
guiLabelSetColor( namebe, 255,255,255 )
guiSetFont(namebe, guiCreateFont( "Data/Rage.ttf",(px+py)*7 ))
local taghirenamerbe = guiCreateEdit(px*178, py*168, px*400, py*40, "", false, tabsabtahval1)
guiEditSetMaxLength ( taghirenamerbe, 15 )
guiSetFont(taghirenamerbe, guiCreateFont( "Data/Rage.ttf",(px+py)*10 ))
local submitcheangename = guiCreateButton(px*155, py*270, px*450, py*50, "Taghir Name Karbari Ba Pardakht 500 Gold", false, tabsabtahval1)
guiSetFont(submitcheangename,guiCreateFont( "Data/Rage.ttf",(px+py)*7 ))
guiSetProperty (submitcheangename, "NormalTextColour", "FFFFFF00")
addEventHandler("onClientGUIClick", getRootElement(),function ()
    if source == dokmebastan then
        closepanelsabtahval(player)
    elseif source == submitcheangename then
        Hexs2 = tostring(guiGetText(taghirenamerbe))--#ExoPrim Exo4Ever		
        ---- To New Name Alamat Nabashe
        if ( string.find ( Hexs2, '~' ) ) or ( string.find ( Hexs2, '!' ) )  or ( string.find ( Hexs2, '@' ) ) or ( string.find ( Hexs2, '#' ) ) or ( string.find ( Hexs2, '&' ) ) or ( string.find ( Hexs2, '*' ) ) or ( string.find ( Hexs2, '-' ) ) or ( string.find ( Hexs2, '=' ) ) or ( string.find ( Hexs2, '+' ) ) or ( string.find ( Hexs2, '\\' ) ) or ( string.find ( Hexs2, '|' ) ) or ( string.find ( Hexs2, '{' ) ) or ( string.find ( Hexs2, '}' ) ) or ( string.find ( Hexs2, ';' ) ) or ( string.find ( Hexs2, ':' ) ) or ( string.find ( Hexs2, '"' ) ) or ( string.find ( Hexs2, '<' ) ) or ( string.find ( Hexs2, '>' ) ) or ( string.find ( Hexs2, '/' ) ) or ( string.find ( Hexs2, '?' ) ) then	
            exports["notf"]:addNotification("Name Bayad Shamel Horof Va Adad Va _ Bashad, Estefade Az Hargone Alamat Haye Digar Mojaz Nist!", "error")
            return false	
        end
        -- To New Name Farsi Nabashe
        if ( string.find ( Hexs2, 'ض' ) ) or ( string.find ( Hexs2, 'ص' ) )  or ( string.find ( Hexs2, 'ث' ) ) or ( string.find ( Hexs2, 'ق' ) ) or ( string.find ( Hexs2, 'ف' ) ) or ( string.find ( Hexs2, 'غ' ) ) or ( string.find ( Hexs2, 'ع' ) ) or ( string.find ( Hexs2, 'ه' ) ) or ( string.find ( Hexs2, 'خ' ) ) or ( string.find ( Hexs2, 'ح' ) ) or ( string.find ( Hexs2, 'ج' ) ) or ( string.find ( Hexs2, 'چ' ) ) or ( string.find ( Hexs2, 'ش' ) ) or ( string.find ( Hexs2, 'س' ) ) or ( string.find ( Hexs2, 'ی' ) ) or ( string.find ( Hexs2, 'ب' ) ) or ( string.find ( Hexs2, 'ل' ) ) or ( string.find ( Hexs2, 'ا' ) ) or ( string.find ( Hexs2, 'ت' ) ) or ( string.find ( Hexs2, 'ن' ) )  or ( string.find ( Hexs2, 'م' ) )  or ( string.find ( Hexs2, 'ک' ) )  or ( string.find ( Hexs2, 'گ' ) )  or ( string.find ( Hexs2, 'ظ' ) )  or ( string.find ( Hexs2, 'ط' ) )  or ( string.find ( Hexs2, 'ز' ) )  or ( string.find ( Hexs2, 'ر' ) )  or ( string.find ( Hexs2, 'ذ' ) )  or ( string.find ( Hexs2, 'د' ) )  or ( string.find ( Hexs2, 'ئ' ) )  or ( string.find ( Hexs2, 'و' ) ) or ( string.find ( Hexs2, 'ً' ) )  or ( string.find ( Hexs2, 'ٌ' ) )  or ( string.find ( Hexs2, 'ٍ' ) )  or ( string.find ( Hexs2, 'ريال' ) )  or ( string.find ( Hexs2, '،' ) )  or ( string.find ( Hexs2, '؛' ) )  or ( string.find ( Hexs2, 'َ' ) )  or ( string.find ( Hexs2, 'ُ' ) )  or ( string.find ( Hexs2, 'ِ' ) )  or ( string.find ( Hexs2, 'ّ' ) )  or ( string.find ( Hexs2, 'ۀ' ) )  or ( string.find ( Hexs2, 'آ' ) )  or ( string.find ( Hexs2, 'ـ' ) )  or ( string.find ( Hexs2, '«' ) )  or ( string.find ( Hexs2, '»' ) )  or ( string.find ( Hexs2, 'ة' ) )  or ( string.find ( Hexs2, 'ي' ) )  or ( string.find ( Hexs2, 'ژ' ) )  or ( string.find ( Hexs2, 'ؤ' ) )  or ( string.find ( Hexs2, 'إ' ) )  or ( string.find ( Hexs2, 'أ' ) )  or ( string.find ( Hexs2, 'ء' ) )  or ( string.find ( Hexs2, 'پ' ) )  or ( string.find ( Hexs2, '؟' ) ) then
            exports["notf"]:addNotification("Name Bayad Shamel Horof English Bashad!", "error")
            return false
        end
        -- To New Name Fasele Nabashe
        if ( string.find ( Hexs2, '%s' ) ) then
            exports["notf"]:addNotification("Estefade Az Fasele (Space) Baraye Name Sahih Nist!", "error")
            return false
        end
        if string.len(Hexs2) < 4 then 
            exports["notf"]:addNotification("Hadaghal Tedad Horof Esm Shoma Bayad 4 Charecter Bashad", "error")
            return false
        end
        if string.len(Hexs2) > 13 then 
            exports["notf"]:addNotification("Hadeaksar Charecter Esm Shoma Bayad 12 Ta Bashad", "error")
            return false
        end
        notfSys:addNotification(thePlayer, "Shoma Ba Movafaghiat Spawn Location Khod Ra Be House Set Kardid" , 'success')
		triggerServerEvent("ChangeShePname", player, player, Hexs2)
    end
end)
function openpanelsabtahval(thePlayer,goldeshtaraf)
	if thePlayer == getLocalPlayer() then
        guiSetText( NamePlayertosabtahval, "Name Karbari Shoma: "..getPlayerName(thePlayer) )
		showCursor(true)
        sabtahvalvisable = true
        guiSetVisible( bgcheange, true )   
	end
end
addEvent("openpanelsabtahval",true)
addEventHandler("openpanelsabtahval",getLocalPlayer(),openpanelsabtahval)
function closepanelsabtahval(thePlayer)
	if thePlayer == getLocalPlayer() then
        guiSetText( NamePlayertosabtahval, nil )
        showCursor(false)
        guiSetText( taghirenamerbe, "" )
        guiSetVisible( bgcheange, false )    
	end
end
addEvent("closepanelsabtahval",true)
addEventHandler("closepanelsabtahval",getLocalPlayer(),closepanelsabtahval)


