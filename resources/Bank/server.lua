local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

local inParty = {}
local partyLeader = {}
local partySlots = {}

--[[addCommandHandler("party",
function (thePlayer, command)
	if inParty[thePlayer] ~= true then
		inParty[thePlayer] = true
		partyLeader[thePlayer] = true
		partySlots[thePlayer] = 1
		setElementData(thePlayer, "p1", getPlayerName(thePlayer))
		triggerClientEvent("ShowPartyPanel", thePlayer, thePlayer, getElementData(thePlayer, "p1"))
		exports["notf"]:addNotification(thePlayer, "Gorooh Dozdi Az Bank Sakhte Shod!", "success")
	else
		exports["notf"]:addNotification(thePlayer, "Shoma Dakhel Yek Party Hastid!", "error")
	end
end)

addCommandHandler("inv",
function (thePlayer, command, player)
	local find = miscSys:findPlayer(player)
	if partyLeader[thePlayer] == true then
		if player then
			if find then
				if partySlots[thePlayer] == 1 then
					partySlots[thePlayer] = 2
					inParty[find] = true
					setElementData(thePlayer, "p2", getPlayerName(find))
					triggerClientEvent("ShowPartyPanel", find, find, getElementData(thePlayer, "p1"), getElementData(thePlayer, "p2"))
				elseif partySlots[thePlayer] == 2 then
					partySlots[thePlayer] = 3
					inParty[find] = true
					setElementData(thePlayer, "p3", getPlayerName(find))
					triggerClientEvent("ShowPartyPanel", find, find, getElementData(thePlayer, "p1"), getElementData(thePlayer, "p2"), getElementData(thePlayer, "p3"))
				elseif partySlots[thePlayer] == 3 then
					partySlots[thePlayer] = 4
					inParty[find] = true
					setElementData(thePlayer, "p4", getPlayerName(find))
					triggerClientEvent("ShowPartyPanel", find, find, getElementData(thePlayer, "p1"), getElementData(thePlayer, "p2"), getElementData(thePlayer, "p3"), getElementData(thePlayer, "p4"))
				else
					outputChatBox("#ff0000Zarfiat Party Pore!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Syntax: /inv <PartOfName/ID>", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Leader Party Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("pleave",
function (thePlayer, command)
	if inParty[thePlayer] == true then
		if partyLeader[thePlayer] ~= true then
			inParty[thePlayer] = nil
			triggerClientEvent("HidePartyPanel", root)
			outputChatBox("#ff0000Shoma Az Party Left Dadid!", thePlayer, 255, 255, 255, true)
		else
			inParty[thePlayer] = nil
			partyLeader[thePlayer] = nil
			triggerClientEvent("HidePartyPanel", root)
			outputChatBox("#ff0000Shoma Az Party Left Dadid Va Party Pak Shod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Dakhel Party Bashid!", thePlayer, 255, 255, 255, true)
	end
end)]]--

atmls1 = 2441.0302734375 ,-1481.1142578125 ,23.652813110352,0,0,162
atmls2 = 1186.1999511719,-1374.3000488281, 13.199999809265 ,0,0,90
atmls3 = 1975.4000244141,-2176.1000976563, 13.199999809265 ,0,0,178
atmls4 = 604.1455078125 ,-1248.0673828125 ,18.1 ,0,0,200

atmsf1 = -1571.0999755859,666.59997558594, 6.8000001907349 ,0,0,88
atmsf2 = -2655.8999023438,257.89999389648, 4 ,0,0,90

atmredcounty = -74.800003051758,1116.3000488281, 19.39999961853 ,0,0,90

atmlv1 = 1715.5999755859,1533.5, 10.39 ,0,0,92
atmlv2 = 2176.6000976563,2443.6999511719, 10.5 ,0,0,178
atmlv3 = 2159.5,950.79998779297, 10.699999809265 ,0,0,270

atmler = { { 2747.3916015625 ,-1186.703125 ,69,0,0,272 }, { 1186.1999511719,-1374.3000488281, 13.199999809265 ,0,0,90 }, { 1975.4000244141,-2176.1000976563, 13.199999809265 ,0,0,178 }, { -1571.0999755859,666.59997558594, 6.8000001907349 ,0,0,88 }, { -2655.8999023438,257.89999389648, 4 ,0,0,90 }, {-74.800003051758,1116.3000488281, 19.39999961853 ,0,0,90 }, { 1715.5999755859,1533.5, 10.39 ,0,0,92 }, { 2176.6000976563,2443.6999511719, 10.5 ,0,0,178 }, { 2159.5,950.79998779297, 10.699999809265 ,0,0,270 },{ 604.1455078125 ,-1248.0673828125 ,18.1 ,0,0,200} }

atm = {}
function displayLoadedRes ( res )
 for theKey,theAtm in ipairs(atmler) do
atm[theAtm] = createObject ( 2942,  theAtm [ 1 ],  theAtm  [ 2 ],  theAtm [ 3 ], theAtm [ 4 ], theAtm [ 5 ], theAtm [ 6 ] )
atmx, atmy, atmz = getElementPosition (atm[theAtm])
atmMarker = createMarker(atmx, atmy, atmz-1 , "cylinder", 1.5, 30,254,36,100)
setElementData (atmMarker,"atmz",true)
bankMarker = createMarker(317.447265625 ,175.2412109375 ,1094.6 , "cylinder", 1.3, 0, 240, 255,5)
local blips = createBlip ( atmx ,atmy ,atmz, 52 )
setElementData(blips, 'blipName', 'ATM')
setElementInterior(bankMarker, 3)
--setElementDimension(bankMarker, 500)
setElementData (bankMarker,"Bank",true)
setElementCollisionsEnabled(atm[theAtm], false)

end
end
addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()), displayLoadedRes )


