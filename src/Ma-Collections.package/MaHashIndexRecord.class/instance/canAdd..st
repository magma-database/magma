testing
canAdd: keyInteger

	self
		eligibleByteArrayIndexesFor: keyInteger
		do: [ :index | (self hasSlotAvailableAtByteArrayIndex: index) ifTrue: [ ^true ] ].
	^false
