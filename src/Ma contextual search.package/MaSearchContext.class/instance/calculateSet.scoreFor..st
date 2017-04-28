private comparing
calculateSet: keywordsArray scoreFor: compareString 
	"Every word in keywordsArray is considered AND'ed, therefore must minimally match, otherwise the entire set is not a match."
	^ keywordsArray 
		inject: self noMatchScore
		into: 
			[ : score : each | 
			| selectionScore |
			selectionScore := self 
				scoreFor: compareString
				keyword: each.
			selectionScore = self noMatchScore ifTrue: [ ^ selectionScore ].
			score min: selectionScore ]