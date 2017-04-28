building
incrementNumberOfChildrenAtByteArrayIndex: anInteger

	| currentNumberOfChildren |

	currentNumberOfChildren := self numberOfChildrenAtByteArrayIndex: anInteger.
	self
		numberOfChildrenAtByteArrayIndex: anInteger
		put: currentNumberOfChildren + 1
