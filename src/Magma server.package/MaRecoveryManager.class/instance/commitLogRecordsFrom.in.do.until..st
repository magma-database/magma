private
commitLogRecordsFrom: anInteger in: aStandardFileStream do: oneArgBlock until: untilBlock 
	| currentPosition selectedRecord untilReached |
	untilReached := false.
	currentPosition := 0.
	[ aStandardFileStream atEnd or: [ untilReached ] ] whileFalse: 
		[ selectedRecord := self 
			readRecoveryFile: aStandardFileStream
			at: currentPosition.
		(selectedRecord commitNumber >= anInteger and: [ (untilReached := untilBlock value: selectedRecord) not ]) ifTrue: [ oneArgBlock value: selectedRecord ].
		currentPosition := currentPosition + selectedRecord physicalSize ].
	^ untilReached