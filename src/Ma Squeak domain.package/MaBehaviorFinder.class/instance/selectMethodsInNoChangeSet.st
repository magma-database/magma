change sets
selectMethodsInNoChangeSet
	| count |
	count := 0.
	self selectMethods: 
		[ : each | 
		count := count + 1.
		count \\ 10 = 0 ifTrue: 
			[ ProgressNotification signal: count printString , ' methods searched.' ].
		(ChangeSorter 
			allChangeSetsWithClass: each actualClass
			selector: each selector) isEmpty ]