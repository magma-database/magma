debugging
applyRecords

	| answer |
	answer := OrderedCollection new.
	[ self applyRecordsDo:
		[ : each |
		answer add: each independentCopy ] ]

		on: MaUnreadableRecoveryRecord
		do: [ : err | answer add: err messageText ].
	^ answer