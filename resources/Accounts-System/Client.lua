local screenW, screenH = guiGetScreenSize()
local sX, sY = guiGetScreenSize()
local px, py = (sX/1600), (sY/900)
local screen = dxCreateScreenSource ( px, py ) 
local x,y = (sX/px), (sY/py)
local notfSys = exports["notf"]
local font4 = dxCreateFont("Data/Fonts/font.ttf", 9)
local font5 = dxCreateFont("Data/Fonts/font.ttf", 11)
local font6 = dxCreateFont("Data/Fonts/font.ttf", 13)
local font7 = dxCreateFont("Data/Fonts/font.ttf", 15)
local font8 = dxCreateFont("Data/Fonts/font.ttf", 17)
local font13 = dxCreateFont("font.TTF", 27)
Music2 = playSound("Data/Sounds/Welcome.mp3",false)
setSoundVolume(Music,0.5)
function findFontToHeight(font, sizeY)
	local fontScale = 0
	local fontSize
	repeat
		fontScale = fontScale+1
		fontSize = dxGetFontHeight(fontScale, "default-bold")
	until fontSize >= sizeY
	return fontScale
end
loadscreen = guiCreateStaticImage(0, 0, screenW, screenH, "Data/Images/Loading.jpg", false)
fontScale = findFontToHeight(font, sY*0.01)
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
--Login Page




showChat(false)
showCursor(true)


TextBox3 = "Name Karbari (Name Shoma Dar Bazi)"
TextBox4 = "Password (Ramz Obore Account Shom)"
TextBox5 = "RePassword(Tekrar Ramz Obore Account Shom)"
TextBox6 = "Email (Email Bazyabi Account Shom)"
s = 0.2
xanim = 150

function getallplayeronline()
	onlineplayer = 0
	for k, players in ipairs(getElementsByType("player")) do
		onlineplayer = onlineplayer + 1
	end
	return onlineplayer
end
 --math.random(1,2)
setTimer(function()
	
	if s == 0.2 then
		s = -0.2
	elseif s == -0.2 then
		s = 0.2
	end
end,20000,0)
soundbackaccountsys = true
tabaccountssystem = 1
function antispamaccs()
	if not darhaletime then
		darhaletime = true
		setTimer(function()
			darhaletime = false
			spamloagin = false
		end,220,1)
	end
end
function SetKonDimVaInt(player)
	if player == getLocalPlayer() then
		setElementInterior(player,10)
		setElementDimension(player,0)
		setElementPosition(player,0,0,70)
		setElementFrozen(player , true )
	end
end

