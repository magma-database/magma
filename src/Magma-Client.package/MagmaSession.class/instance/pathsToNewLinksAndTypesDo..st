serialization
pathsToNewLinksAndTypesDo: aBlock
	| classes links |
	classes := self definition classes asSet.
	links := self definition links asSet.
	self dirtyGraphDo:
		[ : path : parent : index |  "The same Symbol instances might exist in multiple Magma sessions, so disregard those."
			path last isSymbol ifFalse:
				[ | otherSess newClass |
				otherSess := path last quickMagmaSession.
				otherSess ifNotNil:
					[ otherSess ~= self ifTrue:
						[ (links includes: otherSess magmaId) ifFalse: [ aBlock value: path asArray ] ] ].
				(classes includes: (newClass := path last maOriginalClass theNonMetaClass)) ifFalse: [ aBlock value: path asArray ] ]  ]