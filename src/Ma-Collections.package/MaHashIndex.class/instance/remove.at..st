add / remove
remove: valueInteger at: keyInteger 
	"Answer a boolean indicating whether anything was removed."
	guard critical: 
		[ | currentBaxToFill sourceBax parentRecord childRecord baxFilled |
		(self 
			includesValue: valueInteger
			at: keyInteger) ifFalse: [ ^ false ].
		self 
			navigateToward: keyInteger
			until: 
				[ : eachRecord | 
				(currentBaxToFill := eachRecord 
					removeKey: keyInteger
					withValue: valueInteger) notNil ]
			do: 
				[ : eachRecord | 
				"No need for beforeImageSignal here because we already signaled it in the until block."
				eachRecord decrementNumberOfChildrenAtKey: keyInteger.
				self writeRecord ].
		self writeRecord.

		"get out if we can.."
		currentBaxToFill ifNil: [ ^ true ].
		(record hasChildAtByteArrayIndex: currentBaxToFill) ifFalse: [ ^ true ].

		"Now pull up child record entries into the newly vacated slot because add looks for the first available slot that is eligible for the key it is adding, which *could* be greater than the key of the next child (meaning we'd then be out of order)."
		sourceBax := 0.	"non-nil"
		parentRecord := record independentCopy.
		childRecord := record independentCopy.
		
		[ sourceBax notNil and: [ parentRecord hasChildAtHighestByteArrayIndexForBax: currentBaxToFill ] ] whileTrue: 
			[ | highestByteArrayIndexForBaxToFill |
			highestByteArrayIndexForBaxToFill := parentRecord highestByteArrayIndexForAnyKeyAt: currentBaxToFill.
			self 
				readRecord: childRecord
				at: (parentRecord recordNumberAtByteArrayIndex: highestByteArrayIndexForBaxToFill).
			sourceBax := childRecord byteArrayIndexOfLowestEntry.
			sourceBax ifNotNil: 
				[ baxFilled := parentRecord 
					atKey: (childRecord keyAtByteArrayIndex: sourceBax)
					put: (childRecord valueAtByteArrayIndex: sourceBax).
				baxFilled ~= highestByteArrayIndexForBaxToFill ifTrue: 
					[ parentRecord incrementNumberOfChildrenAtByteArrayIndex: baxFilled.
					parentRecord decrementNumberOfChildrenAtByteArrayIndex: highestByteArrayIndexForBaxToFill ].
				childRecord
					decrementNumberOfChildrenAtByteArrayIndex: sourceBax ;
					vacateSlotAtByteArrayIndex: sourceBax.
				self
					writeRecord: parentRecord ;
					writeRecord: childRecord.
				parentRecord populateFrom: childRecord.
				currentBaxToFill := sourceBax ] ].
		^ true ]