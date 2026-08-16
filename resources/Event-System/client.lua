
		--sound = playSound("sound/errorp.mp3",false)
		--setSoundVolume(sound,0.5)



        --sound = playSound("sound/movafagh.mp3",false)
		--setSoundVolume(sound,0.1)




addEventHandler ("onPlayerTarget", getRootElement(), 
function()
    if isElementFrozen(source) then
		cancelEvent()
    end
end)

--[[ Sound Baraye Start Shodan Event ]]--
addEvent("shoroshod",true)
addEventHandler("shoroshod", getRootElement(), function()
local sound = playSound("Data/eventstarted.mp3",false) 
end)


--[[ Panel Baraye Sakhte Event ]]--
local screenW, screenH = guiGetScreenSize()
local font = guiCreateFont("Data/GOTHIC.ttf", 15)

kadr = guiCreateStaticImage((screenW - 425) / 2, (screenH - 300) / 2, 425, 300, "Data/bg.png", false)
guiSetProperty(kadr, "AlwaysOnTop", "True")
guiSetProperty(kadr, "AlwaysOnTop", "True")
guiSetVisible(kadr, false)

-------
-------

ename = guiCreateEdit(165, 20, 227, 41, "", false, kadr)
guiEditSetMaxLength ( ename, 16 )
eprize = guiCreateEdit(165, 90, 227, 41, "", false, kadr)
guiEditSetMaxLength ( eprize, 6 )
edec = guiCreateEdit(165, 160, 227, 41, "", false, kadr)
guiEditSetMaxLength ( edec, 28 )

-------
-------

closebtn = guiCreateButton(25, 240, 108, 47, "Cancel", false, kadr)
guiSetProperty(closebtn, "HoverTextColour", "FFFE0000")
guiSetFont(closebtn, font)
createbtn = guiCreateButton(295, 240, 108, 47, "Create", false, kadr)
guiSetFont(createbtn, font)
guiSetProperty(createbtn, "HoverTextColour", "FF00FF00")
label1 = guiCreateLabel(20, 27, 150, 50, "Event Name:", false, kadr)
guiLabelSetColor(label1, 255, 255, 255)
guiSetFont(label1, font)
label2 = guiCreateLabel(20, 97, 150, 50, "Event Price:", false, kadr)
guiLabelSetColor(label2, 255, 255, 255)
guiSetFont(label2, font)
label3 = guiCreateLabel(20, 166, 120, 50, "Description:", false, kadr)
guiLabelSetColor(label3, 255, 255, 255)
guiSetFont(label3, font)

addCommandHandler("createevent",
function ()
	guiSetVisible(kadr, true)
	showCursor(true)
	guiSetInputEnabled( true )
end)




-----------------------------------------------------------------------------------------
local font4 = guiCreateFont("Data/GOTHIC.ttf", 10)
local font10 = guiCreateFont("Data/GOTHIC.ttf", 11)
local font5 = guiCreateFont("Data/TREBUCBD.ttf", 12)
local font6 = guiCreateFont("Data/GOTHIC.ttf", 17)
--[[ Panel Baraye Didan  Event Help ]]--

eventhelp = guiCreateButton(167, 245, 95, 36, "Event Help", false, kadr)
guiSetFont(eventhelp, font10)
guiSetProperty(eventhelp, "HoverTextColour", "FFFFFFFF")
kadrehelp = guiCreateStaticImage((screenW - 535) / 2, (screenH - 370) / 2, 535, 370, "Data/kadr.png", false)
guiSetProperty(kadrehelp, "AlwaysOnTop", "True")
guiSetProperty(kadrehelp, "AlwaysOnTop", "True")

guiSetVisible(kadrehelp, false)
cancelbtn = guiCreateButton(230, 331, 76, 24, "Back", false, kadrehelp)
guiSetFont(cancelbtn, font4)
guiSetProperty(cancelbtn, "HoverTextColour", "FFFE0000" )


