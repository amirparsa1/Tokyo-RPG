function ShowJobPanel( thePlayer)

triggerClientEvent("ShowJobPanel", thePlayer, thePlayer)

end

local Jobs = {
	{ -1855.546875 ,-2207.0986328125 ,1952.082763671, 3},
}

function ShowJobGui( thePlayer )
	triggerClientEvent("ShowJobPanel", thePlayer, thePlayer)
end

function BindJob( hitElement, matchingDimension )
	exports["notf"]:addNotification(hitElement, "Baraye Didan Job Ha Az ( Z ) Estefade Konid!", 'info')
	bindKey( hitElement, "Z", "down", ShowJobGui )
end

function UnBindJob( leaveElement, matchingDimension )
	unbindKey( leaveElement, "Z", "down", ShowJobGui )
end

local JobMarkers = {}

for i=1,#Jobs do 
	JobMarkers[i] = createMarker(  Jobs[i][1], Jobs[i][2], Jobs[i][3]+0.5, "cylinder", 1.0,0,0,0,0)
	setElementInterior(JobMarkers[i], Jobs[i][4])
   	addEventHandler( "onMarkerHit", JobMarkers[i], BindJob )
	addEventHandler( "onMarkerLeave", JobMarkers[i], UnBindJob )
end
