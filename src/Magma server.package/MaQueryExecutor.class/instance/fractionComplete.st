accessing
fractionComplete
	^ trunkPosition 
		ifNil: [ 0 ]
		ifNotNil: 
			[ | trunkSize |
			trunkSize := self trunk trunkSize.
			trunkSize = 0 
				ifTrue: [ 1 ]
				ifFalse: 
					[ Fraction 
						numerator: trunkPosition
						denominator: self trunk trunkSize ] ]