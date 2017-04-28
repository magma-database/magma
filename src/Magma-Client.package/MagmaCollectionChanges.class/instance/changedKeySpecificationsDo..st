changed keys
changedKeySpecificationsDo: oneArgBlock

	self hasChangedKeys ifFalse: [ ^self ].
	self changedKeys do: oneArgBlock
