recover
applyRecordsDo: aBlock
	"Enumerate the block of RecoveryRecords for a single groupId in my applyFile."

	| currentPosition selectedRecord |
	currentPosition := 0.
	[ selectedRecord := 
		self 
			readRecoveryFile: applyFile
			at: currentPosition.
	selectedRecord isBeginApply
		ifTrue: [ groupId := selectedRecord groupId ]
		ifFalse: 
			[ selectedRecord groupId = groupId
				ifFalse:
					[ MaUnreadableRecoveryRecord signal: 'expected groupId ', groupId printString, ' but encountered record with ', selectedRecord groupId printString. ] ].
	aBlock value: selectedRecord.
	selectedRecord isEndApply ]
		whileFalse:
			[ currentPosition := currentPosition + selectedRecord physicalSize ]