private
executeSwapWith: aMagmaRemoteLocation commitNumber: commitNumber branchCode: branchCode 
	"I am the primary.  aMagmaRemoteLocation wants to be the primary now."
	| commitLogRecords currentCommitNumber |
	self branchCode = branchCode ifFalse: [ MagmaDifferentBranch signal: 'Branch codes don''t match?!' ].
	currentCommitNumber := self commitNumber.
	commitLogRecords := repository commitRecordsFrom: commitNumber.
	commitLogRecords notEmpty and: 
		[ commitLogRecords last commitNumber = currentCommitNumber ifFalse: 
			[ MagmaEnvironmentError signal: 'Warm backup is too far behind at this time!' ] ].
	"We will just manually update the node rather than use MagmaNodeUpdate so its simpler and more explicit.  Using MagmaNodeUpdate *may* work, I'm not sure.."
	self session commit: [ self node swapWithPrimary: aMagmaRemoteLocation ].
	repository beginRestore.
	"Now, capture that last commit!"
	commitLogRecords := commitLogRecords , (repository commitRecordsFrom: currentCommitNumber + 1).
	^ commitLogRecords