accessing
numberOfChildrenBefore: keyInteger

	| lastByteArrayIndex entryIndex totalInSlotsBeforeKey |

	entryIndex := self slotIndexFor: keyInteger.
	lastByteArrayIndex := self byteArrayIndexFor: entryIndex.
	totalInSlotsBeforeKey := self numberOfChildrenBeforeByteArrayIndex: lastByteArrayIndex.
	^((self keyAtByteArrayIndex: lastByteArrayIndex) < keyInteger
		and: [ self hasEntryAtByteArrayIndex: lastByteArrayIndex ])
			ifTrue:
				[ (lastByteArrayIndex = (self highestByteArrayIndexFor: keyInteger))
					ifTrue: [ totalInSlotsBeforeKey + 1 ]
					ifFalse: [ totalInSlotsBeforeKey + (self numberOfChildrenAtByteArrayIndex: lastByteArrayIndex) ] ]
			ifFalse: [ totalInSlotsBeforeKey ]