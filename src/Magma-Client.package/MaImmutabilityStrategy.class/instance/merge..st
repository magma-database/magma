setup
merge: aMaImmutabilityStrategy 
	aMaImmutabilityStrategy specs keysAndValuesDo:
		[ : eachClass : eachMap | specs
			at: eachClass
			ifAbsentPut: [ eachMap copy ] ].
	aMaImmutabilityStrategy classes keysAndValuesDo:
		[ : eachClass : eachBlock | classes
			at: eachClass
			ifAbsentPut: [ eachBlock ] ]