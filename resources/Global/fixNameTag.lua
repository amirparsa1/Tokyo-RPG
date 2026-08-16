
function disableTargetMarkers()
	setPedTargetingMarkerEnabled(false)
end
addEventHandler("onClientResourceStart", resourceRoot, disableTargetMarkers)