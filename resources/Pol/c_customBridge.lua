dff = engineLoadDFF ("files/vgssrdbrdg_lvs.dff")
engineReplaceModel (dff, 8128)

txd = engineLoadTXD ("files/vgsroadbridge.txd")
engineImportTXD (txd, 8128)

dff2 = engineLoadDFF ("files/lodsrdbrdg_lvs.dff")
engineReplaceModel (dff2, 8129)

txd2 = engineLoadTXD ("files/lodvgsslod02.txd")
engineImportTXD (txd2, 8129)

col = engineLoadCOL ("files/vegass_3.col")
engineReplaceCOL (col, 8129 )

engineSetModelLODDistance(8129, 59000)
engineSetModelLODDistance(8128, 59000)