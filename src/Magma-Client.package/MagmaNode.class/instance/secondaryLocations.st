accessing
secondaryLocations
	^ locations size > 1 
		ifTrue: 
			[ locations 
				copyFrom: 2
				to: locations size ]
		ifFalse: [ Array new ]