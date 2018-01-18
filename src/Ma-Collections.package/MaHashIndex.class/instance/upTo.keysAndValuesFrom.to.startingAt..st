accessing
upTo: countInteger keysAndValuesFrom: lowKey to: highKey startingAt: index 
	"Answer the specified number of values starting at logical-position index *within* the lowKey to highKey range."
	^ guard critical: 
		[ | answerIndex keys values |
		answerIndex := 0.
		keys := Array new: countInteger.
		values := Array new: countInteger.
		self 
			upTo: countInteger
			keysAndValuesFrom: lowKey
			to: highKey
			startingAt: index
			do: 
				[ : eachKey : eachValue | 
				keys 
					at: (answerIndex := answerIndex + 1)
					put: eachKey.
				values 
					at: answerIndex
					put: eachValue ].
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