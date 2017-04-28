create
attribute: attributeSymbol epoch: startingDateAndTime duration: aDuration precision: durationUnits 
	^ (self attribute: attributeSymbol)
		setEpoch: startingDateAndTime
		duration: aDuration
		precision: durationUnits