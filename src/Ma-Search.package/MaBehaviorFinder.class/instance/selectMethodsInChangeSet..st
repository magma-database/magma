change sets
selectMethodsInChangeSet: aChangeSet 
	"Remove all methods other than those contained in aChangeSet."
	self selectMethods: 
		[ : each | 
		(ChangeSorter 
			allChangeSetsWithClass: each actualClass
			selector: each selector) includes: aChangeSet ]