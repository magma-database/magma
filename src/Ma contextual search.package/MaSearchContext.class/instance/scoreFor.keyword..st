private comparing
scoreFor: objectString keyword: keywordString 
	"Answer a magnitude suitable for sorting results according to best match."
	(objectString 
		compare: keywordString
		caseSensitive: true) = 2 ifTrue: [ ^ 1 ].
	(objectString 
		compare: keywordString
		caseSensitive: false) = 2 ifTrue: [ ^ 2 ].
	(objectString 
		maBeginsWith: keywordString
		caseSensitive: false) ifTrue: [ ^ 3 ].
	(objectString 
		includesSubstring: keywordString
		caseSensitive: false) ifTrue: [ ^ 4 ].
	^ self noMatchScore