local accSys = exports["Accounts-System"]
local rankname = {
	[1] = {"(R 1) Sotvan","(R 2) Sarvan","(R 3) Sargord","(R 4) Sarhang","(R 5) Sartip","(R 6) SarLashgar","(R 7) Sepahbod"},
	[2] = {"(R 1) Sotvan","(R 2) Sarvan","(R 3) Sargord","(R 4) Sarhang","(R 5) Sartip","(R 6) SarLashgar","(R 7) Sepahbod"},
	[3] = {"(R 1) Sotvan","(R 2) Sarvan","(R 3) Sargord","(R 4) Sarhang","(R 5) Sartip","(R 6) SarLashgar","(R 7) Sepahbod"},
	[4] = {"(R 1) Parastar","(R 2) Sar Parastar","(R 3) Pezeshk","(R 4) Pezeshk Motekhases","(R 5) Pezeshk Jarah","(R 6) Moaven Bimarestan","(R 7) Raeis Bimarestan"},
	[5] = {"(R 1) Agent","(R 2) Hitman","(R 3) Oppressive","(R 4) Handler","(R 5) Board Of Director","(R 6) Director","(R 7) Constant"},
	[6] = {"(R 1) Agent","(R 2) Hitman","(R 3) Oppressive","(R 4) Handler","(R 5) Board Of Director","(R 6) Director","(R 7) Constant"},
	[7] = {"(R 1) TazeVared","(R 2) Akas","(R 3) Rozname Negar","(R 4) GozareshGar","(R 5) Mojri","(R 6) Moaven KhabarNegar","(R 7) Raeis KhabarNegar"},
	[8] = {"(R 1) Bodyguard","(R 2) Vazire Farhang Va Refah","(R 3) Sokhango Va Dabire Dolat","(R 4) Vazire Rah Va Shar Sazi","(R 5) Vazir","(R 6) Moaven Rais Jomhor","(R 7) Rais Jomhor"},
	[9] = {"(R 1) Kar Amooz","(R 2) Taze Kar","(R 3) Achar Be Das","(R 4) Achar Frace","(R 5) Kar Balad","(R 6) Dast Yar Osta","(R 7) Osta"},
}
local factioninfo = {
	--factioninfo[id]={skinmember,Name,Hex,RC,GC,BC,SKINLEader,RankLeader,RankMember}

	[1]={164,"Police Department","#507dde",0, 85, 255,265,7,1},
	[2]={286,"FBI","#0072ff",10, 62, 170,127,7,1},
	[3]={287,"NG","#1953e6",0, 14, 170,282,7,1},
	[4]={275,"Medic","#ff7700",255,119,0,70,7,1},
	[5]={240,"ICA (RP)","#FFFFFF",255,255,255,44,7,1},
	[6]={240,"CIA (RP)","#000000",255,255,255,139,7,1},
	[7]={187,"News Reporter","#cd5c5c",205,92,92,147,7,1},
	[8]={83,"Dolat","#FF00FF",255,0,255,295,7,1},
	[9]={268,"Mechanic","#649c9e",100,156,158,50,7,1},
	
}
addCommandHandler("b",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 then
			if (...) then
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				for k, bisim_edare in ipairs (getElementsByType("player")) do
					if getElementData(bisim_edare, "loggedIn") == true then
						if tonumber(getElementData(accSys:getPlayerAcc(bisim_edare), "pMember")) == 6 then
							outputChatBox("#000000((Bisim)) ("..rankname[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))][tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank"))].." "..getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_edare, 54, 181, 75,true)
						end
					end
				end
			
			else
				outputChatBox("#C0C0C0Bezan: /b [Message]", thePlayer, 212, 156, 49,true)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)

