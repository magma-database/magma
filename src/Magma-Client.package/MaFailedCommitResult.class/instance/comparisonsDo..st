accessing
comparisonsDo: aBlock 
	commitConflicts do:
		[ : each | aBlock value:
			(MaObjectComparison
				with: each key
				with: each value) ]