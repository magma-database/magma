file
selectPreMadeRecord: aMaRecoveryRecord 
	^ (preMadeRecords 
		at: aMaRecoveryRecord recordType
		ifAbsent: 
			[ MaUnreadableRecoveryRecord signal: 'Ungraceful end of commit-group:  invalid recordType found (' , aMaRecoveryRecord recordType printString , ').' ])
		byteArray: aMaRecoveryRecord byteArray ;
		yourself