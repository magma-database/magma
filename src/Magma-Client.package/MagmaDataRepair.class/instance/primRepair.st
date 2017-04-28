private
primRepair
	"safeMode causes the receiver to open its own transaction, and also to verify no data to repair before committing."
	repairBlock ifNil: [ MagmaUserError signal: 'repairBlock must be specified to repair.' ].
	MagmaRepairNotification signal: 'Repair mode: ' , mode.
	self open.
	[ self anyDataToRepair
		ifTrue:
			[ | commitNumberBefore failed |
			failed := false.
			MagmaRepairNotification signal: 'Found data to repair.  Attempting repair.'.
			commitNumberBefore := session remoteCommitNumber.
			session begin.
			"Do the repair."
			doBlock := repairBlock.
			self enumerateCheckAndDo.
			self improveMode
				ifTrue: [ session commit ]
				ifFalse:
					[ MagmaRepairNotification signal: 'Verifying repair before committing.'.
					self anyDataToRepair
						ifTrue:
							[ MagmaRepairNotification signal: 'Still found data to repair.  Aborting.'.
							failed := true.
							session abort ]
						ifFalse:
							[ MagmaRepairNotification signal: 'No data left to repair.  Committing.'.
							session commit ] ].
			"Close to force a new session when evaluating anyDataToRepair."
			self close.
			(failed or:
				[ MagmaRepairNotification signal: 'Verifying repair...'.
				self anyDataToRepair ])
				ifTrue:
					[ | errMsg |
					errMsg := String streamContents:
						[ : stream | stream maPrint: 'Verification failed.  '.
						self improveMode
							ifTrue: [ stream maPrint: 'Some improvement may have been committed.' ]
							ifFalse:
								[ failed ifFalse: [ stream maPrint: '(Perhaps the repair tried to change immutable objects?)' ].
								stream maPrint: 'Repair failed.  Commit number prior to repair was ', commitNumberBefore ] ].
					MagmaRepairNotification signal: errMsg.
					MagmaRepairFailure signal: errMsg ]
				ifFalse: [ MagmaRepairNotification signal: 'Verification complete.  Repair successful.' ] ]
		ifFalse: [ MagmaRepairNotification signal: 'No data to repair.' ] ] ensure: [ self close ]