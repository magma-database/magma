enumerating
slotsFrom: keyInteger do: threeArgBlock until: conditionBlock 
	"The first two arguments of threeArgBlock and conditionBlock are the record and the internal index position needed to access the of each entry in those records via keyAtByteArrayIndex:, oidAtByteArrayIndex:, and recordNumberAtByteArrayIndex:.  The third argument is the levels from the root record, where the root is level 1.  This is used to reference into the receivers preMadeRecords, a performance optimization."
	guard critical: 
		[ | level startingEntryIndex |
		(level := self selectFirstRecordWithKeyEqualOrGreaterThan: keyInteger) isNil ifTrue: [ ^ self ].
		"For inverted records, it is possible the entryIndex for keyInteger will be consumed by the next lower key.  Unfortunately, we have to check."
		startingEntryIndex := record slotIndexFor: keyInteger.
		(record keyAtSlotIndex: startingEntryIndex) < keyInteger ifTrue: [ startingEntryIndex := startingEntryIndex + 1 ].
		self 
			traverseSlotsFromRecord: record
			index: startingEntryIndex
			do: threeArgBlock
			until: conditionBlock
			level: level ]