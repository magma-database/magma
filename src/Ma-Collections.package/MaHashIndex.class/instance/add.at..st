add / remove
add: valueInteger at: keyInteger 
	"Find the record which either has space for keyInteger or is as far zoomed-in as possible (with either space for keyInteger or not).  If a record already contains another key greater than keyInteger, that entry must be 'pushed' down so we can maintain key order.  Additionally, we must increment the numberOfChildren for each record to the path of where we finally add."
	guard critical: 
		[ | currentKeyToWrite currentValueToWrite hasSpace reachedBottom |
		keyInteger > self highestPossibleKey ifTrue:
			[ MaHashIndexUserError signal: keyInteger printString, ' is larger than the highestPossibleKey.' ].
		currentKeyToWrite := keyInteger.
		currentValueToWrite := valueInteger.
		self selectRoot.
		hasSpace := false.
		reachedBottom := false.
		[ hasSpace | reachedBottom ] whileFalse: 
			[ | highestBax keyToMove valueToMove childRecordNumber |
			highestBax := record highestByteArrayIndexFor: currentKeyToWrite.
			((hasSpace := record canAdd: currentKeyToWrite) or: 
				[ (keyToMove := record keyAtByteArrayIndex: highestBax) > currentKeyToWrite ]) 
				ifTrue: 
					[ hasSpace ifFalse: 
						[ valueToMove := record valueAtByteArrayIndex: highestBax.
						record vacateSlotAtByteArrayIndex: highestBax ].
					record incrementNumberOfChildrenAtByteArrayIndex: (record 
							atKey: currentKeyToWrite
							put: currentValueToWrite) ]
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