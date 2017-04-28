test transactions
verifyHasClient2Changes
	| fixture |
	fixture := localRoot at: #testTransactions.
	self assert: (fixture at: 4) = (4 -> 'four').
	clientSession abort.
	self assert: (fixture at: 4) = (4 -> 'Four')