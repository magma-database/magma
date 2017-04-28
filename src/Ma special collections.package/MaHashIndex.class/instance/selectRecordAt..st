private
selectRecordAt: globalIndex
	"Answer the level and the byteArrayIndex of the selected record, or nil if out of bounds.
	Since the caller of this method is going to call traverseSlotsFromRecord:index:do:until:level:,
	we must be sure to populate the receivers path."

	| level byteArrayIndex currentGlobalPosition outOfBounds |

	self selectRoot.
	level := 1.
	currentGlobalPosition := 0.  "0-based"
	outOfBounds := false.
	[
		byteArrayIndex :=
			record
				byteArrayIndexContainingGlobalIndex: globalIndex
				base: currentGlobalPosition.
		byteArrayIndex isNil
			ifTrue:
				[ outOfBounds := true.
				false ]
			ifFalse:
				[ currentGlobalPosition :=
					currentGlobalPosition +
						(record numberOfChildrenBeforeByteArrayIndex: byteArrayIndex).
				(record hasEntryAtByteArrayIndex: byteArrayIndex)
					ifTrue: [ currentGlobalPosition := currentGlobalPosition + 1 ].
				(currentGlobalPosition < globalIndex) and:
					[ "this should never be false if above is true"
					record hasChildAtByteArrayIndex: byteArrayIndex ] ] ]
						whileTrue:
							[ recordFactory
								put: record
								atLevel: level
								byteArrayIndex: byteArrayIndex.
							self selectRecord:
								(record recordNumberAtByteArrayIndex: byteArrayIndex).
							level := level + 1 ].
	^outOfBounds
		ifTrue:
			[ nil ]
		ifFalse:
			[ Array
				with: byteArrayIndex
				with: level ]