private
validateRecord: inputRecord 
	inputRecord hasValidCheckSum ifFalse: 
		[ MaUnreadableRecoveryRecord signal: 'record could not validate its checkSum.' ]