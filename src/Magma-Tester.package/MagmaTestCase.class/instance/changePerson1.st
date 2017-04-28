test transactions
changePerson1
	| person |
	clientSession begin.
	person := (clientSession root at: 'people') first.
	person name first: 'elizabeth'.
	localRoot 
		at: 'performCommitAndRefreshTest'
		put: person