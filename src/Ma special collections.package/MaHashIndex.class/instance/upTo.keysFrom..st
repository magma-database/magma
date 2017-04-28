SUnit tests
upTo: countInteger keysFrom: startKey 
	guard critical: 
		[ | result answerIndex |
		result := Array new: countInteger.
		answerIndex := 1.
		self 
			entriesFrom: startKey
			do: 
				[ : currentRecord : index : level | 
				(currentRecord hasEntryAtByteArrayIndex: index) ifTrue: 
					[ result 
						at: answerIndex
						put: (currentRecord keyAtByteArrayIndex: index).
					answerIndex := answerIndex + 1 ] ]
			until: [ : currentRecord : index : level | answerIndex > countInteger ].
		"Need to check in case of a small index (say only 9 entries?)."
		^ answerIndex < countInteger 
			ifTrue: 
				[ result 
					copyFrom: 1
					to: answerIndex - 1 ]
			ifFalse: [ result ] ]