recover
rollbackUsing: aMaObjectRepository 
	"If a beginApply record with a valid checkSum is found, then we must find a corresponding endApply record also with a valid checkSum.  If we don't, then we must reverse the entire transaction by starting back at the beginning and applying all of the beforeImage records with valid checkSums back to their files."
	MagmaServerPreferences debugRecovery ifTrue: [ self halt: 'about to rollback' ].
	[ self applyRecordsDo: 
		[ : each | 
		each isApplyToFile ifTrue: [ aMaObjectRepository unapply: each ] ] ] 
		on: MaUnreadableRecoveryRecord
		do: 
			[ : error | 
			MagmaRecoveryNotification signal: error messageText , '.  Rollback complete.' ].
	aMaObjectRepository repositoryController close.	"because class-definitions or largeCollections may have even needed rolled-back; refreshView will not refresh them."
	self deleteApplyFile.	"so we don't try to recover again on the next open.."
	aMaObjectRepository repositoryController open