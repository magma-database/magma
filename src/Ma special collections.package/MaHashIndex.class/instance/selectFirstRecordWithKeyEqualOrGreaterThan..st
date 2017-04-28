private
selectFirstRecordWithKeyEqualOrGreaterThan: keyInteger
	"If keyInteger is larger than every key in the index, answer nil, otherwise answer the level of the record with the answer."

	| level searchedLevel |
	level := 1.
	self
		navigateToward: keyInteger
		until:
			[ : currentRecord |
			currentRecord
				eligibleByteArrayIndexesFor: keyInteger
				do:
					[ : each |
					((currentRecord hasEntryAtByteArrayIndex: each)
						and: [ (currentRecord keyAtByteArrayIndex: each) >= keyInteger ])
							ifTrue:
								[ ^ level ] ].
			false ]
		do: [ :currentRecord | level := level + 1 ].
	"Though we have arrived at the record which would contain keyInteger,
	in case it does not have entries whose keys are >= keyInteger,
	look for the next higher key."
	self
		traverseSlotsFromRecord: record
		index: (record slotIndexFor: keyInteger)
		do: [ : currentRecord : byteArrayIndex : currentLevel | "nothing" ]
		until:
			[ : currentRecord : byteArrayIndex : currentLevel |
			searchedLevel := currentLevel.
			currentRecord hasEntryAtByteArrayIndex: byteArrayIndex ]
		level: level.
	^ searchedLevel