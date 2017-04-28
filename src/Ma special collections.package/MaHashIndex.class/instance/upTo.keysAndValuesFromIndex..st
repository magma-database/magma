accessing
upTo: countInteger keysAndValuesFromIndex: lowIndex 
	^ guard critical: 
		[ | answerIndex keys values |
		keys := Array new: countInteger.
		values := Array new: countInteger.
		answerIndex := 0.
		self 
			entriesFromIndex: lowIndex
			do: 
				[ : currentRecord : byteArrayIndex : level | 
				keys 
					at: (answerIndex := answerIndex + 1)
					put: (currentRecord keyAtByteArrayIndex: byteArrayIndex).
				values 
					at: answerIndex
					put: (currentRecord valueAtByteArrayIndex: byteArrayIndex) ]
			until: [ : currentRecord : index : level | answerIndex = countInteger ].
		answerIndex = 0 
			ifTrue: 
				[ {  #(). #()  } ]
			ifFalse: 
				[ answerIndex < countInteger 
					ifTrue: 
						[ { 
							(keys 
								copyFrom: 1
								to: answerIndex).
							(values 
								copyFrom: 1
								to: answerIndex)
						 } ]
					ifFalse: 
						[ {  keys. values  } ] ] ]