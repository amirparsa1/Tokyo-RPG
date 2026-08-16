local accSys = exports["Accounts-System"] -- Code By ExMmD | FearZone For Ever


local SfPostManGetJob = createMarker(-51.207801818848 ,-1391.4719238281 ,10.418999671936 , "cylinder", 1.0,0,221,221,211)
addEventHandler("onMarkerHit",SfPostManGetJob,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pJob")) == 0 then
			triggerClientEvent("ShowPostPanel", hitElement, hitElement)
		else
			outputChatBox("#ff0000[Error]: #ffffffShoma Darhal Hazer Shoghl Darid, #ffff00/estefa #ffffffBaraye Estefa Dadan!", hitElement,100,100,100, true)
		end
	end
end)

addEvent("GivePostManJob",true)
addEventHandler("GivePostManJob", root,
function (thePlayer)
	setElementData(accSys:getPlayerAcc(thePlayer), "pJob", 8)
	outputChatBox("#00ff00[Post-Man]: #ffffffTabrik, Shoma Post-Man Hastid!", thePlayer, 255, 255, 0,true)
end)

local SfPostLocations = {
	{ 524.22937011719 ,191.74066162109 ,14.453239440918, 548.32019042969 ,193.32073974609 ,14.453239440918 },
	{ 175.29032897949 ,-501.2958984375 ,11.068573951721, 129.06698608398 ,-521.40423583984 ,13.680848121643 },
	{ 215.3171081543 ,1235.7487792969 ,17.190567016602, 207.70718383789 ,1232.9500732422 ,17.35857963562 },
	{ 108.34312438965 ,-815.27697753906 ,10.270168304443, 94.991409301758 ,-808.25219726563 ,10.425338745117 },
	{ 167.82690429688 ,-1520.4482421875 ,10.863092422485, 158.77656555176 ,-1516.5952148438 ,10.967138290405 },
	{ -87.842567443848 ,-1299.1271972656 ,10.426812171936, -80.275184631348 ,-1299.0041503906 ,10.418999671936 },
	{ -275.53549194336 ,-380.45724487305 ,11.111083984375, -250.39093017578 ,-329.02075195313 ,10.169408798218 },
	{ -560.54248046875 ,-494.73184204102 ,11.002144813538, -568.07794189453 ,-541.52062988281 ,10.577805519104 },
	{ -379.98541259766 ,-517.78118896484 ,12.751400947571, -378.84371948242 ,-541.36975097656 ,17.243061065674 },	
	{ 536.77099609375 ,-97.114677429199 ,10.357142448425, 531.52099609375 ,-112.6810836792 ,10.707937240601 },
	{ 547.1083984375 ,530.4453125 ,10.864404678345, 561.79486083984 ,530.18438720703 ,12.016744613647 },
	{ 512.25750732422 ,1031.4797363281 ,17.940292358398, 556.79827880859 ,1010.0530395508 ,21.022964477539 },
	{ -845.97473144531 ,1037.8012695313 ,15.705657958984, -837.81262207031 ,1038.1235351563 ,15.705657958984 },
	{ -310.50891113281 ,1188.4143066406 ,10.864738464355, -298.37097167969 ,1184.2054443359 ,10.91778755188 },
	{ -303.64367675781 ,1210.0646972656 ,10.864738464355, -291.00280761719 ,1206.5374755859 ,11.028933525085 },
	{ -866.86633300781 ,766.89447021484 ,10.873832702637, -872.96997070313 ,752.88989257813 ,11.044639587402 },
	{ -312.41418457031 ,1334.9436035156 ,11.560050964355, -294.11514282227 ,1359.47265625 ,11.360000610352 },
	{ -725.69360351563 ,264.47711181641 ,10.891258239746, -749.4755859375 ,256.20562744141 ,16.29487991333 },
	{ -752.48571777344 ,128.36618041992 ,10.880990982056, -771.86901855469 ,132.25277709961 ,10.939586639404 },
	{ -868.63250732422 ,-403.50134277344 ,10.887702941895, -885.44830322266 ,-402.55194091797 ,13.34098815918 },
	{ -862.53680419922 ,-468.26989746094 ,10.881011962891, -883.58679199219 ,-470.0309753418 ,13.068309783936 },
	{ -825.28540039063 ,-763.68511962891 ,10.888679504395, -839.82183837891 ,-765.14672851563 ,11.760124206543 },
	{ -829.68725585938 ,-969.46038818359 ,10.887191772461, -846.89385986328 ,-968.51080322266 ,11.065898895264 },
	{ -830.48413085938 ,-1017.2816772461 ,10.887191772461, -845.27862548828 ,-1017.6992797852 ,12.262492179871 },
	{ -994.17565917969 ,-1169.4825439453 ,14.798236846924, -1015.2987060547 ,-1165.2247314453 ,14.82839012146 },
	{ -1220.5004882813 ,-1227.1801757813 ,14.660752296448, -1224.0834960938 ,-1241.2846679688 ,14.653264045715 },
	{ -1199.1407470703 ,-871.13635253906 ,14.655482292175, -1187.1435546875 ,-871.76354980469 ,14.831503868103 },
	{ -1086.2802734375 ,-519.16955566406 ,11.111526489258, -1067.1112060547 ,-515.93212890625 ,11.121612548828 },
	{ -1200.3195800781 ,-348.52075195313 ,10.738719940186, -1207.2043457031 ,-343.35668945313 ,10.737232208252 },
	{ -1155.1550292969 ,-76.778823852539 ,11.367448806763, -1157.3825683594 ,-66.756713867188 ,11.405611038208 },
	{ -1153.9577636719 ,-84.066909790039 ,11.369351387024, -1148.7277832031 ,-88.21012878418 ,11.40691280365 },
	{ -1010.2196044922 ,268.55471801758 ,11.154140472412, -1003.3755493164 ,267.96813964844 ,11.223171234131 },
	{ -873.49090576172 ,318.08026123047 ,11.169853210449, -870.34313964844 ,338.14712524414 ,11.220903396606 },
	{ -419.82147216797 ,940.28405761719 ,10.869033813477, -470.70007324219 ,949.88507080078 ,13.025512695313 },
	{ -524.31378173828 ,1118.6046142578 ,10.863647460938, -509.23498535156 ,1148.4206542969 ,18.13256072998 },
	{ -702.65802001953 ,1173.1774902344 ,10.858779907227, -701.52185058594 ,1162.7092285156 ,11.04644203186 },
	{ -873.87023925781 ,866.76556396484 ,10.873832702637, -915.67102050781 ,866.34912109375 ,11.058769226074 },
	{ -768.69219970703 ,1481.8580322266 ,12.037399291992, -769.32580566406 ,1493.3513183594 ,12.210112571716 },
	{ 35.244472503662 ,1071.0987548828 ,12.424486160278, 75.349945068359 ,1080.6856689453 ,16.211254119873 },
	{ 92.27530670166 ,905.32061767578 ,10.70566368103, 89.83487701416 ,899.63116455078 ,10.69939994812 },
	{ 429.39819335938 ,771.17297363281 ,11.192794799805, 443.96630859375 ,770.87841796875 ,12.76212978363 },
	{ 509.35745239258 ,485.2265625 ,11.194065093994, 509.02783203125 ,512.72448730469 ,12.068943023682 },
	{ 18.176452636719 ,-1476.0333251953 ,10.268308639526, 14.06144618988 ,-1494.2255859375 ,12.785758972168},
	{ 167.54327392578 ,-1267.4815673828 ,10.238875389099, 160.40264892578 ,-1274.3018798828 ,10.395125389099 },
	{ 355.55163574219 ,-825.57794189453 ,10.860456466675, 349.25280761719 ,-823.26739501953 ,11.032331466675 },
	{ 360.82818603516 ,-663.55102539063 ,9.9748058319092, 366.59869384766 ,-665.38012695313 ,10.176389694214 },
	{ 322.38214111328 ,-60.588584899902 ,9.7099838256836, 339.04049682617 ,-62.114593505859 ,11.470980644226 },
	{ 316.37512207031 ,246.27365112305 ,11.418272018433, 294.60177612305 ,283.42401123047 ,17.682746887207 },
	{ 442.11514282227 ,559.90740966797 ,11.532114028931, 443.88369750977 ,527.22601318359 ,11.606477737427 },
	{ 192.72294616699 ,-399.681640625 ,10.844174385071, 205.93911743164 ,-397.19036865234 ,11.006723403931 },
	{ -999.16955566406 ,-671.5751953125 ,11.580937385559, -996.67956542969 ,-685.50659179688 ,11.73669052124 },
}
--{ X1, Y1, Z1, X2, Y2, Z2 },

