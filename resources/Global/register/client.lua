local screenW, screenH = guiGetScreenSize()
local whatsGender = nil

GUIEditor = {
    staticimage = {},
    edit = {},
    label = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
function()
	----------- Baraye Register Panel -------------
	local font0_font = guiCreateFont("register/Data/font.ttf", 14)
	local font2_font = guiCreateFont("register/Data/font.ttf", 21)
	local font1 = guiCreateFont("register/Data/font.ttf", 25)
	local font1_font = guiCreateFont("register/Data/font2.ttf", 23)
----------

	
        regKadr = guiCreateStaticImage((screenW - 550) / 2, (screenH - 350) / 2, 550, 350, "register/Data/BG_Box.png", false)
		guiSetProperty( regKadr, "Visible", "False")
		
        
-------- img Meshki	 --------------------
		kadr1 = guiCreateStaticImage(30, 82, 130, 35, "register/Data/bgpage.png", false, regKadr)
		kadr2 = guiCreateStaticImage(30, 162, 130, 35, "register/Data/bgpage.png", false, regKadr)
		kadr3 = guiCreateStaticImage(30, 240, 130, 35, "register/Data/bgpage.png", false, regKadr)
-----------------------------------------

        regTopLabel = guiCreateLabel(150, 13, 300, 29, "Panel Sabt Moshakhasat", false, regKadr)
		guiSetFont(regTopLabel, font2_font)
        guiLabelSetColor(regTopLabel, 0 , 0 , 0 )
		khat = guiCreateLabel(5, 35, 540, 29, "ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, regKadr)
		guiLabelSetColor(khat, 70 , 70 , 70 )
 ------------------------------------------     
        regName = guiCreateLabel(40, 83, 160, 38, "Nam:", false, regKadr)
        guiSetFont(regName, font1)
		regNameEdit = guiCreateEdit(194, 83, 142, 34, "", false, regKadr)
		guiEditSetMaxLength ( regNameEdit, 16 )
		----
        regAge = guiCreateLabel(40, 162, 140, 30, "Sen:", false, regKadr)
        guiSetFont(regAge, font1)
		regAgeEdit = guiCreateEdit(194, 163, 104, 34, "", false, regKadr)
		guiEditSetMaxLength ( regAgeEdit, 3 )
		----
        regGender = guiCreateLabel(40, 242, 150, 30, "Jensiat:", false, regKadr)
        guiSetFont(regGender, font1)
		----------------------------------
        regMaleButton = guiCreateStaticImage(190, 219, 65, 65, "register/Data/male.png", false, regKadr)
        regFemaleButton = guiCreateStaticImage(315, 221, 65, 65, "register/Data/female.png", false, regKadr)
		
		male2 = guiCreateStaticImage(190, 219, 65, 65, "register/Data/male2.png", false, regKadr)
		fmale2 = guiCreateStaticImage(315, 221, 65, 65, "register/Data/female2.png", false, regKadr)
		guiSetProperty( male2, "Visible", "False")
		guiSetProperty( fmale2, "Visible", "False")
		
		
        regAcceptButton = guiCreateStaticImage(260, 290, 45, 45, "register/Data/accept.png", false, regKadr)
		
-------------------------------------------------------------------------------------------------------------------		
		
		
		
	----------- Baraye Referral Panel ----------
	
	local fontnorf = guiCreateFont("register/Data/font.ttf", 13)
----------
        refKadr = guiCreateStaticImage((screenW - 461) / 2, (screenH - 238) / 2, 461, 238, "register/Data/BG_Box.png", false)
		guiSetProperty( refKadr, "Visible", "False")
 ------------------------------------- --      
        refAcceptButton = guiCreateLabel(100, 18, 500, 24, "Code Moaref Khod Ra Vared Konid", false, refKadr)
		guiSetFont(refAcceptButton, font0_font)
        guiLabelSetColor(refAcceptButton, 0 , 0 , 0 )
		khat2 = guiCreateLabel(5, 35, 540, 29, "ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, refKadr)
		guiLabelSetColor(khat2, 70 , 70 , 70 )
-------- img Meshki	 --------------------
        kadr4 = guiCreateStaticImage(23, 92, 124, 36, "register/Data/bgpage.png", false, refKadr)
-----------------------------------------		
        
        refLabel = guiCreateLabel(25, 93, 122, 32, "Referral:", false, refKadr)
        guiSetFont(refLabel, font1)
		
		refEdit = guiCreateEdit(179, 93, 98, 36, "", false, refKadr)
		guiEditSetMaxLength ( refEdit, 10 )
-----------------------------------------	
        refAcceptButton = guiCreateStaticImage(208, 185, 45, 45, "register/Data/accept.png", false, refKadr)   
		
		ekhtiari = guiCreateLabel(290, 99, 122, 32, "(Ekhtiari)", false, refKadr)
		guiSetFont(ekhtiari, font0_font)
        guiLabelSetColor(ekhtiari, 0 , 0 , 0 )
end)





addEventHandler("onClientGUIClick", getRootElement(),
function ()
    if source == regMaleButton then
		guiSetProperty( male2, "Visible", "True")
		guiSetProperty( fmale2, "Visible", "False")
        whatsGender = "Male"
        guiSetText ( regShowGender, tostring(whatsGender))
        --exports["notf"]:addNotification("Jensiat Ba Mavaghiat Be Male Set Shod!", 'success')
		triggerServerEvent("CskinRegisterMaleSetShe", getLocalPlayer(), getLocalPlayer() ) --#zezaw
		sound = playSound("register/sound/click.mp3",false)
		setSoundVolume(sound,1)
		
    elseif source == regFemaleButton then
		guiSetProperty( fmale2, "Visible", "True")
		guiSetProperty( male2, "Visible", "False")
        whatsGender = "Female"
        guiSetText ( regShowGender, tostring(whatsGender))
		
        --exports["notf"]:addNotification("Jensiat Ba Mavaghiat Be Female Set Shod!", 'success')
		triggerServerEvent("CskinRegisterFemaleSetShe", getLocalPlayer(), getLocalPlayer() ) --#zezaw
		sound = playSound("register/sound/click.mp3",false)
		setSoundVolume(sound,1)
    elseif source == regAcceptButton then
        local hisNameEdit = guiGetText ( regNameEdit )
        local hisAgeEdit = guiGetText ( regAgeEdit )
        if whatsGender == "Male" or whatsGender == "Female" then
            if hisNameEdit == "" then
            exports["notf"]:addNotification("Lotfan Fielde Name Ra Por Konid!", 'error')
		    sound = playSound("register/sound/error.mp3",false)
		    setSoundVolume(sound,0.9)
            else
                if hisAgeEdit == "" then
					exports["notf"]:addNotification("Lotfan Fielde Sen Ra Por Konid!", 'error')
					sound = playSound("register/sound/error.mp3",false)
					setSoundVolume(sound,0.9)
                else
					if ( string.find ( hisAgeEdit, '0' ) ) or ( string.find ( hisAgeEdit, '1' ) ) or ( string.find ( hisAgeEdit, '2' ) ) or ( string.find ( hisAgeEdit, '3' ) ) or ( string.find ( hisAgeEdit, '4' ) ) or ( string.find ( hisAgeEdit, '5' ) ) or ( string.find ( hisAgeEdit, '6' ) ) or ( string.find ( hisAgeEdit, '7' ) ) or ( string.find ( hisAgeEdit, '8' ) ) or ( string.find ( hisAgeEdit, '9' ) ) then
						triggerServerEvent("regUpDB", getLocalPlayer(), getLocalPlayer() , whatsGender, hisNameEdit, hisAgeEdit)
						guiSetProperty(regKadr, "Visible", "False") 
						guiSetProperty(refKadr, "Visible", "True")
					else
						exports["notf"]:addNotification("Sen Bayad Shamel Adad Bashad!", "error")
						sound = playSound("register/sound/error.mp3",false)
						setSoundVolume(sound,0.9)
					end
                end
            end
        else
            exports["notf"]:addNotification("Lotfan Jensiat Ra Moshakhas Konid!", 'error')
			sound = playSound("register/sound/error.mp3",false)
		    setSoundVolume(sound,0.9)
        end
    elseif source == refAcceptButton then
        local hisRefEdit = guiGetText ( refEdit )
		
		-- Referral Horof Nabashe Fasele Nadashte Bashe #zezaw
		if ( string.find ( hisRefEdit, '%s' ) ) then
			exports["notf"]:addNotification("Estefade Az Fasele (Space) Baraye Referral Sahih Nist!", "error")
			sound = playSound("register/sound/error.mp3",false)
			setSoundVolume(sound,0.9)
        else
			if ( string.find ( hisRefEdit, '0' ) ) or ( string.find ( hisRefEdit, '1' ) ) or ( string.find ( hisRefEdit, '2' ) ) or ( string.find ( hisRefEdit, '3' ) ) or ( string.find ( hisRefEdit, '4' ) ) or ( string.find ( hisRefEdit, '5' ) ) or ( string.find ( hisRefEdit, '6' ) ) or ( string.find ( hisRefEdit, '7' ) ) or ( string.find ( hisRefEdit, '8' ) ) or ( string.find ( hisRefEdit, '9' ) ) or hisRefEdit == "" then
				triggerServerEvent("refUpDB", getLocalPlayer(), getLocalPlayer() , hisRefEdit)
				showCursor ( false )
				guiSetInputEnabled( false )
			else
				exports["notf"]:addNotification("Referral Bayad Shamel Adad Bashad!", "error")
				sound = playSound("register/sound/error.mp3",false)
				setSoundVolume(sound,0.9)
			end
        end
    end
end)


function closeRegister(root)
    if root == getLocalPlayer() then
        local windowState = guiGetProperty(refKadr, "Visible")
        if windowState == "True" then
            guiSetProperty(refKadr, "Visible", "False")
        end
    end
end
addEvent("finishRegister",true)
addEventHandler("finishRegister", getRootElement(), closeRegister)

function openRegister(root)
    if root == getLocalPlayer() then
        local windowState = guiGetProperty(regKadr, "Visible")
        if windowState == "False" then
            guiSetProperty(regKadr, "Visible", "True")
            showCursor ( true )
			guiSetInputEnabled( true )
        end
    end
end
addEvent("startRegister",true)
addEventHandler("startRegister", getRootElement(), openRegister)

function openReferral(root)
    if root == getLocalPlayer() then
        local windowState = guiGetProperty(refKadr, "Visible")
        if windowState == "False" then
            guiSetProperty(refKadr, "Visible", "True")
            showCursor ( true )
			guiSetInputEnabled( true )
        end
    end
end
addEvent("startReferral",true)
addEventHandler("startReferral", getRootElement(), openReferral)