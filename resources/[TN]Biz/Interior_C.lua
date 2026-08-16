function EnterSound(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		playSound("Enter.mp3",false)
	end
end
addEvent("EnterSound",true)
addEventHandler("EnterSound", root, EnterSound)

function LockedSound(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		playSound("Locked.mp3",false)
	end
end
addEvent("LockedSound",true)
addEventHandler("LockedSound", root, LockedSound)