local SfPVehicle = {}
local SfPNowPostMarker1ID = {}
local SfPNowPostMarker1 = {}
local SfPNowPostMarker2ID = {}
local SfPNowPostMarker2 = {}
local SfPNowPostBlip = {}

addEventHandler ( "onVehicleStartEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if vehid == "PM1" or vehid == "PM2" or vehid == "PM3" or vehid == "PM4" or vehid == "PM5" or vehid == "PM6" or vehid == "PM7" or vehid == "PM8" or vehid == "PM9" or vehid == "PM10" then
		if jacked then outputChatBox ( "#ff0000Error: Bande Khoda Dare Kar Mikone Azar Dari Mage!", thePlayer, 230,0,0 ,true) cancelEvent() return false end
		if seat == 0 then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJob")) ~= 8 then
				cancelEvent()
				outputChatBox ( "#ff0000Error: Shoma Post Man Nistid!", thePlayer, 230,0,0 ,true)
			end
		end
	end
end)

addEventHandler ( "onVehicleEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if vehid == "PM1" or vehid == "PM2" or vehid == "PM3" or vehid == "PM4" or vehid == "PM5" or vehid == "PM6" or vehid == "PM7" or vehid == "PM8" or vehid == "PM9" or vehid == "PM10" then
		if seat == 0 then
			if not SfPNowPostMarker1[thePlayer] then
				if not SfPVehicle[thePlayer] then
					SfPVehicle[thePlayer] = source
				end
				local Shansi = math.random( 1 , 50 )
				SfPNowPostMarker1[thePlayer] = createMarker(SfPostLocations[Shansi][1],SfPostLocations[Shansi][2],SfPostLocations[Shansi][3]-2,"checkpoint",3,255, 255, 0,200, thePlayer)
				SfPNowPostMarker1ID[SfPNowPostMarker1[thePlayer]] = Shansi
				SfPNowPostBlip[thePlayer] = createBlipAttachedTo(SfPNowPostMarker1[thePlayer], 56, 2, 255, 0, 0, 255,  0 , 65535,thePlayer)
			end
		end
	end
end)

