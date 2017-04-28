building
removeKey: keyInteger withValue: valueInteger 
	self 
		eligibleByteArrayIndexesFor: keyInteger
		do: 
			[ : each | 
			((self keyAtByteArrayIndex: each) = keyInteger 
			and: [ (self valueAtByteArrayIndex: each) = valueInteger
			and: [ self hasEntryAtByteArrayIndex: each ] ]) ifTrue: 
				[ self
					vacateSlotAtByteArrayIndex: each ;
					decrementNumberOfChildrenAtByteArrayIndex: each.
				^ each ] ].
	^ nil