scrollpanel = guiCreateScrollPane(10, 17, 500, 312, false, kadrehelp)
dastorat = guiCreateLabel(240, 15, 200, 200, "Dastorat", false, scrollpanel)
guiLabelSetColor(dastorat, 255 , 255 , 255)
guiSetFont(dastorat, font6)
cmdha = guiCreateLabel(30, 55, 150, 730, "  /createevent\n\n  /e \n\n  /openevent\n\n  /closeevent\n\n  /esetpos\n\n  /gotoevent\n\n  /stopevent\n\n  /eveh \n\n  /efreezeall\n\n  /eunfreezeall\n\n  /efreeze\n\n  /eunfreeze\n\n  /eg\n\n  /eggall\n\n  /esethpall\n\n  /efreezecars\n\n  /eunfreezecars\n\n  /edv\n\n  /edvall", false, scrollpanel)
guiLabelSetColor(cmdha, 142 , 170 , 138)
guiSetFont(cmdha, font5)
khat = guiCreateLabel(42, 64, 400, 730, "ــــــــــــــــــــــ    ــــــــــــــــ\n\nـــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nــــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nـــــــــــــــــــــــــــ    ــــــــــــــــ\n\nـــــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nـــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nـــــــــــــــــــ    ــــــــــــــــ\n\nــــــــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nـــــــــــــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nـــــــــــــــــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nــــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nــــــــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nــــــــــــــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nــــــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nــــــــــــــــــــــــــــــــــــــ    ـــــــــــــــــــ\n\nــــــــــــــــــــــــــــــــــــــــ    ــــــــــــــــ\n\nـــــــــــــــــــــــــــــــــــــــــــــــــــ    ــــــــــــــــ", false, scrollpanel)
guiSetFont(khat, font5)
guiLabelSetColor(khat,71 , 71 , 71 )
matn = guiCreateLabel(150, 55, 300, 730, "  Sakhtan Event.\n\n  Chat Kardan Dar Event. \n\n  Baz Kardan Join Event.\n\n  Bastan Join Event.\n\n  Set Kardan Spawn Event.\n\n  Join Shodan Be Event.\n\n  Stop Kardan Event.\n\n  Sakhtan Mashin Dar Event. \n\n  Freeze Kardan Hame Player Ha.\n\n  UnFreeze Kardan Hame Player Ha.\n\n  Freeze Kardan Player.\n\n  UnFreeze Kardan Player.\n\n  Gun Dadan Be Player. \n\n  Gun Dadan Be Hame Player Ha.\n\n  Set Kardan Heal Player Haye Event.\n\n  Freeze Kardan Mashin Ha.\n\n     UnFreeze Kardan Mashin Ha.\n\n  Pak Kardan Mashin Hay Event.\n\n  Pak Kardan Tamami Mashin Hay Event.", false, scrollpanel)
guiLabelSetColor(matn, 255 , 255 , 255)
guiSetFont(matn, font5)
cmdha2 = guiCreateLabel(30, 760, 200, 80, "  /etimer", false, scrollpanel)
guiLabelSetColor(cmdha2, 142 , 170 , 138)
guiSetFont(cmdha2, font5)
khat2 = guiCreateLabel(42, 770, 400, 80, "ـــــــــــــــــــــــــــــــــــــــــــــــــــ    ــــــــــــــــ", false, scrollpanel)
guiSetFont(khat2, font5)
guiLabelSetColor(khat2,71 , 71 , 71 )
matn2 = guiCreateLabel(150, 760, 300, 80, "  Eijad Kardan Sanie Shomar Dar Event.", false, scrollpanel)
guiLabelSetColor(matn2, 255 , 255 , 255)
guiSetFont(matn2, font5)
-----------------------------------------------------------------------------------------



addCommandHandler("eventhelp",
function ()
	guiSetVisible(kadrehelp, true)
	showCursor(true)

end)


local font2 = guiCreateFont("Data/GOTHIC.ttf", 12)
local font3 = guiCreateFont("Data/GOTHIC.ttf", 11)
--[[ Panel Baraye Didan Etelaate Event ]]--
kadrinfo = guiCreateStaticImage((screenW - 528) / 2, (screenH - 345) / 2, 528, 345, "Data/kadr.png", false)
guiSetProperty(kadrinfo, "AlwaysOnTop", "True")
guiSetProperty(kadrinfo, "AlwaysOnTop", "True")

guiSetVisible(kadrinfo, false)

-------
-------


eventlogo = guiCreateStaticImage(17, 45, 240, 200, "Data/event.png", false, kadrinfo)
eorgname = guiCreateLabel(207, 15, 150, 150, "  Event Info ", false, kadrinfo)
guiSetFont(eorgname, font)

-------
-------

closeinfobtn = guiCreateButton(29, 270, 109, 49, "Close", false, kadrinfo)
guiSetProperty(closeinfobtn, "HoverTextColour", "FFFE0000")
guiSetFont(closeinfobtn, font)

joineventbtn = guiCreateButton(382, 270, 113, 49, "Join Event", false, kadrinfo)
guiSetFont(joineventbtn, font2)
guiSetProperty(joineventbtn, "HoverTextColour", "FF00FF00")

eorgname = guiCreateLabel(274, 100, 175, 50, "Organizer:", false, kadrinfo)
guiLabelSetColor(eorgname, 255, 255, 255)
guiSetFont(eorgname, font3)
einfoname = guiCreateLabel(274, 148, 175, 50, "Name:", false, kadrinfo)
guiLabelSetColor(einfoname, 255, 255, 255)
guiSetFont(einfoname, font3)
einfoprize = guiCreateLabel(274, 196, 175, 50, "Prize:", false, kadrinfo)
guiLabelSetColor(einfoprize, 255, 255, 255)
guiSetFont(einfoprize, font3)


