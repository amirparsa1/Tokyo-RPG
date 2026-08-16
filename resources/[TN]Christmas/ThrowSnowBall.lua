SnowBalls = 0

addCommandHandler("snowball",function()
	if SnowBalls == 0 then
		SnowBalls = SnowBalls + 1
		setPedWeaponSlot(getLocalPlayer(),0)
		destroyElement(theBall)
		theBall = createObject(3002,0,0,0)
		setObjectScale (theBall,1)
		setElementCollisionsEnabled(theBall,false)
		addEventHandler("onClientPreRender",getRootElement(),keepInHand)
		addEventHandler("onClientKey",getRootElement(),throwBall)
		addEventHandler("onClientPlayerWeaponSwitch", getRootElement(),ballWeaponSwitch)
	end
end)

function keepInHand()
	local x,y,z = getPedBonePosition(getLocalPlayer(),26)
	setElementPosition(theBall,x,y,z)
end

function ballWeaponSwitch(prev,cur)
	if prev == 0 then
		toggleControl("fire",true)
		removeEventHandler("onClientKey",getRootElement(),throwBall)
		setElementAlpha(theBall,0)
	elseif cur == 0 then
		toggleControl("fire",false)
		addEventHandler("onClientKey",getRootElement(),throwBall)
		setElementAlpha(theBall,255)
	end
end
setFPSLimit = 45
function throwBall(button, state)
	if button == "mouse1" and state == true then
		setPedAnimation(getLocalPlayer(),"GRENADE", "WEAPON_throw",-1,false)
		setTimer(function()
			xInHand,yInHand,zInHand = getElementPosition(theBall)
			removeEventHandler("onClientPreRender",getRootElement(),keepInHand)
			toggleControl("fire",true)
			setElementPosition(theBall)
			Ballpedx, Ballpedy, Ballpedz = getElementPosition(getLocalPlayer())
			rotx,roty,rotz = getElementRotation(getLocalPlayer())
			BallRadius = 0.1
			newGroundDiff = 1
			Ballnewx,Ballnewy,Ballnewz = getElementPosition(theBall)
			removeEventHandler("onClientRender",getRootElement(),throwedBall) -- FIX: avoid stacking duplicate render handlers
			addEventHandler("onClientRender",getRootElement(),throwedBall)
		end,300/getGameSpeed(),1)
		setTimer(function()
			setPedAnimation(getLocalPlayer())
		end,900/getGameSpeed(),1)
		removeEventHandler("onClientPlayerWeaponSwitch", getRootElement(),ballWeaponSwitch)
		removeEventHandler("onClientKey",getRootElement(),throwBall)
	end
end

function throwedBall()
	oldx, oldy, oldz = getElementPosition(theBall)
	oldz = Ballnewz
	Ballnewx = math.cos(math.rad(rotz+90))*BallRadius + Ballpedx
	Ballnewy = math.sin(math.rad(rotz+90))*BallRadius + Ballpedy
	Ballnewz = -1/200*(BallRadius-30)^2 + zInHand + 4
	newGroundDiff = oldz-getGroundPosition(oldx,oldy,oldz+1)
	if newGroundDiff>0 then
		BallRadius = BallRadius + getGameSpeed() - 0.2
		setElementPosition(theBall,Ballnewx,Ballnewy,Ballnewz)
	else
		xx, yy, zz = getElementPosition(theBall)
		theBallGrounded = createObject(3002,xx,yy,zz+0.25)
		setObjectScale (theBallGrounded,1)
		setElementCollisionsEnabled(theBallGrounded,false)
		removeEventHandler("onClientRender",getRootElement(),throwedBall)
		setElementPosition(theBall,oldx,oldy,getGroundPosition(oldx,oldy,oldz+1)+0.1)
		SnowBalls=SnowBalls-1
	end
end