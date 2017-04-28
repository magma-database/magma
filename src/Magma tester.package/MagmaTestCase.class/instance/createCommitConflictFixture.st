test transactions
createCommitConflictFixture
	| fixture |
	fixture := (1 to: 6) collect: [ : n | n -> n asWords ].
	clientSession
		abort ;
		commit: 
			[ clientSession root 
				at: #testTransactions
				put: fixture ].
	localRoot 
		at: #testTransactions
		put: fixture	"avoid gc"