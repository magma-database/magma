test refreshAll
updateDormantObject
	clientSession commit: 
		[ | arr |
		arr := clientSession root at: #testRefreshAll.
		(arr at: 1) 
			at: 5
			put: 'FIVE'.
		(arr at: 2) 
			at: 5
			put: 'FIFTEEN' ]