test transactions
makeSameChangesAsOtherClient
	| fixture |
	clientSession begin.
	fixture := clientSession root at: #testTransactions.
	fixture do:
		[ : eachAssoc | | val |
		val := eachAssoc value.
		eachAssoc
			 value: eachAssoc key ;
			 key: val ]