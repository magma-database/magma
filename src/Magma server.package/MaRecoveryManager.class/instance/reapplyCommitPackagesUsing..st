recover
reapplyCommitPackagesUsing: aMaObjectRepository 
	| count continue |
	count := 0.
	continue := true.
	
	[ self 
		commitLogRecordsFrom: commitNumber + 1
		do: 
			[ : each | 
			continue == false ifFalse: 
				[ "Apply ONLY if we have the exact next commit."
				| eachCommitLogEntry |
				(branchCode = each branchCode and: [ each commitNumber = (commitNumber + 1) ]) 
					ifTrue: 
						[ count = 0 ifTrue: 
							[ continue := MagmaForwardRecoveryNeeded signal: 'A forward recovery from ' , each timestamp printString , ' is necessary.  If you wish to recover to a point-in-time, press Debug and save the desired target DateAndTime in my ''targetRecoveryTime''.'.
							self validateTargetRecoveryTime ].
						count := count + 1.
						eachCommitLogEntry := self materializeCommitLogEntryIn: each.
						aMaObjectRepository commitCritical: 
							[ aMaObjectRepository 
								write: eachCommitLogEntry
								logged: false
								commitLogRecord: each.
							repository session advanceWith: eachCommitLogEntry ] ]
					ifFalse: 
						[ each branchCode = branchCode 
							ifTrue: 
								[ each commitNumber > (commitNumber + 1) ifTrue: 
									[ MagmaMissingCommitLogWarning signal: 'Looking for commit record ' , (commitNumber + 1) asString , ' but the oldest commit record found was ' , each commitNumber printString.
									^ self ] ]
							ifFalse: [ MagmaDifferentBranch signal ] ] ] ]
		until: 
			[ : each | 
			continue and: [ targetRecoveryTime notNil and: [ each timestamp > targetRecoveryTime ] ] ] ] 
		on: MaUnreadableRecoveryRecord
		do: 
			[ : error | 
			MagmaWarning signal: count printString , ' reapply''s completed before encountering an error in the commit-log:  ' , error messageText , '.  ' ]