local API = "http://www.youtubeinmp3.com/fetch/?video="
local subTrackOnSoundDown = 0.1
local subTrackOnSoundUp = 0.1

function print ( message, r, g, b )
	outputChatBox ( message, r, g, b,true )
end
local actual_block = nil
ani_all = {}

function xmlToTable(xmlFile, index)
	local xml = getResourceConfig(xmlFile)
	if not xml then
		return false
	end
	local result
	if index then
		result = dumpXMLToTable(xmlFindChild(xml, "group", index), "anim")
	else
		result = dumpXMLToTable(xml, "group")
	end
	
	xmlUnloadFile(xml)
	return result
end

function dumpXMLToTable(parentNode, key)
	local results = {}
	local i = 0
	local groupNode = xmlFindChild(parentNode, key, i)
	while groupNode do
		local group = {'group', name=xmlNodeGetAttribute(groupNode, 'name'), index=i}
		table.insert(results, group)
		i = i + 1
		groupNode = xmlFindChild(parentNode, key, i)
	end
	return results
end

sC,sD = guiGetScreenSize()
C,D = 436,296
A = (sC/2) - (C/2)
B = (sD/2) - (D/2)
function ani_start()	

        window_ust = guiCreateStaticImage(A, B-26, 436, 26, "resim/resim.png", false)
        guiSetProperty(window_ust, "ImageColours", "tl:FCBB0008 tr:FCBB0008 bl:FCBB0008 br:FCBB0008")
	    guiSetVisible(window_ust,false)			

        window_ust_label = guiCreateLabel(0, 0, 436, 26, "radio system", false, window_ust)
        guiSetFont(window_ust_label, "default-bold-small")
        guiLabelSetHorizontalAlign(window_ust_label, "center", false)
        guiLabelSetVerticalAlign(window_ust_label, "center")	
	
        window = guiCreateStaticImage(A, B, C, D, "resim/resim.png", false)
        guiSetProperty(window, "ImageColours", "tl:D2000000 tr:D2000000 bl:D2000000 br:D2000000")
	    guiSetVisible(window,false)	

        editbox = guiCreateEdit(6, 15, 424, 30, "", false, window)
		
        butonresmi_1 = guiCreateStaticImage(6, 62, 100, 33, "resim/button.png", false, window)
        guiSetProperty(butonresmi_1, "ImageColours", "tl:FCD10000 tr:FCD10000 bl:FCD10000 br:FCD10000")
        buton1 = guiCreateLabel(0, 0, 100, 33, "Creat ", false, butonresmi_1)
        guiSetFont(buton1, "default-bold-small")
        guiLabelSetHorizontalAlign(buton1, "center", false)
        guiLabelSetVerticalAlign(buton1, "center")		
		
        butonresmi_2 = guiCreateStaticImage(112, 62, 100, 33, "resim/button.png", false, window)
        guiSetProperty(butonresmi_2, "ImageColours", "tl:FCD10000 tr:FCD10000 bl:FCD10000 br:FCD10000")
        buton2 = guiCreateLabel(0, 0, 100, 33, "Delete", false, butonresmi_2)
        guiSetFont(buton2, "default-bold-small")
        guiLabelSetHorizontalAlign(buton2, "center", false)
        guiLabelSetVerticalAlign(buton2, "center")		
		
        butonresmi_3 = guiCreateStaticImage(221, 62, 100, 33, "resim/button.png", false, window)
        guiSetProperty(butonresmi_3, "ImageColours", "tl:FCD10000 tr:FCD10000 bl:FCD10000 br:FCD10000")
        buton3 = guiCreateLabel(0, 0, 100, 33, "volume -", false, butonresmi_3)
        guiSetFont(buton3, "default-bold-small")
        guiLabelSetHorizontalAlign(buton3, "center", false)
        guiLabelSetVerticalAlign(buton3, "center")		
		
        butonresmi_4 = guiCreateStaticImage(331, 62, 100, 33, "resim/button.png", false, window)
        guiSetProperty(butonresmi_4, "ImageColours", "tl:FCD10000 tr:FCD10000 bl:FCD10000 br:FCD10000")
        buton4 = guiCreateLabel(0, 0, 100, 33, "Volume +", false, butonresmi_4)
        guiSetFont(buton4, "default-bold-small")
        guiLabelSetHorizontalAlign(buton4, "center", false)
        guiLabelSetVerticalAlign(buton4, "center")			
		
        butonresmi_5 = guiCreateStaticImage(6, 105, 100, 33, "resim/button.png", false, window)
        guiSetProperty(butonresmi_5, "ImageColours", "tl:FCD10000 tr:FCD10000 bl:FCD10000 br:FCD10000")		
        buton5 = guiCreateLabel(0, 0, 100, 33, "center to list", false, butonresmi_5)
        guiSetFont(buton5, "default-bold-small")
        guiLabelSetHorizontalAlign(buton5, "center", false)
        guiLabelSetVerticalAlign(buton5, "center")

        butonresmi_6 = guiCreateStaticImage(112, 105, 100, 33, "resim/button.png", false, window)
        guiSetProperty(butonresmi_6, "ImageColours", "tl:FCD10000 tr:FCD10000 bl:FCD10000 br:FCD10000")
        buton6 = guiCreateLabel(0, 0, 100, 33, "Delete to list", false, butonresmi_6)
        guiSetFont(buton6, "default-bold-small")
        guiLabelSetHorizontalAlign(buton6, "center", false)
        guiLabelSetVerticalAlign(buton6, "center")		
		
        butonresmi_7 = guiCreateStaticImage(221, 105, 100, 33, "resim/button.png", false, window)
        guiSetProperty(butonresmi_7, "ImageColours", "tl:FCD10000 tr:FCD10000 bl:FCD10000 br:FCD10000")
        buton7 = guiCreateLabel(0, 0, 100, 33, "", false, butonresmi_7)
        guiSetFont(buton7, "default-bold-small")
        guiLabelSetHorizontalAlign(buton7, "center", false)
        guiLabelSetVerticalAlign(buton7, "center")		
		
        butonresmi_8 = guiCreateStaticImage(331, 105, 100, 33, "resim/button.png", false, window)
        guiSetProperty(butonresmi_8, "ImageColours", "tl:FCD10000 tr:FCD10000 bl:FCD10000 br:FCD10000")
        buton8 = guiCreateLabel(0, 0, 100, 33, "QUIT", false, butonresmi_8)
        guiSetFont(buton8, "default-bold-small")
        guiLabelSetHorizontalAlign(buton8, "center", false)
        guiLabelSetVerticalAlign(buton8, "center")			
		
        favorigridlist = guiCreateGridList(8, 147, 423, 126, false, window)
			guiGridListAddColumn(favorigridlist, "URL Adresi", 0.9)		
			guiGridListSetSelectionMode(favorigridlist, 0)	
			addEventHandler("onClientGUIDoubleClick", favorigridlist, ani_animation, false)			
		
        MTASA_TURK = guiCreateLabel(9, 276, 422, 15, "", false, window)
        guiSetFont(MTASA_TURK, "default-bold-small")
        guiLabelSetHorizontalAlign(MTASA_TURK, "center", false)
        guiLabelSetVerticalAlign(MTASA_TURK, "center") 
		
		xmlFile = ani_loadfile()
		
	
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), ani_start)	
		
