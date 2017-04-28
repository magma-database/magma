enumerating
entriesFromIndex: globalIndex do: threeArgBlock until: conditionBlock

	^self
		slotsFromIndex: globalIndex
		do:
			[ :currentRecord :byteArrayIndex :level |
			(currentRecord hasEntryAtByteArrayIndex: byteArrayIndex)
				ifTrue:
					[ threeArgBlock
						value: currentRecord
						value: byteArrayIndex
						value: level ] ]
		until: conditionBlock
