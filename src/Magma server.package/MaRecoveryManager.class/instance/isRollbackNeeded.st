recover
isRollbackNeeded

	| hasRecords hasValidEndApplyIndicator |
	hasRecords := false.
	hasValidEndApplyIndicator := false.
	[ self applyRecordsDo:
		[ : each |
		each isBeginApply ifTrue: [ hasRecords := true ].
		each isEndApply
			ifTrue:
				[ hasValidEndApplyIndicator := true ] ] ]
		on: MaUnreadableRecoveryRecord
		do: 
			[ : error |
			"An incomplete set of records for a single transactionId was found."
			MagmaNotification signal: error messageText.
			error return ].
	^ hasRecords and: [ hasValidEndApplyIndicator not ]