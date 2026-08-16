local screenW, screenH = guiGetScreenSize()
local font = guiCreateFont("Data/GOTHIC.ttf", 13)
back = guiCreateWindow((screenW - 378) / 2, (screenH - 377) / 2, 330, 330, "Helper Team", false)

send = guiCreateButton(212, 290, 104, 42, "Ersal", false, back)
guiSetFont(send, font)
guiSetProperty(send, "HoverTextColour", "FF00FF00" )
textesh = guiCreateLabel(10, 30, 100, 100, "Onvan:", false, back)
guiSetFont(textesh, font)


editBoxo = guiCreateMemo(85, 25, 234, 40, "", false, back)
textesh1 = guiCreateLabel(10, 100, 100, 100, "Tozihat:", false, back)
guiSetFont(textesh1, font)

editBox = guiCreateMemo(10, 130, 310, 150, "", false, back)
Close = guiCreateButton(10, 290, 104, 45, "Bastan", false, back)
guiSetProperty(Close, "HoverTextColour", "FFFE0000" )

guiSetFont(Close, font)    

guiSetProperty(back,"Visible","False")



addEvent("OpenHelpPanel",true)
addEventHandler("OpenHelpPanel",getLocalPlayer(),
function (thePlayer)
	guiSetProperty(back,"Visible","True")
	guiSetInputEnabled( true )
	showCursor(true)
end)


addEventHandler("onClientGUIClick",getRootElement(),function()
	if source == Close then
		guiSetProperty(back,"Visible","False")
		showCursor(false)
		guiSetInputEnabled( false )
		 sound = playSound("Data/error.mp3",false)
		setSoundVolume(sound,0.9)
	elseif source == send then
		local message = guiGetText(editBox)
		local onvan = guiGetText(editBoxo)
		if ( (string.len ( guiGetText ( editBox ) ) < 70 ) ) then
			if (  string.len ( guiGetText ( editBoxo ) ) < 20 ) then
				if ( ( string.len ( guiGetText ( editBoxo ) ) > 1 ) or ( string.len ( guiGetText ( editBox ) ) > 1 ) ) then
					local payam = tostring(message)
					local onvann = tostring(onvan)
					triggerServerEvent("sendHelpToHelpers",getLocalPlayer(),getLocalPlayer(),payam,onvann)
					
					exports["notf"]:addNotification( "Darkhast Komak Shoma Baraye Team Helper Ersal Shod." , 'success')
					guiSetInputEnabled( false )
					sound = playSound("Data/movafagh.mp3",false)
					setSoundVolume(sound,0.1)
					guiSetProperty(back,"Visible","False")
					showCursor(false)
									
				else
					exports["notf"]:addNotification( "Ebteda Kadr Haye Bala Ra Por Konid." , 'error')
					sound = playSound("Data/errorp.mp3",false)
					setSoundVolume(sound,0.9)
				end
			else
				exports["notf"]:addNotification( "Onvan Bayad Kam Tar Az 20 Harf Bashad." , 'error')
				sound = playSound("Data/errorp.mp3",false)
				setSoundVolume(sound,0.9)
			end
		else
			exports["notf"]:addNotification( "Tozihat Bayad Kam Tar Az 70 Harf Bashad." , 'error')
			sound = playSound("Data/errorp.mp3",false)
			setSoundVolume(sound,0.9)
		end
	end
end)
