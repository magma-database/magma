test transactions
updateThreeAndFour
	| fixture |
	fixture := localRoot at: #testTransactions.
	(fixture at: 3) value: 'Threeeeee'.
	clientSession abort.
	self assert: (fixture at: 3) value = 'three'.
	clientSession begin.
	"Even if it was changed to the same value, it is still a commit-conflict.  It is quick and easy for server to detect commit-conflicts that way."
	"We purposely mis-spell it so that, after client2 commitAndHandleFailure, each client can verify final state:  correctly-spelled Three."
	(fixture at: 3) value: 'Threee'.
	(fixture at: 4) value: 'Four'