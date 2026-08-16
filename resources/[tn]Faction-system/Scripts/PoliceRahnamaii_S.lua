local accSys = exports["Accounts-system"] -- Code By ExMohmD
local miscSys = exports["Misc"] -- Telegram: @ExMohmD
local vehSys = exports["[tn]Ds"] -- Telegram: @ExMohmD

parkinG = createMarker ( 2989.2314453125 ,-789.267578125 ,10.794586181641, "cylinder", 130, 0, 0, 0, 0 )

function toghif( button, state, player )
	if button == "left" and state == "down" then
        if getElementType( source ) == "vehicle" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local distance = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if distance < 10 then
				if getElementData(player,"indutyPolice") == true then
					if getElementData(source,"owner") then
					local mx,my,mz = getElementPosition(parkinG)
					local PaRK = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
						if PaRK < 150 then
						if isElementFrozen(source) == false then
							setElementFrozen(source, true)
							outputChatBox("#45B40DShoma Khodroye : "..getElementData(source,"owner").." Toghif Kardid!", player, 255, 255, 255, true)
							outputChatBox("#0d6d00+9000 Toman", player, 255, 255, 255, true)
							givePlayerMoney(player, 9000)
							setElementDimension ( source, 9999 )
					else
						outputChatBox("#ff0000In Khodro Ghablan Toghif Shode!", player, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000Lotfan Mashin ro Dar Parking Markazi Toghif Konid!!", player, 255, 255, 255, true)
				end
				end
            end
        end
    end
end
end

addEventHandler( "onElementClicked", root, toghif )


DuTyRahnamaii = createPickup ( 221.0673828125 ,145.4228515625 ,1003.0234375, 3, 1275, 0)
setElementInterior ( DuTyRahnamaii, 3 )
setElementDimension ( DuTyRahnamaii, 2400 )

addCommandHandler("pduty",
function ( thePlayer, command )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 11 then
 local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(DuTyRahnamaii)
	local dutys = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
   if dutys < 5 then
	if getElementData(thePlayer,"indutyPolice") == true then
		setElementData(thePlayer,"indutyPolice",nil)
		outputChatBox("#ff0000Az Anjam Vazife Kharej Shodi!!", thePlayer, 255, 255, 255, true)
		setPedArmor(thePlayer, 0)
		takeAllWeapons ( thePlayer )
	else
		setElementData(thePlayer,"indutyPolice",true)
		outputChatBox("#00ff00Shoma dar Hal Anjam Vazife Shodid!!", thePlayer, 255, 255, 255, true)
		setPedArmor(thePlayer, 100)
		setElementHealth(thePlayer, 100)
		giveWeapon(thePlayer,24,1000)
	end
   else
	outputChatBox("#ff0000Error: Baraye Inkar Bayad Dar Mahale Duty Bashid!", thePlayer, 255, 255, 255, true)
   end
 end
end)