addEventHandler("onMarkerHit",resourceRoot,
function(hitElement,matchingDimension)
	if ((getElementType(hitElement) == "player")) then
		if getElementData(hitElement, "loggedIn") then
			local Banki = getElementData (source,"Bank")
			if (Banki == true) then
				triggerClientEvent(hitElement, "bankaGuiAc", hitElement)
			end
		end
	end
end)



--[[
function MarkerHit(  hitElement, matchingDimension )
	if ((getElementType(hitElement) == "player")) then
		if getElementData(hitElement, "loggedIn") then
			local Banki = getElementData (source,"Bank")
			if (Banki == true) then
				triggerClientEvent(hitElement, "bankaGuiAc", hitElement)
			end
		end
	end
end
addEventHandler( "onMarkerHit", getRootElement(), MarkerHit )
--]]
--[[
---------------------------------
-------**Script By zezaw**-------
---------------------------------
-- Sakhte Hesab faghat Az Bank --
function MarkerHit12(  hitElement, matchingDimension )
	if ((getElementType(hitElement) == "player")) then
		if getElementData(hitElement, "loggedIn") then
			local atmi = getElementData (source,"atmz")
			if (atmi == true) then
				 local kartSifre = tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pBankPass"))
				if (kartSifre ~= 0) then
					triggerClientEvent(hitElement, "bankaGuiAc", hitElement)
				else
				exports["notf"]:addNotification(hitElement, "Shoma Hesab Banki Nadarid Baraye Sakhte Hesab Be Bank Morajee Konid!" , 'error')
				triggerClientEvent ( hitElement, "PlayError", hitElement, "Hello World!" )
				end
			end
		end
	end
end
addEventHandler( "onMarkerHit", getRootElement(), MarkerHit12 )

--]]

