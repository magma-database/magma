removed indexes
removedIndexesDo: oneArgBlock

	self hasRemovedIndexes ifFalse: [ ^self ].
	self removedIndexes do: oneArgBlock
