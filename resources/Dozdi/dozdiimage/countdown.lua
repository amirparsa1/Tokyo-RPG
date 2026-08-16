addEvent("BaidAksDozd",true)
addEventHandler("BaidAksDozd",getLocalPlayer(),
function ( source )
	guiSetVisible ( imagecount, false )
	imagecount = guiCreateStaticImage (300,300,115,115,"dozdiimage/images/1.png",false)
	setTimer ( Countdown6, 100, 1 )
end)

function Countdown6 ( source )
	guiSetVisible ( imagecount, false )
	imagecount = guiCreateStaticImage(300,300,130,130,"dozdiimage/images/2.png",false)
	setTimer ( Countdown5, 100, 1 )
end

function Countdown5 ( source )
	guiSetVisible ( imagecount, false )
	imagecount = guiCreateStaticImage(300,300,115,115,"dozdiimage/images/1.png",false)
	setTimer ( Countdown4, 100, 1 )
end

function Countdown4 ( source )
	guiSetVisible ( imagecount, false )
	imagecount = guiCreateStaticImage(300,300,130,130,"dozdiimage/images/2.png",false)
	setTimer ( Countdown3, 100, 1 )
end

function Countdown3 ( source )
	guiSetVisible ( imagecount, false )
	imagecount = guiCreateStaticImage(300,300,115,115,"dozdiimage/images/1.png",false)
	setTimer ( Countdown2, 100, 1 )
end

function Countdown2 ( source )
	guiSetVisible ( imagecount, false )
	imagecount = guiCreateStaticImage(300,300,130,130,"dozdiimage/images/2.png",false)
	setTimer ( Countdown1, 100, 1 )
end


function Countdown1 ( source )
	guiSetVisible ( imagecount, false )
	imagecount = guiCreateStaticImage(300,300,115,115,"dozdiimage/images/1.png",false)
	setTimer ( Countdown0, 100, 1 )
end

function Countdown0 ( source )
	guiSetVisible ( imagecount, false )
	imagecount = guiCreateStaticImage(300,300,130,130,"dozdiimage/images/2.png",false)
	setTimer ( CountdownEnd, 100, 1 )
end
function CountdownEnd ( source )
	guiSetVisible ( imagecount, false )
end
--addCommandHandler ( "dozdi", Countdown )
