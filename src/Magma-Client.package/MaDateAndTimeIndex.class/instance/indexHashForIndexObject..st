must override
indexHashForIndexObject: aDateAndTime 
	^ aDateAndTime
		ifNil: [ 0 ]
		ifNotNil:
			[ | delta hash |
			delta := aDateAndTime asDateAndTime asUTC - epoch.
			hash := (delta asSeconds * self magnification) asInteger.
			delta nanoSeconds isZero ifFalse: [ hash := hash + (delta nanoSeconds / (precision / 1 second * NanosInSecond)) floor ].
			hash < 0 ifTrue: [ MagmaInvalidIndexObject signal: 'Not a valid DateAndTime: . The index object must be greater than ' , epoch printString ].
			hash ]