testing
includesSecondary: aMagmaRemoteLocation 
	self secondaryLocationsDo: [ : each | each = aMagmaRemoteLocation ifTrue: [ ^ true ] ].
	^ false