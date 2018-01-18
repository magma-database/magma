private comparing
bestScoreFor: compareObject 
	"Answer an Integer that represents the best match among my keywords.  Note that for each Array of anded keywords, *all* of that Array must match with a minimum score, otherwise none of the Array is a match and we move to the next Array."
	| answer |
	answer := self noMatchScore.
	compareObject maContextKeywordsDo: 
		[ : eachKeyword | 
		| score |
		eachKeyword ifNotNil: 
			[ score := self calculateScoreFor: eachKeyword.
			answer := answer min: score ] ].
	^ answer