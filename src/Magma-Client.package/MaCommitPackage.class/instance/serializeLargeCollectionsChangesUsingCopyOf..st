private
serializeLargeCollectionsChangesUsingCopyOf: aMaObjectSerializer
	"The objects are serialized, now serialize the allLargeCollectionChanges of
	the receiver."

	| copiedSerializer |
	copiedSerializer := nil.
	self allLargeCollectionChangesDo:
		[ :eachChanges | 
		copiedSerializer ifNil: [ copiedSerializer := aMaObjectSerializer copyWithNewBuffer ].
		eachChanges serializeUsing: copiedSerializer ]