--Khord Be Marker Aval
addEventHandler("onMarkerHit", resourceRoot,
function (hitElement,matchingDimension)
	if (getElementType(hitElement) == "player" and tonumber(getElementData(accSys:getPlayerAcc(hitElement),"pJob")) == 8 and isPedInVehicle(hitElement))  then
		if SfPNowPostMarker1[hitElement] == source then
			local vehicle = getPedOccupiedVehicle(hitElement)
			if SfPVehicle[hitElement] == vehicle then
				setElementFrozen(SfPVehicle[hitElement] ,true)
				local Shansi = SfPNowPostMarker1ID[SfPNowPostMarker1[hitElement]] 
				SfPNowPostMarker1ID[SfPNowPostMarker1[hitElement]] = nil
				destroyElement(SfPNowPostMarker1[hitElement]) 
				SfPNowPostMarker1[hitElement] = nil
				destroyElement(SfPNowPostBlip[hitElement]) 
				SfPNowPostBlip[hitElement] = nil
				SfPNowPostMarker2[hitElement] = createMarker(SfPostLocations[Shansi][4],SfPostLocations[Shansi][5],SfPostLocations[Shansi][6]-2,"checkpoint",2,255, 255, 0,200, hitElement)
				SfPNowPostBlip[hitElement] = createBlipAttachedTo(SfPNowPostMarker2[hitElement], 56, 2, 255, 0, 0, 255,  0 , 65535,hitElement)
				exports["notf"]:addNotification(hitElement, "Az Motor Piade Sho Va Name Ra Tahvil Bede!" , 'info')
			end
		end
	end
end)

