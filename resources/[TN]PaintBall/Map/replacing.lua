function importTextures2()
	txd = engineLoadTXD ( "map/dust2.txd" )
		engineImportTXD ( txd, 14891 )
	col = engineLoadCOL ( "map/dust2.col" )
	dff = engineLoadDFF ( "map/dust2.dff", 0 )
	engineReplaceCOL ( col, 14891 )
	engineReplaceModel ( dff, 14891 )
	engineSetModelLODDistance(14891, 2000)
end

setTimer ( importTextures2, 1000, 1)
--addCommandHandler("replace",importTextures2)

addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()),
	function()
		engineRestoreCOL(14891)
		engineRestoreModel(14891)
		destroyElement(dff)
		destroyElement(col)
		destroyElement(txd)
	end
)