local lightsOff,tangecheraghha = getTrafficLightState() == 9,"ghermez"
function fixScoreboardTable ( )
	
	exports['scoreboard']:scoreboardAddColumn( "levelPlayer" , root , 60, "Level" , 10 )
	exports['scoreboard']:scoreboardSetColumnPriority( "Name" , 2 , root ) 
	exports['scoreboard']:scoreboardSetColumnPriority( "level" , 10 , root ) 

	setGameType("TheNight ( V1.0.1 )") 
	setMapName("TheNight City")
	local realTime = getRealTime()
	setTime(realTime.hour, realTime.minute)
	setFarClipDistance(2500)
	setFogDistance(50)
	setGameSpeed(1)
	setFPSLimit(66)
	setWeather( 1 )
	setJetpackMaxHeight(5000)
	function handleTrafficLightsOutOfOrder()
		if tangecheraghha == "ghermez" then
			tangecheraghha = "sabz"
			setTrafficLightState(0)
		elseif tangecheraghha == "sabz" then
			tangecheraghha = "ghermez"
			setTrafficLightState(3)
		end
	end
	setTimer(handleTrafficLightsOutOfOrder,12000,0)
	setMinuteDuration(60000*getGameSpeed())
	
end
addEventHandler ( "onResourceStart", getRootElement(), fixScoreboardTable )