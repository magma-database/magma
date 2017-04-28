private
installAccessingOverrides
	class
		
		compileSilently: 'writeBarrier
	^ #(size) first first'
		classified: 'access' ;
		
		compileSilently: 'species
		|species|
		species := super species.
		^ species = self class
			ifTrue: [self class superclass]
			ifFalse: [species]'
		classified: 'accessing'.
	((class methodDictionary at: #writeBarrier) literalAt: 2)
		at: 1
		put: (WeakArray with: barrier)