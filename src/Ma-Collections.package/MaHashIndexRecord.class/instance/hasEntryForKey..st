testing
hasEntryForKey: keyInteger
	"Answer whether keyInteger resides in an entry of the receiver."

	self
		eligibleByteArrayIndexesFor: keyInteger
		do:
			[ :index |
			((self hasEntryAtByteArrayIndex: index)
				and: [ (self keyAtByteArrayIndex: index) = keyInteger ])
					ifTrue:
						[ ^true ] ].
	^false
