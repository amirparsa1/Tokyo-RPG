--- Texcher
function replaceModel()
  txd = engineLoadTXD("Texture/Police.txd", 7911 )
  engineImportTXD(txd, 7911)
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)
