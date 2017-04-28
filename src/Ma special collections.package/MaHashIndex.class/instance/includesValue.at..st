testing
includesValue: valueInteger at: keyInteger

	| hasEntry key |
	self
		entriesFrom: keyInteger
		do:
			[ : eachRecord : eachByteArrayIndex : level |
			(hasEntry and:
				[ key = keyInteger
					and: [ (eachRecord valueAtByteArrayIndex: eachByteArrayIndex) = valueInteger ] ])
						ifTrue:
							[ ^ true ] ]
		until:
			[ : eachRecord : eachByteArrayIndex : level |
			"Until we're on an entry that could not possibly hold keyInteger."
			((hasEntry := eachRecord hasEntryAtByteArrayIndex: eachByteArrayIndex)
				and: [ (key := eachRecord keyAtByteArrayIndex: eachByteArrayIndex) > keyInteger ])
					or: [ eachByteArrayIndex > (eachRecord highestByteArrayIndexFor: keyInteger) ] ].
	^ false