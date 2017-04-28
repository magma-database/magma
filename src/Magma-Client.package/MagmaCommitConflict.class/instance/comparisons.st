accessing
comparisons
	^ self conflictingObjects collect:
		[ : each | MaObjectComparison
			with: each key
			with: each value ]