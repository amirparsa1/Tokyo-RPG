local screenW, screenH = guiGetScreenSize()
local whatsGender = nil

GUIEditor = {
    staticimage = {},
    edit = {},
    label = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
function()

	----------- Baraye Register Panel -------------
	local font4 = guiCreateFont("Data/font.ttf", 10)

----------

	
        meliBG = guiCreateStaticImage((screenW - 354) / 2, (screenH - 0) / 2, 354, 236, "Data/BG.png", false)
		guiSetProperty( meliBG, "Visible", "False")
		
		GUIEditor.label[0001] = guiCreateLabel(100, 81, 250, 50, "", false, meliBG)
		guiSetFont(GUIEditor.label[0001],font4)
		guiLabelSetColor(GUIEditor.label[0001],0 , 0 , 0 )
		
		GUIEditor.label[0002] = guiCreateLabel(100, 101, 250, 50, "", false, meliBG)
		guiSetFont(GUIEditor.label[0002],font4)
		guiLabelSetColor(GUIEditor.label[0002],0 , 0 , 0 )
		
		GUIEditor.label[0003] = guiCreateLabel(100, 121, 250, 50, "", false, meliBG)
		guiSetFont(GUIEditor.label[0003],font4)
		guiLabelSetColor(GUIEditor.label[0003],0 , 0 , 0 )
		
		GUIEditor.label[0004] = guiCreateLabel(100, 141, 250, 50, "", false, meliBG)
		guiSetFont(GUIEditor.label[0004],font4)
		guiLabelSetColor(GUIEditor.label[0004],0 , 0 , 0 )
		
		
		GUIEditor.label[0005] = guiCreateLabel(50, 159, 250, 50, "", false, meliBG)
		guiSetFont(GUIEditor.label[0005],font4)
		guiLabelSetColor(GUIEditor.label[0005],0 , 0 , 0 )
		GUIEditor.label[0006] = guiCreateLabel(50, 175, 250, 50, "", false, meliBG)
		guiSetFont(GUIEditor.label[0006],font4)
		guiLabelSetColor(GUIEditor.label[0006],0 , 0 , 0 )
		
		GUIEditor.label[0007] = guiCreateLabel(210, 159, 250, 50, "", false, meliBG)
		guiSetFont(GUIEditor.label[0007],font4)
		guiLabelSetColor(GUIEditor.label[0007],0 , 0 , 0 )
		GUIEditor.label[0008] = guiCreateLabel(210, 175, 250, 50, "", false, meliBG)
		guiSetFont(GUIEditor.label[0008],font4)
		guiLabelSetColor(GUIEditor.label[0008],0 , 0 , 0 )
		
		---------------------- Dokme Ha -----------------------------
		--ClosePanel = guiCreateStaticImage(500, 20, 50, 50, "Data/box.png", false, meliBG)
		-------------------------------------------------------------
end)





------- Config Script ------------
function updateEtelatCartMeli( root ,name, register, codmeli,gun, car, bike, ghayegh, heli,skin)
	if root == getLocalPlayer() then
		
		name = tostring(name)
        guiSetText ( GUIEditor.label[0001],"" ..name.."" )
		
		register = tostring(register)
        guiSetText ( GUIEditor.label[0002],"" ..register.."" )
		
		codmeli = tostring(codmeli)
        guiSetText ( GUIEditor.label[0003],"" ..codmeli.."" )
		
		gun = tostring(gun)
        guiSetText ( GUIEditor.label[0004],"" ..gun.."/h" )
		
		car = tostring(car)
        guiSetText ( GUIEditor.label[0005],"" ..car.."/h" )
		
		bike = tostring(bike)
        guiSetText ( GUIEditor.label[0006],"" ..bike.."/h" )
		
		ghayegh = tostring(ghayegh)
        guiSetText ( GUIEditor.label[0007],"" ..ghayegh.."/h" )
		
		heli = tostring(heli)
        guiSetText ( GUIEditor.label[0008],"" ..heli.."/h" )
		
		skin = guiCreateStaticImage(20, 85, 60, 60, ":[Phoenix]Huds/Data/hskins/"..skin..".png", false, meliBG)
		setTimer(function()
			destroyElement(skin)
		end,4900,1)
	end
end
addEvent("updateEtelatCartMeli",true)
addEventHandler("updateEtelatCartMeli", getRootElement(), updateEtelatCartMeli)


addEvent("showCartMeli",true)
addEventHandler("showCartMeli",getLocalPlayer(),function()
    guiSetProperty(meliBG, "Visible", "True")
end)

addEvent("hideCartMeli",true)
addEventHandler("hideCartMeli",getLocalPlayer(),function()
    guiSetProperty(meliBG, "Visible", "False")
end)

