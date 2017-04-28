test MagmaStat
newStat: anArray 
	^ anArray
		inject: MagmaStat new
		into: [ : stat : each | stat addValue: each ]