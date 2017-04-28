test backup/restore
verifyRestore
	"A backup was performed a long time ago at the beginning of the test suite.  Since then, commit.log files have been written.  Now lets apply all of those files to the backup and verify lots of things are correct just like they are in the original."
	"Close the current commit log, so we know it we'll be caught up to the second."
	| backupSession verifier recoveryOccurred correctCommitNumber |
	recoveryOccurred := false.
	correctCommitNumber := self 
		remotePerform: #copyCommitLogsToBackup
		in: 'server'.
"Encountered situation where, even though destination files were closed, they were not yet flushed, resulting in a recovery failure.  Give it five seconds, should be more than enough time."
(Delay forSeconds: 5) wait.
	[ backupSession := MagmaSession openLocal: self backupDirectory fullName ] 
		on: MagmaForwardRecoveryNeeded
		do: 
			[ : warning | 
			recoveryOccurred := true.
			warning resume: true ].
	self assert: recoveryOccurred.
	self assert: correctCommitNumber = backupSession repositoryController commitNumber.
	backupSession connectAs: 'restore verifier'.
	self 
		should: [ backupSession begin ]
		raise: MagmaUserError.
	backupSession abort.
	verifier := self class new clientSession: backupSession.
	self restoreVerifications do: [ : each | verifier perform: each ].
	backupSession repositoryController commitRestore.
	backupSession
		begin ;
		commit.
	"Ok, I'm satisfied."
	backupSession disconnectAndClose