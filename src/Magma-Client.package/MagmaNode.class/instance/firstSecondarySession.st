accessing
firstSecondarySession
	^ self firstSecondaryLocation ifNotNilDo: [ : sl | self sessionFor: sl ]