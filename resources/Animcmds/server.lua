
--[ Script By ExoPrim ]--
local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
local AnAnimSys = exports["[TN]CustomAnim"]
animSpam = {}
----- F for Lagv Animation ---
function stopanim( thePlayer )
	if animSpam[thePlayer] == 0 then 
		unbindKey( thePlayer, "F", "down", "stopanim" )
		setPedAnimation ( thePlayer )
		animSpam[thePlayer] = 1
	end
end
addCommandHandler( "stopanim", stopanim )
addEvent("stopanim",true)
addEventHandler("stopanim", root, stopanim)
-- (( Sit )) --

function sit ( thePlayer, command,  arg )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed == false then
		if (arg) then
			if isPedOnGround (thePlayer) then
				if not isPedInVehicle(thePlayer) then
					local sitnumber = arg
					if tonumber(sitnumber) == 1 then
						setPedAnimation(thePlayer,"BEACH","ParkSit_M_loop",-1,false, false, false, true)
					elseif tonumber(sitnumber) == 2 then
						setPedAnimation(thePlayer,"BEACH","ParkSit_W_loop",-1,false, false, false, true)
					elseif tonumber(sitnumber) == 3 then
						setPedAnimation(thePlayer,"BEACH","Lay_Bac_Loop",-1,false, false, false, true)
					elseif tonumber(sitnumber) == 4 then
						setPedAnimation(thePlayer,"BEACH","SitnWait_loop_W",-1,false, false, false, true)
					else
						outputChatBox("#ff0000✖️ #ffffffID Sit Eshtebah Mibashad!", thePlayer, 255, 255, 255, true)
					end
						animSpam[thePlayer] = 0
						bindKey( thePlayer, "F", "down", "stopanim" )
				else
					outputChatBox("#ff0000✖️ #ffffffTo Mashin Nemishe Sit Kard!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffInja Nemishe Sit Kard!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /sit  <1~4>", thePlayer, 255, 255, 255, true)
		end
	end
end
addCommandHandler("sit", sit )
---------------------------------------------------------------------------------------------


-- (( Dance )) --

function dance ( thePlayer, command,  arg )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
if (arg) then
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		local dancenumber = arg
		if tonumber(dancenumber) == 1 then
			setPedAnimation(thePlayer,"dancing","dnce_m_b",-1,true, false, false, false)
		elseif tonumber(dancenumber) == 2 then
			setPedAnimation(thePlayer,"dancing","bd_clap",-1,true, false, false, false)
		elseif tonumber(dancenumber) == 3 then
			setPedAnimation(thePlayer,"dancing","bd_clap1",-1,true, false, false, false)
		elseif tonumber(dancenumber) == 4 then
			setPedAnimation(thePlayer,"dancing","dan_loop_a",-1,true, false, false, false)
		elseif tonumber(dancenumber) == 5 then
			setPedAnimation(thePlayer,"dancing","dance_loop",-1,true, false, false, false)
		elseif tonumber(dancenumber) == 6 then
			setPedAnimation(thePlayer,"dancing","dan_down_a",-1,true, false, false, false)
		elseif tonumber(dancenumber) == 7 then
			setPedAnimation(thePlayer,"dancing","dnce_m_c",-1,true, false, false, false)
		elseif tonumber(dancenumber) == 8 then
			setPedAnimation(thePlayer,"dancing","dnce_m_d",-1,true, false, false, false)
		elseif tonumber(dancenumber) == 9 then
			setPedAnimation(thePlayer,"dancing","dan_right_a",-1,true, false, false, false)
		elseif tonumber(dancenumber) == 10 then
			setPedAnimation(thePlayer,"dancing","dan_left_a",-1,true, false, false, false)
		else
			outputChatBox("#ff0000✖️ #ffffffID Dance Eshtebah Mibashad!", thePlayer, 255, 255, 255, true)
		end
			animSpam[thePlayer] = 0
			bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /dance  <1~10>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("dance",dance )
------------------------------------------------------------------------------------------

-- (( Kiss )) --


function kiss ( thePlayer, command,  arg )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
if (arg) then
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		local kissnumber = arg
		if tonumber(kissnumber) == 1 then
			setPedAnimation(thePlayer,"kissing","grlfrd_kiss_03",-1,false, false, false, false)
		elseif tonumber(kissnumber) == 2 then
			setPedAnimation(thePlayer,"kissing","grlfrd_kiss_02",-1,false, false, false, false)
		elseif tonumber(kissnumber) == 3 then
			setPedAnimation(thePlayer,"kissing","grlfrd_kiss_01",-1,false, false, false, false)
		else
			outputChatBox("#ff0000✖️ #ffffffID Kiss Eshtebah Mibashad!", thePlayer, 255, 255, 255, true)
		end
			animSpam[thePlayer] = 0
			bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffTo Mashin Nemishe Kiss Kard!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffInja Nemishe Kiss Kard!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /kiss  <1~3>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("kiss", kiss )

