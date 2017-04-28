private
refreshFrom: aMaObjectBuffer using: aMagmaSession includingLocal: aBoolean 
	"An important implementation awareness:  Remember that aMaObjectBuffer may already include its #prewriteAdjustmentTo:from:, or it may not.  CommitLogRecords are written PRIOR to the adjustment, whereas buffers in the DB are written AFTER the adjustment.  The adjustment itself is simply the transfer of the delta-values to the shared-values, and zero'ing out the deltas.
	This method doesn't know where aMaObjectBuffer came from, so doing the same 'adjustment' right here is the correct behavior."
	| sharedMin sharedMax |
	"Update my 'attributes', 'count' and 'sum'."
	1
		to: 3
		do:
			[ : instVarIndex | self
				slotAt: instVarIndex
				put: (aMagmaSession serializer objectWithOid: (aMaObjectBuffer maInstVarAt: instVarIndex)) ].
	"Now add-in the deltas from the buffer."
	count := count + (MaOidCalculator integerFromOid: (aMaObjectBuffer maInstVarAt: 7)).
	sum := sum + (MaOidCalculator floatFromOid: (aMaObjectBuffer maInstVarAt: 8)).
	sharedMin := MaOidCalculator floatFromOid: (aMaObjectBuffer maInstVarAt: 4).
	min := aBoolean
		ifTrue: [ sharedMin ]
		ifFalse: [ min min: sharedMin ].
	sharedMax := MaOidCalculator floatFromOid: (aMaObjectBuffer maInstVarAt: 5).
	max := aBoolean
		ifTrue: [ sharedMax ]
		ifFalse: [ max max: sharedMax ].
	aBoolean ifTrue:
		[ last := MaOidCalculator floatFromOid: (aMaObjectBuffer maInstVarAt: 6).
		deltaCount := 0.
		deltaSum := 0.0 ]