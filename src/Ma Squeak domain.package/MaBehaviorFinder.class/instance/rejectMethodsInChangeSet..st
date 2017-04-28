change sets
rejectMethodsInChangeSet: aChangeSet 
	self rejectMethods: 
		[ : each | 
		(ChangeSorter 
			allChangeSetsWithClass: each actualClass
			selector: each selector) includes: aChangeSet ]