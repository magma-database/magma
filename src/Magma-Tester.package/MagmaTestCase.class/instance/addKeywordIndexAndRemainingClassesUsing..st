test keyword index
addKeywordIndexAndRemainingClassesUsing: smalltalkIndex 
	"I run in client2."
	| indexDef mc |
	indexDef := self newKeywordIndex.
	mc := clientSession abort root at: 'testKeywordIndex'.
	clientSession commit: [ mc addIndex: indexDef ].
	OrderedCollection withAllSubclassesDo: 
		[ : each | 
		clientSession commit: 
			[ self notify: 'adding ' , each name.
			self 
				add: each maCommentKeywords -> each name
				to: mc
				smalltalkVersion: smalltalkIndex
				using: indexDef ] ].
	^ smalltalkIndex