addEventHandler("onMarkerHit",resourceRoot,
function(hitElement,matchingDimension)
	if ((getElementType(hitElement) == "player")) then
		if getElementData(hitElement, "loggedIn") then
			local atmi = getElementData (source,"atmz")
			if (atmi == true) then
				 local kartSifre = tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pBankPass"))
				if (kartSifre ~= 0) then
					triggerClientEvent(hitElement, "bankaGuiAc", hitElement)
				else
				exports["notf"]:addNotification(hitElement, "Shoma Hesab Banki Nadarid Baraye Sakhte Hesab Be Bank Morajee Konid!" , 'error')
				triggerClientEvent ( hitElement, "PlayError", hitElement, "Hello World!" )
				end
			end
		end
	end
end)



function getCurrentDateAndTime()
	local realTime = getRealTime()
    local cDate = string.format("%04d/%02d/%02d", realTime.year + 1900, realTime.month + 1, realTime.monthday )
	return cDate
end

addEvent("bankaBilgileri",true) 
addEventHandler("bankaBilgileri",root, 
function ()
 local kartSifre = getElementData(accSys:getPlayerAcc(source), "pBankPass")
  if kartSifre ~= 0 then
   local bankaParasi = getElementData(accSys:getPlayerAcc(source), "pBank")
    local kurulumTarih = getElementData(accSys:getPlayerAcc(source), "pBankcDate")
	 local Pname = getPlayerName (source)
	  triggerClientEvent(source, "BankaBilgileriGoster", source,Pname,bankaParasi,kurulumTarih)
	else
	  triggerClientEvent(source, "HataMesaji", source,"Shoma Hich Hesab banki Nadarid!")
end
end
)

addEvent("atmSoydu",true) 
addEventHandler("atmSoydu",root, 
function ()
local data = getElementData (source,"AtmSoyuyor")
 if (data == true) then
 local para = math.random (4000,8000)
  givePlayerMoney (source,para)
  setElementData (source,"atmSoyabilirmi",false)
  setTimer ( setElementData, 180000, 1, source,"atmSoyabilirmi",true)
  setTimer ( outputChatBox, 180000, 1,"You can hack the atm now!",source,0,255,0)
  outputChatBox("You hacked the ATM and received  "..para.."! You can hack the atm again in 180 seconds." ,source,0,255,0,true)
   local wanted = getPlayerWantedLevel (source)
    if (wanted < 3) then
	 setPlayerWantedLevel (source,wanted + 1)
end
end
end
)

addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
		setElementData (source,"AtmSoyuyor",false)
		triggerClientEvent(source, "soymaEkraniKapat",source)
	end
)

function outputChange1(dataName,oldValue)
	if getElementType(source) == "player" then 
		 if (dataName == "Yakalanma") then
		  local dataa = getElementData (source,"Yakalanma")
		   if (dataa == true) then
		   		setElementData (source,"AtmSoyuyor",false)
		triggerClientEvent(source, "soymaEkraniKapat",source)
end
end
end
end
addEventHandler("onElementDataChange",getRootElement(),outputChange1)

function outputChange2(dataName,oldValue)
	if getElementType(source) == "player" then 
		 if (dataName == "Tutuklanma") then
		  local dataa = getElementData (source,"Tutuklanma")
		   if (dataa == true) then
		   		setElementData (source,"AtmSoyuyor",false)
		triggerClientEvent(source, "soymaEkraniKapat",source)
end
end
end
end
addEventHandler("onElementDataChange",getRootElement(),outputChange2)

addEvent("SifreUnuttum",true) 
addEventHandler("SifreUnuttum",root, 
function ()
 local kartSifre = getElementData(accSys:getPlayerAcc(source), "pBankPass")
 local soru = getElementData(accSys:getPlayerAcc(source), "pBankQues")
 local cevap = getElementData(accSys:getPlayerAcc(source), "pBankAnswer")
  if kartSifre ~= 0 then
	  triggerClientEvent(source, "KartSifreDegisC",source,soru,cevap)
	else
	  triggerClientEvent(source, "HataMesaji", source,"Shoma Hich Hesab banki Nadarid!")
end
end
)

