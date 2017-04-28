test querys - persistent empty
createEmpty
	clientSession commit: 
		[ clientSession root 
			at: 'testPersistentEmpty'
			put: self newMc ]