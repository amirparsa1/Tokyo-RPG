
addEvent("PlayMegaPhoneSound",true)
addEventHandler( "PlayMegaPhoneSound", resourceRoot, 
function ( player )
    local m = playSound3D("Data/MegaPhone.mp3", 0, 0, 0, false)
    setSoundMaxDistance(m, 90)
    attachElements(m, player)
end)

addEvent("PrisonGateSound",true)
addEventHandler("PrisonGateSound", resourceRoot, 
function (Gate)
	  local Sound = playSound3D("Data/Gate.wav", 0, 0, 0, false)
	  attachElements(Sound, Gate)
      setSoundMaxDistance(Sound, 200)
end)

addEvent("OpenGateSound",true)
addEventHandler("OpenGateSound", resourceRoot, 
function (Gate)
	  local Sound = playSound3D("Data/GateOpen.mp3", 0, 0, 0, false)
	  attachElements(Sound, Gate)
      setSoundMaxDistance(Sound, 40)
end)

addEvent("CloseGateSound",true)
addEventHandler("CloseGateSound", resourceRoot, 
function (Gate)
	  local Sound = playSound3D("Data/GateClose.mp3", 0, 0, 0, false)
	  attachElements(Sound, Gate)
      setSoundMaxDistance(Sound, 40)
end)



function backupWarning ( )
if not getKeyState("lctrl") and not getKeyState("rctrl") then return end
triggerServerEvent("backupNeed", getLocalPlayer(), getLocalPlayer() ) --#Code By ExMohmD :D
end
bindKey( "pgdn", "down", backupWarning )

function acceptWarning ( )
if not getKeyState("lctrl") and not getKeyState("rctrl") then return end
triggerServerEvent("acceptWarning", getLocalPlayer(), getLocalPlayer() ) --#Code By ExMohmD :D
end
bindKey( "enter", "down", acceptWarning )


function setCuffed(player)
    -- Left
    setElementBoneRotation(player, 32, 26.57374382019, 61.337575733622, 59.206573486328)
    setElementBoneRotation(player, 33, 27.843754291534, 15.3639249801636, 46.40625) -- y = 8.3639249801636
    setElementBoneRotation(player, 34, -81.018516340527, 342.87482380867, 326.11833715439)
    -- Right
    setElementBoneRotation(player, 22, 338.839179039, 53.49357098341, 298.45233917236)
    setElementBoneRotation(player, 23, 307.68748283386, 22.110015869141, 313.59375) -- y = 5.110015869141
    setElementBoneRotation(player, 24, 96.047592163086, 357.88313293457, 56.739406585693)
    
    updateElementRpHAnim(player)
end
addEvent("cuffhand",true)
addEventHandler("cuffhand", resourceRoot, setCuffed)
--[[
function updateCuffedPlayers( )
    for _,p in ipairs(getElementsByType'player') do
        if p:getData('restrain') == 1 then
            setCuffed(p)
        end
    end
end
addEventHandler ("onClientPedsProcessed", root, updateCuffedPlayers)
--]]