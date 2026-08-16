txd = engineLoadTXD("models/18.txd")
engineImportTXD(txd,18)
dff = engineLoadDFF("models/18.dff",18)
engineReplaceModel(dff,18)