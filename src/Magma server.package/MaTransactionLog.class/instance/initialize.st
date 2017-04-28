initialize-release
initialize
	super initialize.
	"An OrderedCollection of MaCommitLogEntrys and MaTransactionLogEntrys.."
	entries := OrderedCollection new.
	specialOids := Dictionary new