addEvent("ParaCek",true) 
addEventHandler("ParaCek",root, 
function ()
 local kartSifre = getElementData(accSys:getPlayerAcc(source), "pBankPass")
  if kartSifre ~= 0 then
   local bankaParasi = getElementData(accSys:getPlayerAcc(source), "pBank")
	  triggerClientEvent(source, "paraCekmeyeBasla", source,bankaParasi)
	else
	  triggerClientEvent(source, "HataMesaji", source,"Shoma Hich Hesab banki Nadarid!")
end
end
)

addEvent("transfer",true) 
addEventHandler("transfer",root, 
function ()
 local kartSifre = getElementData(accSys:getPlayerAcc(source), "pBankPass")
  if kartSifre ~= 0 then
   local bankaParasi = getElementData(accSys:getPlayerAcc(source), "pBank")
	  triggerClientEvent(source, "transferingMoney", source,bankaParasi)
	else
	  triggerClientEvent(source, "HataMesaji", source,"Shoma Hich Hesab banki Nadarid!")
end
end
)

addEvent("KartOlustur",true) 
addEventHandler("KartOlustur",root, 
function ()
 local kartSifre = getElementData(accSys:getPlayerAcc(source), "pBankPass")
  if kartSifre == 0 then
	  triggerClientEvent(source, "KartOlusturC", source)
	else
	  triggerClientEvent(source, "HataMesaji", source,"Shoma Hesab Banki Darid!")
end
end
)

addEvent("kartOlusturdu",true) 
addEventHandler("kartOlusturdu",root, 
function (sifre,soru,cevap)
 setElementData(accSys:getPlayerAcc(source), "pBankQues", soru)
 setElementData(accSys:getPlayerAcc(source), "pBankAnswer", cevap)
 setElementData(accSys:getPlayerAcc(source), "pBankPass", sifre)
 local cDate = getCurrentDateAndTime()
 setElementData(accSys:getPlayerAcc(source), "pBankcDate", cDate)
end
)

addCommandHandler("showbank",
function (thePlayer)
	local acc = getPlayerAccount (thePlayer)
	outputChatBox("Tarikht Sakht: "..getElementData(accSys:getPlayerAcc(thePlayer), "pBankcDate"), thePlayer)
	outputChatBox("Ramz: "..getElementData(accSys:getPlayerAcc(thePlayer), "pBankPass"), thePlayer)
	outputChatBox("Mojodi Bank: "..getElementData(accSys:getPlayerAcc(thePlayer), "pBank"), thePlayer)
	outputChatBox("Soal Amniat:"..getElementData(accSys:getPlayerAcc(thePlayer), "pBankQues"), thePlayer)
	outputChatBox("Javab Soal Amniat:"..getElementData(accSys:getPlayerAcc(thePlayer), "pBankAnswer"), thePlayer)
end)

addEvent("ParaYatir",true) 
addEventHandler("ParaYatir",root, 
function ()
 local kartSifre = getElementData(accSys:getPlayerAcc(source), "pBankPass")
  if kartSifre ~= 0 then
   local bankaParasi = getElementData(accSys:getPlayerAcc(source), "pBank")
	  triggerClientEvent(source, "paraYatirmayaBasla", source,bankaParasi)
	else
	  triggerClientEvent(source, "HataMesaji", source,"Shoma Hesab Banki Nadarid!")
end
end
)