--department Chat /d
addCommandHandler("d",
function(thePlayer, cmd,  ...)
	local factionMember = getElementData(thePlayer, "pMember")
	local factionRank = getElementData(thePlayer, "pRank")
	if getElementData(thePlayer, "loggedIn") == true then
		local factionesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) 
		if factionesh == 1 or factionesh== 2 or factionesh == 3 or factionesh == 4 or factionesh == 6 then
			if (...) then
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
					for k, d in ipairs (getElementsByType("player")) do
						if getElementData(d, "loggedIn") == true then
							local pMemberesh = tonumber(getElementData(accSys:getPlayerAcc(d), "pMember"))
							if pMemberesh == 1 or pMemberesh == 2 or pMemberesh == 3 or pMemberesh == 6 or pMemberesh == 4 then
								if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
									outputChatBox("#00fff0((Bisim Markazi)) (#1E1Eff"..rankname[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))][tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank"))].." ".. getPlayerName(thePlayer):gsub("_", " ") .." Az #ff0000Edare Police: #ffffff".. message.."#00ff00#00fff0)", d, 54, 181, 75,true)
								elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 then
									outputChatBox("#00fff0((Bisim Markazi)) (#1E1Eff"..rankname[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))][tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank"))].." ".. getPlayerName(thePlayer):gsub("_", " ") .." Az #ff0000Police Federal: #ffffff".. message.."#00ff00#00fff0)", d, 54, 181, 75,true)
								elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
									outputChatBox("#00fff0((Bisim Markazi)) (#1E1Eff"..rankname[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))][tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank"))].." ".. getPlayerName(thePlayer):gsub("_", " ") .." Az #ff0000Gurd Meli: #ffffff".. message.."#00ff00#00fff0)", d, 54, 181, 75,true)
								elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then
									outputChatBox("#00fff0((Bisim Markazi)) (#1E1Eff"..rankname[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))][tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank"))].." ".. getPlayerName(thePlayer):gsub("_", " ") .." Az #ff0000Team Pezeshki: #ffffff".. message.."#00ff00#00fff0)", d, 54, 181, 75,true)
								elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 then
									outputChatBox("#00fff0((Bisim Markazi)) (#1E1Eff"..rankname[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))][tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank"))].." ".. getPlayerName(thePlayer):gsub("_", " ") .." Az #000000Sazeman CIA: #ffffff".. message.."#00ff00#00fff0)", d, 54, 181, 75,true)

								end
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /d [Message]", thePlayer, 212, 156, 49,true)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

--department Chat /d
addCommandHandler("lc",
function(thePlayer, cmd,  ...)
	local factionMember = getElementData(thePlayer, "pMember")
	local factionRank = getElementData(thePlayer, "pRank")
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
			if (...) then
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				for k, lc in ipairs (getElementsByType("player")) do
					if getElementData(lc, "loggedIn") == true then
						if tonumber(getElementData(accSys:getPlayerAcc(lc), "pRank")) == 7 or tonumber(getElementData(accSys:getPlayerAcc(lc), "pAdmin")) > 0 then
							if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
								outputChatBox("#0055ff(( [LC] Police Department "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 then
								outputChatBox("#003eaa(( [LC] Police Federal "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
								outputChatBox("#000eaa(( [LC] National Guard "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then
								outputChatBox("#ff7700(( [LC] Medic "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
								outputChatBox("#443b3b(( [LC] ICA "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 then
								outputChatBox("#2fa1d6(( [LC] School "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 then
								outputChatBox("#cd5c5c(( [LC] News Reporter "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 8 then
								outputChatBox("#ff00ff(( [LC] Shahrdar "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 9 then
								outputChatBox("#649c9e(( [LC] Mechanic "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 10 then
								outputChatBox("#cccc00(( [LC] Taxi "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 10 then
								outputChatBox("#ebe300(( [LC] Albania "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 11 then
								outputChatBox("#39badb(( [LC] Avengers "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 12 then
								outputChatBox("#00FFBB(( [LC] ♛One4One♛ "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 13 then
								outputChatBox("#878787(( [LC] iNFiNiTy "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 14 then
								outputChatBox("#331900(( [LC] Terorist "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 15 then
								outputChatBox("#448d04(( [LC] Yakuza "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
								outputChatBox("#6500ff(( [LC] Admin "..getPlayerName(thePlayer):gsub("_", " ")..")): #ffffff".. message.."", lc, 54, 181, 75,true)
							end
						end
					end
				end
			else
				outputChatBox("#C0C0C0Bezan: /lc [Message]", thePlayer, 212, 156, 49,true)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

addCommandHandler("b",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
			if (...) then
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				for k, bisim_edare in ipairs (getElementsByType("player")) do
					if getElementData(bisim_edare, "loggedIn") == true then
						if tonumber(getElementData(accSys:getPlayerAcc(bisim_edare), "pMember")) == 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then

							outputChatBox("#1E1Eff((Bisim)) (Sarbaz ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_edare, 54, 181, 75,true)

						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_edare), "pMember")) == 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
							outputChatBox("#1E1Eff((Bisim)) (Sarvan ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_edare, 54, 181, 75,true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_edare), "pMember")) == 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
							outputChatBox("#1E1Eff((Bisim)) (Sargurd ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_edare, 54, 181, 75,true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_edare), "pMember")) == 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
							outputChatBox("#1E1Eff((Bisim)) (Sarhang ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_edare, 54, 181, 75,true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_edare), "pMember")) == 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
							outputChatBox("#1E1Eff((Bisim)) (Sartip ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_edare, 54, 181, 75,true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_edare), "pMember")) == 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
							outputChatBox("#1E1Eff((Bisim)) (Sub-Leader ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_edare, 54, 181, 75,true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_edare), "pMember")) == 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
							outputChatBox("#1E1Eff((Bisim)) (Leader ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_edare, 54, 181, 75,true)
						end
					end
				end
			
			else
				outputChatBox("#C0C0C0Bezan: /b [Message]", thePlayer, 212, 156, 49,true)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)

addCommandHandler("b",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, bisim_federal in ipairs (getElementsByType("player")) do
						if getElementData(bisim_federal, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(bisim_federal), "pMember")) == 2 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#1E1Eff((Bisim)) (Sarbaz ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_federal, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_federal), "pMember")) == 2 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#1E1Eff((Bisim)) (Sarvan ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_federal, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_federal), "pMember")) == 2 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#1E1Eff((Bisim)) (Sargurd ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_federal, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_federal), "pMember")) == 2 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#1E1Eff((Bisim)) (Sarhang ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_federal, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_federal), "pMember")) == 2 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#1E1Eff((Bisim)) (Sartip ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_federal, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_federal), "pMember")) == 2 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#1E1Eff((Bisim)) (Sub-Leader ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_federal, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_federal), "pMember")) == 2 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#1E1Eff((Bisim)) (Leader ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_federal, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /b [Message]", thePlayer, 212, 156, 49,true)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

addCommandHandler("b",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				for k, bisim_ng in ipairs (getElementsByType("player")) do
					if getElementData(bisim_ng, "loggedIn") == true then
						if tonumber(getElementData(accSys:getPlayerAcc(bisim_ng), "pMember")) == 3 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
							outputChatBox("#1E1Eff((Bisim)) (Sarbaz ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_ng, 54, 181, 75,true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_ng), "pMember")) == 3 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
							outputChatBox("#1E1Eff((Bisim)) (Sarvan ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_ng, 54, 181, 75,true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_ng), "pMember")) == 3 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
							outputChatBox("#1E1Eff((Bisim)) (Sargurd ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_ng, 54, 181, 75,true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_ng), "pMember")) == 3 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
							outputChatBox("#1E1Eff((Bisim)) (Sarhang ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_ng, 54, 181, 75,true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_ng), "pMember")) == 3 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
							outputChatBox("#1E1Eff((Bisim)) (Sartip ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_ng, 54, 181, 75,true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_ng), "pMember")) == 3 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
							outputChatBox("#1E1Eff((Bisim)) (Sub-Leader ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_ng, 54, 181, 75,true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_ng), "pMember")) == 3 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
							outputChatBox("#1E1Eff((Bisim)) (Leader ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #1E1Eff)", bisim_ng, 54, 181, 75,true)
						end
					end
				end
			
			else
				outputChatBox("#C0C0C0Bezan: /b [Message]", thePlayer, 212, 156, 49,true)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

addCommandHandler("b",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, bisim_medic in ipairs (getElementsByType("player")) do
						if getElementData(bisim_medic, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(bisim_medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#ff7700((Bisim)) (Rank 1 ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #ff3700)", bisim_medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#ff7700((Bisim)) (Rank 2 ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #ff3700)", bisim_medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#ff7700((Bisim)) (Rank 3 ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #ff3700)", bisim_medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#ff7700((Bisim)) (Rank 4 ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #ff3700)", bisim_medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#ff7700((Bisim)) (Rank 5 ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #ff3700)", bisim_medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#ff7700((Bisim)) (Sub-Leader ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #ff3700)", bisim_medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(bisim_medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#ff7700((Bisim)) (Leader ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.." #ff3700)", bisim_medic, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /b [Message]", thePlayer, 212, 156, 49,true)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, hitman in ipairs (getElementsByType("player")) do
						if getElementData(hitman, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(hitman), "pMember")) == 5 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#9fa1a3(Rank 1) ICA ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", hitman, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(hitman), "pMember")) == 5 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#9fa1a3(Rank 2) ICA ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", hitman, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(hitman), "pMember")) == 5 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#9fa1a3(Rank 3) ICA ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", hitman, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(hitman), "pMember")) == 5 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#9fa1a3(Rank 4) ICA ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", hitman, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(hitman), "pMember")) == 5 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#9fa1a3(Rank 5) ICA ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", hitman, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(hitman), "pMember")) == 5 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#9fa1a3(Co-Leader) ICA ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", hitman, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(hitman), "pMember")) == 5 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#9fa1a3(Leader) ICA ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", hitman, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("SYNTAX: /f [Message]", thePlayer, 212, 156, 49)	
			end
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)

addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, NR in ipairs (getElementsByType("player")) do
						if getElementData(NR, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(NR), "pMember")) == 7 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#cd5c5c(Rank 1) NR ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", NR, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(NR), "pMember")) == 7 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#cd5c5c(Rank 2) NR ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", NR, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(NR), "pMember")) == 7 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#cd5c5c(Rank 3) NR ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", NR, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(NR), "pMember")) == 7 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#cd5c5c(Rank 4) NR ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", NR, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(NR), "pMember")) == 7 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#cd5c5c(Rank 5) NR ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", NR, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(NR), "pMember")) == 7 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#cd5c5c(Sub-Leader) NR ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", NR, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(NR), "pMember")) == 7 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#cd5c5c(Leader) NR ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", NR, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /f [Message]", thePlayer, 212, 156, 49,true)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)


addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, Medic in ipairs (getElementsByType("player")) do
						if getElementData(Medic, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(Medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#ff7700(Rank 1) Medic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#ff7700(Rank 2) Medic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#ff7700(Rank 3) Medic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#ff7700(Rank 4) Medic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#ff7700(Rank 5) Medic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#ff7700(Sub-Leader) Medic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Medic, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Medic), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#ff7700(Leader) Medic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Medic, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /f [Message]", thePlayer, 212, 156, 49,true)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

--School Chat





addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, teacher in ipairs (getElementsByType("player")) do
						if getElementData(teacher, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(teacher), "pMember")) == 6 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /f [Message]", thePlayer, 212, 156, 49,true)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)


--Ballas Chat

addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 10 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, Albania in ipairs (getElementsByType("player")) do
						if getElementData(Albania, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(Albania), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#ebe300(Rank 1) Albania ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Albania, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Albania), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#ebe300(Rank 2) Albania ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Albania, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Albania), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#ebe300(Rank 3) Albania ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Albania, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Albania), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#ebe300(Rank 4) Albania ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Albania, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Albania), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#ebe300(Rank 5) Albania ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Albania, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Albania), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#ebe300(Sub-Leader) Albania ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Albania, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Albania), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#ebe300(Leader) Albania ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Albania, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /f [Message]", thePlayer, 212, 156, 49)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)



addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 11 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, Avengers in ipairs (getElementsByType("player")) do
						if getElementData(Avengers, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(Avengers), "pMember")) == 11 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#39badb(Rank 1) Avengers ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Avengers, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Avengers), "pMember")) == 11 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#39badb(Rank 2) Avengers ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Avengers, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Avengers), "pMember")) == 11 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#39badb(Rank 3) Avengers ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Avengers, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Avengers), "pMember")) == 11 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#39badb(Rank 4) Avengers ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Avengers, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Avengers), "pMember")) == 11 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#39badb(Rank 5) Avengers ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Avengers, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Avengers), "pMember")) == 11 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#39badb(Sub-Leader) Avengers ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Avengers, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Avengers), "pMember")) == 11 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#39badb(Leader) Avengers ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Avengers, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /f [Message]", thePlayer, 212, 156, 49)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)



addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 12 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, Bloods in ipairs (getElementsByType("player")) do
						if getElementData(Bloods, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(Bloods), "pMember")) == 12 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#dc0000(Rank 1) Bloods ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Bloods, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Bloods), "pMember")) == 12 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#dc0000(Rank 2) Bloods ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Bloods, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Bloods), "pMember")) == 12 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#dc0000(Rank 3) Bloods ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Bloods, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Bloods), "pMember")) == 12 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#dc0000(Rank 4) Bloods ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Bloods, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Bloods), "pMember")) == 12 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#dc0000(Rank 5) Bloods ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Bloods, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Bloods), "pMember")) == 12 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#dc0000(Sub-Leader) Bloods ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Bloods, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Bloods), "pMember")) == 12 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#00FFBB(Leader) ♛One4One♛ ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Bloods, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /f [Message]", thePlayer, 212, 156, 49)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)



addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 13 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, iNFiNiTy in ipairs (getElementsByType("player")) do
						if getElementData(iNFiNiTy, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(iNFiNiTy), "pMember")) == 13 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#878787(Rank 1) iNFiNiTy ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", iNFiNiTy, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(iNFiNiTy), "pMember")) == 13 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#878787(Rank 2) iNFiNiTy ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", iNFiNiTy, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(iNFiNiTy), "pMember")) == 13 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#878787(Rank 3) iNFiNiTy ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", iNFiNiTy, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(iNFiNiTy), "pMember")) == 13 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#878787(Rank 4) iNFiNiTy ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", iNFiNiTy, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(iNFiNiTy), "pMember")) == 13 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#878787(Rank 5) iNFiNiTy ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", iNFiNiTy, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(iNFiNiTy), "pMember")) == 13 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#878787(Sub-Leader) iNFiNiTy ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", iNFiNiTy, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(iNFiNiTy), "pMember")) == 13 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#878787(Leader) iNFiNiTy ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", iNFiNiTy, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /f [Message]", thePlayer, 212, 156, 49)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)



addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 14 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, Virus in ipairs (getElementsByType("player")) do
						if getElementData(Virus, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(Virus), "pMember")) == 14 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#331900(Rank 1) Terorist ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Virus, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Virus), "pMember")) == 14 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#331900(Rank 2) Terorist ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Virus, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Virus), "pMember")) == 14 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#331900(Rank 3) Terorist ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Virus, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Virus), "pMember")) == 14 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#331900(Rank 4) Terorist ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Virus, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Virus), "pMember")) == 14 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#331900(Rank 5) Terorist ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Virus, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Virus), "pMember")) == 14 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#331900(Sub-Leader) Terorist ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Virus, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Virus), "pMember")) == 14 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#331900(Leader) Terorist ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Virus, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /f [Message]", thePlayer, 212, 156, 49)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 15 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, Yakuza in ipairs (getElementsByType("player")) do
						if getElementData(Yakuza, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(Yakuza), "pMember")) == 15 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#448d04(Rank 1) Yakuza ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Yakuza, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Yakuza), "pMember")) == 15 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#448d04(Rank 2) Yakuza ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Yakuza, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Yakuza), "pMember")) == 15 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#448d04(Rank 3) Yakuza ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Yakuza, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Yakuza), "pMember")) == 15 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#448d04(Rank 4) Yakuza ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Yakuza, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Yakuza), "pMember")) == 15 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#448d04(Rank 5) Yakuza ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Yakuza, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Yakuza), "pMember")) == 15 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#448d04(Sub-Leader) Yakuza ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Yakuza, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(Yakuza), "pMember")) == 15 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#448d04(Leader) Yakuza ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", Yakuza, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /f [Message]", thePlayer, 212, 156, 49)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 9 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, mech in ipairs (getElementsByType("player")) do
						if getElementData(mech, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 9 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#649c9e(Rank 1) Mechanic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 9 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#649c9e(Rank 2) Mechanic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 9 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#649c9e(Rank 3) Mechanic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 9 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#649c9e(Rank 4) Mechanic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 9 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#649c9e(Rank 5) Mechanic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 9 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#649c9e(Sub-Leader) Mechanic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 9 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#649c9e(Leader) Mechanic ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("#C0C0C0Bezan: /f [Message]", thePlayer, 212, 156, 49,true)	
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)
--[[addCommandHandler("f",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 10 then
		
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, mech in ipairs (getElementsByType("player")) do
						if getElementData(mech, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
								outputChatBox("#00ff7b(Rank 1) Taxi ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
								outputChatBox("#00ff7b(Rank 2) Taxi ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
								outputChatBox("#00ff7b(Rank 3) Taxi ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
								outputChatBox("#00ff7b(Rank 4) Taxi ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then
								outputChatBox("#00ff7b(Rank 5) Taxi ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
								outputChatBox("#00ff7b(Co-Leader) Taxi ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(mech), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
								outputChatBox("#00ff7b(Leader) Taxi ".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."", mech, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("SYNTAX: /f [Message]", thePlayer, 212, 156, 49)	
			end
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)--]]