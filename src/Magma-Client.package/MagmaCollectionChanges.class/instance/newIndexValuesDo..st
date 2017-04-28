added indexes
newIndexValuesDo: aBlock

	self hasNewIndexValues ifFalse: [ ^self ].
	self newIndexValues do: aBlock
