private
segmentsAfter: aMagmaCollectionReaderSegment do: aBlock 
	| foundIt |
	foundIt := false.
	segments do: 
		[ : each | 
		foundIt ifTrue: [ aBlock value: each ].
		each = aMagmaCollectionReaderSegment ifTrue: [ foundIt := true ] ]