*magma-server-private
minimumSearchSpaceSizeUsing: aMaLargeCollectionManager 
	| calculateSizeBlock |
	calculateSizeBlock := 
	[ : each | 
	each minimumSearchSpaceSizeUsing: aMaLargeCollectionManager ].
	^ self isConjunction 
		ifTrue: [ (self terms collect: calculateSizeBlock) min ]
		ifFalse: [ self terms detectSum: calculateSizeBlock ]