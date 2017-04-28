enumerating
keysAndValuesFrom: lowKey startingAt: anInteger do: twoArgBlock until: conditionBlock 
	"Value twoArgBlock with each key and value pair, until conditionBlock is false for same key-value pair, starting at anInteger after the lowest index of lowKey."
	| lowest currentIndex |
	currentIndex := 0.
	lowest := self 
		indexOfLowest: lowKey
		exactKey: false.
	lowest > 0 ifTrue: 
		[ self 
			entriesFromIndex: lowest + anInteger - 1
			do: 
				[ : currentRecord : byteArrayIndex : level | 
				currentIndex := currentIndex + 1.
				twoArgBlock 
					value: (currentRecord keyAtByteArrayIndex: byteArrayIndex)
					value: (currentRecord valueAtByteArrayIndex: byteArrayIndex) ]
			until: 
				[ : currentRecord : byteArrayIndex : level | 
				conditionBlock 
					value: (currentRecord keyAtByteArrayIndex: byteArrayIndex)
					value: (currentRecord valueAtByteArrayIndex: byteArrayIndex) ] ]