test transactions
testTransactions
	"This tests Magma's transaction processing, its ability to detect and handle commit conflicts."
	self
		performCommitConflictTest ;
		performBuildIndexCommitConflictTest ;
		performPseudoConflictTest