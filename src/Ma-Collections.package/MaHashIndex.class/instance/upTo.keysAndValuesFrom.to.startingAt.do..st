enumerating
upTo: countInteger keysAndValuesFrom: lowKey to: highKey startingAt: index do: twoArgBlock
	"Answer the specified number of values starting at logical-position index within the lowKey to highKey range, value twoArgBlock with each key-value pair in that range."
	| lowest currentIndex |
	currentIndex := 0.
	lowest := self indexOfLowest: lowKey exactKey: false.
	lowest > 0
		ifTrue:
			[ self
				entriesFromIndex: lowest + index - 1
				do:
					[ : currentRecord : byteArrayIndex : level |
					currentIndex := currentIndex + 1.
					twoArgBlock
						value: (currentRecord keyAtByteArrayIndex: byteArrayIndex)
						value: (currentRecord valueAtByteArrayIndex: byteArrayIndex) ]
				until:
					[  : currentRecord : byteArrayIndex : level |
					currentIndex = countInteger
					or: [ (currentRecord keyAtByteArrayIndex: byteArrayIndex) > highKey ] ] ]