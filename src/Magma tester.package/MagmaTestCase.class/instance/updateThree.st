test transactions
updateThree
	| fixture |
	clientSession
		abort ;
		begin.
	fixture := localRoot 
		at: #testTransactions
		put: (clientSession root at: #testTransactions).
	(fixture at: 3) value: 'Three'