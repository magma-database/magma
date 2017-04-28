recover
reapplyCommitPackagesUsing: aMaObjectRepository 
	| count continue onTrack applyCommitRecord |
	count := 0.
	continue := true.
	onTrack := false.
	applyCommitRecord := [ : recoveryRecord | | eachCommitLogEntry |
	count := count + 1.
	eachCommitLogEntry := self materializeCommitLogEntryIn: recoveryRecord.
	aMaObjectRepository commitCritical:
		[ aMaObjectRepository
			write: eachCommitLogEntry
			logged: false
			commitLogRecord: recoveryRecord.
		repository session advanceWith: eachCommitLogEntry ] ].
	"Branch code is allowed to change as long as we establish that we are 'onTrack' first.  branchCode can change when a backup is moved somewhere else and used as a primary."
	[ self
		commitLogRecordsFrom: commitNumber
		do:
			[ : each | continue = true ifTrue:
				[ "Apply ONLY if we have the exact next commit."
				(branchCode = each branchCode and: [ each commitNumber = (commitNumber + 1) ])
					ifTrue:
						[ count = 0 ifTrue:
							[ continue := MagmaForwardRecoveryNeeded signal: 'A forward recovery from ' , each timestamp printString , ' is necessary.  If you wish to recover to a point-in-time, press Debug and save the desired target DateAndTime in my ''targetRecoveryTime''.'.
							self validateTargetRecoveryTime ].
						applyCommitRecord value: each ]
					ifFalse:
						[ each branchCode = branchCode
							ifTrue:
								[ each commitNumber > (commitNumber + 1)
									ifTrue:
										[ MagmaMissingCommitLogWarning signal: 'Looking for commit record ' , (commitNumber + 1) asString , ' but the oldest commit record found was ' , each commitNumber printString.
										^ self ]
									ifFalse:
										[ onTrack := each commitNumber = commitNumber and: [ "{ branchCode. repository previousBranchCode} includes: each branchCode"
											true ] ] ]
							ifFalse:
								[ each commitNumber = (commitNumber + 1) ifTrue:
									[ onTrack
										ifTrue:
											[ repository branchCode: each branchCode.
											applyCommitRecord value: each ]
										ifFalse: [ MagmaDifferentBranch signal ] ] ] ] ] ]
		until: [ : each | continue = false or: [ targetRecoveryTime notNil and: [ each timestamp >= targetRecoveryTime ] ] ] ]

		on: MaUnreadableRecoveryRecord
		do:
			[ : error | MagmaWarning signal: count printString , ' reapply''s completed before encountering an error in the commit-log:  ' , error messageText , '.  ' ]