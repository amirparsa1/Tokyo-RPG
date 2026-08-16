ColorID = 0
Color1R = 0
Color1G = 0
Color1B = 0
Color2R = 0
Color2G = 0
Color2B = 0
Color3R = 0
Color3G = 0
Color3B = 0
Color4R = 0
Color4G = 0
Color4B = 0
LightR = 0
LightG = 0
LightB = 0

addEventHandler("onColorPickerCancel", root, 
function()
	triggerServerEvent("ResetCarColor", getLocalPlayer(), getLocalPlayer(), Color1R, Color1G, Color1B, Color2R, Color2G, Color2B, Color3R, Color3G, Color3B, Color4R, Color4G, Color4B, LightR, LightG, LightB )
	ColorID = 0
	Color1R = 0
	Color1G = 0
	Color1B = 0
	Color2R = 0
	Color2G = 0
	Color2B = 0
	Color3R = 0
	Color3G = 0
	Color3B = 0
	Color4R = 0
	Color4G = 0
	Color4B = 0
	LightR = 0
	LightG = 0
	LightB = 0
end) 

function ShowColor(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(VehColorWindow, "Visible", "True")
		showCursor(true)
		ColorID = 0
		local theVehicle = getPedOccupiedVehicle ( getLocalPlayer() )
		Color1R, Color1G, Color1B, Color2R, Color2G, Color2B, Color3R, Color3G, Color3B, Color4R, Color4G, Color4B = getVehicleColor ( theVehicle , true )
		LightR, LightG, LightB = getVehicleHeadLightColor(theVehicle)
	end
end
addEvent("ShowColor",true)
addEventHandler("ShowColor", root, ShowColor)

addEventHandler("onColorPickerChange", root, 
function(element, hex, R, G, B) 
	triggerServerEvent("UpdateCarColor", getLocalPlayer(), getLocalPlayer(), Color1R, Color1G, Color1B, Color2R, Color2G, Color2B, Color3R, Color3G, Color3B, Color4R, Color4G, Color4B, LightR, LightG, LightB , R, G, B , ColorID )
end) 

addEventHandler("onColorPickerOK", root, 
function(element, hex, R, G, B) 
	triggerServerEvent("SetCarColor", getLocalPlayer(), getLocalPlayer(), Color1R, Color1G, Color1B, Color2R, Color2G, Color2B, Color3R, Color3G, Color3B, Color4R, Color4G, Color4B, LightR, LightG, LightB , R, G, B , ColorID )
end) 

-- #zezaw
function biadcpickercar ()
	exports["cpicker"]:openPicker(getLocalPlayer(), "#FFAA00", "Vehicle Color")
end
addEvent("BiadCPickerForCar",true)
addEventHandler("BiadCPickerForCar", root, biadcpickercar)
