notfSys = exports["notf"]
player = getLocalPlayer()
local sX, sY = guiGetScreenSize()
local px, py = (sX/1600), (sY/900)
local x,y = (sX/px), (sY/py)
function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing ( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
		return true
	else
		return false
	end
end
function findFontToHeight(font, sizeY)
	local fontScale = 0
	local fontSize
	repeat
		fontScale = fontScale+1
		fontSize = dxGetFontHeight(fontScale, "default-bold")
	until fontSize >= sizeY
	return fontScale
end
fontScale = findFontToHeight(font, sY*0.01)
local bgsarafi = guiCreateStaticImage( px*180, py*80,  px*1280, py*720, "Data/ExBg.png", false,false)
guiSetVisible( bgsarafi, false ) 
local bgbuttn = guiCreateStaticImage(px*480, py*345,  px*300, py*60, "Data/bgtyp.png", false,bgsarafi)
guiSetVisible( bgbuttn, false ) 
local goldeshtaraflabael = guiCreateLabel(px*500, py*280, px*350, py*150,  "", false, bgsarafi)
guiLabelSetColor( goldeshtaraflabael, 255,255,0 )
guiSetFont(goldeshtaraflabael, guiCreateFont( "Data/Rage.ttf",(px+py)*8 ))
local excheangeprice = guiCreateLabel(px*500, py*440, px*350, py*150,  "", false, bgsarafi)
guiLabelSetColor( excheangeprice, 0,255,0 )
guiSetFont(excheangeprice, guiCreateFont( "Data/Rage.ttf",(px+py)*8 ))
local tedadgoldbaraexcheng = guiCreateLabel(px*10, py*10,  px*452, py*54,  "0", false, bgbuttn)
guiLabelSetColor( tedadgoldbaraexcheng, 0,0,0)
guiSetFont(tedadgoldbaraexcheng, guiCreateFont( "Data/Rage.ttf",(px+py)*10 ))
guiSetVisible( tedadgoldbaraexcheng, false ) 
local tedadgoldbaraexcheng2 = guiCreateLabel(px*400, py*350,  px*200, py*40,  "Gold :", false, bgsarafi)
guiLabelSetColor( tedadgoldbaraexcheng2, 255,255,255)
guiSetFont(tedadgoldbaraexcheng2, guiCreateFont( "Data/Rage.ttf",(px+py)*10 ))


function deleteLastCharacter(str)
	return(str:gsub("[%z\1-\194-\244][\128-\191]*$", ""))
end	

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	nowselected = "hichi"
    if source == bgbuttn or source == tedadgoldbaraexcheng or source == tedadgoldbaraexcheng2 then
		nowselected = "btn"
	elseif source == bgsarafi then
		nowselected = "bg"

	end
end)