function ani_loadfile()
	local file = xmlLoadFile("favourite.xml")
	if not file then
		file = xmlCreateFile("favourite.xml", "favourites")
	end
	
	xmlSaveFile(file)
	
	if xmlFindChild(file, "ses3d", 0) then
		local childrens = xmlNodeGetChildren(file)
		
		for key, node in pairs(childrens) do
			local anim = xmlNodeGetAttribute(node, "ses3d")
		end
	end

	return file
end

	
function ani_add()
	local tekst = guiGetText(editbox)
			if  tekst then
					local child = xmlCreateChild(xmlFile, "ses3d")
				
					xmlNodeSetAttribute(child, "ses3d", tekst)
					
					xmlSaveFile(xmlFile)
					ani_getfavourites()
    print ( "#047a18[radio] #ffb90a URL به موارد دلخواه اضافه شد", 0, 255, 0 )	
					
			end
end

function ani_del()
	local selected = guiGridListGetSelectedItem(favorigridlist)
		local tekst = guiGridListGetItemText(favorigridlist, selected, 1)
		if tekst then
				local ses3d = guiGridListGetItemText(favorigridlist, selected,1 )				
				if ses3d then
				    local index = tonumber(guiGridListGetItemData(favorigridlist, selected, 1))		
if index then					
					local node = xmlFindChild(xmlFile, "ses3d", index-1)
					if node then
						xmlDestroyNode(node)
					end
					xmlSaveFile(xmlFile)
					ani_getfavourites()
    print ( "#047a18[radio] #ffb90a URL پاک شد", 0, 255, 0 )	
					
					end
				end
		end
end

function ani_getfavourites()
	if xmlFile then
		if guiGridListClear(favorigridlist) then
			for key, node in pairs(xmlNodeGetChildren(xmlFile)) do
				local anim = xmlNodeGetAttribute(node, "ses3d")
			
				local row = guiGridListAddRow(favorigridlist)
				guiGridListSetItemText(favorigridlist, row, 1, tostring(anim), false, false)
				guiGridListSetItemData(favorigridlist, row, 1, tostring(key))				
			end
		end
	end
end

function ani_animation()
	if source == favorigridlist then
	local selected = guiGridListGetSelectedItem(favorigridlist)
		local tekst = guiGridListGetItemText(favorigridlist, selected, 1)
		if tekst then
				local ses3d = guiGridListGetItemText(favorigridlist, selected,1 )				
				if ses3d then
	            guiSetText(editbox,ses3d)
				end
		end
     end		
end