addEvent("sifreDeneme",true) 
addEventHandler("sifreDeneme",root,
function (sifre1,sifre2,sifre3,sifre4,tip)
if (sifre1) and (sifre2) and (sifre3) and (sifre4) then
 local kartSifre = tonumber(getElementData(accSys:getPlayerAcc(source), "pBankPass"))
  if (kartSifre) then
  local gelenSifre = tonumber(sifre1..sifre2..sifre3..sifre4)
   if (gelenSifre == kartSifre) then
   local bankaParasi = getElementData(accSys:getPlayerAcc(source), "pBank")
   local kendiParasi = getPlayerMoney (source)
   local cash = getElementData(accSys:getPlayerAcc(source), "pBank")
    if (tip == "Cekme") then
	  triggerClientEvent(source, "ParaCekmeEkrani", source,bankaParasi)
    elseif (tip == "Yatirma") then
	  triggerClientEvent(source, "ParaYatirmaEkrani", source,kendiParasi,bankaParasi)
	 elseif (tip == "transfer") then
		triggerClientEvent(source, "TransferScreen", source,cash)
	  end
	else
	  triggerClientEvent(source, "HataMesaji2", source,"Ramz Eshtebah Mibashad!")
end
end
end
end
)

addEvent("paraYatirPara",true) 
addEventHandler("paraYatirPara",root, 
function (miktar)
	if (miktar) then
		local miktar = tonumber(miktar)
		local para = getPlayerMoney (source)
		if tonumber(miktar) >= 1000 then
				if (para >= tonumber(miktar)) then
				if ( string.find ( miktar, '%p' ) ) then return false end
				local bankaParasi = getElementData(accSys:getPlayerAcc(source), "pBank")
				takePlayerMoney (source,math.floor(miktar))
				setElementData(accSys:getPlayerAcc(source), "pBank", tonumber(bankaParasi) + math.floor(miktar))
				local bankaParasi2 = getElementData(accSys:getPlayerAcc(source), "pBank")
				local para = getPlayerMoney (source)
				triggerClientEvent(source, "paraYatirParaC", source,bankaParasi2,para," Mablagh $"..math.floor(miktar).." Be Hesab Shoma Ezafe Shod!")
				local pName = getPlayerName (source)
				local BankMiktar = getElementData(accSys:getPlayerAcc(source), "pBank")
			else 
				local bankaParasi2 = getElementData(accSys:getPlayerAcc(source), "pBank")
				local para = getPlayerMoney (source)
				triggerClientEvent(source, "paraYatirParaC", source,bankaParasi2,para,"Pool Shoma Kafi Nemibashad!")
			end
		else
			triggerClientEvent(source, "paraYatirParaC", source,bankaParasi2,para,"Na Motabar!")
		end
	end
end
)