guiCreateStaticImage(px*600, py*35,  px*150, py*150, "Data/gold_xipq.png", false,bgsarafi)
function drawSarafiSys()
	if sarafivisable == true then

        if isMouseInPosition(px*1250, py*80,  px*187, py*97) then
			dxDrawImage(px*1250, py*80,  px*187, py*97, "Data/Close.png", 0, 0, 0, tocolor(150,150,150, 255), true)
			if getKeyState("mouse1")  then
				if not press then
					press = true
                    closepanelsarafi(getLocalPlayer())
                    guiSetVisible( bgsarafi, false ) 
                    guiSetText( excheangeprice, "0" )
					guiSetVisible( bgbuttn, false ) 
				end
			else
				press = false
			
			end
		else
			dxDrawImage(px*1250, py*80,  px*187, py*97, "Data/Close.png", 0, 0, 0, tocolor(255,255,255, 255), true)
		end 
        if guiGetText(tedadgoldbaraexcheng) == "" then
            guiSetText( tedadgoldbaraexcheng , "0" )
        end
		if tonumber(guiGetText(tedadgoldbaraexcheng)) >= 1000000000 then
			guiSetText( tedadgoldbaraexcheng , deleteLastCharacter ( guiGetText(tedadgoldbaraexcheng) ) )
        end

		if isMouseInPosition(px*570, py*580,  px*442, py*85) then
			dxDrawImage(px*570, py*580,  px*442, py*85, "Data/Ex.png", 0, 0, 0, tocolor(150,150,150, 255), true)
			if getKeyState("mouse1")  then
				if not press then
					press = true
					if tonumber(guiGetText(tedadgoldbaraexcheng)) >= 500 then
						triggerServerEvent("excheangeroanjambede", localPlayer, localPlayer, tonumber(guiGetText(tedadgoldbaraexcheng)), guiGetText(lastpoldaryafti))
						closepanelsarafi(getLocalPlayer())
					else
						notfSys:addNotification( "Ma Inja Zir 500g Tala Moamele Nemikonam" , 'info')
					end
				end
			else
				press = false
			
			end
		else
			dxDrawImage(px*570, py*580,  px*442, py*85, "Data/Ex.png", 0, 0, 0, tocolor(255,255,255, 255), true)
		end 

		local lastpoldaryafti = tonumber(guiGetText(tedadgoldbaraexcheng))*500
        guiSetText( excheangeprice, "Pool Daryafti: "..lastpoldaryafti.."$")
        --lastpriceforsarafi = tonumber(guiGetText(tedadgoldbaraexcheng)) * 50
        --guiSetText( excheangeprice, "$"..lastpriceforsarafi  )
	end
end
addEventHandler("onClientCharacter", getRootElement(),
function (character)
local supportedCharacters = {["1"] = true, ["2"] = true, ["3"] = true, ["4"] = true, ["5"] = true, ["6"] = true, ["7"] = true,["8"] = true, ["9"] = true, ["0"] = true,}
    if supportedCharacters[character] == true then
		if not isChatBoxInputActive(  ) then
			if nowselected == "btn" then
        		if guiGetText(tedadgoldbaraexcheng) == "0" then
        		    local LastText = guiGetText( tedadgoldbaraexcheng ) 
        		    guiSetText( tedadgoldbaraexcheng , ""..character.."" )
        		else
        		   local LastText = guiGetText( tedadgoldbaraexcheng ) 
        		   guiSetText( tedadgoldbaraexcheng , ""..LastText..character.."" )
        		end
			end
		end

    end
end)	

bindKey("backspace", "down", function ()
	if nowselected == "btn" then

		if guiGetText(tedadgoldbaraexcheng) ~= "" then
			guiSetText( tedadgoldbaraexcheng , deleteLastCharacter ( guiGetText(tedadgoldbaraexcheng) ) )
    	else
    	    guiSetText( tedadgoldbaraexcheng , "0" )
		end
	end
end)












function openpanelsarafi(thePlayer,goldeshtaraf)
	if thePlayer == getLocalPlayer() then

		showCursor(true)
        sarafivisable = true
		guiSetText( goldeshtaraflabael , "Your Gold: "..tostring(goldeshtaraf).." g"  )

        addEventHandler("onClientRender",root,drawSarafiSys)
        guiSetVisible( bgsarafi, true )   
		guiSetVisible( bgbuttn, true ) 
		guiSetVisible( tedadgoldbaraexcheng, true ) 
	end
end
addEvent("openpanelsarafi",true)
addEventHandler("openpanelsarafi",getLocalPlayer(),openpanelsarafi)

function closepanelsarafi(thePlayer)
	if thePlayer == getLocalPlayer() then
        showCursor(false)
		sarafivisable = false
        guiSetText( tedadgoldbaraexcheng , "0" )
		nowselected = "hichi"
		removeEventHandler("onClientRender",root,drawSarafiSys)
		guiSetText( excheangeprice, "0" )
        guiSetVisible( bgsarafi, false )    
		guiSetVisible( bgbuttn, false ) 
		guiSetVisible( tedadgoldbaraexcheng, false )  
	end
end
addEvent("closepanelsarafi",true)
addEventHandler("closepanelsarafi",getLocalPlayer(),closepanelsarafi)




