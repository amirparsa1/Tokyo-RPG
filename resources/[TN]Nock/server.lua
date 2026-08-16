local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
function SendMasseg(text,thePlayer)
    outputChatBox("#fa8072(Nock-System): #ffffff"..text, thePlayer, 255, 255, 255, true)
end
fasele = 2
addCommandHandler("revive",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 4 then
		SendMasseg("#ff7700Baraye Inkar Bayad Ozv Faction Medic Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if (player == nil) then
		SendMasseg("#ff7700Bezan: /revive <partOfName/ID>", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	if find ~= thePlayer then 
		local x, y, z = getElementPosition( thePlayer )
		local fx, fy, fz = getElementPosition( find )
		local myInt = getElementInterior(thePlayer)
		local myDim = getElementDimension(thePlayer)
		local yourInt = getElementInterior(find)
		local yourDim = getElementDimension(find)
		local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
		if de < fasele then
			if myInt == yourInt and myDim == yourDim then
				if getElementHealth ( find ) < 1 then
                    setElementFrozen(thePlayer,true)
                    setPedAnimation(thePlayer, "medic", "cpr", 3000,false)
					setTimer(function()
						-- FIX (bugfix pass 4): the element can be gone by the time this timer
						--   fires (player quit / object destroyed). Without this guard MTA
						--   raises "Bad argument" and the rest of the callback never runs.
						if not isElement(thePlayer) then return end
                        setElementData(find,"pNockTime",0)
                        spawnPlayer(find, fx, fy, fz, 270)
                        setElementDimension(find, myInt)
                        setElementData(thePlayer,"NeedRebvive",false)
                        setElementInterior(find, myDim)
                        SendMasseg("Shoma Tavasote DR."..getPlayerName(thePlayer).." Revive Shodid.", find, 255, 255, 255, true)
                        SendMasseg("Shoma Bimar "..getPlayerName(find).." Ra Darman Kardid. #00FF00+10000$", thePlayer, 255, 255, 255, true)
                        givePlayerMoney (thePlayer , 10000)
                        if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) == 0 then
                            setElementModel(find, tonumber(getElementData(accSys:getPlayerAcc(find), "cSkin")))
                        else
                            setElementModel(find, tonumber(getElementData(accSys:getPlayerAcc(find), "fSkin")))
                        end
                        fadeCamera(find, true, 1)
                        setCameraTarget(find,find)
                        setElementFrozen(thePlayer,false)
                        setPedAnimation(find, "ped", "getup_front", 1,false)
                        setElementFrozen(find,false)
                    end,7700,1)
				else
					SendMasseg("In Shakhs Ke Halesh Khobe!!", thePlayer)
				end
			else
				SendMasseg("Baraye Inkar Bayad Be Shakhs Nazdik Bashid!", thePlayer)
			end
		else
			SendMasseg("Baraye Inkar Bayad Be Shakhs Nazdik Bashid!", thePlayer)
		end
	else
		SendMasseg("Shakhs Yaft Nashod!", thePlayer)
	end
end)
