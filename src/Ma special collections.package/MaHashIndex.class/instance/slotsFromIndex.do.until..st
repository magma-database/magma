enumerating
slotsFromIndex: globalIndex do: threeArgBlock until: conditionBlock 
	"The first two arguments of threeArgBlock and conditionBlock are the record and the internal index position needed to access the of each entry in those records via keyAtByteArrayIndex:, oidAtByteArrayIndex:, and recordNumberAtByteArrayIndex:.  The third argument is the levels from the root record, where the root is level 1.  This is used to reference into the receivers preMadeRecords, a performance optimization."
	guard critical: 
		[ | byteArrayIndexAndLevelArray |
		(byteArrayIndexAndLevelArray := self selectRecordAt: globalIndex) isNil ifTrue: [ ^ self ].
		self 
			traverseSlotsFromRecord: record
			index: (record slotIndexForBax: byteArrayIndexAndLevelArray first)
			do: threeArgBlock
			until: conditionBlock
			level: byteArrayIndexAndLevelArray last ]