*ma-serializer-core
maShouldTraverseWithPath: path parent: parent index: indexInteger
	| cl |
	cl := self class.
	cl = CompiledMethod ifTrue: [ ^ true ].
	cl isBytes ifTrue: [ ^ false ].
	(cl isVariable and: [ cl isPointers not ]) ifTrue: [ ^ false ].
	^ self maUsesStandardStorage
	and: [ (parent maIsTransient: indexInteger) not ]