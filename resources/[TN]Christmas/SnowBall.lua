txd = engineLoadTXD ( "models/SnowBall.txd" )
engineImportTXD ( txd, 3002 )
dff = engineLoadDFF ( "models/SnowBall.dff", 0 )
engineReplaceModel ( dff, 3002)