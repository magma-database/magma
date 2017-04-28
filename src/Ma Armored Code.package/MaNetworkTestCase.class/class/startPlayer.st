system startup
startPlayer
	self thisPlayer ifNotNilDo: [ : player | self hasRunningTestPlayer ifFalse: [ player startFor: self ] ]