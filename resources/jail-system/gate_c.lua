function soundegate(gate)
	  local sound = playSound3D("Data/buzz.wav", 0, 0, 0, false)
	  attachElements(sound, gate)
      setSoundMaxDistance(sound, 10)
	  setSoundVolume(sound,0.2)
end
addEvent("playPrisonGateOpen",true)
addEventHandler("playPrisonGateOpen", getRootElement(), soundegate)




----- Peds


------ped
Jailped = createPed( 121, 3088.25 ,-665.4150390625 ,16.584127426147)
setElementRotation ( Jailped, 0, 0 , 88.262786865234 )
setElementFrozen(Jailped, true)

function SuperMarketnpc()
	setTimer ( function()
		setPedAnimation(Jailped,"dealer","dealer_idle",1,true,false)
		
	end, 1000, 0 )
end
SuperMarketnpc()


function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", Jailped, cancelPedDamage)