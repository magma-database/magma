accessing
firstSecondarySession
	^ self firstSecondaryLocation ifNotNil: [ : sl | self sessionFor: sl ]