--Khord Be Marker Dovom
addEventHandler("onMarkerHit", resourceRoot,
function (hitElement,matchingDimension)
	if (getElementType(hitElement) == "player" and tonumber(getElementData(accSys:getPlayerAcc(hitElement),"pJob")) == 8 )  then
		if SfPNowPostMarker2[hitElement] == source then
			setElementFrozen(hitElement,true)
			destroyElement(SfPNowPostMarker2[hitElement])
			SfPNowPostMarker2[hitElement] = nil
			destroyElement(SfPNowPostBlip[hitElement]) 
			SfPNowPostBlip[hitElement] = nil
			setPedAnimation( hitElement, "ped","idle_chat", -1, true, false, false )
			exports["notf"]:addNotification(hitElement, "Dar Hale Tahvile Name , Sabr Konid ..." , 'info')
				setTimer(function()
					setPedAnimation ( hitElement )
					setElementFrozen(hitElement,false)
					if SfPVehicle[hitElement] then
						setElementFrozen(SfPVehicle[hitElement] ,false)
					end
					local mablagh = 0
					if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill")) <= 50 then--skill 1
						mablagh = math.random(400,500)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill")) <= 100 then--skill 2
						mablagh = math.random(500,600)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill")) <= 200 then--skill 3
						mablagh = math.random(600,700)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill")) <= 300 then--skill 4
						mablagh = math.random(750,900)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill")) > 300 then--skill 5
						mablagh = math.random(900,1200)
					end
					local PmExtraMoney = 0
					if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pVip")) > 0 then
						PmExtraMoney = math.floor( (tonumber(mablagh) / 100) * 10 )
					end
					givePlayerMoney(hitElement,mablagh+PmExtraMoney)
					skillebadipb = tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill")) + 1
					setElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill",skillebadipb)
					if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill")) <= 50 then--skill 1
						outputChatBox("#00ff00[Post-Man]: #ffffffShoma Name Ro Tahvil Dadid! Dastmozd : "..mablagh.."#00ff00$ #ffffff+ "..PmExtraMoney.."#00ff00$ #ffae00(Skill 1 | " ..skillebadipb.." / 50)", hitElement, 255, 255, 0,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill")) <= 100 then--skill 2
						outputChatBox("#00ff00[Post-Man]: #ffffffShoma Name Ro Tahvil Dadid! Dastmozd : "..mablagh.."#00ff00$ #ffffff+ "..PmExtraMoney.."#00ff00$ #ffae00(Skill 1 | " ..skillebadipb.." / 100)", hitElement, 255, 255, 0,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill")) <= 200 then--skill 3
						outputChatBox("#00ff00[Post-Man]: #ffffffShoma Name Ro Tahvil Dadid! Dastmozd : "..mablagh.."#00ff00$ #ffffff+ "..PmExtraMoney.."#00ff00$ #ffae00(Skill 1 | " ..skillebadipb.." / 200)", hitElement, 255, 255, 0,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill")) <= 300 then--skill 4
						outputChatBox("#00ff00[Post-Man]: #ffffffShoma Name Ro Tahvil Dadid! Dastmozd : "..mablagh.."#00ff00$ #ffffff+ "..PmExtraMoney.."#00ff00$ #ffae00(Skill 1 | " ..skillebadipb.." / 300)", hitElement, 255, 255, 0,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pPostmanSkill")) > 300 then--skill 5
						outputChatBox("#00ff00[Post-Man]: #ffffffShoma Name Ro Tahvil Dadid! Dastmozd : "..mablagh.."#00ff00$ #ffffff+ "..PmExtraMoney.."#00ff00$ #ffae00(Skill 1 | " ..skillebadipb.." / Max)", hitElement, 255, 255, 0,true)
					end
				end, 5000, 1)
		end
	end
end)

--pPizzaBoySkill
addEventHandler( "onPlayerQuit", getRootElement( ),
function()
	if SfPNowPostMarker1[source] then
		destroyElement(SfPNowPostMarker1[source]) 
		SfPNowPostMarker1[source] = nil
		destroyElement(SfPNowPostBlip[source]) 
		SfPNowPostBlip[source] = nil
	end
	if SfPNowPostMarker2[source] then
		destroyElement(SfPNowPostMarker2[source]) 
		SfPNowPostMarker2[source] = nil
		destroyElement(SfPNowPostBlip[source]) 
		SfPNowPostBlip[source] = nil
	end
	if SfPVehicle[source] then
		SfPVehicle[source] = nil
		setElementFrozen(SfPVehicle[source],false)
	end
end)

addEventHandler("onVehicleExplode", getRootElement(),
function ()
	local vehid = getElementID ( source )
	if vehid == "PM1" or vehid == "PM2" or vehid == "PM3" or vehid == "PM4" or vehid == "PM5" 
	or vehid == "PM6" or vehid == "PM7" or vehid == "PM8" or vehid == "PM9" or vehid == "PM10" then
		local find = getVehicleController ( source )
		if find then
			if SfPVehicle[find] == source then
				if SfPNowPostMarker1[find] then
					destroyElement(SfPNowPostMarker1[find]) 
					SfPNowPostMarker1[find] = nil
					destroyElement(SfPNowPostBlip[find]) 
					SfPNowPostBlip[find] = nil
				end
				if SfPNowPostMarker2[find] then
					destroyElement(SfPNowPostMarker2[find]) 
					SfPNowPostMarker2[find] = nil
					destroyElement(SfPNowPostBlip[find]) 
					SfPNowPostBlip[find] = nil
				end
				if SfPVehicle[find] then
					SfPVehicle[find] = nil
				end
				outputChatBox("#ff0000[Post-Man]: #ffffffMotore Shoma Terekid Va Kare Shoma Be Payan Resid!", find, 255, 255, 255, true)
				setVehicleEngineState(source, false)
				setVehicleLocked(source, false)
				setElementFrozen(source, false)
			end
		end
	end
end)

addEventHandler("onVehicleStartExit",getRootElement(),
function (thePlayer,seat)
	if SfPVehicle[thePlayer] == source then
		if seat == 0 then
			if not isElementFrozen(source) then
				exports["[TN]Jobs"]:RespawnJobVehOnExit ( SfPVehicle[thePlayer] )
				if SfPNowPostMarker2[thePlayer] then
					destroyElement(SfPNowPostMarker2[thePlayer]) 
					SfPNowPostMarker2[thePlayer] = nil
					destroyElement(SfPNowPostBlip[thePlayer]) 
					SfPNowPostBlip[thePlayer] = nil
				end
				if SfPNowPostMarker1[thePlayer] then
					destroyElement(SfPNowPostMarker1[thePlayer]) 
					SfPNowPostMarker1[thePlayer] = nil
					destroyElement(SfPNowPostBlip[thePlayer]) 
					SfPNowPostBlip[thePlayer] = nil
				end
				if SfPVehicle[thePlayer] then
					SfPVehicle[thePlayer] = nil
				end
			end
		end
	end
end)

addEventHandler("onPlayerWasted",getRootElement(),
function ( )
    --local OccupiedVeh = getPedOccupiedVehicle(source)
	if SfPVehicle[source] then
	    if SfPNowPostMarker2[source] then
			if PNowPost[source] then
				destroyElement(PNowPost[source])
				PNowPost[source] = nil
				setElementFrozen(source,false)
			end
			destroyElement(SfPNowPostMarker2[source]) 
			SfPNowPostMarker2[source] = nil
			destroyElement(SfPNowPostBlip[source]) 
			SfPNowPostBlip[source] = nil
		end
	    if SfPNowPostMarker1[source] then
			destroyElement(SfPNowPostMarker1[source]) 
			SfPNowPostMarker1[source] = nil
			destroyElement(SfPNowPostBlip[source]) 
			SfPNowPostBlip[source] = nil
		end
		respawnVehicle(SfPVehicle[source])
		SfPVehicle[source] = nil
	end
end)


-- The End --