local isSound = false
addEvent ( "onPlayerViewSpeakerManagment", true )
addEventHandler ( "onPlayerViewSpeakerManagment", root, function ( current )
	local toState = not guiGetVisible ( window ) 
	local toState2 = not guiGetVisible ( window_ust )	
	guiSetVisible ( window, toState )
	guiSetVisible ( window_ust, toState2 )	
	ani_getfavourites()
	showCursor ( toState ) 
	if ( toState == true ) then
		guiSetInputMode ( "no_binds_when_editing" )
		local x, y, z = getElementPosition ( localPlayer )
		if ( current ) then isSound = true
		else  end
	end
end )

addEventHandler ( "onClientGUIClick", root, function ( )
	if ( source == buton8 ) then
		guiSetVisible ( window, false ) 
		guiSetVisible ( window_ust, false ) 		
		showCursor ( false )
	elseif ( source == buton1 ) then
		if ( isURL ( ) ) then
			triggerServerEvent ( "onPlayerPlaceSpeakerBox", localPlayer, guiGetText ( editbox ), isPedInVehicle ( localPlayer ) )
			
			isSound = true

		else
			print ( "#047a18[radio] #ff0a0a را وارد کنید URL لطفا یک ", 255, 0, 0 )
		end
	elseif ( source == buton2 ) then
		triggerServerEvent ( "onPlayerDestroySpeakerBox", localPlayer )

		isSound = false

	elseif ( source == buton3 ) then
		if ( isSound ) then
			local toVol = math.round ( getSoundVolume ( speakerSound [ localPlayer ] ) - subTrackOnSoundDown, 2 )
			if ( toVol > 0.0 ) then
				print ( "#047a18[radio] #ffb90a میزان صدا: %"..math.floor ( toVol * 100 ).."", 0, 255, 0 )
				triggerServerEvent ( "onPlayerChangeSpeakerBoxVolume", localPlayer, toVol )

			else
				print ( "#047a18[radio] #ff0a0a شما نمی توانید صدارا کم تر از 0% کم تر کنید", 255, 0, 0 )
			end
		end
	elseif ( source == buton4 ) then
		if ( isSound ) then
			local toVol = math.round ( getSoundVolume ( speakerSound [ localPlayer ] ) + subTrackOnSoundUp, 2 )
			if ( toVol < 1.1 ) then
				print ( "#047a18[radio] #ffb90a میزان صدا: %"..math.floor ( toVol * 100 ).."", 0, 255, 0 )
				triggerServerEvent ( "onPlayerChangeSpeakerBoxVolume", localPlayer, toVol )

			else
				print ( "#047a18[radio] #ff0a0a شما نمی توانید صدارا بیشتر از 100% زیاد تر کنید", 255, 0, 0 )
			end
		end
	elseif ( source == buton5 ) then	
	ani_add()
	elseif ( source == buton6 ) then		
	ani_del()
	elseif ( source == buton7 ) then
	    if getElementData(getLocalPlayer(),"YouTubeMod")==true then
        setElementData(getLocalPlayer(),"YouTubeMod",false)	
        guiSetText(buton7,"")		
        print ( "هنوز فعال نیست", 0, 255, 0 )		
		else
        setElementData(getLocalPlayer(),"YouTubeMod",true)
        guiSetText(buton7,"")	
        print ( "هنوز فعال نیست", 0, 255, 0 )		
        end		
	end
end )

speakerSound = { }
addEvent ( "onPlayerStartSpeakerBoxSound", true )
addEventHandler ( "onPlayerStartSpeakerBoxSound", root, function ( who, url, isCar,dimension )
	if ( isElement ( speakerSound [ who ] ) ) then destroyElement ( speakerSound [ who ] ) end
	local x, y, z = getElementPosition ( who )

	speakerSound [ who ] = playSound3D ( url, x, y, z, true )

	setSoundVolume ( speakerSound [ who ], 1 )
	setSoundMinDistance ( speakerSound [ who ], 15 )
	setSoundMaxDistance ( speakerSound [ who ], 20 )
	setElementDimension(speakerSound [ who ],dimension)
	if ( isCar ) then
		local car = getPedOccupiedVehicle ( who )
		attachElements ( speakerSound [ who ], car, 0, 5, 1 )
	end
end )

addEvent ( "onPlayerDestroySpeakerBox", true )
addEventHandler ( "onPlayerDestroySpeakerBox", root, function ( who ) 
	if ( isElement ( speakerSound [ who ] ) ) then 
		destroyElement ( speakerSound [ who ] ) 
	end
end )

addEvent ( "onPlayerChangeSpeakerBoxVolumeC", true )
addEventHandler ( "onPlayerChangeSpeakerBoxVolumeC", root, function ( who, vol ) 
	if ( isElement ( speakerSound [ who ] ) ) then
		setSoundVolume ( speakerSound [ who ], tonumber ( vol ) )
	end
end )

function isURL ( )
	if ( guiGetText ( editbox ) ~= "" ) then
		return true
	else
		return false
	end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end