addEvent("transferMoney",true) 
addEventHandler("transferMoney",root, 
function (target, meghdar, cash)
	local target = getPlayerFromName(target)
	local pname = getPlayerName(target)
	local pnames = getPlayerName(source)
	local cash = getElementData(accSys:getPlayerAcc(source), "pBank")
	local hiscash = getElementData(accSys:getPlayerAcc(target), "pBank")
	if target then
		if (meghdar) then
		local meghdar = tonumber(meghdar)
			if cash >= tonumber(meghdar) then
			if tonumber(cash) >= 1000 then
			if ( string.find ( cash, '%p' ) ) then return false end
				local Mahdodiatesh = tonumber(getElementData(accSys:getPlayerAcc(source), "pEnteghal"))
				if Mahdodiatesh >= meghdar then
					if source ~= target then
						if getElementData(accSys:getPlayerAcc(target), "pBankPass") ~= 0 then
							local Mahdodiatesh2 = tonumber(getElementData(accSys:getPlayerAcc(source), "pEnteghal"))
							local KamShe = Mahdodiatesh2 - tonumber(meghdar)
							setElementData(accSys:getPlayerAcc(source), "pEnteghal",tonumber(KamShe))
							setElementData(accSys:getPlayerAcc(source), "pBank", tonumber(cash) - math.floor(meghdar))
							setElementData(accSys:getPlayerAcc(target), "pBank", tonumber(hiscash) + math.floor(meghdar))
							outputChatBox("", source, 255,255,255,true)
							outputChatBox("#00ff00[Tarakonesh Movafagh]: #ffffffShoma Mablaghe #00ff00$"..math.floor(meghdar).." #ffffffBaraye #00ff00"..pname.." #ffffffVariz Kardid.", source ,255,255,255,true)
							exports.Logs:newLog("KartBeKart","Player "..getPlayerName(source).." Be Hesabe Player "..pname.." $"..math.floor(meghdar).." Variz Kard")
							outputDebugString("Player "..getPlayerName(source).." Be Hesabe Player "..pname.." $"..math.floor(meghdar).." Variz Kard")
							outputChatBox("#00ff00[Sms Bank]: #ffffffPlayer #00ff00"..pnames.." #ffffffMablaghe #00ff00$"..math.floor(meghdar).." #ffffffBaraye Shoma Variz Kard.", target, 255, 255, 255, true)
							triggerClientEvent(source, "clientTransferMoney", source,"rrr", cash)
						else
							outputChatBox("#ff0000✖️ #ffffffIn Player Hesabe Banki Nadarad!", source ,255,255,255,true)
						end
					else
						outputChatBox("#ff0000✖️ #ffffffEmkane Kart Be Kart Be Hesabe Khodetan Nis!", source ,255,255,255,true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffJa Be Jai Rozane Bish Az $300,000 Pol Mojaz Nist!", source, 255, 255, 255, true)
				end
			end
			else
				triggerClientEvent(source, "clientTransferMoney", source,cash, "Mojodi Shoma Kafi Nemibashad!")
			end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", source ,255,255,255,true) -- badan Fix She 2 Ta Player Peyda Nashod Ast --#zezaw
		end
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", source ,255,255,255,true)
	end
end
)

addEvent("sifreDegismeDenemesi",true) 
addEventHandler("sifreDegismeDenemesi",root, 
function (cevap,sifre)
 if (cevap and sifre) then
    local sifre2 = getElementData(accSys:getPlayerAcc(source), "pBankPass")
	local cevap2 = getElementData(accSys:getPlayerAcc(source), "pBankAnswer")
   if (tostring(cevap) == tostring(cevap2)) then
	 triggerClientEvent(source, "sifreYaziGoster", source,"Password Shoma Ba Movafaghiat Taghir Yaft!")
	 setElementData(accSys:getPlayerAcc(source), "pBankPass", sifre)
	else 
	local sifre = getElementData(accSys:getPlayerAcc(source), "pBankPass")
	triggerClientEvent(source, "sifreYaziGoster", source,"Javab Shoma Eshtebah Mibashad!")
end
end
end
)

addEvent("paraCekPara",true) 
addEventHandler("paraCekPara",root, 
function (miktar)
 	if (miktar) then
 		local mitkar = tonumber(mitkar)
  		local bankaParasi = getElementData(accSys:getPlayerAcc(source), "pBank")
    	if (tonumber(bankaParasi) >= tonumber(miktar)) then
   			if tonumber(bankaParasi) >= 1000 then
				if ( string.find ( miktar, '%p' ) ) then return false end
				    givePlayerMoney (source, math.floor(miktar))
				    setElementData(accSys:getPlayerAcc(source), "pBank", tonumber(bankaParasi) - math.floor(miktar))
				     local bankaParasi2 = getElementData(accSys:getPlayerAcc(source), "pBank")
				    triggerClientEvent(source, "paraCekParaC", source,bankaParasi2,"$"..math.floor(miktar).." Az Hesab Khod Bardashtid!")
				    local pName = getPlayerName (source)
				    local BankMiktar = getElementData(accSys:getPlayerAcc(source), "pBank")
		 	end
		else 
			local bankaParasi2 = getElementData(accSys:getPlayerAcc(source), "pBank")
			triggerClientEvent(source, "paraCekParaC", source,bankaParasi2,"Mojodi Shoma Kafi Nemibashad!")
		end
	end
end
)


----- blips ----
local blip = createBlip ( 1467.146484375 ,-1009.919921875 ,26.84375, 52 )
setElementData(blip, 'blipName', 'Bank LS')

