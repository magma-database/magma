accessing
ensureClassUsing: aMaObjectSerializer

	^ self isDefined
		ifTrue: [ self classObject ]
		ifFalse: [ self createClassUsing: aMaObjectSerializer ]