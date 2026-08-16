local accSys = exports["Accounts-System"]

function convertNumber( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1,%2' )    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

local TakeTaxShahrdar = nil
local GiveTaxShahrdar = nil

addCommandHandler("givetax",
function ( thePlayer, command, value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 8  then
		if value then
			if tonumber(value) > 99 then
				if tonumber(value) < 30001 then
					if	GiveTaxShahrdar ~= true then		
						GiveTaxShahrdar = true
						for k, hame_Playera	in ipairs (getElementsByType("player")) do	
							if getElementData(hame_Playera, "loggedIn") == true then
								local value = tonumber(value)
								givePlayerMoney(hame_Playera, value)
								outputChatBox("#00ff00[Tavajoh]: Shahrdar "..getPlayerName(thePlayer).." Be Player Haye Online , Nafari $"..convertNumber(value).." Komak Kard!", hame_Playera, 255, 255, 255, true)
							end
						end
						exports.Logs:newLog("Shahrdar "..getPlayerName(thePlayer).." Be Player Haye Online , Nafari $"..convertNumber(value).." Komak Kard!")
						setTimer(
						function ()
							GiveTaxShahrdar = nil
						end, 60000*60, 1)
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Be Tazegi Be Player Ha Komak Kardid Bayad 1 Saat Sabr Konid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffMablaghe Komak Bayad Hadaksar $30,000 Bashad!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffMablaghe Komak Bayad Hadaghal $100 Bashad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /givetax <Meghdar>", thePlayer, 255, 255, 255, true)
		end
	end
end)

addCommandHandler("taketax",
function ( thePlayer, command, value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 8 then
		if value then
			if tonumber(value) > 9 then
				if tonumber(value) < 3001 then
					if	TakeTaxShahrdar ~= true then		
						TakeTaxShahrdar = true
						setElementData(thePlayer,"PlayerOnlineTakeTax",1)
						for k, hame_Playera	in ipairs (getElementsByType("player")) do	
							if getElementData(hame_Playera, "loggedIn") == true then
								local value = tonumber(value)
								takePlayerMoney(hame_Playera, value)
								outputChatBox("#00ff00[Tavajoh]: Shahrdar "..getPlayerName(thePlayer).." Az Player Haye Online , Nafari $"..convertNumber(value).." Maliat Daryaft Kard!", hame_Playera, 255, 255, 255, true)
								local chanta = getElementData(thePlayer,"PlayerOnlineTakeTax")
								local chantabadi = tonumber(chanta) + 1
								setElementData(thePlayer,"PlayerOnlineTakeTax",chantabadi)
							end
						end
						local CheghadrPolBede = getElementData(thePlayer,"PlayerOnlineTakeTax")
						givePlayerMoney(thePlayer, value*CheghadrPolBede)
						exports.Logs:newLog("Shahrdar "..getPlayerName(thePlayer).." Az Player Haye Online , Nafari $"..convertNumber(value).." Maliat Gereft!")
						setElementData(thePlayer,"PlayerOnlineTakeTax",nil)
						setTimer(
						function ()
							TakeTaxShahrdar = nil
						end, 60000*60, 1)
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Be Tazegi Az Player Ha Maliat Gereftid! Bayad 1 Saat Sabr Konid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffMablagh'e Maliat Bayad Hadaksar $3,000 Bashad!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffMablagh'e Maliat Bayad Hadaghal $10 Bashad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /taketax <Meghdar>", thePlayer, 255, 255, 255, true)
		end	
	end
end)
