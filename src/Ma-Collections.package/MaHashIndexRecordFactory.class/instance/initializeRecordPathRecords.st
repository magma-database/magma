initializing
initializeRecordPathRecords

	1
		to: self maxDepth
		do:
			[ :x |
			recordPath
				at: x
				put: (
					MaHashIndexRecord
						keySize: index keySize
						valueSize: index valueSize
						numberOfSlots: index hashRecordSize) ]