-----------------------------------------------------------------------------------------

-- (( lati )) --


function lati ( thePlayer, command )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		setPedAnimation(thePlayer,"rapping","rap_b_loop",-1,true, false, false, false)
		animSpam[thePlayer] = 0
		bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("lati", lati )


function harf ( thePlayer, command )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
	if isPedOnGround (thePlayer) then
		if not isPedInVehicle(thePlayer) then
			setPedAnimation(thePlayer,"gangs","prtial_gngtlkc",-1,true,false)
			animSpam[thePlayer] = 0
			bindKey( thePlayer, "F", "down", "stopanim" )
		else
			outputChatBox("#ff0000Dar Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("harf", harf )

-----------------------------------------------------------------------------------------

-- (( gerye )) --


function gerye ( thePlayer, command )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		setPedAnimation(thePlayer,"graveyard","mrnf_loop",-1,true, false, false, false)
		animSpam[thePlayer] = 0
		bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("gerye", gerye )
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------



function smoker ( thePlayer, command )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		setPedAnimation(thePlayer,"shop","smoke_ryd",-1,true, false, false, false)
		animSpam[thePlayer] = 0
		bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("smoker", smoker)


-----------------------------------------------------------------------------------------

function tashvigh ( thePlayer, command,  arg )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
if (arg) then
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		local tashvighnumber = arg
		if tonumber(tashvighnumber) == 1 then
			setPedAnimation(thePlayer,"on_lookers","shout_in",-1,true, false, false, false)
		elseif tonumber(tashvighnumber) == 2 then
			setPedAnimation(thePlayer,"on_lookers","shout_02",-1,true, false, false, false)
		elseif tonumber(tashvighnumber) == 3 then
			setPedAnimation(thePlayer,"on_lookers","wave_loop",-1,true, false, false, false)
		elseif tonumber(tashvighnumber) == 4 then
			setPedAnimation(thePlayer,"on_lookers","point_loop",-1,true, false, false, false)
		elseif tonumber(tashvighnumber) == 5 then
			setPedAnimation(thePlayer,"CASINO","manwinb",-1,true, false, false, false)
		elseif tonumber(tashvighnumber) == 6 then
			setPedAnimation(thePlayer,"STRIP","PUN_HOLLER",-1,true, false, false, false)
	
		else
			outputChatBox("#ff0000✖️ #ffffffID tashvigh Eshtebah Mibashad!", thePlayer, 255, 255, 255, true)
		end
			animSpam[thePlayer] = 0	
			bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /tashvigh  <1~6>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("tashvigh", tashvigh )


function salam ( thePlayer, command )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		setPedAnimation(thePlayer,"BD_FIRE","BD_GF_Wave",-1,true, false, false, false)
		animSpam[thePlayer] = 0
		bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("salam", salam )


-----------------------------------------------------------------------------------------

function camera ( thePlayer, command,  arg )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
if (arg) then
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		local cameranumber = arg
		if tonumber(cameranumber) == 1 then
			setPedAnimation(thePlayer,"CAMERA","camcrch_idleloop",-1,false, false, false, true)
		elseif tonumber(cameranumber) == 2 then
			setPedAnimation(thePlayer,"CAMERA","camcrch_stay",-1,false, false, false, true)
		elseif tonumber(cameranumber) == 3 then
			setPedAnimation(thePlayer,"CAMERA","piccrch_out",-1,false, false, false, true)
		elseif tonumber(cameranumber) == 4 then
			setPedAnimation(thePlayer,"CAMERA","camstnd_to_camcrch",-1,false, false, false, true)

	
		else
			outputChatBox("#ff0000✖️ #ffffffID Camera Eshtebah Mibashad!", thePlayer, 255, 255, 255, true)
		end
			animSpam[thePlayer] = 0
			bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan:  /camera  <1~4>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("camera", camera )

-------------------------------------------------------------------------------------------------



-- (( strip )) --

function strip ( thePlayer, command,  arg )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
if (arg) then
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		local stripnumber = arg
		if tonumber(stripnumber) == 1 then
			setPedAnimation(thePlayer,"STRIP","strip_A",-1,true, false, false, false)
		elseif tonumber(stripnumber) == 2 then
			setPedAnimation(thePlayer,"STRIP","strip_C",-1,true, false, false, false)
		elseif tonumber(stripnumber) == 3 then
			setPedAnimation(thePlayer,"STRIP","strip_E",-1,true, false, false, false)
		elseif tonumber(stripnumber) == 4 then
			setPedAnimation(thePlayer,"STRIP","strip_D",-1,true, false, false, false)
		elseif tonumber(stripnumber) == 5 then
			setPedAnimation(thePlayer,"STRIP","strip_G",-1,true, false, false, false)
		elseif tonumber(stripnumber) == 6 then
			setPedAnimation(thePlayer,"STRIP","strip_F",-1,true, false, false, false)
		elseif tonumber(stripnumber) == 7 then
			setPedAnimation(thePlayer,"STRIP","STR_B2C",-1,true, false, false, false)
		elseif tonumber(stripnumber) == 8 then
			setPedAnimation(thePlayer,"STRIP","STR_C1",-1,true, false, false, false)
		elseif tonumber(stripnumber) == 9 then
			setPedAnimation(thePlayer,"STRIP","STR_C2",-1,true, false, false, false)
		elseif tonumber(stripnumber) == 10 then
			setPedAnimation(thePlayer,"STRIP","STR_loop_A",-1,true, false, false, false)
		elseif tonumber(stripnumber) == 11 then
			setPedAnimation(thePlayer,"STRIP","STR_loop_C",-1,true, false, false, false)
		else
			outputChatBox("#ff0000✖️ #ffffffID Strip Eshtebah Mibashad!", thePlayer, 255, 255, 255, true)
		end
			animSpam[thePlayer] = 0
			bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /strip  <1~11>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("strip",strip )
------------------------------------------------------------------------------------------




-- (( Rap )) --

function rap ( thePlayer, cmd,  arg )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
	if not isPedInVehicle(thePlayer) then
		setPedAnimation(thePlayer,"rapping","rap_c_loop",-1,true,false)
		bindKey( thePlayer, "W", "down", "stopanim" )
		bindKey( thePlayer, "A", "down", "stopanim" )
		bindKey( thePlayer, "S", "down", "stopanim" )
		bindKey( thePlayer, "D", "down", "stopanim" )
	end
end
addCommandHandler("rap", rap )






---------------------------------------  Premium  ----------------------------------------
----------------------------------------**********------------------------------------------




------------------------------- Parkour -------------------------------------

function parkour ( thePlayer, cmd,  arg )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGoldPremium")) <= 0 then
		outputChatBox("#ff0000Baraye Inkar Bayad MemberShip Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
if (arg) then
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		local parkournum = arg

		if tonumber(parkournum) == 1 then
			AnAnimSys:setPedParkourAnimation(thePlayer,"BckHndSpingBTuck",-1,true,false,false,false)
		elseif tonumber(parkournum) == 2 then
			AnAnimSys:setPedParkourAnimation(thePlayer,"BckHndSping",-1,true,false,false,false)
		elseif tonumber(parkournum) == 3 then
			AnAnimSys:setPedParkourAnimation(thePlayer,"CartWheel",-1,true,false,false,false)
		elseif tonumber(parkournum) == 4 then
			AnAnimSys:setPedParkourAnimation(thePlayer,"FrntHndSpring",-1,true,false,false,false)
		elseif tonumber(parkournum) == 5 then
			AnAnimSys:setPedParkourAnimation(thePlayer,"HandPlant",-1,true,false,false,false)
		else
			outputChatBox("#ff0000✖️ #ffffffID Parkour Eshtebah Mibashad!", thePlayer, 255, 255, 255, true)
		end
			animSpam[thePlayer] = 0
			bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /parkour  <1~5>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("parkour", parkour )




------------------------------- baile -------------------------------------




function baile ( thePlayer, cmd,  arg )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGoldPremium")) <= 0 then
		outputChatBox("#ff0000Baraye Inkar Bayad Gold Premium Bashid!", thePlayer, 255, 255, 255, true)
		return false
end
if (arg) then
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		local bailenum = arg
		if tonumber(bailenum) == 1 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 1",-1,true,false,false,false)
		elseif tonumber(bailenum) == 2 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 2",-1,true,false,false,false)
		elseif tonumber(bailenum) == 3 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 3",-1,true,false,false,false)
		elseif tonumber(bailenum) == 4 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 4",-1,true,false,false,false)
		elseif tonumber(bailenum) == 5 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 5",-1,true,false,false,false)
		elseif tonumber(bailenum) == 6 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 6",-1,true,false,false,false)
		elseif tonumber(bailenum) == 7 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 7",-1,true,false,false,false)
		elseif tonumber(bailenum) == 8 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 8",-1,true,false,false,false)
		elseif tonumber(bailenum) == 9 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 9",-1,true,false,false,false)
		elseif tonumber(bailenum) == 10 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 10",-1,true,false,false,false)
		elseif tonumber(bailenum) == 11 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 11",-1,true,false,false,false)
		elseif tonumber(bailenum) == 12 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 12",-1,true,false,false,false)
		elseif tonumber(bailenum) == 13 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 13",-1,true,false,false,false)
		else
			outputChatBox("#ff0000✖️ #ffffffID baile Eshtebah Mibashad!", thePlayer, 255, 255, 255, true)
		end
			animSpam[thePlayer] = 0
			bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /baile  <1~13>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("baile", baile )






------------------------------- Raghs -------------------------------------



function raghs ( thePlayer, command,  arg )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGoldPremium")) <= 0 then
		outputChatBox("#ff0000Baraye Inkar Bayad Gold Premium Bashid!", thePlayer, 255, 255, 255, true)
		return false
		end
if (arg) then
	if isPedOnGround (thePlayer) then
	if not isPedInVehicle(thePlayer) then
		local raghs = arg
		if tonumber(raghs) == 1 then
			AnAnimSys:setPedBDAnimation1(thePlayer,"bd_1",-1,true,false,false,false)
		elseif tonumber(raghs) == 2 then
			AnAnimSys:setPedBDAnimation1(thePlayer,"bd_2",-1,true,false,false,false)
		elseif tonumber(raghs) == 3 then
			AnAnimSys:setPedBDAnimation1(thePlayer,"bd_3",-1,true,false,false,false)
		elseif tonumber(raghs) == 4 then
			AnAnimSys:setPedBDAnimation2(thePlayer,"break_D",-1,true,false,false,false)
		elseif tonumber(raghs) == 5 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 2",-1,true,false,false,false)
		elseif tonumber(raghs) == 6 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 3",-1,true,false,false,false)
		elseif tonumber(raghs) == 7 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 5",-1,true,false,false,false)
		elseif tonumber(raghs) == 8 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 7",-1,true,false,false,false)
		elseif tonumber(raghs) == 9 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 8",-1,true,false,false,false)
		elseif tonumber(raghs) == 10 then
			AnAnimSys:setPedFortniteAnimation(thePlayer,"baile 13",-1,true,false,false,false)

	
		else
			outputChatBox("#ff0000✖️ #ffffffID Raghs Eshtebah Mibashad!", thePlayer, 255, 255, 255, true)
		end
			animSpam[thePlayer] = 0
			bindKey( thePlayer, "F", "down", "stopanim" )
	else
		outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan:  /raghs  <1~10>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("raghs", raghs )


------------------------------- Varzesh -------------------------------------

function varzesh ( thePlayer, command,  arg )
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGoldPremium")) <= 0 then
		outputChatBox("#ff0000Baraye Inkar Bayad MemberShip Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if (arg) then
		if isPedOnGround (thePlayer) then
			if not isPedInVehicle(thePlayer) then
				local varzesh = arg
				if tonumber(varzesh) == 1 then
					AnAnimSys:setPedVarzeshAnimation2(thePlayer,"shena",-1,true,false,false,false)
				elseif tonumber(varzesh) == 2 then
					AnAnimSys:setPedVarzeshAnimation1(thePlayer,"derazneshast",-1,true,false,false,false)
				
				
				
				else
					outputChatBox("#ff0000✖️ #ffffffID Varzesh Eshtebah Mibashad!", thePlayer, 255, 255, 255, true)
				end
					animSpam[thePlayer] = 0
					bindKey( thePlayer, "F", "down", "stopanim" )
			else
				outputChatBox("#ff0000✖️ #ffffffDakhel Khodro Nemishe Animation Zad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffBayad Roye Zamin Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan:  /varzesh  <1~2>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("varzesh", varzesh )







function CoverL(root)
	cuffed = getElementData(root, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
	if not isPedInVehicle (root) then
		setPedAnimation(root,"heist9","swt_wllpk_r",-1,true,false)
		bindKey( root, "W", "down", "stopanim" )
		bindKey( root, "A", "down", "stopanim" )
		bindKey( root, "S", "down", "stopanim" )
		bindKey( root, "D", "down", "stopanim" )
	end

end
addEvent("CoverL",true)
addEventHandler("CoverL", root, CoverL)

function CoverR(root)
	cuffed = getElementData(root, "pCuffed?") or false
	if cuffed ~= false then
		return false
	end
	if not isPedInVehicle (root) then
		setPedAnimation(root,"heist9","swt_wllpk_l",-1,true,false)
		bindKey( root, "W", "down", "stopanim" )
		bindKey( root, "A", "down", "stopanim" )
		bindKey( root, "S", "down", "stopanim" )
		bindKey( root, "D", "down", "stopanim" )
	end
end
addEvent("CoverR",true)
addEventHandler("CoverR", root, CoverR)


