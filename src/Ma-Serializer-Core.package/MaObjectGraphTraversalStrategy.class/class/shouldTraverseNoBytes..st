private
shouldTraverseNoBytes: anObject 
	| cl |
	cl := anObject class.
	cl = CompiledMethod ifTrue: [ ^ true ].
	cl isBytes ifTrue: [ ^ false ].
	cl isPointers ifFalse: [ ^ false ].
	^ true