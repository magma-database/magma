performance
mergeImmutabilityStrategy: aMaImmutabilityStrategy 
	self immutabilityStrategy:
		(immutabilityStrategy
			ifNil: [ aMaImmutabilityStrategy ]
			ifNotNil: [ immutabilityStrategy merge: aMaImmutabilityStrategy ])