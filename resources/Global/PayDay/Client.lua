function paychecksound(client)
	  if client == getLocalPlayer() then
	  local soundeghofl = playSound("PayDay/paycheck.mp3",false)
	  setSoundVolume(soundeghofl,0.5)
	  end
end
addEvent("paychecksound",true)
addEventHandler("paychecksound", getRootElement(), paychecksound)