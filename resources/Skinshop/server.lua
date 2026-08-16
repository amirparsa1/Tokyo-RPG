local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

function changePlayerSkin(ID,selectedSkin)
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pGoldPremium")) <= 0 then
		if ID ~= 231 and ID ~= 251 and ID ~= 145 and ID ~= 90 and ID ~= 148 and ID ~= 150 and ID ~= 152 and ID ~= 169 and ID ~= 190 and ID ~= 237 and ID ~= 66 and ID ~= 57 and ID ~= 58 and ID ~= 52 and ID ~= 51 and ID ~= 79 and ID ~= 78 and ID ~= 80 and ID ~= 81 and ID ~= 83 and ID ~= 142 and ID ~= 203 and ID ~= 204 and ID ~= 221  and ID ~= 222 then
			exports["notf"]:addNotification(source," Skin Ba Movafaghiat Set Shod.", 'success')
			triggerClientEvent ( source, "PlayMovafagh", source)
			triggerClientEvent ( source, "BasteShe", source)
			setElementModel(source,ID)
			setElementData(accSys:getPlayerAcc(source), "cSkin", ID)
		else
			triggerClientEvent ( source, "errorskin", source)
			triggerClientEvent ( source, "pbashid", source)
			
		end
	else
		exports["notf"]:addNotification(source," Skin Ba Movafaghiat Set Shod.", 'success')
		triggerClientEvent ( source, "PlayMovafagh", source)
		triggerClientEvent ( source, "BasteShe", source)
		setElementModel(source,ID)
		setElementData(accSys:getPlayerAcc(source), "cSkin", ID)
	end
end
addEvent("changePlayerSkin",true)
addEventHandler("changePlayerSkin",root,changePlayerSkin)

function setElemDimen(source,ID)
	setElementDimension(source,ID)
end
addEvent("setElemDimen",true)
addEventHandler("setElemDimen",root,setElemDimen)


-- #Edward ---
function setElemInterior(source,ID)
	setElementInterior(source,ID)
end
addEvent("setElemInterior",true)
addEventHandler("setElemInterior",root,setElemInterior)
-------------------------------------------------------


function setElemFrozen(source,bool)
	setElementFrozen(source,bool)
end
addEvent("setElemFrozen",true)
addEventHandler("setElemFrozen",root,setElemFrozen)

firstTime = true
function onSpawnFirstTime()
	triggerClientEvent(source,"onJoin",source,firstTime)
end
--addCommandHandler("giz", onSpawnFirstTime)
--addEventHandler("onPlayerJoin",root,onSpawnFirstTime)



function BindKonSetSkin (hitElement,matchingDimension)
	if hitElement and getElementType(hitElement) == "player" then
		exports["notf"]:addNotification(hitElement, "Ba Zadan Dokme ( B ) Skin Set Konid!" , 'info')
		triggerClientEvent ( hitElement, "Playinfo", hitElement)
		bindKey( hitElement, "B", "down", SetKonSkino )
	end
end

function UnBindKonSetSkin(hitElement,matchingDimension)
	if hitElement and getElementType(hitElement) == "player" then
		unbindKey( hitElement, "B", "down", SetKonSkino )
		unbindKey( hitElement, "B", "up", SetNakonSkin )
	end
end

firstTime = true
function SetKonSkino( thePlayer )
	triggerClientEvent(thePlayer,"onJoin",thePlayer,firstTime)
end
function createPomps ()
    Markeresh = createMarker(204.173828125 ,-159.78515625 ,999.500 , "cylinder",  1.3,111,175,230,60)
	setElementInterior ( Markeresh, 14 )
    addEventHandler("onMarkerHit",Markeresh, BindKonSetSkin)
		addEventHandler( "onMarkerLeave", Markeresh, UnBindKonSetSkin )
end	
createPomps()

