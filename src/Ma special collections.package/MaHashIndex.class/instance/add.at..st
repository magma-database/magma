add / remove
add: valueInteger at: keyInteger 
	"Find the record which either has space for keyInteger or is as far zoomed-in as possible (with either space for keyInteger or not).  If a record already contains another key greater than keyInteger, that entry must be 'pushed' down so we can maintain key order.  Additionally, we must increment the numberOfChildren for each record to the path of where we finally add."
	guard critical: 
		[ | currentKeyToWrite currentValueToWrite hasSpace reachedBottom |
		self 
			validateCanAdd: valueInteger
			at: keyInteger.
		currentKeyToWrite := keyInteger.
		currentValueToWrite := valueInteger.
		self selectRoot.
		hasSpace := false.
		reachedBottom := false.
		[ hasSpace | reachedBottom ] whileFalse: 
			[ | highestBax keyToMove valueToMove childRecordNumber |
			highestBax := record highestByteArrayIndexFor: currentKeyToWrite.
			((hasSpace := record canAdd: currentKeyToWrite) or: 
				[ (keyToMove := record keyAtHighestSlotFor: currentKeyToWrite) > currentKeyToWrite ]) 
				ifTrue: 
					[ hasSpace ifFalse: 
						[ valueToMove := record valueAtByteArrayIndex: highestBax.
						record vacateSlotAtByteArrayIndex: highestBax ].
					"Incrementing here is 'corrected', below, if necessary.."
					record incrementNumberOfChildrenAtByteArrayIndex: (record 
							atKey: currentKeyToWrite
							put: currentValueToWrite).
					hasSpace ifFalse: 
						[ "It should be safe to assume, here, that highestBax is where currentKeyToWrite was just placed."
						(record canAdd: keyToMove) 
							ifTrue: 
								[ record
									incrementNumberOfChildrenAtByteArrayIndex: (record 
											atKey: keyToMove
											put: valueToMove) ;
									decrementNumberOfChildrenAtByteArrayIndex: highestBax.
								hasSpace := true ]
							ifFalse: 
								[ "If the displaced entry will not be a child of the displacer, we need to correct the increment, (see) above, by decrement the numberOfChildren and incrementing where it *will* be placed."
								| newBax |
								newBax := record highestByteArrayIndexFor: keyToMove.
								highestBax = newBax ifFalse: 
									[ record
										decrementNumberOfChildrenAtByteArrayIndex: highestBax ;
										incrementNumberOfChildrenAtByteArrayIndex: newBax ] ] ] ]
				ifFalse: [ record incrementNumberOfChildrenAtByteArrayIndex: highestBax ].
			self writeRecord: record.
			valueToMove notNil ifTrue: 
				[ "we will need to push this key/value pair down"
				currentKeyToWrite := keyToMove.
				currentValueToWrite := valueToMove ].
			childRecordNumber := record recordNumberCloserTo: currentKeyToWrite.
			reachedBottom := childRecordNumber = 0.
			reachedBottom ifFalse: [ self selectRecord: childRecordNumber ] ].
		(reachedBottom and: [ hasSpace not ]) ifTrue: 
			[ self selectNewRecordFor: currentKeyToWrite.
			record incrementNumberOfChildrenAtByteArrayIndex: (record 
					atKey: currentKeyToWrite
					put: currentValueToWrite).
			self writeRecord ] ]