-------
-------

eorgnames = guiCreateLabel(361, 100, 175, 50, "", false, kadrinfo)
guiLabelSetColor(eorgnames, 64 , 64 , 235)
guiSetFont(eorgnames, font3)
einfonames = guiCreateLabel(331, 148, 175, 50, "", false, kadrinfo)
guiLabelSetColor(einfonames, 64 , 64 , 235)
guiSetFont(einfonames, font3)
einfoprizes = guiCreateLabel(325, 197, 175, 50, "", false, kadrinfo)
guiLabelSetColor(einfoprizes, 64 , 64 , 235)
guiSetFont(einfoprizes, font3)

addEvent("infoPanel",true)
addEventHandler("infoPanel",getLocalPlayer(),function()
	guiSetVisible(kadrinfo, true)
	showCursor(true)
end)





addEvent("etelaateinfoPanel",true)
addEventHandler("etelaateinfoPanel",getLocalPlayer(),function(eventorg,eventname,eventprize,eventdsc)
		EventOrgName = tostring(eventorg)
	guiSetText ( eorgnames, ""..EventOrgName )
		EventInfoName = tostring(eventname)
	guiSetText ( einfonames, ""..EventInfoName )
		EventInfoPrize = tostring(eventprize)
	guiSetText ( einfoprizes, ""..EventInfoPrize )
end)

-- #VeCtoR
addEventHandler("onClientGUIClick",root,
function ()
	if source == closeinfobtn then
		guiSetVisible(kadrinfo, false)
	    showCursor(false)
		guiSetInputEnabled( false )
		sound = playSound("sound/error.mp3",false)
		setSoundVolume(sound,0.9)
	end
	
	if source == cancelbtn then
		guiSetVisible(kadrehelp, false)
		guiSetVisible(kadr, true)
	    showCursor(true)
		guiSetInputEnabled( true )
		sound = playSound("sound/error.mp3",false)
		setSoundVolume(sound,0.9)
	end
	
	if source == eventhelp then
		guiSetVisible(kadrehelp, true)
		guiSetVisible(kadr, false)
	    showCursor(true)
		guiSetInputEnabled( false )
		sound = playSound("sound/click.mp3",false)
		setSoundVolume(sound,0.9)
	end
	
	if source == joineventbtn then
		triggerServerEvent("borotoevent", getLocalPlayer(), getLocalPlayer() )
	end
	
	if source == closebtn then
	    guiSetVisible(kadr, false)
	    showCursor(false)
		guiSetInputEnabled( false )
		sound = playSound("sound/error.mp3",false)
		setSoundVolume(sound,0.9)
	end
	
	if source == createbtn then
		if guiGetText(ename) ~= "" then
			if guiGetText(edec) ~= "" then
				if guiGetText(eprize) ~= "" then
					--if tonumber(guiGetText(eprize)) >= 20000 then
						--if tonumber(guiGetText(eprize)) <= 150000 then
							local namesh = guiGetText(ename)
							local pr = guiGetText(eprize)
							local desc = guiGetText(edec)
							local name = tostring(namesh)
							local price = tostring(pr)	
							local dsc = tostring(desc)
							triggerServerEvent("eventBesazBaInEtelaat",getLocalPlayer(),name,price,dsc)
							sound = playSound("sound/movafagh.mp3",false)
		                    setSoundVolume(sound,0.1)
							guiSetVisible(kadr, false)
							showCursor(false)
							guiSetInputEnabled( false )
							
						--else
						--exports["notf"]:addNotification("Price Bayad Kamtar Az $150,000 Bashad!","error")
						--sound = playSound("sound/errorp.mp3",false)
						--setSoundVolume(sound,0.4)
						--end
					--else
					--exports["notf"]:addNotification("Price Bayad Bishtar Az $20,000 Bashad!","error")
					--sound = playSound("sound/errorp.mp3",false)
					--setSoundVolume(sound,0.4)
					--end
				else
				exports["notf"]:addNotification("Kadre Prize Khali Mibashad!","error")
				sound = playSound("sound/errorp.mp3",false)
				setSoundVolume(sound,0.4)
				end
			else
			exports["notf"]:addNotification("Kadre Tozihat Khali Mibashad!","error")
			sound = playSound("sound/errorp.mp3",false)
			setSoundVolume(sound,0.4)
			end
		else
		exports["notf"]:addNotification("Kadre Event Name Khali Mibashad!","error")
		sound = playSound("sound/errorp.mp3",false)
		setSoundVolume(sound,0.4)
		end
	end
end)