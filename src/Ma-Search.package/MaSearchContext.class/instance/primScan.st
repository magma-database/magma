private
primScan
	"Stream the next anInteger objects into aMauiContextResults according to my keywords and organized in aMauiContextResults by relevance."
	self
		 startTimer ;
		 prepareForScan.
	[ self shouldStopScanning ] whileFalse:
		[ | score next |
		scanProcess description: 'scanning for ' , self keywordsSelection.
		next := self next.
		next ifNotNil:
			[ score := self bestScoreFor: (self getCompareObjectFor: next).
			score = self noMatchScore ifFalse:
				[ self results
					atRelevance: score
					add: next.
				self changed ].
			scanProcess advance ] ].
	timer cancel