function DrawDXAccountSystem()             
	HACC, MACC = getTime()
	xanim = xanim + s 
	if MACC < 10 then
		MACC = "0"..tostring(MACC)
	end
	if HACC < 10 then
		HACC = "0"..tostring(HACC)
	end
	
	if getKeyState("backspace")  then
		if not press then
			press = true
			if selected then
				if selected == 2 then
					if TextBox1 ~= "" then
						if not spamloagin then
							spamloagin = true
							antispamaccs()
							TextBox1 = deleteLastCharacter(TextBox1)
						end
					end
				elseif selected == 1 then
					if not spamloagin then
						spamloagin = true
						antispamaccs()
						TextBox2 = deleteLastCharacter(TextBox2)
					end
				elseif selected == 3 then
					if not spamloagin then
						spamloagin = true
						antispamaccs()
						TextBox3 = deleteLastCharacter(TextBox3)
					end
				elseif selected == 4 then
					if not spamloagin then
						spamloagin = true
						antispamaccs()
						TextBox4 = deleteLastCharacter(TextBox4)
					end
				elseif selected == 5 then
					if not spamloagin then
						spamloagin = true
						antispamaccs()
						TextBox5 = deleteLastCharacter(TextBox5)
					end
				elseif selected == 6 then
					if not spamloagin then
						spamloagin = true
						antispamaccs()
						TextBox6 = deleteLastCharacter(TextBox6)
					end
				end
			end
		end
	else
		press = false
	end

	if selected > 0 and not spamloagin then
		if getKeyState("mouse1")  then
			if not press then
				press = true
				selected = 0
			end
		else
			press = false
		end
	end
	
	dxDrawImage(px*-math.floor(xanim) , py*-170, px*2900, py*1100, "Data/Images/BG.jpg", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(px*295, py*100, px*1050, py*725, "Data/Images/Login.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(px*385, py*190, px*94, py*27, "Data/Images/OnlinePlayer.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawText(getallplayeronline(), px*419, py*383, px*45, py*24, tocolor(0, 0, 0, 255), fontScale, font6, "left", "center",false,false,false, false) 
	dxDrawText(HACC..":"..MACC, px*65,  py*165, px*100, py*25, tocolor(0, 0, 0, 255), fontScale, font13, "left", "center",false,false,false, false) 
	dxDrawImage(px*250, py*250, px*534, py*388, "Data/Images/Avatar_1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	if isMouseInPosition(px*1255, py*300, px*229, py*60) then
		dxDrawImage(px*1255,  py*300, px*229, py*60, "Data/Images/H_Login.png", 0, 0, 0, tocolor(150,150,150, 255), false)
		if getKeyState("mouse1")  then
			if not press then
				press = true
				if not spamloagin then
					spamloagin = true
					antispamaccs()
					tabaccountssystem = 1
				end
			end
		else
			press = false
		end
	else
		dxDrawImage(px*1255,  py*300, px*229, py*60, "Data/Images/B_Login.png", 0, 0, 0, tocolor(255,255,255, 255), false)
	end
	
	if xml then
		usernameChild = xmlFindChild(xml,"username",0)
		passwordChild = xmlFindChild(xml,"password",0)
		checkboxChild = xmlFindChild(xml,"state",0)
		UserLoad = xmlNodeGetValue(usernameChild)
		PassWordLoad = xmlNodeGetValue(passwordChild)
	end
	if UserLoad ~= "" then
		dxDrawText("Welcome Back", px*530,  py*1290, px*100, py*50, tocolor(255,255,255,255), fontScale, font4, "left", "center",false,false,false, false) 
		dxDrawText(UserLoad, px*530,  py*1323, px*100, py*50, tocolor(255,255,255,255), fontScale, font8, "left", "center",false,false,false, false)
		accsavenashode = true
	else
		accsavenashode = false
		dxDrawText("Welcome To TheNight MTA", px*420,  py*1290, px*100, py*50, tocolor(255,255,255,255), fontScale, font8, "left", "center",false,false,false, false) 
		dxDrawText("Please Create Account", px*450,  py*1335, px*100, py*50, tocolor(255,255,255,255), fontScale, font8, "left", "center",false,false,false, false)
	end
	if isMouseInPosition(px*362, py*650, px*402, py*69) and usernameChild then
		dxDrawImage(px*700, py*670, px*33, py*27, "Data/Images/Fast_Login.png", 0, 0, 0, tocolor(150,150,150, 255), false)
		dxDrawImage(px*362, py*650, px*402, py*69, "Data/Images/Box_Welcome.png", 0, 0, 0, tocolor(150,150,150, 255), false)
		if getKeyState("mouse1")  then
			if not press then
				press = true
				if xml then
					if not spamloagin then
						spamloagin = true
						antispamaccs()
						if accsavenashode then
							triggerServerEvent ( "attemptLogin", getLocalPlayer(), getLocalPlayer(), UserLoad, PassWordLoad )
						else
							exports["notf"]:addNotification("Shoma Account Nadarid Lotfan Yek Account Besazid", "info")
						end

					end
					
				end
			end
		else
			press = false
		end
	else
		dxDrawImage(px*700, py*670, px*33, py*27, "Data/Images/Fast_Login.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		dxDrawImage(px*362, py*650, px*402, py*69, "Data/Images/Box_Welcome.png", 0, 0, 0, tocolor(255,255,255, 255), false)
	end

	if isMouseInPosition(px*1255, py*370, px*229, py*60) then
		dxDrawImage(px*1255,  py*370, px*229, py*60, "Data/Images/H_Register.png", 0, 0, 0, tocolor(150,150,150, 255), false)
		if getKeyState("mouse1")  then
			if not press then
				press = true
				if not spamloagin then
					spamloagin = true
					antispamaccs()
					tabaccountssystem = 2

				end

			end
		else
			press = false
		end
	else
		dxDrawImage(px*1255,  py*370, px*229, py*60, "Data/Images/B_Register.png", 0, 0, 0, tocolor(255,255,255, 255), false)
	end

	if isMouseInPosition(px*1255, py*440, px*229, py*60) then
		dxDrawImage(px*1255,  py*440, px*229, py*60, "Data/Images/H_ChangeSerial.png", 0, 0, 0, tocolor(150,150,150, 255), false)
		if getKeyState("mouse1")  then
			if not press then
				press = true
				if not spamloagin then
					spamloagin = true
					antispamaccs()
					exports["notf"]:addNotification("Comming Soon...", "info")
				end
			end
		else
			press = false
		end
	else
		dxDrawImage(px*1255,  py*440, px*229, py*60, "Data/Images/B_ChangeSerial.png", 0, 0, 0, tocolor(255,255,255, 255), false)
	end
	if isMouseInPosition(px*1255, py*510, px*229, py*60) then
		dxDrawImage(px*1255,  py*510, px*229, py*60, "Data/Images/H_Recovery.png", 0, 0, 0, tocolor(150,150,150, 255), false)
		if getKeyState("mouse1")  then
			if not press then
				press = true
				if not spamloagin then
					spamloagin = true
					antispamaccs()
					--tabaccountssystem = 4
					exports["notf"]:addNotification("Comming Soon...", "info")
				end

			end
		else
			press = false
		end
	else
		dxDrawImage(px*1255,  py*510, px*229, py*60, "Data/Images/B_Recovery.png", 0, 0, 0, tocolor(255,255,255, 255), false)
	end
	if soundbackaccountsys == true then
		if isMouseInPosition(px*155, py*80, px*32, py*25) then
			dxDrawImage(px*155,  py*80, px*32, py*25, "Data/Images/SoundOn.png", 0, 0, 0, tocolor(150,150,150, 255), false)

				if getKeyState("mouse1")  then
					if not press then
						press = true
						if not spamloagin then
							spamloagin = true
							antispamaccs()
							soundbackaccountsys = false
							setSoundPaused( Music, true )
							
						end
					end
				else
					press = false
				end
		else
			dxDrawImage(px*155,  py*80, px*32, py*25, "Data/Images/SoundOn.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		end
	elseif soundbackaccountsys == false then
		if isMouseInPosition(px*155, py*80, px*32, py*25) then
			dxDrawImage(px*155,  py*80, px*32, py*25, "Data/Images/SoundOff.png", 0, 0, 0, tocolor(150,150,150, 255), false)
			if getKeyState("mouse1")  then
				if not press then
					press = true
					if not spamloagin then
						spamloagin = true
						antispamaccs()
						soundbackaccountsys = true
						setSoundPaused( Music, false )
						
					end

					
				end
			else
				press = false
			end
		else
			dxDrawImage(px*155,  py*80, px*32, py*25, "Data/Images/SoundOff.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		end
	end
	

	if tabaccountssystem == 1 then
		dxDrawImage(px*840,  py*170, px*392, py*115, "Data/Images/textlogin.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		
		if selected == 2 then
			dxDrawImage(px*850,  py*350, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,51,255, 200), false)
			dxDrawImage(px*1150,  py*360, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		else
			if isMouseInPosition(px*850, py*350, px*350, py*51) then
				dxDrawImage(px*850,  py*350, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(150,150,150, 200), false)
				dxDrawImage(px*1150,  py*360, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(150,150,150, 255), false)
				if getKeyState("mouse1")  then

					if not press then
						press = true
						if not spamloagin then
							if TextBox1 == "Lotfan Yek User Name Vared Konid" then
								TextBox1 = ""
							end
							spamloagin = true
							antispamaccs()
							selected = 2
						end
						
						
					end
				else
					press = false
				end
			else
				dxDrawImage(px*850,  py*350, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,255,255, 200), false)
				dxDrawImage(px*1150,  py*360, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(255,255,255, 255), false)
			end
		end

		
		if TextBox1 == "Lotfan Yek User Name Vared Konid" then
			dxDrawText(TextBox1, px*925,  py*700, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false) 
		else
			dxDrawText(TextBox1, px*1005-string.len(TextBox1),  py*700, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false) 
		end
		if selected == 1 then
			dxDrawImage(px*850,  py*450, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,51,255, 200), false)
			dxDrawImage(px*1150,  py*460, px*22, py*29, "Data/Images/Password.png", 0, 0, 0, tocolor(255,255,255, 200), false)
		else
			if isMouseInPosition(px*850, py*450, px*350, py*51) then
				dxDrawImage(px*850,  py*450, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(150,150,150, 200), false)
				dxDrawImage(px*1150,  py*460, px*22, py*29, "Data/Images/Password.png", 0, 0, 0, tocolor(150,150,150, 200), false)
				if getKeyState("mouse1")  then
					if not press then
						press = true
						if not spamloagin then
							spamloagin = true
							antispamaccs()
							if TextBox2 == "Lotfan Yek Password Vared Konid" then
								TextBox2 = ""
							end
							selected = 1
						end

					end
				else
					press = false
				end
			else
				dxDrawImage(px*850,  py*450, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,255,255, 255), false)
				dxDrawImage(px*1150,  py*460, px*22, py*29, "Data/Images/Password.png", 0, 0, 0, tocolor(255,255,255, 255), false)
			end
		end

		if TextBox2 == "Lotfan Yek Password Vared Konid" then
			dxDrawText(TextBox2, px*920,  py*905, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false)
		else
			dxDrawText(TextBox2, px*990-string.len(TextBox2),  py*905, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false) 
		end
		
		if isMouseInPosition(px*830, py*550, px*392, py*54) then
			dxDrawImage(px*830, py*550, px*392, py*54, "Data/Images/l.png", 0, 0, 0, tocolor(150,150,150, 255), false)
			if getKeyState("mouse1")  then
				if not press then
					press = true
					if not spamloagin then
						spamloagin = true
						antispamaccs()
						triggerServerEvent ( "attemptLogin", getLocalPlayer(), getLocalPlayer(), TextBox1, TextBox2 )

					end
				end
			else
				press = false
			end
		else
			dxDrawImage(px*830,  py*550, px*392, py*54, "Data/Images/l.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		end
		
	elseif tabaccountssystem == 2 then ----------Register Panel
		
		dxDrawImage(px*840,  py*170, px*392, py*115, "Data/Images/textregister.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		if selected == 3 then
			dxDrawImage(px*850,  py*300, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,51,255, 200), false)
			dxDrawImage(px*1150,  py*310, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		else
			if isMouseInPosition(px*850, py*300, px*350, py*51) then
				dxDrawImage(px*850,  py*300, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(150,150,150, 200), false)
				dxDrawImage(px*1150,  py*310, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(150,150,150, 255), false)
				if getKeyState("mouse1")  then

					if not press then
						press = true
						if not spamloagin then
							spamloagin = true
							antispamaccs()
							selected = 3
							if TextBox3 == "Name Karbari (Name Shoma Dar Bazi)" then
								TextBox3 = ""
							end
						end
						
						
					end
				else
					press = false
				end
			else
				dxDrawImage(px*850,  py*300, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,255,255, 200), false)
				dxDrawImage(px*1150,  py*310, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(255,255,255, 255), false)
			end
		end

		if selected == 4 then
			dxDrawImage(px*850,  py*380, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,51,255, 200), false)
			dxDrawImage(px*1150,  py*390, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		else
			if isMouseInPosition(px*850, py*390, px*350, py*51) then
				dxDrawImage(px*850,  py*380, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(150,150,150, 200), false)
				dxDrawImage(px*1150,  py*390, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(150,150,150, 255), false)
				if getKeyState("mouse1")  then

					if not press then
						press = true
						if not spamloagin then
							spamloagin = true
							antispamaccs()
							selected = 4
							
							if TextBox4 == "Password (Ramz Obore Account Shom)" then
								TextBox4 = ""
							end
						end
						
						
					end
				else
					press = false
				end
			else
				dxDrawImage(px*850,  py*380, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,255,255, 200), false)
				dxDrawImage(px*1150,  py*390, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(255,255,255, 255), false)
			end
		end
		if selected == 5 then
			dxDrawImage(px*850,  py*460, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,51,255, 200), false)
			dxDrawImage(px*1150,  py*470, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		else
			if isMouseInPosition(px*850, py*460, px*350, py*51) then
				dxDrawImage(px*850,  py*460, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(150,150,150, 200), false)
				dxDrawImage(px*1150,  py*470, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(150,150,150, 255), false)
				if getKeyState("mouse1")  then

					if not press then
						press = true
						if not spamloagin then
							spamloagin = true
							antispamaccs()
							selected = 5
							if TextBox5 == "RePassword(Tekrar Ramz Obore Account Shom)" then
								TextBox5 = ""
							end
						end
						
						
					end
				else
					press = false
				end
			else
				dxDrawImage(px*850,  py*460, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,255,255, 200), false)
				dxDrawImage(px*1150,  py*470, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(255,255,255, 255), false)
			end
		end
		if selected == 6 then
			dxDrawImage(px*850,  py*540, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,51,255, 200), false)
			dxDrawImage(px*1150,  py*550, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		else
			if isMouseInPosition(px*850, py*540, px*350, py*51) then
				dxDrawImage(px*850,  py*540, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(150,150,150, 200), false)
				dxDrawImage(px*1150,  py*550, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(150,150,150, 255), false)
				if getKeyState("mouse1")  then

					if not press then
						press = true
						if not spamloagin then
							spamloagin = true
							antispamaccs()
							selected = 6
							if TextBox6 == "Email (Email Bazyabi Account Shom)" then
								TextBox6 = ""
							end
						end
						
						
					end
				else
					press = false
				end
			else
				dxDrawImage(px*850,  py*540, px*350, py*51, "Data/Images/buttn.png", 0, 0, 0, tocolor(255,255,255, 200), false)
				dxDrawImage(px*1150,  py*550, px*22, py*29, "Data/Images/Name.png", 0, 0, 0, tocolor(255,255,255, 255), false)
			end
		end
		if isMouseInPosition(px*830, py*650, px*392, py*54) then
			dxDrawImage(px*830, py*650, px*392, py*54, "Data/Images/R.png", 0, 0, 0, tocolor(150,150,150, 255), false)
			if getKeyState("mouse1")  then
				if not press then
					press = true
					if not spamloagin then
						spamloagin = true
						antispamaccs()
						if TextBox3 ~= "Name Karbari (Name Shoma Dar Bazi)" then
							if TextBox4 ~= "Password (Ramz Obore Account Shom)" then
								if TextBox5 ~= "RePassword(Tekrar Ramz Obore Account Shom)" then
									if TextBox6 ~= "Email (Email Bazyabi Account Shom)" then
										if string.len(TextBox3) > 3 then
											if string.len(TextBox4) > 3 then
												if TextBox4 == TextBox5 then
													if string.find( TextBox6, "@gmail.com" ) or string.find( TextBox6, "@yahoo.com" ) then

														triggerServerEvent ( "attemptRegister", getLocalPlayer(), getLocalPlayer(), TextBox3, TextBox4, TextBox6 )

													else
														notfSys:addNotification("Lotfan Yek Email Motabar Vared Konid!","error")
													end
												else
													notfSys:addNotification("Ramz Obor Ba Tekrar On Yeksan Nist!","error")
												end
											else
												notfSys:addNotification("Ramz Obor Shoma Motmaen Nist Lotfan Hadaghal 4 Harf Dar On Estefade Konid!","error")
											end
										else
											notfSys:addNotification("Name Karbari Bayad Hadaghal 4 Harf V Hadaksat 15 Harf Bashad!","error")
										end
									else
										notfSys:addNotification("Yek Email Baraye Account Khod Vared Konid!","error")
									end
								else
									notfSys:addNotification("Tekrar Ramz Obor Nemitavanad Khali Bashad!","error")
								end
							else
								notfSys:addNotification("Lotfan Yek Password Baraye Account Khod Vared Konid!","error")
							end
						else
							notfSys:addNotification("Name Karbari Vared Nakardid!","error")
						end
					end
				end
			else
				press = false
			end
		else
			dxDrawImage(px*830,  py*650, px*392, py*54, "Data/Images/R.png", 0, 0, 0, tocolor(255,255,255, 255), false)
		end
		if TextBox3 == "Name Karbari (Name Shoma Dar Bazi)" then
			dxDrawText(TextBox3, px*910,  py*600, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false)
		else
			dxDrawText(TextBox3, px*1000-string.len(TextBox3),  py*600, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false)
		end
		if TextBox4 == "Password (Ramz Obore Account Shom)" then
			dxDrawText(TextBox4, px*910,  py*760, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false)
		else
			dxDrawText(TextBox4, px*1000-string.len(TextBox4),  py*760, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false)
		end
		if TextBox5 == "RePassword(Tekrar Ramz Obore Account Shom)" then
			dxDrawText(TextBox5, px*870,  py*920, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false)
		else
			dxDrawText(TextBox5, px*1000-string.len(TextBox5),  py*920, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false)
		end
		if TextBox6 == "Email (Email Bazyabi Account Shom)" then
			dxDrawText(TextBox6, px*910,  py*1080, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false)
		else
			dxDrawText(TextBox6, px*990-string.len(TextBox6),  py*1080, px*100, py*50, tocolor(255,255,255,255), fontScale, font5, "left", "center",false,false,true, false)
		end
	end
end

setTimer(function()
	local dxvisabledACC = true 
	selected = 0
	Music = playSound("Data/Sounds/Music.mp3",true)
	setSoundVolume(Music,0.5)
	toggleAllControls(false)
	removeEventHandler("onClientRender",root,DrawDXAccountSystem) -- FIX: avoid stacking duplicate render handlers
	addEventHandler("onClientRender",root,DrawDXAccountSystem)
	--guiSetProperty(LoginPageBg,"Visible","True")
	guiSetProperty( loadscreen, "Visible", "False" )
	SetKonDimVaInt(getLocalPlayer())
end,2000,1)

function LoginToRegisterStep2()
	local Alpha = guiGetAlpha( RegisterPageBg )
	local NextAlpha = Alpha + 0.05
	guiSetAlpha( RegisterPageBg , NextAlpha )
	if tonumber( NextAlpha ) > 1 then
		guiSetAlpha( RegisterPageBg, 1 )
		removeEventHandler( "onClientRender", root, LoginToRegisterStep2 )
	end
end
function CameraMatrixRender()
	setCameraMatrix(277.4873046875 ,-2134.9443359375 ,26.061069488525, 521.9697265625 ,-1812.5517578125 ,6.578125)
	if guiGetProperty(LoginPageBg, "Visible") == "True" then
		guiBringToFront ( LoginPageBg )
	elseif guiGetProperty(RegisterPageBg, "Visible") == "True" then
		guiBringToFront ( RegisterPageBg )
	end
end
removeEventHandler("onClientRender",root,CameraMatrixRender) -- FIX: avoid stacking duplicate render handlers
addEventHandler ( "onClientRender", root, CameraMatrixRender )



function LoginToRegisterStep1()
	local Alpha = guiGetAlpha( LoginPageBg )
	local NextAlpha = Alpha - 0.05
	guiSetAlpha( LoginPageBg , NextAlpha )

	if tonumber( NextAlpha ) < 0 then
		guiSetAlpha( LoginPageBg, 1 )
		guiSetProperty( LoginPageBg, "Visible", "False" )
		guiSetProperty( RegisterPageBg, "Visible", "True" )
		guiSetAlpha( RegisterPageBg, 0 )
		removeEventHandler("onClientRender",root,LoginToRegisterStep2) -- FIX: avoid stacking duplicate render handlers
		addEventHandler ( "onClientRender", root, LoginToRegisterStep2 )
		removeEventHandler( "onClientRender", root, LoginToRegisterStep1 )
	end
end

function RegisterToLoginStep2()
	local Alpha = guiGetAlpha( LoginPageBg )
	local NextAlpha = Alpha + 0.05
	guiSetAlpha( LoginPageBg , NextAlpha )
	if tonumber( NextAlpha ) > 1 then
		guiSetAlpha( LoginPageBg, 1 )
		removeEventHandler( "onClientRender", root, LoginToRegisterStep2 )
	end
end

function RegisterToLoginStep1()
	local Alpha = guiGetAlpha( RegisterPageBg )
	local NextAlpha = Alpha - 0.05
	guiSetAlpha( RegisterPageBg , NextAlpha )
	if tonumber( NextAlpha ) < 0 then
		guiSetAlpha( RegisterPageBg, 1 )
		guiSetProperty( RegisterPageBg, "Visible", "False" )
		guiSetProperty( LoginPageBg, "Visible", "True" )
		guiSetAlpha( LoginPageBg, 0 )
		removeEventHandler("onClientRender",root,RegisterToLoginStep2) -- FIX: avoid stacking duplicate render handlers
		addEventHandler ( "onClientRender", root, RegisterToLoginStep2 )
		removeEventHandler( "onClientRender", root, RegisterToLoginStep1 )
	end
end


function deleteLastCharacter(str)
	return(str:gsub("[%z\1-\127\194-\244][\128-\191]*$", ""))
end	

addEventHandler("onClientCharacter", getRootElement(),
function (character)
	local supportedCharacters = {
		["q"] = true, ["w"] = true, ["x"] = true, ["4"] = true, ["T"] = true, ["Z"] = true, ["V"] = true,
		["e"] = true, ["r"] = true, ["c"] = true, ["5"] = true, ["U"] = true, ["I"] = true, ["B"] = true,
		["t"] = true, ["z"] = true, ["v"] = true, ["6"] = true, ["O"] = true, ["P"] = true, ["N"] = true,
		["u"] = true, ["i"] = true, ["b"] = true, ["7"] = true, ["A"] = true, ["S"] = true, ["M"] = true,
		["o"] = true, ["p"] = true, ["n"] = true, ["8"] = true, ["D"] = true, ["F"] = true, ["#"] = true,
		["a"] = true, ["s"] = true, ["m"] = true, ["9"] = true, ["G"] = true, ["H"] = true, ["@"] = true,
		["d"] = true, ["f"] = true, ["0"] = true, ["-"] = true, ["J"] = true, ["K"] = true, ["."] = true,
		["g"] = true, ["h"] = true, ["1"] = true, ["_"] = true, ["L"] = true, ["Y"] = true,
		["j"] = true, ["k"] = true, ["2"] = true, ["Q"] = true, ["W"] = true, ["X"] = true,
		["l"] = true, ["y"] = true, ["3"] = true, ["E"] = true, ["R"] = true, ["C"] = true,
	}
	if supportedCharacters[character] then
		if selected == 2 and string.len(TextBox1) < 13 then
			TextBox1 = TextBox1..""..character
		elseif selected == 1 and string.len(TextBox2) < 13 then
			TextBox2 = TextBox2..""..character
		elseif selected == 3 and string.len(TextBox3) < 13 then
			TextBox3 = TextBox3..""..character
		elseif selected == 4 and string.len(TextBox4) < 13 then
			TextBox4 = TextBox4..""..character
		elseif selected == 5 and string.len(TextBox5) < 13 then
			TextBox5 = TextBox5..""..character
		elseif selected == 6 and string.len(TextBox6) < 25 then
			TextBox6 = TextBox6..""..character
		end
	end
end)



addEventHandler("onClientGUIClick", resourceRoot,
function ()
	if source == UsernameLabel then
		NowLabel = 1
		guiSetText( UsernameLabel , "" )
	elseif source == PasswordLabel then
		NowLabel = 2
		PassWord = ""
		guiSetText( PasswordLabel , "" )
	elseif source == RegUsernameLabel then
		NowLabel = 3
		guiSetText( RegUsernameLabel , "" )
	elseif source == RegPasswordLabel then
		NowLabel = 4
		guiSetText( RegPasswordLabel , "" )
	elseif source == RegEmailLabel then
		NowLabel = 5
		guiSetText( RegEmailLabel , "" )
	elseif source == LoginButton then
		triggerServerEvent ( "attemptLogin", getLocalPlayer(), getLocalPlayer(), guiGetText(UsernameLabel), PassWord )
		--outputChatBox("PassWord Was: "..PassWord.."")
	elseif source == RegisterPageButton then
		removeEventHandler("onClientRender",root,LoginToRegisterStep1) -- FIX: avoid stacking duplicate render handlers
		addEventHandler ( "onClientRender", root, LoginToRegisterStep1 )
	elseif source == LoginPageButton then 
		removeEventHandler("onClientRender",root,RegisterToLoginStep1) -- FIX: avoid stacking duplicate render handlers
		addEventHandler ( "onClientRender", root, RegisterToLoginStep1 )
	elseif source == RemButton then
		if RememberState == true then
			guiStaticImageLoadImage ( RemButton, "Data/Images/False.png" )
			RememberState = false
		elseif RememberState == false then
			guiStaticImageLoadImage ( RemButton, "Data/Images/True.png" )
			RememberState = true
		end
	elseif source == RegisterButton then 
		local pUser = guiGetText(RegUsernameLabel)
		local pPass = guiGetText(RegPasswordLabel)
		local pMail = guiGetText(RegEmailLabel)
		triggerServerEvent ( "attemptRegister", getLocalPlayer(), getLocalPlayer(), pUser, pPass, pMail)
	else 
		NowLabel = nil
	end
end)

addEvent("HideLoginPannel",true)
addEventHandler("HideLoginPannel", root,
function (thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		toggleAllControls(true)

		removeEventHandler ( "onClientRender", root, CameraMatrixRender )
		removeEventHandler ( "onClientRender", root, DrawDXAccountSystem )
		setElementData("nowHud", true)
		if Music then
			destroyElement( Music )
			Music = nil
		end
	  	showChat(true)
		showCursor(false)
	end
end)

xml = xmlLoadFile("userdata.xml")
if not xml then
	xml = xmlCreateFile("userdata.xml","userdata")
	usernameChild = xmlCreateChild(xml,"username")
	passwordChild = xmlCreateChild(xml,"password")
	checkboxChild = xmlCreateChild(xml,"state")
	xmlSaveFile(xml)
	TextBox1 = "Lotfan Yek User Name Vared Konid"
	TextBox2 = "Lotfan Yek Password Vared Konid"
else
	usernameChild = xmlFindChild(xml,"username",0)
	passwordChild = xmlFindChild(xml,"password",0)
	checkboxChild = xmlFindChild(xml,"state",0)
	UserLoad = xmlNodeGetValue(usernameChild)
	PassWordLoad = xmlNodeGetValue(passwordChild)
	TextBox1 = UserLoad
	TextBox2 = PassWordLoad
end

function saveXML(client)
	if client == getLocalPlayer() then
		if not xml then
			xml = xmlCreateFile("userdata.xml","userdata")
		end

		xmlNodeSetValue(usernameChild,TextBox1)
		xmlNodeSetValue(passwordChild,TextBox2)
		xmlNodeSetValue(checkboxChild,"true")
		xmlSaveFile(xml)

	end
end
addEvent("saveXML",true)
addEventHandler("saveXML",getRootElement(),saveXML)


addEvent("SteSheSkillGunHa2", true)
addEventHandler("SteSheSkillGunHa2", getRootElement(),
function ()
	--triggerServerEvent("SteSheSkillGunHa1", getLocalPlayer(), getLocalPlayer() )
	triggerServerEvent("SetSheSkillHaBadeTamrin", getLocalPlayer(), getLocalPlayer() )
end)


addEvent("bong", true)
addEventHandler("bong", getLocalPlayer(),
function ()
	local sound = playSound("Data/Sounds/bong.mp3")
	setSoundVolume(sound, 20)
end)

addEvent("setkonidskienshobarayeaccsys", true)
addEventHandler("setkonidskienshobarayeaccsys", getLocalPlayer(),
function (skinidishaccsys)
	idskin = tonumber(skinidish)
	outputChatBox(tonumber(skinidish))
end)
