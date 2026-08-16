function BoxOpen(x, y, z)
	playSound3D("Box.mp3", x, y, z, false)
	effect = createEffect("extinguisher", x, y, z + 0.7)
	
					  setTimer ( function()
					  destroyElement ( effect )
				end, 3000, 1 )
end
addEvent( "onCreateBox", true )
addEventHandler( "onCreateBox", localPlayer, BoxOpen )

addEventHandler ( "onClientPlayerDamage", getLocalPlayer(),
function ( attacker, weapon, bodypart )
	if getElementData(source,"HealFactor") == true then
		cancelEvent()
	end
end)

local server = setmetatable(
		{},
		{
			__index = function(t, k)
				t[k] = function(...) triggerServerEvent('onServerCall', resourceRoot, k, ...) end
				return t[k]
			end
		}
	)

function setTrayOnMinimize( )
     createTrayNotification( "Shoma Dar Server Persian  AFK Shodid!", "warning" )
end
addEventHandler( "onClientMinimize", getRootElement( ), setTrayOnMinimize )

local InRkoCoolDown = false
addEventHandler("onClientPlayerWeaponFire", getLocalPlayer(),
function (weapon, _, _, hitX, hitY, hitZ)
	if weapon ~= 0 then
		return
	end
	if not getElementData(getLocalPlayer(),"RKO") then
		return
	end
	if not InRkoCoolDown then
		InRkoCoolDown = true
		triggerServerEvent( "PerformRKO", getLocalPlayer(), getLocalPlayer() )
		setTimer( function()
			InRkoCoolDown = false
		end, 10000, 1)
	end
end)

addEvent("RkoSound",true)
addEventHandler("RkoSound", getRootElement(),
function ( SoundSource )
	local Sound = playSound3D("RkoSound.mp3", 0, 0, 0, false)
	setElementInterior(Sound, getElementInterior(SoundSource))
	setElementDimension(Sound, getElementDimension(SoundSource))
	attachElements(Sound, SoundSource)
	setSoundMaxDistance( Sound, 30 )
end)
