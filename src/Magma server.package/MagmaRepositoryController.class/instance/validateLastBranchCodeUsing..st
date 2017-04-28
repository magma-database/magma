high-availability
validateLastBranchCodeUsing: primarySession 
	"Validate that the branchCode of my last commit-record is the same as the branchCode of the primary repository I am becoming a warm-backup for."
	"There is a slim chance that a warm-backup will be exactly one-commit behind if the network cable to the primary server is cut after it logged one last commit, but before the bits made it out of the nic to the warm backup.  So the last commit warm backup (B) received was 172, but the crashed primary (A) actually got 173 written to its log.  Then a different commit 173 has since occurred to the new primary (B).  Now (A) is starting back up intending to catch back up to being a warm backup for (B), but this must be prevented because it has a different 173.

What follows are just my initial notes about this use-case:

What to do on restart of the primary for each scenario:

	#(''backup +1'' ''primary +0'') - Primary can catch up
	#(''backup +0'' ''primary +1'') 
		- Network cable cut in middle of commit 173, just before sending to warm backup.  So warm backup is still at 172.
		- Note committing client is now waiting for response which will timeout.  Therefore, no expectations that commit 173 succeeded.
		- ConnectionClosed signaled to other clients causes failover.  A totally different commit 173 happens on the new primary!
		- Now, let's say the log:flush: happens on the original primary in which the network cable was cut.
		- Now, on restarting, that commit 173 (the +1 commit) is different than the 173 of the warm backup.
			A:  When restarting the crashed server, compare the branchCode of the last commitRecord (173) between the two.  If they are different, the repositories are branched and the crashed server must be reestablished, it cannot be immediately failed back over."
	| myBranchCode correspondingCommitRecordInPrimary primaryBranchCode |
self maMarked: 'delete'.  "Technically, this entire method is not even needed, because Magma already verifies commitNumber and branchCode on every single write."
	myBranchCode := self branchCode.
	correspondingCommitRecordInPrimary := (primarySession commitLogRecordsFrom: self commitNumber)
		ifEmpty: [ ^ self ]
		ifNotEmptyDo:
			[ : commitLogRecords | commitLogRecords first ].
	"The moment of truth.."
	primaryBranchCode := correspondingCommitRecordInPrimary branchCode.
	correspondingCommitRecordInPrimary commitNumber = self commitNumber ifFalse: [ MagmaUnavailableCommitRecord signal: 'Commit record unavailable, won''t be able to roll forward.' ].
	primaryBranchCode = myBranchCode ifFalse: [ MagmaDifferentBranch signal: 'Commit ' , self commitNumber asString , ' is different between the primary and this repository.' ]