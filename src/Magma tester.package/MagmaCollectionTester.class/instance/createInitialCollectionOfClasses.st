test keyword index
createInitialCollectionOfClasses
	"I'm running in client1"

	| mc answer indexDef root |
	mc := MagmaCollection new.
	answer := Dictionary new.
	indexDef := self newKeywordIndex.
	root := clientSession root.
	clientSession commit:
		[ root
			at: 'testKeywordIndex'
			put: mc.
		MaClientServerRequest withAllSubclasses do:
			[ : each |
			self
				add: each maCommentKeywords -> each name
				to: mc
				smalltalkVersion: answer
				using: indexDef ] ].
	^ answer