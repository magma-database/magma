accessing
comparisons
	^ Array streamContents:
		[ : stream | self conflictingObjectsDo:
			[ : each | stream nextPut:
				(MaObjectComparison
					with: each key
					with: each value) ] ]