accessing
precision: aDuration

	( self validPrecisions includes: aDuration)
		ifTrue: [ precision := aDuration ]
		ifFalse: [ self error: 'invalid precision' ]